import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:jobhub/views/ui/auth/login.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_constants.dart';
//import '../../../controllers/login_provider.dart';
import '../../../controllers/signup_provider.dart';
import '../../common/app_bar.dart';
import '../../common/app_style.dart';
import '../../common/custom_btn.dart';
import '../../common/custom_textfield.dart';
import '../../common/height_spacer.dart';
import '../../common/reusable_text.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
 
 final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpNotifier> (
      builder: (context, signupNotifier, child ) {
        return Scaffold(
      appBar: PreferredSize( preferredSize: const Size.fromHeight(50),
      ///appbar in custon widget
      child: CustomAppBar(
        text: "Sign up",
        child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(CupertinoIcons.arrow_left),
        ),
      ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const HeightSpacer(size: 50),
            ReusableText(text: "Hello, Welcome!",
             style: appstyle(30, Color(kDark.value), FontWeight.w600),
             ),
             ReusableText(text: "Fill the details to Signup for an account",
             style: appstyle(16, Color(kDarkGrey.value), FontWeight.w600),
             ),
             const HeightSpacer(size: 50),
             //reusable custom text field

            CustomTextField(
              controller: name,
              keyboardType: TextInputType.text,
              hintText: "Full name",
              validator: (name) {
                if(name!.isEmpty) {
                  return "Please enter your name";
                } else {
                  return null;
                }
              },
            ),

            const HeightSpacer(size: 20),

            CustomTextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              hintText: "Email",
              validator: (email) {
                if(email!.isEmpty || !email.contains("@")) {
                  return "Please enter a valid email";
                } else {
                  return null;
                }
              },
            ),

            const HeightSpacer(size: 20),

            CustomTextField(
              controller: password,
              keyboardType: TextInputType.text,
              hintText: "Password",
              obscureText: signupNotifier.obscureText,
              validator: (password) {
                if(signupNotifier.passwordValidator(password??'')) {
                  return "Please enter a valid password with at least one uppercase, one lowercase, one digit, a special character and length of 8 letters";
                } return null;
              },
              suffixIcon: GestureDetector(
                onTap: () {
                  signupNotifier.obscureText = !signupNotifier.obscureText;
                },
                child: Icon(
                  signupNotifier.obscureText
                  ?Icons.visibility : Icons.visibility_off,
                   color: Color(kDark.value),),
              ),
            ),

            const HeightSpacer(size: 10),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const LoginPage());
                },
                child: ReusableText(text: "Login",
                 style: appstyle(14, Color(kDark.value), FontWeight.w500),
                 ),
              ),
            ),

             const HeightSpacer(size: 50),

             CustomButton(
              text: "Sign up",
              onTap: () {},
             ),

          ],
        ),
        )
    );
      }
    );
  }
}