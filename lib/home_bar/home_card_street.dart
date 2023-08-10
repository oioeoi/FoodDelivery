import 'package:flutter/material.dart';

class StreetCard extends StatelessWidget {
  const StreetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(alignment: Alignment.topCenter, children: [
        Container(//lapisan bawah
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.green[200],
          ),
        ),
        Container( //lapisan atas
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromARGB(
              255,
              42,
              107,
              78,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery to Home',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Jlm. Utama Street No.2',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      alignment: Alignment(0, 0),
                      child: Text(
                        '2.4 Km',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: const Color.fromARGB(255, 64, 61, 61),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                  iconSize: 35,
                  onPressed: () {},
                  icon: Icon(
                    Icons.navigate_next_rounded,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ]),
    );
  }
}
