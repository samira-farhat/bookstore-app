class Book{

  final String title;
  final String author;
  final String description;
  final String price;
  final String image;
  final String category;

  Book({required this.title, required this.author, required this.description, required this.price, required this.image, required this.category});


  // for using the API
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['volumeInfo']['title'] ?? 'No Title',
      author: (json['volumeInfo']['authors'] != null) ? (json['volumeInfo']['authors'] as List).join(', ') : 'Unknown',
      description: json['volumeInfo']['description'] ?? 'No description',
      price: json['saleInfo']['listPrice'] != null
          ? json['saleInfo']['listPrice']['amount'].toString()
          : 'Free',
      image: json['volumeInfo']['imageLinks']?['thumbnail'] ?? '',
      category: json['volumeInfo']['categories'] != null
          ? (json['volumeInfo']['categories'] as List).first
          : 'Unknown',
    );
  }

}

