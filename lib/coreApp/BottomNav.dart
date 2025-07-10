import 'package:flutter/material.dart';
import 'homePage.dart';
import 'searchPage.dart';
import 'wishlistPage.dart';
import 'cartPage.dart';
import 'profilePage.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {

  int selectedIndex= 0;

  // a list to navigate to the page of the tapped item according to the index selected
  List<Widget> pages= [
    HomePage(),
    SearchPage(),
    WishlistPage(showBackButton: false),
    CartPage(),
    ProfilePage(),
  ];

  // set selectedIndex to the index of the tapped item
  void tappedItem(int index) {
    setState(() {
      selectedIndex= index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[100],
        title: Text('Sector 45',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      // made a container to be able to set the background color of all pages from the list, since they do not have a scaffold (scaffold within a scaffold)
      body: Container(
        color: Colors.purple[100],
        // go to the page at the index of the selected item
        child: pages[selectedIndex],
      ),

      // used this widget to make the navigation at the bottom of the page
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // so that the styling is fixed throughout the navigation between pages
        backgroundColor: Colors.purple[100],
        currentIndex: selectedIndex,
        onTap: tappedItem,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.black,
        // the items for the navigation and their respective icons and labels below it.
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

