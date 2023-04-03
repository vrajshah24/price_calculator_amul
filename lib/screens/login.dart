import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:price_calculator_amul/colors.dart';
import 'package:price_calculator_amul/responsive.dart';
import 'package:price_calculator_amul/widgets/textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getHeight(context) * 0.4,
              width: getWidth(context),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 18 * getResponsiveText(context),
                        ),
                      ),
                      SizedBox(
                        height: 20 * getResponsive(context),
                      ),
                      Text('Sign In in order to update the stocks.')
                    ],
                  )
                ],
              ),
            ),
            Card(
              elevation: 5,
              child: SizedBox(
                height: getHeight(context) * 0.6,
                width: getWidth(context),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30 * getResponsive(context),
                    ),
                    textfield('Username', 'Username', 1,
                        getWidth(context) * 0.6, username),
                    textfield('Password', 'Password', 1,
                        getWidth(context) * 0.6, password),
                    SizedBox(
                      height: 40 * getResponsive(context),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      height: 60 * getResponsive(context),
                      width: getWidth(context) * 0.6,
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
