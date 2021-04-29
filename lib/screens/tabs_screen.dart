import 'package:flutter/material.dart';
import 'package:mealsapp/screens/favorite_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoryScreen(), 'title': 'Categories'},
    {'page': FavoriteScreen(), 'title': 'Your Favorites'}
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return // DefaultTabController(
        //     length: 2,
        //     // initialIndex: 1,  inorder to have the default tab changed.
        //     child: Scaffold(
        //       appBar: AppBar(
        //         title: Text('Meals'),
        //         bottom: TabBar(
        //           tabs: [
        //             Tab(icon: Icon(Icons.category), text: 'Categroies'),
        //             Tab(
        //               icon: Icon(Icons.star),
        //               text: 'Favorite',
        //             )
        //           ],
        //         ),
        //       ),
        //       body: TabBarView(
        //         children: [CategoryScreen(), FavoriteScreen()],
        //       ),
        //     ));
        Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        //type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
      ),
    );
  }
}
