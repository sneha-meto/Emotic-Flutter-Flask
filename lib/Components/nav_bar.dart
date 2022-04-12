import 'package:emoticflutter/pages/home_view.dart';
import 'package:flutter/material.dart';

class NavBarItem extends StatefulWidget {
  final String title;
  NavBarItem({required this.title});

  @override
  State<NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      style: TextStyle(fontSize: 18),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
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
                height: 80,
                child: Image.network('https://picsum.photos/250?image=9'),
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 100.0),
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.home),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      }),
                  NavBarItem(title: 'Home'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
