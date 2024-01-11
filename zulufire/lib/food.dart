import 'package:flutter/material.dart';
import 'cart.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 

class FoodPage extends StatelessWidget {
  final Map<String, dynamic> foodData;

  const FoodPage({super.key, required this.foodData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food'),
      ),
        body: Container(
        width: 323,
        height: 206,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 323,
                height: 206,
                decoration: ShapeDecoration(
                  color: const Color(0xFFC4C4C4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Positioned(
              left: -17,
              top: -7,
              child: Container(
                width: 428,
                height: 242,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 428,
                      height: 242,
                      decoration: ShapeDecoration(
 image: DecorationImage(
                  image: NetworkImage(foodData['Image']),
                  fit: BoxFit.cover,
                ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
                             Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: Text(
                         foodData['Name'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                       const SizedBox(width: 12), // Padding between text and icon
                          const Icon(
                            Icons.star,
                            size: 17,
                            color: Colors.amber,
                          ),
                          const SizedBox(width: 4), // Padding between icon and text
                          Text(
                            foodData['Rating'],
                            style: const TextStyle(
                              color: Color(0xFF111719),
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w100,
                              height: 0,
                            ),
                          ),
                                                  const SizedBox(height: 18), // Padding below the rating
                          SizedBox(
                            width: 323,
                            child: Text(
                              'This ${foodData['Name']} is really good and tasty. Its made with lots of Love and Care',
                              style: const TextStyle(
                                color: Color(0xFF858891),
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0.10,
                              ),
                            ),
                          ),
                             Positioned(
  left: 0,
  right: 0,
  bottom: 50, // Adjust this value for your preference
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: ElevatedButton(
      onPressed: () async {
        // Check if the food item exists in the cart
        var cartSnapshot = await FirebaseFirestore.instance
            .collection('cart')
            .where('Name', isEqualTo: foodData['Name'])
            .get();

        if (cartSnapshot.docs.isEmpty) {
          // Food item doesn't exist in the cart, add a new document
          await FirebaseFirestore.instance.collection('cart').add({
            'Name': foodData['Name'],
            'Image': foodData['Image'],
            'Price': foodData['Price'],
            'Quantity': 1, // Set initial quantity as 1
          });
        } else {
          // Food item exists, update the quantity
          var cartDoc = cartSnapshot.docs.first;
          await cartDoc.reference.update({
            'Quantity': cartDoc['Quantity'] + 1,
          });
        }

        // Show the 'Food Added to Cart' message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Food Added to Cart, Awesome!'),
            duration: Duration(seconds: 2),
          ),
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
          width: double.infinity,
          height: 63,
          child: const Center(
            child: Text(
              'Add to Cart',
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
),

          ],
        ),
      ),
            bottomNavigationBar: BottomNavigationBar(
  showSelectedLabels: false,
  showUnselectedLabels: false,
  backgroundColor: Colors.white,
  elevation: 0, // Remove shadow
  items: <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(left: 100),
        child: Container(
          width: 24,
          height: 31,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/homeactive.png'),
              fit: BoxFit.cover,
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
            height: 24,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/cartdeactive.png'),
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
