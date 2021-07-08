import 'package:flutter/material.dart';
import 'package:mayankpunethainternship/provider/data_provider.dart';
import 'package:mayankpunethainternship/screens/home_screen.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _index = 0;
  List<Widget> _screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  void _changeScreen(int index) {
    setState(() {
      _index = index;
    });
  }

  bool _isInit = false;

  @override
  void didChangeDependencies() {
    Provider.of<DataProvider>(context, listen: false).fetchData();
    Provider.of<DataProvider>(context, listen: false)
        .fetchData2()
        .then((value) {
      setState(() {
        _isInit = true;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !_isInit
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: _changeScreen,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore_rounded,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.ac_unit,
            ),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.tune_outlined,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message_outlined,
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_box_outlined,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
