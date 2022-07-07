import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  String weightType;
  Color colorWeightType;
  Status({Key? key, required this.colorWeightType, required this.weightType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: colorWeightType,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            weightType,
            style: TextStyle(fontSize: 18, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
