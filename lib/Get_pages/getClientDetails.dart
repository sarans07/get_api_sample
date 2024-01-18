import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../Model/ClientClass.dart';
import '../Textstyle.dart';

class clientDetails extends StatefulWidget {
  const clientDetails({super.key});

  @override
  State<clientDetails> createState() => _clientDetailsState();
}

class _clientDetailsState extends State<clientDetails> {


  Future<List<ClientList>> fetchClientDetails() async{
    var resp = await http.get(Uri.parse("http://catodotest.elevadosoftwares.com//Client/GetAllClientDetails"));
    var data = jsonDecode(resp.body)["clientList"];
    return (data as List).map((e) => ClientList.fromJson(e) ).toList();

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchClientDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
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
                FutureBuilder<List<ClientList>>(
                    future: fetchClientDetails(),
                    builder: (context, snapshot){
                      if(snapshot.hasData){
                        List<ClientList> list = snapshot.data!; //inserting the data into a list
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
                                    Text('Client ID : ${list[index].clientId.toString()}',
                                    style: page,
                                    ),
                                    Text('Client Name : ${list[index].clientName.toString()}'),
                                    Text('Client Mobile no : ${list[index].phone.toString()}'),
                                    Text('Client Address : ${list[index].address.toString()}'),
                                    Text('Client Mail ID : ${list[index].email.toString()}'),
                                    Text('Client GST No : ${list[index].gst.toString()}'),
                                    Text('Contact Person : ${list[index].contactPerson.toString()}'),
                                    Text('Contact Person no : ${list[index].phoneNumber.toString()}'),
                                    Text('Website : ${list[index].website.toString()}'),
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
