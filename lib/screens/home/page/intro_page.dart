import 'package:flutter/material.dart';

import 'login_page.dart';

class Intropage extends StatelessWidget {
  const Intropage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image_1_dark.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 70, left: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 48),

                // title
                const Text(
                  'POPLOVE',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 65,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 1),

                // subtitle
                const Text(
                  'SHOP',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 65,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),

                const SizedBox(height: 50),

                // start now button

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: Center(
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 123, 90, 43),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Center(
                        child: Container(
                          child: const Text(
                            'Start',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
