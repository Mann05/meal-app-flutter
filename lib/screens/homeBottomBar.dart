import 'package:flutter/material.dart';
import '../widgets/drawer_main.dart';
import './favoriteScreen.dart';
import './categories.dart';

class HomeBottomBarScreen extends StatefulWidget {
  @override
  _HomeBottomBarScreenState createState() => _HomeBottomBarScreenState();
}

class _HomeBottomBarScreenState extends State<HomeBottomBarScreen> {
  final List<Map<String, Object>> _pages = [
    {'key': CategoriesScreen(), 'title': 'Categories'},
    {'key': FavoriteScreen(), 'title': 'Favorites'},
  ];
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    print(index);
    setState(() {
      _selectedPageIndex = index;
      print(_selectedPageIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['key'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Category'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorite'),
          ),
        ],
      ),
    );
  }
}
