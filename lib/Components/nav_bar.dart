import 'package:emoticflutter/pages/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
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
                      style: TextStyle(fontSize: 25),
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
                child: Row(
                  children: [
                    Icon(Icons.home),
                    Text(
                      " Home",
                      style: TextStyle(fontSize: 18),
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
