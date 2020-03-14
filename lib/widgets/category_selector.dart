import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  List<String> categories = [
    'Messages',
    'Online',
    'Groups',
    'Requests',
    'Blocked'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Text(categories[index],
          style: TextStyle(
           color: index==selectedIndex ? Colors.white : Colors.white54,
           fontSize: 24.0,
           fontWeight: FontWeight.bold, 
           letterSpacing: 1.2
          ),),
        );
      }),
    );
  }
}
