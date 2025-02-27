import 'package:flutter/material.dart';

class Boxpage extends StatefulWidget {
  const Boxpage({super.key});

  @override
  State<Boxpage> createState() => _BoxpageState();
}

class _BoxpageState extends State<Boxpage> {
  final List<String> features = [
    "Powerful lighting for evening and night games.",
    "Premium playing surface to enhance performance and reduce injuries.",
    "Digital or manual scoreboard with trained umpires for official games.",
    "Different pitch types for spin, pace, or balanced play.",
    "Bats, balls, gloves, pads, and helmets for players who don’t bring their own.",
    "Comfortable seating arrangements for friends, family, and supporters.",
    "Clean and well-maintained facilities for players.",
    "Snacks, drinks, and energy boosters available on-site.",
    "Organizing leagues, corporate tournaments, and friendly matches.",
    "Special packages for company events and team-building activities."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "asset/images/p2b.jpg",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "StrEat Adda Box Cricket",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ),
                      Icon(Icons.favorite_border, size: 30),
                    ],
                  ),
                  SizedBox(height: 5),
                  Container(height: 3, width: double.infinity, color: Colors.black),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.star, size: 25),
                      SizedBox(width: 10),
                      Text("Features", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: features.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.check_circle, color: Colors.green, size: 20),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                features[index],
                                style: TextStyle(fontSize: 16),
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
