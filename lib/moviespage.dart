import 'package:flutter/material.dart';

import 'main.dart';

class Moviespage extends StatefulWidget {
  const Moviespage({super.key});

  @override
  State<Moviespage> createState() => _MoviespageState();
}

class _MoviespageState extends State<Moviespage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,size: w*0.1,
            color: Colors.yellow,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body:Container(
        width: w*1,
        height: h*1,
        child: Padding(
          padding:  EdgeInsets.all(w*0.06),
          child: Column(
            children: [
              SizedBox(height: h*0.03,),
              Container(
                width: w*0.9,
                height: h*0.5,
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
                child: Center(
                  child: Text("Img",style: TextStyle(fontSize: w*0.08,fontWeight: FontWeight.w700),),
                ),
              ),
               SizedBox(height: h*0.03,),
              ElevatedButton(onPressed: (){
              },
                child: Text("Play",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white),),
                style: ButtonStyle(
                  backgroundColor:WidgetStatePropertyAll(Colors.blue),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name: ",style: TextStyle(fontWeight: FontWeight.w700,fontSize: w*0.1,color: Colors.yellow),),
                      SizedBox(height: h*0.02,),
                      Text("Type:",style: TextStyle(fontWeight: FontWeight.w600,fontSize: w*0.05,color: Colors.yellow),),
                      SizedBox(height: h*0.02,),
                      Text("Language:",style: TextStyle(fontWeight: FontWeight.w600,fontSize: w*0.05,color: Colors.yellow),),
                    ],
                  ),
                  SizedBox()
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
