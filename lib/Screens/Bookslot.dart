import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Payment.dart';

class Bookslot extends StatefulWidget {
  final String boxname;
  final String address;
  final String image;

  Bookslot({required this.boxname, required this.address, required this.image});

  @override
  State<Bookslot> createState() => _BookslotState();
}

class _BookslotState extends State<Bookslot> {
  DateTime selectedDate = DateTime.now();
  String selectedTime = "";

  final List<String> timeSlots = List.generate(24, (index) {
    String start = _formatTime(index);
    String end = _formatTime(index + 1);
    return "$start - $end";
  });

  final Map<String, bool> box1Selections = {};
  final Map<String, bool> box2Selections = {};

  static String _formatTime(int hour) {
    String period = hour < 12 ? "AM" : "PM";
    int formattedHour = hour % 12 == 0 ? 12 : hour % 12;
    return "$formattedHour:00 $period";
  }

  @override
  void initState() {
    super.initState();
    for (var slot in timeSlots) {
      box1Selections[slot] = false;
      box2Selections[slot] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        toolbarHeight: 90,
        backgroundColor: Colors.green,
        centerTitle: true,
        title: SizedBox(
          height: 210,
          width: 200,
          child: Image.asset('asset/images/logo2.png', fit: BoxFit.contain),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("asset/images/back_side_slot.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.boxname,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      backgroundColor: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
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
              _buildTimeSlotRow("Box 1", box1Selections),
              SizedBox(height: 16),
              _buildTimeSlotRow("Box 2", box2Selections),
              SizedBox(height: 20),
          
              TextField(
                // controller: titlecontroller,
                decoration: InputDecoration(
                  hintText: "Enter the booker Name",
                  labelText: "Name ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),

              TextField(
                // controller: titlecontroller,
                decoration: InputDecoration(
                  hintText: "Enter the booker Phone Number ",
                  labelText: "Phone Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20),topRight: Radius.circular(20))
                ),
                child: Center(
                  child: Text(
                    "Selected Time: $selectedTime",
                    style: TextStyle(fontSize: 16,color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height:10,),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20),topRight: Radius.circular(20))
                ),
                child: Center(
                  child: Text(
                    "Date is : ${DateFormat('yMMMd').format(selectedDate)} ",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          
              SizedBox(height: 20),
              InkWell(
                onTap: selectedTime.isNotEmpty
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Payment(
                        boxname: widget.boxname,
                        address: widget.address,
                        image: widget.image,
                        date: DateFormat('yMMMd').format(selectedDate),
                        time: selectedTime,
                      ),
                    ),
                  );
                }
                    : null,
          
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: selectedTime.isNotEmpty ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Book ",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeSlotRow(String title, Map<String, bool> selections) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: timeSlots.map((slot) {
              return ChoiceChip(
                label: Text(slot, style: TextStyle(fontSize: 12)),
                selected: selections[slot] ?? false,
                onSelected: (bool selected) {
                  setState(() {
                    selections.forEach((key, value) => selections[key] = false);
                    selections[slot] = selected;
                    if (selected) selectedTime = slot;
                  });
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
