// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 
import 'home.dart'; 
import 'checkout.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
           body: Column(
  children: [
 Padding(
  padding: const EdgeInsets.only(top: 40),
  child: StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('cart').snapshots(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
        return const Center(child: Text('Cart empty! Waiting for food!'));
      } else {
        num totalPrice = 0;
        return SingleChildScrollView(
          child: Column(
            children: List.generate(snapshot.data!.docs.length, (index) {
              var foodData = snapshot.data!.docs[index];
              int quantity = foodData['Quantity'] ?? 0;

              if (quantity <= 0) {
                return const SizedBox(); // Skip rendering if quantity is 0 or negative
              }

              totalPrice += (foodData['Price'] ?? 0) * quantity;

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        leading: Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: NetworkImage(foodData['Image'] ?? ''), // Placeholder image
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        title: Text(
                          foodData['Name'] ?? 'Food Name',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            height: 1.0,
                            letterSpacing: -0.41,
                          ),
                        ),
                        subtitle: Text(
                          '₹ ${foodData['Price'] ?? '0'}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                            letterSpacing: -0.24,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Action for adding quantity to Firestore
                                int updatedQuantity = quantity + 1;
                                FirebaseFirestore.instance
                                    .collection('cart')
                                    .doc(foodData.id)
                                    .update({'Quantity': updatedQuantity});

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Food added'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              },
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFA4A0C),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Icon(Icons.add, size: 20, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                '$quantity',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Vazirmatn',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Action for removing quantity from Firestore
                                int updatedQuantity = quantity - 1;
                                FirebaseFirestore.instance
                                    .collection('cart')
                                    .doc(foodData.id)
                                    .update({'Quantity': updatedQuantity});

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Food reduced'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              },
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFA4A0C),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Icon(Icons.remove, size: 20, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: const Color(0xFFF2F2F7),
                      ),
                    ],
                  ),
                ),
              );
            })..addAll([
                  const SizedBox(height: 30),
                  Container(
                    width: 333,
                    height: 31,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 55,
                          child: Text(
                            'Total                                              ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w900,
                              height: 0.08,
                            ),
                          ),
                        ),
                        const SizedBox(width: 220),
                        SizedBox(
                          width: 58,
                          child: Text(
                            '₹$totalPrice',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w900,
                              height: 0.08,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        );
      }
    },
  ),
),


          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: ElevatedButton(
              onPressed: () {
                // Action for checkout button
                     Navigator.push(context,MaterialPageRoute(builder: (context) => CheckoutScreen()), // Navigate to CheckoutScreen
      );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                primary: const Color(0xFFFA4A0C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  color: const Color(0xFFFA4A0C),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Container(
                  width: 262,
                  height: 63,
                  child: const Center(
                    child: Text(
                      'Checkout',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w900,
                        height: 0.06,
                        letterSpacing: 0.10,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        elevation: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(left: 100),
              child: GestureDetector(
                onTap: () {
                  // Navigate to HomePage when the home icon is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Container(
                  width: 24,
                  height: 31,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/homedeactive.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            label: '', // Empty label
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(right: 100),
              child: GestureDetector(
                onTap: () {
                  // Navigate to CartPage when the cart icon is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
                child: Container(
                  width: 24,
                  height: 31,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/cartactive.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            label: '', // Empty label
          ),
        ],
        onTap: (int index) {
          // Handle other navigation items if needed
        },
      ),
    );
  }
}
