import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screeenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 70,
      width: screeenWidth * .85,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 157, 78, 105).withOpacity(.5),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            blurRadius: 8,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: const CupertinoSearchTextField(
        placeholder: "Song or artist...",
        style: TextStyle(color: CupertinoColors.systemGrey),
        itemSize: 30,
        padding: EdgeInsets.symmetric(horizontal: 20),
        prefixInsets: EdgeInsets.only(left: 20),
        suffixInsets: EdgeInsets.only(right: 20),
      ),
    );
  }
}
