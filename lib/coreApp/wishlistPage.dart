import 'package:flutter/material.dart';
import 'wishlist.dart'; // This contains the wishlistBooks list
import '../coreApp/cart.dart';

class WishlistPage extends StatefulWidget {
  final bool showBackButton;
  const WishlistPage({super.key, this.showBackButton= true});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: Text('Wishlist',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: widget.showBackButton,
      ),
      body: wishlistBooks.isEmpty
          ? Center(
        child: Text(
          'Your wishlist is empty.',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black54,
          ),
        ),
      )
          : Padding(
            padding: EdgeInsets.all(10.0),
            child: ScrollbarTheme( // used this to design the scrollbar to be more visible
              data: ScrollbarThemeData(
                thumbColor: WidgetStateProperty.all(Colors.deepPurpleAccent[100]),
                thickness: WidgetStateProperty.all(6),
                radius: Radius.circular(5),
              ),
              child: Scrollbar(
                      thumbVisibility: true,
                      child: GridView.builder(
              itemCount: wishlistBooks.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 25,
                childAspectRatio: 0.5,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.purple[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Image.asset(
                          'assets/${wishlistBooks[index].category}/${wishlistBooks[index].image}',
                          fit: BoxFit.contain,
                          width: double.infinity,
                        ),
                      ),

                      SizedBox(height: 8),

                      Text(
                        wishlistBooks[index].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 8),

                      Text(
                        '\$${wishlistBooks[index].price} USD',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 6),

                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if(!cartBooks.contains(wishlistBooks[index])){
                              cartBooks.add(wishlistBooks[index]);

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('${wishlistBooks[index].title} added to cart!')),
                              );
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple[100],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                    ],
                  ),
                );
              },
                      ),
                    ),
            ),
          ),
    );
  }
}
