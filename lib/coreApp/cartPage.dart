import 'package:flutter/material.dart';
import '../coreApp/checkoutPage.dart';
import '../coreApp/cart.dart';

class CartPage extends StatefulWidget {
  final bool showBackButton;
  const CartPage({super.key, this.showBackButton= false});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: Text(
          'Cart',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: widget.showBackButton,
      ),
      body: cartBooks.isEmpty
          ? Center(
        child: Text(
          'Your cart is empty.',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black54,
          ),
        ),
      )
          : Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ScrollbarTheme(
                data: ScrollbarThemeData(
                  thumbColor: WidgetStateProperty.all(
                      Colors.deepPurpleAccent[100]),
                  thickness: WidgetStateProperty.all(6),
                  radius: Radius.circular(5),
                ),
                child: Scrollbar(
                  thumbVisibility: true,
                  child: GridView.builder(
                    itemCount: cartBooks.length,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
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
                                'assets/${cartBooks[index].category}/${cartBooks[index].image}',
                                fit: BoxFit.contain,
                                width: double.infinity,
                              ),
                            ),

                            SizedBox(height: 8),

                            Text(
                              cartBooks[index].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),

                            SizedBox(height: 8),

                            Text(
                              '\$${cartBooks[index].price} USD',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),

                            IconButton(
                              onPressed: () {
                                setState(() {
                                  cartBooks.removeAt(index);
                                });
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // Checkout button
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Text(
                'Proceed to Checkout',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
