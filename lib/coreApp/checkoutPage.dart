import 'package:flutter/material.dart';
import '../coreApp/cart.dart';

class CheckoutPage extends StatefulWidget {
  CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String paymentMethod= 'Cash on Delivery';

  // Calculate total price
  double get totalPrice {
    double sum = 0.0;
    for (var book in cartBooks) {
      sum += double.parse(book.price);
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: Text(
          'Checkout',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: cartBooks.isEmpty
          ? Center(
        child: Text(
          'Your cart is empty.',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      )
          : SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // Customer details
            Text(
              'Enter Your Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            // text field for customer name
            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Full Name',
                filled: true,
                fillColor: Colors.white,
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            SizedBox(height: 10),

            // text field for customer address
            TextField(
              controller: addressController,
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Address',
                filled: true,
                fillColor: Colors.white,
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            SizedBox(height: 10),

            // text field for customer phone number
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Phone Number',
                filled: true,
                fillColor: Colors.white,
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            SizedBox(height: 25),

            // Order Summary
            Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            SizedBox(
              height: 350,
              child: ListView.builder(
                itemCount: cartBooks.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    margin: EdgeInsets.all(5.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 3,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(8),

                      // cover image of the book in cart
                      leading: Image.asset(
                        'assets/${cartBooks[index].category}/${cartBooks[index]
                            .image}',
                        fit: BoxFit.contain,
                      ),

                      // title of the book ordered
                      title: Text(
                        cartBooks[index].title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      // price of the book ordered
                      trailing: Text(
                        '\$${cartBooks[index].price}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 20),

            // Total Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  // to fix it at 2 decimal spaces and string it
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            SizedBox(height: 25),

            // section to pick payment method
            Text('Payment Method',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            // radio button for COD
            RadioListTile(
              title: Text('Cash on Delivery'),
              value: 'Cash on Delivery',
              groupValue: paymentMethod,
              onChanged: (value) {
                setState(() {
                  paymentMethod= value!;
                });
              }
            ),

            // radio button for credit card
            RadioListTile(
                title: Text('Credit Card'),
                value: 'Credit Card',
                groupValue: paymentMethod,
                onChanged: (value) {
                  setState(() {
                    paymentMethod= value!;
                  });
                }
            ),

            // radio button for paypal
            RadioListTile(
                title: Text('PayPal'),
                value: 'PayPal',
                groupValue: paymentMethod,
                onChanged: (value) {
                  setState(() {
                    paymentMethod= value!;
                  });
                }
            ),

            SizedBox(height: 25),

            // Confirm Order Button
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) =>
                      AlertDialog(
                        title: Text('Order Confirmed'),
                        content: Text('Thank you for your purchase!\n\nPayment Method: $paymentMethod'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(
                                  context); //pop twice so it could go back to home / cart screen
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text(
                'Confirm Order',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

