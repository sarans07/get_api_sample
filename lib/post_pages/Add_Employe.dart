import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../Model/SucessClass.dart';

class addemploye extends StatefulWidget {

  const addemploye({super.key});

  @override
  State<addemploye> createState() => _addemployeState();
}

class _addemployeState extends State<addemploye> {

  final _formkey =GlobalKey<FormState>();


  Future<Success>? _future;

  Future<Success>AddEmployeeDetails(String name, String number, String username, String password, String confirmpassword)async{
    var res = await http.post(Uri.parse("http://catodotest.elevadosoftwares.com/Employee/InsertEmployee"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
      body:jsonEncode(<String, dynamic>{
        "employeeId":0,
        "employeeName":name,
        "mobile":number,
        "userName":username,
        "password":password,
        "confirmPassword":confirmpassword,
        "createdBy":1

      })
    );
    return Success.fromJson(jsonDecode(res.body));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  TextEditingController _name = TextEditingController();
  TextEditingController _mob = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _repass = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: (_future == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }
  SingleChildScrollView buildColumn() {
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _name,
                decoration: const InputDecoration(hintText: 'Enter Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                ),
                validator: (value) {
                  if (value == null ||value.length<3||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                    return 'Please enter Valid Name';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _mob,
                decoration: const InputDecoration(hintText: 'Enter Mobile Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    )
                ),
                validator: (value){
                  if (value == null|| value.isEmpty||value.length<10||value.length>10) {
                    return 'Please enter valid phone number';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _username,
                decoration: const InputDecoration(hintText: 'Enter UserName',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    )
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                    return 'Enter the valid User-Name!';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _pass,
                decoration: const InputDecoration(hintText: 'Enter Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    )
                ),
                validator: (value){
                  if (value!.isEmpty||value.length<4){
                    return 'Enter the valid Password';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _repass,
                decoration: const InputDecoration(hintText: 'Confirm_Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    )
                ),
                validator: (value){
                  if (value!.isEmpty||value.length<4){
                    return 'Enter the valid Password';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                if(_formkey.currentState!.validate()) {
                  setState(() {
                    _future = AddEmployeeDetails(
                        _name.text, _mob.text, _username.text, _pass.text,
                        _repass.text);
                  });
                }
              },
              child: const Text('Create Data'),
            ),
          ],
        ),
      ),
    );
  }
  FutureBuilder<Success> buildFutureBuilder() {
    return FutureBuilder<Success>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.success.toString());
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}

