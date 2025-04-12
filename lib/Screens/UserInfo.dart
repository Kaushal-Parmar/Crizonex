import 'package:flutter/material.dart';

import 'MyAccount.dart';
import 'UserNotification.dart';
import 'Userhistory.dart';
class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  void _showMyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text("My Account"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildInfoRow("UserName:", "Kelvin_007"),
                SizedBox(height: 10),
                _buildInfoRow("Email:", "kelvin@example.com"),
                SizedBox(height: 10),
                _buildInfoRow("Phone:", "+91 9876543210"),
                SizedBox(height: 10),
                _buildInfoRow("Password", "kelvin008899"),

              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("OK"),
              onPressed: () {

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void _showMyDialogLogout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("LogOut "),
          content: Text("Are you sure?"),
          actions: [
            TextButton(
              child: const Text("Yes",style: TextStyle(color: Colors.green),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("No",style: TextStyle(color: Colors.red),),
              onPressed: () {

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("asset/images/img.png"),
                      radius: 40,
                    ),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        Text("Kelvin_007",style: TextStyle(fontSize: 25),),
                        Row(
                          children: [
                            Text("+91",style: TextStyle(fontSize: 15),),
                            Text("998866234",style: TextStyle(fontSize: 15),)
                          ],
                        )
                      ],
                    )
                  ],
                ),

                InkWell(
                  onTap: () {
                    _showMyDialog(context);
                  },
                  child: ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text("My Account "),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Userhistory(),));
                  },
                  child: ListTile(
                    leading: Icon(Icons.history),
                    title: Text("History "),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) => Usernotification(), ));
                  },
                  child: ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text("Notification "),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return getBottomsheet();
                        });
                  },
                  child: ListTile(
                    leading: Icon(Icons.edit),
                    title: Text("Editing "),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _showMyDialogLogout();

                  },
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("Log-out ",),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),

              ],
            ),
          )
        )
      
      ),
    );
  }
  Widget getBottomsheet({bool isUpdate = false, int id = 0}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Update Data',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextField(
            // controller: titlecontroller,
            decoration: InputDecoration(
              hintText: "Enter Update Mail i'd",
              labelText: "UserName",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            // controller: titlecontroller,
            decoration: InputDecoration(
              hintText: "Enter Update Mail i'd",
              labelText: "Mail I'd",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.number,
            // controller: titlecontroller,
            decoration: InputDecoration(
              hintText: "Enter Update Phone number ",
              labelText: "Phone Number",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            // controller: titlecontroller,
            decoration: InputDecoration(
              hintText: "Enter Update new password ",
              labelText: "Password ",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 1, color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {

                  },
                  child: Text("Update data"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 1, color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text("Okay"),
          ),
        ],
      ),
    );
  }

}





