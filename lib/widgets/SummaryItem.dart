// import 'dart:ui';

import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  SummaryItem(this.title, this.value, this.logo, this.color);
  String title;
  Icon logo;
  String value;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // width: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.all(11),
        elevation: 2,
        child: Container(
          // height: double.infinity,
          height: 200,
          // width: 200,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: color,
                      boxShadow: [
                        BoxShadow(
                          color: color,
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: Offset(0, 1),
                        )
                      ]),
                  // padding: EdgeInsets.all(20),
                  child: logo,
                ),
                SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
        ),
      ),
    );
    // return Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(30),
    //     color: Colors.white,
    //     boxShadow: const [
    //       BoxShadow(
    //         offset: Offset(0, 0),
    //         blurRadius: 6,
    //         color: Colors.black38,
    //       ),
    //     ],
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       // Container(
    //       //   // height: 200,
    //       //   // width: 200,
    //       //   child: Image.asset(
    //       //     image,
    //       //     fit: BoxFit.cover,
    //       //     width: 200,
    //       //     height: 200,
    //       //     // scale: ,

    //       //   ),
    //       // ),
    //       Expanded(
    //         child: ClipRRect(
    //           borderRadius: BorderRadius.circular(30),
    //           child: Image.asset(
    //             image,
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 16),
    //         child: Text(
    //           title,
    //           style: TextStyle(
    //             color: Colors.black,
    //             fontWeight: FontWeight.bold,
    //             fontSize: 20,
    //           ),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 16),
    //         child: Text(
    //           '$value People',
    //           style: TextStyle(
    //             color: Colors.black,
    //             fontSize: 14,
    //           ),
    //         ),
    //       ),
    //       SizedBox(height: 16),
    //     ],
    //   ),
    // );
  }
}
