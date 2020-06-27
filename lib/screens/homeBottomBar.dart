import 'package:flutter/material.dart';
import '../models/mealModel.dart';
import '../widgets/drawer_main.dart';
import './favoriteScreen.dart';
import './categories.dart';

class HomeBottomBarScreen extends StatefulWidget {
  final List<MealModel> favoriteMeals;

  HomeBottomBarScreen(this.favoriteMeals);
  @override
  _HomeBottomBarScreenState createState() => _HomeBottomBarScreenState();
}

class _HomeBottomBarScreenState extends State<HomeBottomBarScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    // print(index);
    setState(() {
      _selectedPageIndex = index;
      print(_selectedPageIndex);
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'key': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'key': FavoriteScreen(widget.favoriteMeals),
        'title': 'Favorites',
      },
    ];
    super.initState();
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
