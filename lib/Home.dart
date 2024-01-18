import 'package:flutter/material.dart';
import 'package:get_api_sample/Get_pages/getClientDetails.dart';
import 'package:get_api_sample/Get_pages/getEmployeDetails.dart';
import 'package:get_api_sample/Textstyle.dart';
import 'package:get_api_sample/post_pages/Add_Client_Details.dart';
import 'package:get_api_sample/post_pages/Add_Employe.dart';
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>addemploye()));

                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*0.4,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Text("Add Employe",
                    style: page,
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>addClientDetails()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*0.4,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Text("Add Client",style: page,)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>employeDetails()));

                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*0.4,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("View Employe",style: page,),
                        )
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>clientDetails()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*0.4,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Text("View Client",
                    style: page
                    )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
