import 'package:flutter/material.dart';
import '../coreApp/bookDetailsPage.dart';
import '../coreApp/wishlistPage.dart';
import '../models/Book.dart';
import '../coreApp/wishlist.dart';
import '../coreApp/cart.dart';

// same design as fantasy page but different books
class PoetryPage extends StatefulWidget {
  PoetryPage({super.key});

  @override
  State<PoetryPage> createState() => _PoetryPageState();
}

class _PoetryPageState extends State<PoetryPage> {

  // a method to check if a book is in the wishlist (to deal with the color of the favorite icon)
  bool isWishlisted(Book book){
    return wishlistBooks.contains(book);
  }

  // method to deal with toggling the favorite icon, if its clicked and the book is not in wishlistedBooks then add it, else remove it.
  void toggleWishlist(Book book){
    setState(() {
      if(isWishlisted(book)){
        wishlistBooks.remove(book);
      }
      else{
        wishlistBooks.add(book);
      }
    });
  }

  List<Book> poetryBooks = [
    Book(
      title: 'Milk and Honey',
      author: 'Rupi Kaur',
      description: 'Milk and Honey description',
      price: '8.99',
      image: 'milkHoney.jpg',
      category: 'poetryBooks',
    ),
    Book(
      title: 'Home Body',
      author: 'Rupi Kaur',
      description: 'Home Body description',
      price: '10.00',
      image: 'homeBody.jpg',
      category: 'poetryBooks',
    ),
    Book(
      title: 'Pillow Thoughts',
      author: 'Courtney Peppernell',
      description: 'Pillow Thoughts description',
      price: '8.50',
      image: 'pillowThoughts.jpg',
      category: 'poetryBooks',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: Text(
          '𝙋𝙤𝙚𝙩𝙧𝙮',
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          // to navigate to the wishlist page
          IconButton(
            onPressed: () {
              // navigate to the wishlist page, and pass the list of wishlistBooks
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WishlistPage(),
                ),
              );
            },
            icon: Icon(Icons.favorite),
            color: Colors.deepPurple,
            iconSize: 30,
          ),
          SizedBox(width: 15), // for some spacing
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Tap a book cover to view its details',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          SizedBox(height: 20),

          Expanded(
            child: ScrollbarTheme(
              data: ScrollbarThemeData(
                thumbColor: WidgetStateProperty.all(Colors.deepPurpleAccent[100]),
                thickness: WidgetStateProperty.all(6),
                radius: Radius.circular(5),
              ),
              child: Scrollbar(
                thumbVisibility: true,
                child: GridView.builder(
                  itemCount: poetryBooks.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 25,
                    childAspectRatio: 0.5,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetailsPage(book: poetryBooks[index]),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
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
                                'assets/${poetryBooks[index].category}/${poetryBooks[index].image}',
                                fit: BoxFit.contain,
                                width: double.infinity,
                              ),
                            ),

                            SizedBox(height: 8),

                            Text(
                              poetryBooks[index].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),

                            SizedBox(height: 8),

                            Text(
                              '\$${poetryBooks[index].price} USD',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),

                            SizedBox(height: 6),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                // add to cart button
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if(!cartBooks.contains(poetryBooks[index])){
                                        cartBooks.add(poetryBooks[index]);

                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('${poetryBooks[index].title} added to cart!')),
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

                                // add to wishlist icon
                                IconButton(
                                  onPressed: () {
                                    toggleWishlist(poetryBooks[index]);
                                  },
                                  icon: Icon(isWishlisted(poetryBooks[index]) ? Icons.favorite : Icons.favorite_border),
                                  color: isWishlisted(poetryBooks[index]) ? Colors.deepPurple : Colors.grey,
                                ),

                              ],
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
