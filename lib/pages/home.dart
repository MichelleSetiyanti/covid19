import 'dart:convert';

import 'package:flutter/material.dart';
import '../widgets/SummaryItem.dart';
import 'package:http/http.dart' as http;
import 'package:covid19/models/update.dart';

class PagePertama extends StatelessWidget {
  const PagePertama({Key? key}) : super(key: key);

  Future<Covid> getSummary() async {
    var response = await http.get(
      Uri.parse("https://data.covid19.go.id/public/api/update.json"),
    );
    return Covid.fromJson(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              // background(),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.indigo[900],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      header(),
                      search(),
                      FutureBuilder(
                        future: getSummary(),
                        builder: (context, AsyncSnapshot<Covid?> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: Text(
                                "Laoding..",
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          }
                          return Row(
                            children: [
                              SummaryItem(
                                "CONFIRMED",
                                "${snapshot.data?.update.total.jumlahPositif}",
                                const Icon(
                                  Icons.person_add_alt_sharp,
                                  color: Colors.white,
                                ),
                                Colors.amber,
                              ),
                              SummaryItem(
                                "DEATHS",
                                "${snapshot.data?.update.total.jumlahMeninggal}",
                                const Icon(Icons.person_off_sharp,
                                    color: Colors.white),
                                const Color.fromARGB(255, 51, 230, 212),
                              ),
                            ],
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            // boxShadow: [
                            //   BoxShadow(color: Colors.green, spreadRadius: 1),
                            // ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Container(
          //   width: 300,
          //   height: 300,
          //   color: Colors.amber,
          // ),
        ],
      ),

      // appBar: AppBar(
      //   title: Text("data"),
      //   centerTitle: true,
      // ),
      // body: FutureBuilder(
      //     future: getSummary(),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return Center(
      //           child: Text("Laoding.."),
      //         );
      //       }
      //       return Column(
      //         children: [
      //           SummaryItem("CONFIRMED", "${dataSummary.confirmed.value}"),
      //           SummaryItem("DEATHS", "${dataSummary.confirmed.value}"),
      //         ],
      //       );
      //     }),
    );
  }
}

Widget search() {
  return Container(
    margin: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search..",
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.indigo[900],
              ),
              isDense: true,
              contentPadding: const EdgeInsets.all(0),
            ),
            textAlignVertical: TextAlignVertical.center,
          ),
        ),
        Container(
          width: 1,
          height: 30,
          color: Colors.indigo[900],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 30,
          ),
        ),
      ],
    ),
  );
}

Widget header() {
  return Padding(
    padding: EdgeInsets.all(16),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Hello,",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Michelle",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 50,
          height: 50,
          child: CircleAvatar(
            backgroundImage:
                NetworkImage("https://picsum.photos/200/300?random=2"),
          ),
        ),
      ],
    ),
  );
}

Widget background() {
  return Container(
    height: 300,
    decoration: BoxDecoration(
      color: Colors.indigo[900],
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
    ),
  );
}
