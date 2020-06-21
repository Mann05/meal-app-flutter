import 'package:flutter/material.dart';
import '../widgets/drawer_main.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false,
      _vegetarian = false,
      _vegan = false,
      _lactose = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal Selection',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text('Vegetarian Free'),
                  value: _vegetarian,
                  subtitle: Text('Only Include vegetarian-free meals.'),
                  onChanged: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Gluten Free'),
                  value: _glutenFree,
                  subtitle: Text('Only Include gluten-free meals.'),
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegan Free'),
                  value: _vegan,
                  subtitle: Text('Only Include vegan-free meals.'),
                  onChanged: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Lactose Free'),
                  value: _lactose,
                  subtitle: Text('Only Include lactose-free meals.'),
                  onChanged: (newValue) {
                    setState(() {
                      _lactose = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
