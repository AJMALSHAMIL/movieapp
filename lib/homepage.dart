import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movieapp/moviespage.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


   List apiData=[];
   List Movies =[];

  
  getApi()async{
    Uri? url = Uri.tryParse('https://api.tvmaze.com/shows');
    http.Response data = await http.get(url!);
   List decodedApi =jsonDecode(data.body);
   apiData =decodedApi;

    Movies = apiData[0]['image'];
   setState(() {

   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Center(child: Text("Movies",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: ElevatedButton(onPressed: (){
        //       getApi();
        //     },
        //         child: Text("Get",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black),)),
        //   ),
        // ],
      ),
      body: Padding(
        padding:  EdgeInsets.all(w*0.03),
        child: Container(
          width: w*1,
          child: Container(
            width: w*1,
            height: h*1,
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              // itemCount: Movies.length,
              itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: w*0.05,
                    crossAxisSpacing: w*0.05,
                    childAspectRatio: 0.65
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Moviespage(),));
                    },
                    child: Container(
                      width: w*0.2,
                      height: h*0.2,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.yellow.withOpacity(0.25),
                              blurRadius:4,
                              spreadRadius: 2,
                              offset: Offset(0,4),
                            ),
                          ],
                          color: Colors.white,
                        borderRadius: BorderRadius.circular(w*0.04),
                        border: Border.all(color: Colors.yellow)
                      ),

                      child: Padding(
                        padding:  EdgeInsets.all(w*0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                width: w*0.35,
                                height: w*0.4,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(w*0.04),
                                    border: Border.all(color: Colors.yellow),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        blurRadius:4,
                                        spreadRadius: 2,
                                        offset: Offset(0,4),
                                      ),
                                    ]
                                ),
                                child:
                                Center(child: Text("img",style: TextStyle(fontWeight: FontWeight.w700),)),
                                //  Image.network("${Movies[index]['medium']}",fit: BoxFit.fill,),
                            ),
                            ),
                            SizedBox(height: w*0.04,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name :",style: TextStyle(fontWeight: FontWeight.w700,fontSize: w*0.045),),
                                // Text("Name :${}",style: TextStyle(fontWeight: FontWeight.w700,fontSize: w*0.045),),
                                Text("Type :",style: TextStyle(fontWeight: FontWeight.w500),),
                                // Text("Type :${}",style: TextStyle(fontWeight: FontWeight.w500),),
                                Text("Language :",style: TextStyle(fontWeight: FontWeight.w500),),
                                // Text("Language :${}",style: TextStyle(fontWeight: FontWeight.w500),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                  },),
          ),
        ),
      ),
    );
  }
}
