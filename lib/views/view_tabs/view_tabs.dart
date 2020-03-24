import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meals/models/model_meals.dart';
import 'package:meals/views/view_favorites/view_favorites.dart';
import 'package:meals/views/view_filters/view_filters.dart';
import 'package:meals/views/view_home/view_home.dart';
import 'package:meals/widget_icon_button.dart';
import 'package:provider/provider.dart';

class ViewTabs extends StatefulWidget {
  @override
  _ViewTabsState createState() => _ViewTabsState();
}

class _ViewTabsState extends State<ViewTabs> {
  final List<Map<String, dynamic>> pages = [
    {
      'view': ViewHome(),
      'title': 'Categories',
      'actions': [
        WIconButton(
          icon: Icons.category,
          onPressed: () {},
        )
      ]
    },
    {
      'view': ViewFavorites(),
      'title': 'Favorites',
      'actions': [
        WIconButton(
          icon: Icons.star,
          onPressed: () {},
        )
      ]
    }
  ];
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Meals meals = Provider.of<Meals>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pages[pageIndex]['title'],
          style: TextStyle(color: Colors.white),
        ),
        actions: pages[pageIndex]['actions'],
      ),
      body: pages[pageIndex]['view'],
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: 80,
              color: Theme.of(context).primaryColor,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                'Deli Meals',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              onTap: () => Navigator.pushReplacementNamed(context, '/'),
              leading: Icon(Icons.restaurant),
              title: Text('Meals', style: TextStyle(fontSize: 18)),
            ),
            Container(height: 1, color: Colors.grey[300]),
            ListTile(
              onTap: () => Navigator.popAndPushNamed(context, ViewFilters.route),
              leading: Icon(Icons.settings),
              title: Text('Set Filters', style: TextStyle(fontSize: 18)),
            ),
            Container(height: 1, color: Colors.grey[300]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() => pageIndex = index);
        },
        unselectedItemColor: Colors.white.withOpacity(0.5),
        selectedItemColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        selectedIconTheme: IconThemeData(size: 24),
        unselectedIconTheme: IconThemeData(size: 20),
        currentIndex: pageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
