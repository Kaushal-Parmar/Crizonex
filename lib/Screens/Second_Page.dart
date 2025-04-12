import 'package:crizonex/Screens/BoxPage.dart';
import 'package:flutter/material.dart';

class ListOfBox extends StatefulWidget {
  const ListOfBox({super.key});

  @override
  State<ListOfBox> createState() => _ListOfBoxState();
}

class _ListOfBoxState extends State<ListOfBox> {
  TextEditingController searchController = TextEditingController();

  final List<String> pics = [
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

  final List<String> boxNames = [
    "Free Hit - Box Cricket",
    "StrEat Adda Box Cricket",
    "7 Star Sports Club",
    "Backbenchers Box Cricket",
    "The Capital Cricket Box",
    "The Infinity Box Cricket",
    "NH51 Box Cricket",
    "P2B Cricket Box",
    "Somnath Cricket"
  ];

  final List<String> addresses = [
    "Raghukul Farm, Airport Rd, Bhavnagar, Gujarat 364001",
    "Streat Adda Cafe, Bhavnagar, Gujarat 364001",
    "7Star Sports Club, Bhavnagar, Gujarat 364001",
    "Opposite Top 3 Lords, Budhel, Bhavnagar, Gujarat 364002",
    "Near D-Mart, Kailash Dham Society, Bhavnagar, Gujarat 364002",
    "Hill Park to S.S.Engineering college road, Bhavnagar, Gujarat 364001",
    "NH51, Gujarat 364002",
    "Bhavnagar, Gujarat 364110",
    "Top 3 Circle, Road, Bhavnagar, Gujarat 364002"
  ];

  List<String> filteredPics = [];
  List<String> filteredBoxNames = [];
  List<String> filteredAddresses = [];

  @override
  void initState() {
    super.initState();
    filteredPics = List.from(pics);
    filteredBoxNames = List.from(boxNames);
    filteredAddresses = List.from(addresses);
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredPics = List.from(pics);
        filteredBoxNames = List.from(boxNames);
        filteredAddresses = List.from(addresses);
      });
      return;
    }

    List<String> tempPics = [];
    List<String> tempBoxNames = [];
    List<String> tempAddresses = [];

    for (int i = 0; i < boxNames.length; i++) {
      if (boxNames[i].toLowerCase().contains(query.toLowerCase()) ||
          addresses[i].toLowerCase().contains(query.toLowerCase())) {
        tempPics.add(pics[i]);
        tempBoxNames.add(boxNames[i]);
        tempAddresses.add(addresses[i]);
      }
    }

    setState(() {
      filteredPics = tempPics;
      filteredBoxNames = tempBoxNames;
      filteredAddresses = tempAddresses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      searchController.clear();
                      filterSearchResults('');
                    },
                  ),
                ),
                onChanged: (value) => filterSearchResults(value),
              ),
            ),
            Expanded(
              child: filteredBoxNames.isEmpty
                  ? const Center(child: Text("No results found"))
                  : ListView.builder(
                itemCount: filteredPics.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Boxpage(
                              Image: filteredPics[index],
                              BoxName: filteredBoxNames[index],
                              Location: filteredAddresses[index],
                            ),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 5,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage("asset/images/Container_back.png"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  filteredPics[index],
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
                                        filteredBoxNames[index],
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
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
                                              filteredAddresses[index],
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
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
                      ),
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
