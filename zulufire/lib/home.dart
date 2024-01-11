
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 
import 'cart.dart';
import 'home2.dart';
import 'login.dart';
//import 'food.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
   appBar: AppBar(
        toolbarHeight: 80,
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20), // Adjust left padding
            child: Container(
              width: 38,
              height: 38,
              child: Image.asset(
                'assets/sidemenu2.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // Other app bar properties...
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Drawer content...
            Expanded(
              child: ListView(
                children: const [
                  // Other drawer items...
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: Container(
                width: 262,
                height: 63,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFFFA4A0C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Log Out',
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
  // title: Center(
  // child: Column(
  //   crossAxisAlignment: CrossAxisAlignment.center,
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   children: [
  //     Padding(
  //       padding: const EdgeInsets.only(top: 4.0),
  //       child: Text(
  //         'Deliver to',
  //         style: TextStyle(
  //           color: Color(0xFF8B9099),
  //           fontSize: 14,
  //           fontFamily: 'Montserrat',
  //           fontWeight: FontWeight.w500,
  //           height: 0.09,
  //         ),
  //         textAlign: TextAlign.left,
  //       ),
  //     ),
  //     SizedBox(height: 4),
  //     Text(
  //       'Residence',
  //       style: TextStyle(
  //         color: Color(0xFFFE724C),
  //         fontSize: 15,
  //         fontFamily: 'Montserrat',
  //         fontWeight: FontWeight.w500,
  //         height: 0.08,
  //       ),
  //       textAlign: TextAlign.left,
  //     ),
  //   ],
  // ),


    //      child: Text(
    //   'Zulu',
    //   textAlign: TextAlign.center,
    //   style: TextStyle(
    //     color: Color(0xFFFE724C),
    //     fontSize: 15,
    //     fontFamily: 'Montserrat',
    //     fontWeight: FontWeight.w500,
    //     height: 0.10,
    //   ),
    // ),
      // child: Container(
      //   padding: EdgeInsets.only(top: 30), // Padding between Deliver to and Residence
      //   width: 80,
      //   height: 39,
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(
      //         'Deliver to',
      //         textAlign: TextAlign.center,
      //         style: TextStyle(
      //           color: Color(0xFF8B9099),
      //           fontSize: 14,
      //           fontFamily: 'Montserrat',
      //           fontWeight: FontWeight.w500,
      //           height: 0.10,
      //         ),
      //       ),
      //       const SizedBox(height: 8),
      //       Text(
      //         'Residence',
      //         textAlign: TextAlign.center,
      //         style: TextStyle(
      //           color: Color(0xFFFE724C),
      //           fontSize: 15,
      //           fontFamily: 'Montserrat',
      //           fontWeight: FontWeight.w500,
      //           height: 0.10,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    //),
        // Other app bar configurations
      
       body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20), // Padding for "What would you like to order today"
        // padding: const EdgeInsets.symmetric(horizontal: 20),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15), // Padding between "What would you like to order today" and the toggle bar
            // Adjusted style for "What would you like to order today"
            const Text(
              'What would you like\nto order today?',
              style: TextStyle(
                color: Color(0xFF313642),
                fontSize: 35,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
 const SizedBox(height: 18),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
      Container(
        width: 326,
        height: 61,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
               child: GestureDetector(
              onTap: () {
                // Navigate to home2.dart when "CAMPUS" is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage_()), // Replace HomePage_ with your actual class name
                );
              },
              child: Container(
                width: 326,
                height: 61,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFCCC8C8)),
                    borderRadius: BorderRadius.circular(51),
                  ),
                ),
              ),),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 169.35,
                height: 61,
                decoration: ShapeDecoration(
                  color: const Color(0xFFFA4A0C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(51),
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 38.10,
              top: 30, // Adjust top position to center vertically
              child: SizedBox(
                width: 91.03,
                child: Text(
                  'RESIDENCE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    height: 0.12,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 186.29,
              top: 30, // Adjust top position to center vertically
               child: GestureDetector(
              onTap: () {
                // Navigate to home2.dart when "CAMPUS" is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage_()), // Replace HomePage_ with your actual class name
                );
              },
              child: const SizedBox(
                width: 107.96,
                child: Text(
                  'CAMPUS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFA4A0C),
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    height: 0.12,
                  ),
                ),
              ),
               ),
            ),
          ],
        ),
      ),
    
  ],
),


            
    const SizedBox(height: 30), // Padding between toggle and Featured Snack Stops
    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.0),
      child: Text(
        'Featured Snack Stops',
         textAlign: TextAlign.left,
        style: TextStyle(
          color: Color(0xFF323643),
          fontSize: 22,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
          height: 0,
        ),
      ),
    ),

      const SizedBox(height: 14), // Padding after Featured Snack Stops

      const Text(
        'Fantasy Cafe',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Color(0xFF323643),
          fontSize: 18,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
          height: 0,
        ),
      ),
      const SizedBox(height: 13), // Padding after Fantasy Cafe
SizedBox(
  height: 165, // Set a fixed height or use constraints
  child: FutureBuilder<QuerySnapshot>(
    future: FirebaseFirestore.instance.collection('Food').get(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
        return const Center(child: Text('No data available'));
      } else {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (BuildContext context, int index) {
            var foodData = snapshot.data!.docs[index];
            return Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                width: 240,
                height: 125,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3FD3D1D8),
                      blurRadius: 30,
                      offset: Offset(15, 15),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
         children: [
                    Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          foodData['Image'],
                          fit: BoxFit.cover,
                          width: 240,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        foodData['Name'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Text(
                             '₹ ${foodData['Price']}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Spacer(),
                              GestureDetector(
  onTap: () async {
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
        content: Text('Food Added to Cart, Yummy!'),
        duration: Duration(seconds: 2),
      ),
    );
  },
 child: Container(
    width: 25,
    height: 25,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: const Center(
      child: Icon(
        Icons.add,
        size: 18,
        color: Colors.black,
      ),
    ),
  ),
),
                          // CircleAvatar(
                          //   radius: 15,
                          //   backgroundColor: Colors.transparent,
                          //   child: Text(
                          //     '+',
                          //     style: TextStyle(
                          //       color: Colors.black,
                          //       fontSize: 20,
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4), // Additional space between price and rating
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          const Icon(Icons.star, size: 14, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(
                            foodData['Rating'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            );
          },
        );
      }
    },
  ),
),
      const SizedBox(height: 14), // Padding after Featured Snack Stops
      const Text(
        'Adyar Regency',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Color(0xFF323643),
          fontSize: 18,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
          height: 0,
        ),
      ),
        const SizedBox(height: 13), // Padding after Fantasy Cafe
SizedBox(
  height: 165, // Set a fixed height or use constraints
  child: FutureBuilder<QuerySnapshot>(
    future: FirebaseFirestore.instance.collection('Food').get(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
        return const Center(child: Text('No data available'));
      } else {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (BuildContext context, int index) {
            var foodData = snapshot.data!.docs[index];
            return Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                width: 240,
                height: 125,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3FD3D1D8),
                      blurRadius: 30,
                      offset: Offset(15, 15),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          foodData['Image'],
                          fit: BoxFit.cover,
                          width: 240,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        foodData['Name'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Text(
                             '₹ ${foodData['Price']}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
  onTap: () async {
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
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Food Added to Cart, Yummy!'),
        duration: Duration(seconds: 2),
      ),
    );
  },
 child: Container(
    width: 25,
    height: 25,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: const Center(
      child: Icon(
        Icons.add,
        size: 18,
        color: Colors.black,
      ),
    ),
  ),
),
                          // CircleAvatar(
                          //   radius: 15,
                          //   backgroundColor: Colors.transparent,
                          //   child: Text(
                          //     '+',
                          //     style: TextStyle(
                          //       color: Colors.black,
                          //       fontSize: 20,
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4), // Additional space between price and rating
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          const Icon(Icons.star, size: 14, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(
                            foodData['Rating'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            );
          },
        );
      }
    },
  ),
),





          ],
        ),
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

  // bottomNavigationBar: BottomNavigationBar(
  //    showSelectedLabels: false,
  // showUnselectedLabels: false,
  // backgroundColor: Colors.white,
  //  elevation: 0, // Remove shadow
  //   items:  <BottomNavigationBarItem>[
  //     BottomNavigationBarItem(
  //     icon: Padding(
  //       padding: EdgeInsets.only(left: 100), // Adjust right padding
  //       child: Container(
  //         width: 24,
  //         height: 31,
  //         decoration: BoxDecoration(
  //           image: DecorationImage(
  //             image: AssetImage('assets/homeactive.png'),
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //       ),
  //     ),
  //     label: '', // Empty label
  //   ),
  //     BottomNavigationBarItem(
  //        icon: Padding(
  //       padding: EdgeInsets.only(right: 100), // Adjust left padding
  //       child: Container(
  //         width: 24,
  //         height: 24,
  //         decoration: BoxDecoration(
  //           image: DecorationImage(
  //             image: AssetImage('assets/cartdeactive.png'),
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //       ),
  //     ),
  //     label: '', // Empty label
  //   ),
  //   ],
  //   onTap: (int index) {
  //     // Handle navigation here
  //   },
  // ),
    );
  }
}
