import 'package:flutter/material.dart';
import '../coreApp/bookDetailsPage.dart';
import '../coreApp/wishlistPage.dart';
import '../models/Book.dart';
import '../coreApp/wishlist.dart';
import '../coreApp/cart.dart';

// same design as fantasy page but different books
class RomancePage extends StatefulWidget {
  RomancePage({super.key});

  @override
  State<RomancePage> createState() => _RomancePageState();
}

class _RomancePageState extends State<RomancePage> {

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

  List<Book> romanceBooks = [
    Book(
      title: 'It Ends With Us',
      author: 'Colleen Hoover',
      description: 'It Ends With Us description',
      price: '8.99',
      image: 'itEndsWithUs.jpg',
      category: 'romanceBooks',
    ),
    Book(
      title: 'The Love Hypothesis',
      author: 'Ali Hazelwood',
      description: 'The Love Hypothesis description',
      price: '9.49',
      image: 'loveHypothesis.jpg',
      category: 'romanceBooks',
    ),
    Book(
      title: 'People We Meet on Vacation',
      author: 'Emily Henry',
      description: 'People We Meet on Vacation description',
      price: '10.00',
      image: 'peopleVacation.jpg',
      category: 'romanceBooks',
    ),
    Book(
      title: 'Ugly Love',
      author: 'Colleen Hoover',
      description: 'Ugly Love description',
      price: '7.99',
      image: 'uglyLove.jpg',
      category: 'romanceBooks',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: Text(
          '𝙍𝙤𝙢𝙖𝙣𝙘𝙚',
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
                  itemCount: romanceBooks.length,
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
                            builder: (context) => BookDetailsPage(book: romanceBooks[index]),
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
                                'assets/${romanceBooks[index].category}/${romanceBooks[index].image}',
                                fit: BoxFit.contain,
                                width: double.infinity,
                              ),
                            ),

                            SizedBox(height: 8),

                            Text(
                              romanceBooks[index].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),

                            SizedBox(height: 8),

                            Text(
                              '\$${romanceBooks[index].price} USD',
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
                                      if(!cartBooks.contains(romanceBooks[index])){
                                        cartBooks.add(romanceBooks[index]);

                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('${romanceBooks[index].title} added to cart!')),
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
                                    toggleWishlist(romanceBooks[index]);
                                  },
                                  icon: Icon(isWishlisted(romanceBooks[index]) ? Icons.favorite : Icons.favorite_border),
                                  color: isWishlisted(romanceBooks[index]) ? Colors.deepPurple : Colors.grey,
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
