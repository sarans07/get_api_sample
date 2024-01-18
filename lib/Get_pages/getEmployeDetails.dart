import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_api_sample/Model/EmployeClass.dart';
import 'package:http/http.dart'as http;

import '../Textstyle.dart';

class employeDetails extends StatefulWidget {
  const employeDetails({super.key});

  @override
  State<employeDetails> createState() => _employeDetailsState();
}

class _employeDetailsState extends State<employeDetails> {


  Future<List<EmployeeList>> fetchEmployeDetails() async{
    var res = await http.get(Uri.parse("http://catodotest.elevadosoftwares.com/Employee/GetAllEmployeeDetails"));
    var datas = jsonDecode(res.body)["employeeList"];
    return (datas as List).map((e) => EmployeeList.fromJson(e)).toList();

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchEmployeDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.home)),
        title: Text('Clients Details',
          style: headings,
        ),
        backgroundColor: Colors.blue,

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.yellow[100],
            child: Column(
              children: [
                FutureBuilder<List<EmployeeList>>(
                    future: fetchEmployeDetails(),
                    builder: (context, snapshot){
                      if(snapshot.hasData){
                        List<EmployeeList> list = snapshot.data!; //inserting the data into a list
                        return ListView.builder(
                          itemCount: list.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Employee ID : ${list[index].employeeId.toString()}',
                                    style: headings,
                                    ),
                                    Text('Employee Name : ${list[index].employeeName.toString()}'),
                                    Text('Employee Mobile No : ${list[index].mobile.toString()}'),
                                    Text('User Name : ${list[index].userName.toString()}'),
                                    Text('Employee Password : ${list[index].password.toString()}'),
                                    Text('Confirm Password : ${list[index].confirmPassword.toString()}'),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                      else if (snapshot.hasError){
                        return Text("${snapshot.error}");
                      }
                      return const CircularProgressIndicator();
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
