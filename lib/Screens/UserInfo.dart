import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("asset/images/user_back.jpg"),fit: BoxFit.cover),
            ),child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: CircleAvatar(
                  backgroundImage: AssetImage("asset/images/user_logo_2.png"),
                  backgroundColor: Colors.white,
                  radius: 60,
                ),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(left: 60,right: 60),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/18,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40),bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40))
                    ),
                    child:
                Center(child: Text("Mr.John_Wick",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),))),
              ),
                
              Padding(
                padding: const EdgeInsets.only(top: 40,left: 80),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.favorite,size: 40,color:Colors.red ,),
                        SizedBox(width: 20,),
                        Text("Favorite",style: TextStyle(fontSize: 20),)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Icons.phone,size: 40,color:Colors.black ,),
                        SizedBox(width: 20,),
                        Text("+91 1234567890",style: TextStyle(fontSize: 20),)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Icons.remove_red_eye,size: 40,color:Colors.black ,),
                        SizedBox(width: 20,),
                        Text("Mrjosh1100",style: TextStyle(fontSize: 20),)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Icons.notifications_active,size: 40,color:Colors.black ,),
                        SizedBox(width: 20,),
                        Text("Notification",style: TextStyle(fontSize: 20),)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Icons.logout,size: 40,color:Colors.black ,),
                        SizedBox(width: 20,),
                        Text("Logout",style: TextStyle(fontSize: 20),)
                      ],
                    ),
                
                  ],
                ),
              ),
                
                
                
                
            ],
          ),
          ),
        )
      
      ),
    );
  }


}




