import 'package:flutter/material.dart';
import '../coreApp/bookDetailsPage.dart';
import '../coreApp/wishlistPage.dart';
import '../models/Book.dart';
import '../coreApp/wishlist.dart';
import '../coreApp/cart.dart';

class ClassicsPage extends StatefulWidget {
  const ClassicsPage({super.key});

  @override
  State<ClassicsPage> createState() => _ClassicsPageState();
}

class _ClassicsPageState extends State<ClassicsPage> {
  bool isWishlisted(Book book) => wishlistBooks.contains(book);

  void toggleWishlist(Book book) {
    setState(() {
      if (isWishlisted(book)) {
        wishlistBooks.remove(book);
      } else {
        wishlistBooks.add(book);
      }
    });
  }

  final List<Book> classicBooks = [
    Book(
      title: 'Pride and Prejudice',
      author: 'Jane Austen',
      description: 'Pride and Prejudice description',
      price: '7.99',
      image: 'pridePrejudice.jpg',
      category: 'classicBooks',
    ),
    Book(
      title: '1984',
      author: 'George Orwell',
      description: 'A dystopian novel set in Oceania, a totalitarian state where the ruling Party, led by the enigmatic Big Brother, controls every aspect of life. The story follows Winston Smith, a minor Party member, as he rebels against the Partys control and its manipulation of truth through a forbidden love affair and a secret meeting with a mysterious figure, OBrien. The novel explores themes of totalitarianism, surveillance, propaganda, and the dangers of losing individual freedom.',
      price: '8.49',
      image: '1984.jpg',
      category: 'classicBooks',
    ),
    Book(
      title: 'To Kill a Mockingbird',
      author: 'Harper Lee',
      description: 'To Kill a Mockingbird description',
      price: '9.99',
      image: 'mockingbird.jpg',
      category: 'classicBooks',
    ),
    Book(
      title: 'The Great Gatsby',
      author: 'F. Scott Fitzgerald',
      description: 'The Great Gatsby description',
      price: '6.75',
      image: 'gatsby.jpg',
      category: 'classicBooks',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: const Text(
          '𝘾𝙡𝙖𝙨𝙨𝙞𝙘𝙨',
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WishlistPage()),
              );
            },
            icon: const Icon(Icons.favorite),
            color: Colors.deepPurple,
            iconSize: 30,
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: Scrollbar(
        thumbVisibility: true,
        thickness: 6,
        radius: const Radius.circular(5),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tap a book cover to view its details',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // Let outer scroll view handle scrolling
                itemCount: classicBooks.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 25,
                  childAspectRatio: 0.5,
                ),
                itemBuilder: (context, index) {
                  final book = classicBooks[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookDetailsPage(book: book)),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.purple[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 7,
                            child: Image.asset(
                              'assets/${book.category}/${book.image}',
                              fit: BoxFit.contain,
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            book.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '\$${book.price} USD',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if (!cartBooks.contains(book)) {
                                      cartBooks.add(book);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('${book.title} added to cart!')),
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
                                child: const Text(
                                  'Add to Cart',
                                  style: TextStyle(color: Colors.black, fontSize: 12),
                                ),
                              ),
                              IconButton(
                                onPressed: () => toggleWishlist(book),
                                icon: Icon(
                                  isWishlisted(book) ? Icons.favorite : Icons.favorite_border,
                                  color: isWishlisted(book) ? Colors.deepPurple : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
