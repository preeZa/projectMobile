import 'package:flutter/material.dart';

import '../../../main.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/image 2_dark.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
          child: isSmallScreen
              ? const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Brand_name(),
                    _FormContent(),
                  ],
                )
              : Container(
                  padding: const EdgeInsets.all(32.0),
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: const Row(
                    children: const [
                      Expanded(child: Brand_name()),
                      Expanded(
                        child: Center(child: _FormContent()),
                      ),
                    ],
                  ),
                )),
    ));
  }
}

class Brand_name extends StatefulWidget {
  const Brand_name({Key? key}) : super(key: key);

  @override
  State<Brand_name> createState() => _Brand_name();
}

class _Brand_name extends State<Brand_name> {
  @override
  Widget build(BuildContext context) {
    // final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "POPLVOE SHOP",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
        )
      ],
    );
  }
}

class _FormContent extends StatefulWidget {
  const _FormContent({Key? key}) : super(key: key);

  @override
  State<_FormContent> createState() => __FormContentState();
}

class __FormContentState extends State<_FormContent> {
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Color wh = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Form(
        // key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              style: TextStyle(color: wh),
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    color: Color(0xFF765827),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: wh),
                ),
                labelText: 'Username',
                labelStyle: TextStyle(color: wh),
                hintText: 'Enter your username',
                hintStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Icon(
                  Icons.person,
                  color: wh,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: wh),
                ),
              ),
            ),
            _gap(),
            TextFormField(
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Color(0xFF765827)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: wh),
                ),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'Enter your password',
                hintStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: const Icon(
                  Icons.lock_outline_rounded,
                  color: Colors.white,
                ),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: wh,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            CheckboxListTile(
              value: _rememberMe,
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _rememberMe = value;
                });
              },
              title: const Text(
                'Remember me',
                style: TextStyle(color: Colors.white),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              contentPadding: const EdgeInsets.all(0),
              side: BorderSide(color: wh),
              checkColor: wh,
              activeColor: Color(0xFF765827),
            ),
            _gap(),
            _gap(),
            Row(
              children: [
                Text(
                  'Dont\'have an account ?',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            _gap(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF765827),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                  );
                  // if (_formKey.currentState?.validate() ?? false) {
                  //   /// do something
                  // }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
