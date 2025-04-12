import 'package:crizonex/Screens/Second_Page.dart';
import 'package:crizonex/Screens/UserInfo.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  var boxname;
  var address;
  var image;
  var date;
  var time;
  Payment({super.key,this.boxname,this.address,this.image,this.date,this.time});
  @override
  State<Payment> createState() => _PaymentState();
}
class _PaymentState extends State<Payment> {
  List<Payment_Data> Payment_info=[
    Payment_Data("asset/images/g_pay.png", "Google Pay"),
    Payment_Data("asset/images/phone_pe_logo.png", "Phone Pe"),
    Payment_Data("asset/images/paytm.png", "Paytm"),
    Payment_Data("asset/images/paypal_logo.png","PayPal"),
    Payment_Data("asset/images/mastercard.png", "MasterCard"),
    Payment_Data("asset/images/visa.png", "VISA"),
    
    
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
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
            
                            children: [
                              Text(widget.boxname,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                softWrap: true,
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 3),
                              Flexible(
                                child: Text(widget.address.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                  softWrap: true,
                                  style:  TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 120,
            
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(image: AssetImage(widget.image.toString()),fit: BoxFit.cover)
            
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.date.toString(),style: TextStyle(fontSize: 12),),
                                Text(widget.time.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        
                          Center(child: Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: Row(
                              children: [
                                Icon(Icons.currency_rupee,size: 30,),
                                Text("1000",style: TextStyle(fontSize: 30),),
                              ],
                            ),
                          ))
                        ],
                      ),
                                
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(left: 20,top:10,right: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: Payment_info.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(),
                        child: SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: Container(
                            height: 100,

                            child: ListTile(
                              leading:Image.asset(Payment_info[index].Pics,width: 50,height: 50,),
                              // leading:Image(image: Payment_info[index].Pics),
                              title: Text(Payment_info[index].Text.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              trailing: Icon(Icons.arrow_forward_ios_outlined),
                            ),

                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                  child: InkWell(
                    onTap: () {
                      showDialog(context: context, builder: (context)=>AlertDialog(
                        title: Icon(Icons.check_circle,color: Colors.blue,size: 50,),
                        content: Text("Your selected box is booked and Payment was successfully submitted"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>ListOfBox()));
                            },
                            child: Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),

                                ),
                              
                                padding: const EdgeInsets.all(14),
                                child: Center(child:Text("OKAY",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
                              ),
                            ),
                          ),
                        ],
                      ));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/11,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Payment Successfully",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                          SizedBox(width: 10,),
                          Icon(Icons.check_circle,color: Colors.white,size: 25,),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class Payment_Data{
  var Pics;
  var Text;

  Payment_Data(this.Pics, this.Text);
  var pics;
  var text;
  
}