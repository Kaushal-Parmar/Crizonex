import 'package:crizonex/Screens/Bookslot.dart';
import 'package:crizonex/Screens/Payment.dart';
import 'package:crizonex/Screens/UserInfo.dart';
import 'package:flutter/material.dart';

class Boxpage extends StatefulWidget {
  var Image;
  var BoxName;
  var Location;
  Boxpage({super.key,this.Image,this.BoxName,this.Location,});

  @override
  State<Boxpage> createState() => _BoxpageState();
}

class _BoxpageState extends State<Boxpage> {
  var feature=[
    "Powerful lighting for evening and night games.",
    "Premium playing surface to enhance performance and reduce injuries.",
    "Digital or manual scoreboard with trained umpires for official games.",
    "Different pitch types for spin, pace, or balanced play.",
    "Bats, balls, gloves, pads, and helmets for players who don’t bring their own.",
    "Comfortable seating arrangements for friends, family, and supporters.",
    "Clean and well-maintained facilities for players.",
    " Snacks, drinks, and energy boosters available on-site.",
    " Organizing leagues, corporate tournaments, and friendly matches.",
    "Special packages for company events and team-building activities."

  ];
  var Terms_Conditions=[
    "Cancellation refunds are only applicable if canceled at least 24 hours before the booking.",
    "No abusive language, misbehavior, or physical fights are tolerated.",
    "Alcohol and smoking are strictly prohibited inside the facility.",
    "Players are responsible for their safety. The management is not liable for injuries.",
    "Any damage to the property or equipment must be compensated by the responsible individual/team.",
    "Matches are played within a fixed time frame; delays may result in a penalty or forfeiture.",
    "Players must arrive 15 minutes before their scheduled time.",
    "No outside food or drinks allowed, except water bottles.",
    "Tournament registrations are non-refundable.",
    "Membership benefits are non-transferable and valid only for the registered member."
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                widget.Image.toString(),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10,left: 10),
                      child: Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height/10,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                        
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width/1.4,
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                    
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.location_pin),
                                        SizedBox(width: 10,),
                                        Text(widget.BoxName.toString(),
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          softWrap: true,
                                        ),
                                      ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 40,),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("asset/images/location_back.jpg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 210,right: 20),
                          child: Center(
                            child: Text(widget.Location.toString(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 10,
                              softWrap: true,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("asset/images/back_pay.jpg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 20),
                          child: Center(
                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.currency_rupee,color: Colors.white,size: 30,),
                                SizedBox(width: 10,),
                                Text(
                                  "1000",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,

                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  "Per Hour",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10,bottom: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("asset/images/phone_back.jpg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.call,color: Colors.black,size: 30,),
                                SizedBox(width: 10,),
                                Text(
                                  "+91",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,

                                  ),
                                ),
                                SizedBox(width: 5,),
                                Text(
                                  "9876567823",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,

                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20,left: 50,right: 50),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => Expanded(
                              child: AlertDialog(
                                title: Text("Terms & Conditions"),
                                content: Terms_Conditions.isNotEmpty
                                    ? SizedBox(
                                  width: double.maxFinite, 
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: Terms_Conditions.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 2),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Icon(Icons.check_circle, color: Colors.red, size: 20),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: Text(
                                                Terms_Conditions[index],
                                                style: TextStyle(fontSize: 14),
                                                softWrap: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                )
                                    : Text("No terms available"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      // Close dialog
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Bookslot(
                                            boxname: widget.BoxName.toString(),
                                            address: widget.Location.toString(),
                                            image: widget.Image.toString(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(

                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      padding: const EdgeInsets.all(14),
                                      child: Center(
                                        child: Text(
                                          "OKAY",
                                          style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.blue
                          ),
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_month,color: Colors.white,),
                              SizedBox(width: 10,),
                              Text("BOOK",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,),
                      child: Expanded(
                        child: Container(
                          
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.star,size: 25,),
                                    SizedBox(width: 10,),
                                    Text("Features",style: TextStyle(fontSize: 20),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10,right: 20),
                                child: SingleChildScrollView(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: feature.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 2),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Icon(Icons.check_circle, color: Colors.green, size: 20),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: Text(
                                                feature[index],
                                                style: TextStyle(fontSize: 14),
                                                softWrap: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
