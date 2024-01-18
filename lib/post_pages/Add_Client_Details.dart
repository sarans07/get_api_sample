import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../Model/SucessClass.dart';

class addClientDetails extends StatefulWidget {
  const addClientDetails({super.key});

  @override
  State<addClientDetails> createState() => _addClientDetailsState();
}

class _addClientDetailsState extends State<addClientDetails> {

  Future<Success>? _future;


  final _formkey =GlobalKey<FormState>();


  Future<Success>AddClientDetails(String name, String number, String address, String gst, String web, String email, String conname, String connumber)async{
    var res = await http.post(Uri.parse("http://catodotest.elevadosoftwares.com/Client/InsertClient"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:jsonEncode(<String, dynamic>{
          "clientId":0,
          "clientName":name,
          "phone":number,
          "address":address,
          "gst":gst,
          "website":web,
          "email":email,
          "contactPerson":conname,
          "phoneNumber":connumber,
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
  TextEditingController _email = TextEditingController();
  TextEditingController _gst = TextEditingController();
  TextEditingController _con = TextEditingController();
  TextEditingController _connum = TextEditingController();
  TextEditingController _web = TextEditingController();
  TextEditingController _add = TextEditingController();


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
                decoration: const InputDecoration(
                    hintText: 'Enter Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  )
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
                controller: _email,
                decoration: const InputDecoration(hintText: 'Enter E-mail',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    )
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                    return 'Enter valid E-mail';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _gst,
                decoration: const InputDecoration(hintText: 'Enter GST Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    )
                ),
                validator: (value){
                  if (value == null|| value.isEmpty||value.length<15||value.length>15) {
                    return 'Please enter GST number';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _con,
                decoration: const InputDecoration(hintText: 'Enter Contact Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    )
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
                controller: _connum,
                decoration: const InputDecoration(hintText: 'Enter Conatct Number',
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
                controller: _web,
                decoration: const InputDecoration(hintText: 'Enter Website',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    )
                ),
                validator: (value) {
                  if (value == null ||value.length<3||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                    return 'Please enter Website';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _add,
                decoration: const InputDecoration(hintText: 'Enter Address',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    )
                ),
                validator: (value) {
                  if (value == null ||value.length<3||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                    return 'Please enter Valid Address';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if(_formkey.currentState!.validate()){
                setState(() {
                  _future = AddClientDetails(_name.text,_mob.text,_email.text,_gst.text,_con.text,_connum.text,_add.text,_web.text);
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
  SingleChildScrollView buildFutureBuilder() {
    return SingleChildScrollView(
      child: FutureBuilder<Success>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.success.toString());
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
