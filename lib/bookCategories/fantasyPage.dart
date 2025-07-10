import 'package:flutter/material.dart';
import '../coreApp/bookDetailsPage.dart';
import '../coreApp/wishlistPage.dart';
import '../models/Book.dart';
import '../coreApp/wishlist.dart';
import '../coreApp/cart.dart';


class FantasyPage extends StatefulWidget {
  FantasyPage({super.key});

  @override
  State<FantasyPage> createState() => _FantasyPageState();
}

class _FantasyPageState extends State<FantasyPage> {

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

  List<Book> fantasyBooks = [
    Book(
      title: 'Shatter Me',
      author: 'Tahereh Mafi',
      description: 'The girl with the power to kill with a single touch now has the world in the palm of her hand. Juliette Ferrars thought shed won. She took over Sector 45, was named Supreme Commander, and now has Warner by her side. But when tragedy strikes, she must confront the darkness that dwells both around and inside her',
      price: '7.99',
      image: 'shatterMe.jpg',
      category: 'fantasyBooks',
    ),
    Book(
      title: 'ACOTAR',
      author: 'Sarah J. Maas',
      description: 'The A Court of Thorns and Roses series by Sarah J. Maas is a young adult fantasy romance series centered around Feyre Archeron, a 19-year-old huntress, and her journey in the faerie lands of Prythian.',
      price: '7.99',
      image: 'acotar.jpg',
      category: 'fantasyBooks',
    ),
    Book(
      title: 'Fourth Wing',
      author: 'Rebecca Yarros',
      description: 'Fourth Wing description',
      price: '10.00',
      image: 'fourthWing.jpg',
      category: 'fantasyBooks',
    ),
    Book(
      title: 'The Cruel Prince',
      author: 'Holly Black',
      description: 'Cruel Prince description',
      price: '13.00',
      image: 'cruelPrince.jpg',
      category: 'fantasyBooks',
    ),
    Book(
      title: 'Powerless',
      author: 'Lauren Roberts',
      description: 'Powerless description',
      price: '15.00',
      image: 'powerless.jpg',
      category: 'fantasyBooks',
    ),
    Book(
      title: 'LightLark',
      author: 'Alex Aster',
      description: 'Lightlark description',
      price: '12.99',
      image: 'lightlark.jpg',
      category: 'fantasyBooks',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: Text('𝙁𝙖𝙣𝙩𝙖𝙨𝙮',
          style: TextStyle(
            fontSize: 25,
          ),
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
                  itemCount: fantasyBooks.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 25,
                    childAspectRatio: 0.5, // so that the design of the gri is taller to match the book covers
                  ),
                  itemBuilder: (context, index) {
                    // added the gesture detector widget so that when a book cover image is tapped we navigate to the details page and pass the attributes to be displayed
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetailsPage(book: fantasyBooks[index]),
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

                            // book cover image
                            Expanded(
                              flex: 7,
                              child: Image.asset(
                                'assets/${fantasyBooks[index].category}/${fantasyBooks[index].image}',
                                fit: BoxFit.contain, // so that the full image is shown
                                width: double.infinity,
                              ),
                            ),

                            SizedBox(height: 8),

                            // book title
                            Text(
                              fantasyBooks[index].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),

                            SizedBox(height: 8),

                            // book price
                            Text(
                              '\$${fantasyBooks[index].price} USD',
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
                                      if(!cartBooks.contains(fantasyBooks[index])){
                                        cartBooks.add(fantasyBooks[index]);

                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('${fantasyBooks[index].title} added to cart!')),
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
                                    toggleWishlist(fantasyBooks[index]);
                                  },
                                  icon: Icon(isWishlisted(fantasyBooks[index]) ? Icons.favorite : Icons.favorite_border),
                                  color: isWishlisted(fantasyBooks[index]) ? Colors.deepPurple : Colors.grey,
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
