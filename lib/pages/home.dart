import 'dart:convert';

import 'package:flutter/material.dart';
import '../widgets/SummaryItem.dart';
import 'package:http/http.dart' as http;
import 'package:covid19/models/summary.dart';

class PagePertama extends StatelessWidget {
  late Summary dataSummary;

  Future getSummary() async {
    var response = await http.get(
      Uri.parse("https://covid19.mathdro.id/api"),
    );
    // print(response.body);
    var data = json.decode(response.body) as Map<String, dynamic>;
    dataSummary = Summary.fromJson(data);
    // print(dataSummary.confirmed.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          // SafeArea(
          //   child: SingleChildScrollView(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         Padding(
          //           padding: EdgeInsets.all(16),
          //           child: Row(
          //             children: [
          //               Expanded(
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text(
          //                       "Hello,",
          //                       style: TextStyle(
          //                         color: Colors.white70,
          //                         fontSize: 20,
          //                       ),
          //                     ),
          //                     Text(
          //                       "Michelle",
          //                       style: TextStyle(
          //                         color: Colors.white70,
          //                         fontSize: 24,
          //                         fontWeight: FontWeight.bold,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               Container(
          //                 width: 50,
          //                 height: 50,
          //                 child: CircleAvatar(
          //                   backgroundImage: NetworkImage(
          //                       "https://picsum.photos/seed/picsum/200/300"),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
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
