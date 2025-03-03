import 'package:crizonex/Screens/BoxPage.dart';
import 'package:crizonex/Screens/UserInfo.dart';
import 'package:flutter/material.dart';

class ListOfBox extends StatefulWidget {
  const ListOfBox({super.key});

  @override
  State<ListOfBox> createState() => _ListOfBoxState();
}

class _ListOfBoxState extends State<ListOfBox> {

   var pics = [
    "asset/images/Free_hit.jpg",
    "asset/images/Street_add.jpg",
    "asset/images/7_star.jpg",
    "asset/images/Bachbenchar.jpg",
    "asset/images/capital.jpg",
    "asset/images/infinity.jpg",
    "asset/images/NH51.jpg",
    "asset/images/p2b.jpg",
    "asset/images/Somnath.jpg",
  ];

   var boxNames = [
    "Free Hit - Box Cricket",
    "StrEat Adda Box Cricket ",
    "7 Star sports club",
    "Backbenchers box cricket",
    "The Capital Cricketbox",
    "The Infinity BoxCricket",
    "NH51 Box cricket",
    "P2B CRICKET BOX",
    "Somnath Cricket "
  ];

  var addresses = [
    "Raghukul Farm, Airport Rd, opp. D.B.Park, near PM Avas Yojna, Subhashnagar, Bhavnagar, Gujarat 364001",
    "Streat Adda Cafe, Bhavnagar - Sidsar Rd, opp. GMIU College, opposite Gyanmanjari College, Bhavnagar, Gujarat 364001",
    "7Star Sports Club, 150ft, Ring Rd, behind Nayra Petrol Pump, Tarasamiya, Bhavnagar, Gujarat 364001",
    "opposite Top 3 lords, Budhel, Bhavnagar, Gujarat 364002",
    "beside aradhna hotel street, near d-mart, Kailash Dham Society, Bhavnagar, Gujarat 364002",
    "Plot No. 5, Hill Park to S.S.Engineering college road, Bhavnagar - Sidsar Rd, Bhavnagar, Gujarat 364001, SIDSAR, Gujarat 364002",
    "NH51, Gujarat 364002",
    "Bhavnagar, Gujarat 364110",
    "Shivam Amrut 9, Top 3 circle, road, Bhavnagar, Gujarat 364002"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5,left: 14,right: 14,top: 5),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: pics.length??boxNames.length??addresses.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16,bottom: 10),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Boxpage(Image:pics[index],BoxName: boxNames[index],Location: addresses[index],)));
                        },
                        child: Card(
                          child: Container(


                            width: double.infinity,
                            decoration: BoxDecoration(

                              image: DecorationImage(image: AssetImage("asset/images/Container_back.png"),fit: BoxFit.cover),
                              borderRadius: const BorderRadius.only(

                              ),
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  child: Image.asset(
                                    pics[index],
                                    height: MediaQuery.of(context).size.height / 4,
                                    width: 120,

                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text(
                                          boxNames[index],
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          softWrap: true,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Icon(Icons.location_pin, size: 18),
                                            const SizedBox(width: 5),
                                            Expanded(
                                              child: Text(
                                                addresses[index],
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 5,
                                                softWrap: true,
                                                style: const TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ],
                                        ),
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
