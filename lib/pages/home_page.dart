import 'package:flutter/material.dart';
import 'package:spongebob/components/bottom_nav_bar.dart';
import 'package:spongebob/pages/character_page.dart';
import 'package:spongebob/pages/favourite_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // this selected index is to control the bottom nav bar
  int _selectedIndex = 0;

  // this method will update our selected index
  // when the user taps on the bottom bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to display
  final List<Widget> _pages = [
    // home page
    const CharacterPage(),

    // favourite page
    const FavouritePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.blueGrey,
        child: Column(
          children: [
            //logo
            DrawerHeader(child: Image.asset(
              'lib/images/spongebob family.png'
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                color: Colors.grey,
              ),
            ),

            //other pages
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color:Colors.white
                  ),
                title: Text(
                  'Home',
                style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.info,
                  color:Colors.white
                  ),
                title: Text(
                  'About',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
