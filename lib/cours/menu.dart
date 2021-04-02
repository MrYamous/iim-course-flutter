import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuka/app_icons.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  ProductDetailsCurrentTab currentTab = ProductDetailsCurrentTab.summary;
  int position = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(AppIcons.tab_barcode), label: 'Fiche'),
          BottomNavigationBarItem(
              icon: Icon(AppIcons.tab_fridge), label: 'Caractéristiques'),
          BottomNavigationBarItem(
              icon: Icon(AppIcons.tab_nutrition), label: 'Nutrition'),
          BottomNavigationBarItem(
              icon: Icon(AppIcons.tab_array), label: 'Tableau'),
        ],
        currentIndex: 0,
        onTap: (int position) {
          setState(() {
            currentTab = ProductDetailsCurrentTab.values.elementAt(position);
            this.position = position;
          });
        },
      ),
    );
  }
}

enum ProductDetailsCurrentTab { summary, info, nutrition, nutritionalValues }
