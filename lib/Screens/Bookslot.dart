import 'package:crizonex/Screens/UserInfo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Payment.dart';

class Bookslot extends StatefulWidget {
  var boxname;
  var address;
  var image;
  Bookslot({ required this.boxname,required this.address, required this.image});


  @override
  State<Bookslot> createState() => _BookslotState();


}

class _BookslotState extends State<Bookslot> {

  DateTime selectedDate = DateTime.now();
  String dropdownValue = '00-01';
  String dropdownValue2 = '00-01';

  // Example of booked slots for demonstration
  final List<String> bookedSlots = ['10-11', '15-16', '20-21'];

  List<String> timeSlots = List.generate(24, (index) {
    String start = index.toString().padLeft(2, '0');
    String end = (index + 1).toString().padLeft(2, '0');
    return '$start-$end';
  });

  // Function to check slot availability
  bool isSlotAvailable(String time) {
    return !bookedSlots.contains(time);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.black.withOpacity(0.6),
        title: Image.asset(
          'asset/images/Text_logo2.png',
          fit: BoxFit.contain,
          height: 100,
          width: 200,
        ),
        actions: [

          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              children: [
                IconButton(
                  icon: Icon(Icons.notifications,color: Colors.white,size: 30,),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.person,color: Colors.white,size: 30,),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewPage()));
                  },
                ),
              ],
            ),
          ),

        ],

      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            // Date Picker Row
            SizedBox(height: 10,),

            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image:AssetImage("asset/images/back_side_slot.jpg"),fit: BoxFit.cover)
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Center(child: Text(" ${widget.boxname}",style: TextStyle(color: Colors.white,fontSize: 30,backgroundColor: Colors.black.withOpacity(0.4)),)),

                ],
              ),

            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('yMMMd').format(selectedDate),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2060),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        selectedDate = pickedDate;
                      });
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.white),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_month, color: Colors.white),
                        SizedBox(width: 5),
                        Text("Select", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Time Slot Selection Row
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Slot A
                  Column(
                    children: [
                      slotBox("A"),
                      SizedBox(height: 20),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: timeSlots.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                  // Slot B
                  Column(
                    children: [
                      slotBox("B"),
                      SizedBox(height: 20),
                      DropdownButton<String>(
                        value: dropdownValue2,
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: timeSlots.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue2 = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Display Selected Date & Time
            Text(
              "Selected Date: ${DateFormat('yMMMd').format(selectedDate)}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Selected Time: $dropdownValue",
              style: TextStyle(fontSize: 16),
            ),

            // Slot Availability Check
            SizedBox(height: 20),
            Text(
              isSlotAvailable(dropdownValue) ? "Available" : "Not Available",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isSlotAvailable(dropdownValue) ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: 40,),
            InkWell(
              onTap:() {
                Navigator.pop(context);
                // Close dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Payment(
                      boxname: widget.boxname.toString(),
                      address: widget.address.toString(),
                      image: widget.image.toString(),
                      date: DateFormat('yMMMd').format(selectedDate),
                      time: dropdownValue,
                    ),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration:BoxDecoration(
                    color: Colors.blue
                ),
                child: Center(child: Text("Booking",style:TextStyle(fontSize: 25,color: Colors.white),)),
              ),
            )

          ],
        ),
      ),
    );
  }

  // Function to generate slot UI
  Widget slotBox(String label) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 200,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.black),
            color: Colors.green,
          ),
        ),
        Positioned(
          top: 20,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 80,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 40,
            child: Image.asset("asset/images/logo__main.png"),
          ),
        ),
      ],
    );
  }
}
