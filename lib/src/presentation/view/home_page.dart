import 'package:flutter/material.dart';
import 'first_tab.dart';
import 'fourth_tab.dart';
import 'second_tab.dart';
import 'third_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _page;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _page = 0;
    _pageController = PageController(
      initialPage: _page,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (newPage) {
          setState(() {
            _page = newPage;
          });
        },
        children: <Widget>[
          FirstTab(),
          SecondTab(),
          ThirdTab(),
          FourthTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 50.0,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        showUnselectedLabels: true,
        currentIndex: _page,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.accessibility,
            ),
            label: 'First Tab',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.movie,
            ),
            label: 'Second Tab',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.image,
            ),
            label: 'Third Tab',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on,
            ),
            label: 'Fourth Tab',
          ),
        ],
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(
              milliseconds: 500,
            ),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
