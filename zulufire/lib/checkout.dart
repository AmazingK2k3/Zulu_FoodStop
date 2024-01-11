// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'home.dart';
import 'dart:async';


class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late Duration _timerDuration;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timerDuration = const Duration(minutes: 20);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timerDuration.inSeconds > 0) {
          _timerDuration = _timerDuration - const Duration(seconds: 1);
        } else {
          _timer.cancel();
          // Handle timeout logic here
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFFFF4B3A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 28,
              top: 187,
              child: SizedBox(
                width: 295,
                height: 270.59,
                child: Stack(
                  children: [
                    Positioned(
                      left: 19.64,
                      top: 21.82,
                      child: Container(
                        width: 275.36,
                        height: 235.59,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/cat.png'), // Replace with your image file path
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 25),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.21),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3FD3D1D8),
                      blurRadius: 36.43,
                      offset: Offset(18.21, 18.21),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 318,
                      child: Text(
                        'YAYY CHECKED OUT!!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(
                      width: 297,
                      child: Opacity(
                        opacity: 0.50,
                        child: Text(
                          'Yummmy Food on your WAY!! ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            letterSpacing: 0.30,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Arriving in : ${_timerDuration.inHours}:${(_timerDuration.inMinutes % 60).toString().padLeft(2, '0')}:${(_timerDuration.inSeconds % 60).toString().padLeft(2, '0')}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange, // Replace with your preferred color
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
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
                                'Go to Home',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
