import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuka/res/app_images.dart';

import 'cours/menu.dart';

class DetailsProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Stack(
      children: [
        Column(children: [
          Expanded(
              child: Cover(
            themeData: themeData,
          )),
          Expanded(
              child: Card(
            themeData: themeData,
          )),
          Expanded(
              child: ProductNutriScore(
            themeData: themeData,
          )),
          Expanded(
              child: ProductNovaScore(
            themeData: themeData,
            score: 4,
          )),
          Expanded(child: ProductEcoScore(themeData: themeData, score: 'D')),
          Expanded(
              child: RowData(
            label: 'Quantité',
            value: '200gr',
            themeData: themeData,
          )),
          //Expanded(child: RowData(label: 'Vendu', value: 'France')),
          Expanded(child: DetailsScreen())
        ])
      ],
    );
  }
}

class Cover extends StatelessWidget {
  const Cover({required this.themeData});

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.productVisuel);
  }
}

class Card extends StatelessWidget {
  const Card({required this.themeData});

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Petits pois et carottes',
                  style: themeData.textTheme.headline5,
                ),
                Text(
                  'Cassegrain',
                  style: themeData.textTheme.headline6!
                      .copyWith(color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProductEcoScore extends StatelessWidget {
  ProductEcoScore({required this.themeData, required this.score});

  final ThemeData themeData;
  String score = 'C';

  String _getimpact() {
    switch (score) {
      case 'A':
        {
          return 'Très faible impact environnemental';
        }
      case 'B':
        {
          return 'Faible impact environnemental';
        }
      case 'C':
        {
          return 'Impact environnemental modéré';
        }
      case 'D':
        {
          return 'Impact environnemental élevé';
        }
      case 'E':
        {
          return 'Impact environnemental très élevé';
        }
      default:
        {
          return '';
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Row(
        children: [
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(
                  'EcoScore',
                  style: themeData.textTheme.headline5,
                ),
                Text(
                  _getimpact(),
                  style: themeData.textTheme.headline6!
                      .copyWith(color: Colors.grey),
                )
              ]))
        ],
      ),
    );
  }
}

class ProductNovaScore extends StatelessWidget {
  ProductNovaScore({required this.themeData, required this.score});

  final ThemeData themeData;
  int score = 1;

  String _getnova() {
    switch (score.toString()) {
      case '1':
        {
          return 'Aliments non transformés ou transformés minimalement';
        }
      case '2':
        {
          return 'Ingrédients culinaires transformés';
        }
      case '3':
        {
          return 'Aliments transformés';
        }
      case '4':
        {
          return 'Produits alimentaires et boissons ultra-transformés';
        }
      default:
        {
          return '';
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Row(
        children: [
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(
                  'Groupe NOVA',
                  style: themeData.textTheme.headline5,
                ),
                Text(
                  _getnova(),
                  style: themeData.textTheme.headline6!
                      .copyWith(color: Colors.grey),
                )
              ]))
        ],
      ),
    );
  }
}

class ProductNutriScore extends StatelessWidget {
  const ProductNutriScore({required this.themeData});

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Row(
        children: [
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(
                  'Nutriscore',
                  style: themeData.textTheme.headline5,
                ),
                Image.asset(AppImages.nutriscoreB)
              ]))
        ],
      ),
    );
  }
}

class RowData extends StatelessWidget {
  final String label;
  final String value;
  final bool separator;
  final ThemeData themeData;

  const RowData(
      {required this.label,
      required this.value,
      required this.themeData,
      this.separator = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      // bodyText1
      children: [
        Text(label, style: themeData.textTheme.headline5),
        Text(
          value,
          style: themeData.textTheme.headline5,
        )
      ],
    );
  }
}
