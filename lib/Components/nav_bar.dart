import 'package:emoticflutter/Utilities/color.dart';
import 'package:emoticflutter/pages/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  Color buttonColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: kPaleYellow,
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10,
            ),
          ],
        ),
        //height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, right: 10),
                      child: Image.asset("assets/images/logopic.png"),
                    ),
                    Text(
                      "Emotic",
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 100.0),
              child: InkWell(
                onTap: () {
                  Get.to(Home());
                },
                onHover: (isHover) {
                  if (isHover) {
                    setState(() {
                      buttonColor = kOrange;
                    });
                  } else {
                    setState(() {
                      buttonColor = Colors.black;
                    });
                  }
                },
                child: Row(
                  children: [
                    Icon(Icons.home, color: buttonColor),
                    Text(
                      " Home",
                      style: TextStyle(fontSize: 18, color: buttonColor),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
