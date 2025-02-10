import 'package:flutter/material.dart';

class UserTileWidget extends StatelessWidget {
  const UserTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.9,
      height: height * 0.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.black),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: height * 0.01),
            child: Container(
              width: width * 0.2,
              height: height * 0.1,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Column(
            children: [
              FittedBox(
                child: Text(
                  'Arham Bajwa',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              FittedBox(
                child: Text(
                  'muhammadarhambajwa1@gmail.com',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
              FittedBox(
                child: Text(
                  '03xxxxxxxxx',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
