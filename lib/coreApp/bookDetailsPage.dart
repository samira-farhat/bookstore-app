import 'package:flutter/material.dart';
import '../models/Book.dart';
import '../coreApp/wishlist.dart';
import '../coreApp/cart.dart';

class BookDetailsPage extends StatefulWidget {
  final Book book;

  const BookDetailsPage({super.key, required this.book});

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  // a method to check if a book is in the wishlist (to deal with the color of the favorite icon)
  bool isWishlisted(Book book) {
    return wishlistBooks.contains(book);
  }

  // method to deal with toggling the favorite icon, if its clicked and the book is not in wishlistedBooks then add it, else remove it.
  void toggleWishlist(Book book) {
    setState(() {
      if (isWishlisted(book)) {
        wishlistBooks.remove(book);
      } else {
        wishlistBooks.add(book);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Book cover image
            Image.asset(
              'assets/${widget.book.category}/${widget.book.image}',
              height: 250,
              fit:
                  BoxFit.contain, // so that the full image is shown not cropped
            ),

            SizedBox(height: 15),

            // display review
            Text(
              '★★★★★',
              style: TextStyle(
                fontSize: 20,
              ),
            ),

            SizedBox(height: 20),

            // display title
            Text(
              widget.book.title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            // display author
            Text(
              widget.book.author,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 10),

            // display price
            Text(
              '\$${widget.book.price} USD',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // add to cart button
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if(!cartBooks.contains(widget.book)){
                        cartBooks.add(widget.book);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${widget.book.title} added to cart!')),
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

                SizedBox(width: 25),

                // add to wishlist icon
                IconButton(
                  onPressed: () {
                    toggleWishlist(widget.book);
                  },
                  icon: Icon(isWishlisted(widget.book)
                      ? Icons.favorite
                      : Icons.favorite_border),
                  color: isWishlisted(widget.book)
                      ? Colors.deepPurple
                      : Colors.grey,
                ),
              ],
            ),

            SizedBox(height: 20),

            // display the book description
            Text(
              widget.book.description,
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
