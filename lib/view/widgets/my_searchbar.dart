import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      backgroundColor: const MaterialStatePropertyAll(Colors.white),
      elevation: const MaterialStatePropertyAll(5),
      hintText: "Search",
      hintStyle: const MaterialStatePropertyAll(TextStyle(fontSize: 24)),
      leading: SvgPicture.asset(
        "assets/bag_auth.svg",
        height: 40,
      ),
      trailing: const <Widget>[Icon(Icons.search)],
      overlayColor: const MaterialStatePropertyAll(Colors.amber),
      shadowColor: const MaterialStatePropertyAll(Colors.blueGrey),
      shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)))),
    );
  }
}
