import 'package:flutter/material.dart';
import 'package:up_down_app/screens/action_list_screen.dart';
import 'package:up_down_app/screens/action_form_screen.dart';
import 'package:up_down_app/screens/action_insights_screen.dart';
import 'package:provider/provider.dart';
import 'package:up_down_app/data/up_down_action.dart';
import 'package:up_down_app/screens/talk_about_it_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UpDownActionModel(),
      child: UpDownApp(),
    ),
  );
}

class UpDownApp extends StatefulWidget {
  @override
  _UpDownAppState createState() => _UpDownAppState();
}

class _UpDownAppState extends State<UpDownApp> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    ActionFormScreen(),
    ActionListScreen(),
    ActionInsightsScreen(),
    TalkAboutItScreen(),
    // ... other screens
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Up Down App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _children,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

