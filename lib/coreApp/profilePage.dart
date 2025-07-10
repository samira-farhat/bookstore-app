import 'package:flutter/material.dart';
import 'cartPage.dart';
import 'wishlistPage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [

            // Profile icon + name
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.deepPurpleAccent[100],
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.black,
              ),
            ),

            //SizedBox(height: 10),

            Text(
              'Eve Holt',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            // View Wishlist
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.favorite_border, color: Colors.black),
                title: Text('View Wishlist',
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WishlistPage()),
                  );
                },
              ),
            ),

            SizedBox(height: 5),

            // View Cart
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.shopping_cart_outlined, color: Colors.black),
                title: Text('View Cart',
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage(showBackButton: true)),
                  );
                },
              ),
            ),

            SizedBox(height: 5),

            // Settings
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.settings, color: Colors.black),
                title: Text('Settings',
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
                onTap: () {
                  // settings related code
                },
              ),
            ),

            SizedBox(height: 5),

            // Logout
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.black),
                title: Text(
                  'Logout',
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
                onTap: () async { // add async
                  // function to remove the saved login token we have, and redirect to the login page, and doesn't allow the user to use the back button
                  SharedPreferences prefs= await SharedPreferences.getInstance();
                  await prefs.remove('authentication_token');
                  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
