import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mountain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          Placeholder(
            fallbackHeight: 290.0,
          ),
          Body(themeData: themeData),
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(themeData: themeData),
          Actions(),
          Text('Lorem ipsum')
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 40.0,
      ),
      child: Row(
        children: [
          // 2 textes
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Text 1',
                  style: themeData.textTheme.headline5,
                ),
                Text(
                  'Text 2',
                  style: themeData.textTheme.headline6!
                      .copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red),
          Text('41')
        ],
      ),
    );
  }
}

class Actions extends StatelessWidget {
  const Actions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Button(
          icon: Icons.call,
          label: 'Call',
        ),
        Button(
          icon: Icons.navigation,
          label: 'Route',
        ),
        Button(
          icon: Icons.share,
          label: 'Share',
        ),
      ],
    );
  }
}

class Button extends StatelessWidget {
  final IconData icon;
  final String label;

  Button({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () {
        print('Clic sur $label');
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.blue,
            ),
            const SizedBox(height: 10.0),
            Text(
              label.toUpperCase(),
              style: const TextStyle(color: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
