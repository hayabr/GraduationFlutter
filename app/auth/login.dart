import 'package:flutter/material.dart';
import 'package:userauth/components/crud.dart';
import 'package:userauth/components/customtextform.dart';
import 'package:userauth/components/valid.dart';
import 'package:userauth/constant/linkApi.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:userauth/main.dart'; // ✅ Ensure you have this package installed

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formstate = GlobalKey();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Crud crud = Crud(); // ✅ Removed unnecessary `new` keyword

  login() async {
    if (formstate.currentState!.validate()) {
      var response = await crud.postRequest(linkLogin, {
        "email": email.text,
        "password": password.text
      });

      if (response['status'] == "success") {
      
        Navigator.of(context).pushNamed("home");

      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: "Login Failed",
          desc: "Invalid email or password!",
          btnOkOnPress: () {},
        ).show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Center(
              child: Form(
                key: formstate, // ✅ Added Form widget
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Image.asset(
                      "lib/assets/1299984.png",
                      width: 200,
                      height: 200,
                    ),
                    const SizedBox(height: 30),
                    CustomtextFormSign(
                      valid: (val) {
                        return validInput(val!, 3, 20);
                      },
                      key: UniqueKey(),
                      hint: "Email",
                      mycontroller: email,
                    ),
                    const SizedBox(height: 1),
                    CustomtextFormSign(
                      valid: (val) {
                        return validInput(val!, 3, 20);
                      },
                      key: UniqueKey(),
                      hint: "Password",
                      mycontroller: password,
                      isPassword: true,
                    ),
                    const SizedBox(height: 15),
                    MaterialButton(
                      color: const Color.fromARGB(255, 28, 132, 90),
                      textColor: Colors.white,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () async {
                        await login(); // ✅ Fixed function call
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color.fromARGB(255, 28, 132, 90),
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed("signup");
                      },
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
