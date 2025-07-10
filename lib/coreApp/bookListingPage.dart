import 'package:flutter/material.dart';
import '../coreApp/wishlistPage.dart';
import '../models/Book.dart';
import '../coreApp/wishlist.dart';
import 'bookDetailsPage.dart';
import '../coreApp/cart.dart';

class BooksPage extends StatefulWidget {
  BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {

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

  // didnt use the API since the images didn't work instead used my own book list
  List<Book> books = [
    Book(
      title: 'Shatter Me',
      author: 'Tahereh Mafi',
      description: 'Shatter Me description',
      image: 'shatterMe.jpg',
      price: '7.99',
      category: 'fantasyBooks',
    ),
    Book(
      title: 'ACOTAR',
      author: 'Sarah J. Maas',
      description: 'The A Court of Thorns and Roses series by Sarah J. Maas is a young adult fantasy romance series centered around Feyre Archeron, a 19-year-old huntress, and her journey in the faerie lands of Prythian.',
      image: 'acotar.jpg',
      price: '7.99',
      category: 'fantasyBooks',
    ),
    Book(
      title: 'Fourth Wing',
      author: 'Rebecca Yarros',
      description: 'Fourth Wing description',
      image: 'fourthWing.jpg',
      price: '10.00',
      category: 'fantasyBooks',
    ),
    Book(
      title: 'The Cruel Prince',
      author: 'Holly Black',
      description: 'Cruel Prince description',
      image: 'cruelPrince.jpg',
      price: '13.00',
      category: 'fantasyBooks',
    ),
    Book(
      title: 'Powerless',
      author: 'Lauren Roberts',
      description: 'Powerless description',
      image: 'powerless.jpg',
      price: '15.00',
      category: 'fantasyBooks',
    ),
    Book(
      title: 'LightLark',
      author: 'Alex Aster',
      description: 'Lightlark description',
      image: 'lightlark.jpg',
      price: '12.99',
      category: 'fantasyBooks',
    ),
    Book(
      title: 'The Silent Patient',
      author: 'Alex Michaelides',
      description: 'The Silent Patient description',
      image: 'silentPatient.jpg',
      price: '12.99',
      category: 'mysteryBooks',
    ),
    Book(
      title: 'The Girl with the Dragon Tattoo',
      author: 'Stieg Larsson',
      description: 'The Girl with the Dragon Tattoo description',
      image: 'dragonTattoo.jpg',
      price: '10.50',
      category: 'mysteryBooks',
    ),
    Book(
      title: 'Gone Girl',
      author: 'Gillian Flynn',
      description: 'Gone Girl description',
      image: 'goneGirl.jpg',
      price: '9.99',
      category: 'mysteryBooks',
    ),
    Book(
      title: 'Big Little Lies',
      author: 'Liane Moriarty',
      description: 'Big Little Lies description',
      image: 'bigLittleLies.jpg',
      price: '8.99',
      category: 'mysteryBooks',
    ),
    Book(
      title: 'The Guest List',
      author: 'Lucy Foley',
      description: 'The Guest List description',
      image: 'guestList.jpg',
      price: '11.25',
      category: 'mysteryBooks',
    ),
    Book(
      title: 'It Ends With Us',
      author: 'Colleen Hoover',
      description: 'It Ends With Us description',
      image: 'itEndsWithUs.jpg',
      price: '8.99',
      category: 'romanceBooks',
    ),
    Book(
      title: 'The Love Hypothesis',
      author: 'Ali Hazelwood',
      description: 'The Love Hypothesis description',
      image: 'loveHypothesis.jpg',
      price: '9.49',
      category: 'romanceBooks',
    ),
    Book(
      title: 'People We Meet on Vacation',
      author: 'Emily Henry',
      description: 'People We Meet on Vacation description',
      image: 'peopleVacation.jpg',
      price: '10.00',
      category: 'romanceBooks',
    ),
    Book(
      title: 'Ugly Love',
      author: 'Colleen Hoover',
      description: 'Ugly Love description',
      image: 'uglyLove.jpg',
      price: '7.99',
      category: 'romanceBooks',
    ),
    Book(
      title: 'Pride and Prejudice',
      author: 'Jane Austen',
      description: 'Pride and Prejudice description',
      image: 'pridePrejudice.jpg',
      price: '7.99',
      category: 'classicBooks',
    ),
    Book(
      title: '1984',
      author: 'George Orwell',
      description: 'A dystopian novel set in Oceania, a totalitarian state where the ruling Party, led by the enigmatic Big Brother, controls every aspect of life. The story follows Winston Smith, a minor Party member, as he rebels against the Partys control and its manipulation of truth through a forbidden love affair and a secret meeting with a mysterious figure, OBrien. The novel explores themes of totalitarianism, surveillance, propaganda, and the dangers of losing individual freedom.',
      image: '1984.jpg',
      price: '8.49',
      category: 'classicBooks',
    ),
    Book(
      title: 'To Kill a Mockingbird',
      author: 'Harper Lee',
      description: 'To Kill a Mockingbird description',
      image: 'mockingbird.jpg',
      price: '9.99',
      category: 'classicBooks',
    ),
    Book(
      title: 'The Great Gatsby',
      author: 'F. Scott Fitzgerald',
      description: 'The Great Gatsby description',
      image: 'gatsby.jpg',
      price: '6.75',
      category: 'classicBooks',
    ),
    Book(
      title: 'Atomic Habits',
      author: 'James Clear',
      description: 'Atomic Habits description',
      image: 'atomicHabits.jpg',
      price: '11.99',
      category: 'selfHelpBooks',
    ),
    Book(
      title: 'The 7 Habits of Highly Effective People',
      author: 'Stephen R. Covey',
      description: 'The 7 Habits description',
      image: 'sevenHabits.jpg',
      price: '10.99',
      category: 'selfHelpBooks',
    ),
    Book(
      title: 'Think Like a Monk',
      author: 'Jay Shetty',
      description: 'Think Like a Monk description',
      image: 'thinkMonk.jpg',
      price: '9.49',
      category: 'selfHelpBooks',
    ),
    Book(
      title: 'Milk and Honey',
      author: 'Rupi Kaur',
      description: 'Milk and Honey description',
      image: 'milkHoney.jpg',
      price: '8.99',
      category: 'poetryBooks',
    ),
    Book(
      title: 'Home Body',
      author: 'Rupi Kaur',
      description: 'Home Body description',
      image: 'homeBody.jpg',
      price: '10.00',
      category: 'poetryBooks',
    ),
    Book(
      title: 'Pillow Thoughts',
      author: 'Courtney Peppernell',
      description: 'Pillow Thoughts description',
      image: 'pillowThoughts.jpg',
      price: '8.50',
      category: 'poetryBooks',
    ),
  ];

  // method to sort the books by title before displaying
  @override
  void initState() {
    super.initState();
    books.sort((a, b) => a.title.compareTo(b.title));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: Text('𝙎𝙝𝙤𝙥 𝘼𝙡𝙡',
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
                  itemCount: books.length,
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
                            builder: (context) => BookDetailsPage(book: books[index]),
                          ),
                        );
                      },
                      child: Container(
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
                                'assets/${books[index].category}/${books[index].image}',
                                fit: BoxFit.contain, // so that the full image is shown
                                width: double.infinity,
                              ),
                            ),

                            SizedBox(height: 8),

                            // book title
                            Text(
                              books[index].title,
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
                              '\$${books[index].price} USD',
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
                                      if(!cartBooks.contains(books[index])){
                                        cartBooks.add(books[index]);

                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('${books[index].title} added to cart!')),
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
                                    toggleWishlist(books[index]);
                                  },
                                  icon: Icon(isWishlisted(books[index]) ? Icons.favorite : Icons.favorite_border),
                                  color: isWishlisted(books[index]) ? Colors.deepPurple : Colors.grey,
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

