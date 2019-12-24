import 'package:fivekmrun_flutter/profile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    // Text(
    //   'Index 0: Профил',
    //   style: optionStyle,
    // ),
    ProfileDashboard(),
    Text(
      'Index 1: Бягания',
      style: optionStyle,
    ),
    Text(
      'Index 2: Резултати',
      style: optionStyle,
    ),
    Text(
      'Index 3: Събития',
      style: optionStyle,
    ),
    Text(
      'Index 4: Дарения',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Профил'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run),
            title: Text('Бягания'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            title: Text('Резултати'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Събития'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Дарения'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
