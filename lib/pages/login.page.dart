import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:moneylover/pages/googlesignin.page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;
  void togglePasswordObscure() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Login Page"),
          backgroundColor: const Color.fromARGB(255, 196, 197, 196),
          foregroundColor: const Color.fromARGB(255, 32, 32, 32),
        ),
        body: SafeArea(
          child: Container(
            color: const Color.fromARGB(255, 219, 221, 220),
            child: Column(
              children: [
                //*background image
                const Center(
                  child: SizedBox(
                    height: 300,
                    child: Opacity(
                      opacity: .2,
                      child: Image(image: AssetImage("assets/userLogin.png")),
                    ),
                  ),
                ),
                //* username field
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30.0, right: 30, bottom: 10),
                  child: Card(
                    elevation: 4,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: userNameController,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.account_circle),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(
                                      255, 181, 216, 245)), //<-- SEE HERE
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(
                                      255, 213, 246, 230)), //<-- SEE HERE
                            ),
                            hintText: '   Username'),
                        showCursor: true,
                      ),
                    ),
                  ),
                ),
                //*password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Card(
                    elevation: 4,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: passwordController,
                        obscureText: obscurePassword,
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: togglePasswordObscure,
                                child: Icon(obscurePassword
                                    ? Icons.visibility_off_sharp
                                    : Icons.visibility_sharp)),
                            prefixIcon: const Icon(Icons.password_outlined),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(
                                      255, 181, 216, 245)), //<-- SEE HERE
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(
                                      255, 213, 246, 230)), //<-- SEE HERE
                            ),
                            hintText: '   Enter Password'),
                        showCursor: true,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 52,
                ),
                //* login button
                Column(
                  children: [
                    ConstrainedBox(
                      constraints:
                          const BoxConstraints.tightFor(height: 54, width: 160),
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            shadowColor:
                                const Color.fromARGB(255, 213, 246, 230),
                            backgroundColor:
                                Colors.blue[300], // background (button) color
                            foregroundColor:
                                Colors.white, // foreground (text) color
                          ),
                          onPressed: () {
                            // context.read<LoginCubit>().loginUser(
                            //     username: userNameController.text,
                            //     password: passwordController.text);
                          },
                          icon: const Icon(
                            Icons.login,
                            size: 20,
                          ),
                          label: const Text(
                            "Login",
                            style: TextStyle(fontSize: 18),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //*not a user? sign up

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Not a Member yet ?   "),
                        TextButton(
                            onPressed: () {
                              // context.router.push(const SignupRoute());
                            },
                            child: const Text(
                              "Click here to Register now",
                              style: TextStyle(fontSize: 16),
                            ))
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text("Try other Sign_in  options"),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (() async {
                    await Google_Login().signup(context);
                    log("signed_in_using_google_account");
                  }),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Image.asset("assets/googleBtn.png")),
                )
                //* forgot pass
              ],
            ),
          ),
        ));
  }
}
