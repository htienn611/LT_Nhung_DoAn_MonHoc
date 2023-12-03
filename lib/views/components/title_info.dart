import 'package:flutter/material.dart';

class InfoTitle extends StatelessWidget {
  const InfoTitle(
      {super.key,
      required this.icon,
      required this.title,
      required this.value});
  final IconData icon;
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    double cardW = MediaQuery.of(context).size.width - 10 > 402
        ? 500
        : MediaQuery.of(context).size.width - 10;
    print(cardW);
    return Container(
        width: cardW,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Card(
          elevation: 0,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    size: 30,
                  )
                ],
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(value, style: TextStyle(fontSize: 18))
                ],
              )
            ],
          ),
        ));
  }
}