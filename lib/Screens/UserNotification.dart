import 'package:flutter/material.dart';
class Usernotification extends StatefulWidget {
  const Usernotification({super.key});

  @override
  State<Usernotification> createState() => _UsernotificationState();
}

class _UsernotificationState extends State<Usernotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        toolbarHeight: 90,
        backgroundColor: Colors.green,
        centerTitle: true, // Centers the title
        title: SizedBox(
          height: 210, // Adjust the height as needed
          width: 200,  // Adjust the width as needed
          child: Image.asset(
            'asset/images/logo2.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("asset/images/background.jpg"),fit: BoxFit.cover)
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10,left: 15,right: 15),
            child: Column(
              children: [
                Container(
                  height: 110,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("7 Star sport club",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Text("Date: ",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                            Text(" 03/04/2025",style: TextStyle(color: Colors.white,fontSize: 15,),),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Time :",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                            Text("03-04 pm ",style: TextStyle(color: Colors.white,fontSize: 15),)
                          ],
                        ),
                        Row(
                          children: [
                            Text("Statues: ",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                            Text("Booked",style: TextStyle(color: Colors.white,fontSize: 15,),)


                          ],
                        )
                      ],
                    ),
                  ) ,
                ),
                SizedBox(height: 10,),
                Container(
                  height: 110,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("StrEat Adda Box Cricket",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Text("Date: ",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                            Text(" 10/04/2025",style: TextStyle(color: Colors.white,fontSize: 15,),),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Time :",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                            Text("10-12 pm ",style: TextStyle(color: Colors.white,fontSize: 15),)
                          ],
                        ),
                        Row(
                          children: [
                            Text("Statues: ",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                            Text("Booked",style: TextStyle(color: Colors.white,fontSize: 15,),)


                          ],
                        )
                      ],
                    ),
                  ) ,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
