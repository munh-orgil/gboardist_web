// ignore: depend_on_referenced_packages
import 'package:core_control_panel/constants/colors.dart';
import 'package:core_control_panel/constants/widget.dart';
import 'package:core_control_panel/widgets/customs/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool loading = true;
  bool rememberMe = false;
  bool passwordVisible = true;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void getData() async {}

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.black,
      title: "Login",
      child: Scaffold(
        body: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/board.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.transparent,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/wide-logo.png",
                              height: 150,
                              fit: BoxFit.fitHeight,
                            ),
                            gapH32,
                            Container(
                              width: 400,
                              height: 500,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(40, 40, 40, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Column(
                                children: [
                                  gapH32,
                                  CustomTextField(
                                    controller: userNameController,
                                    hintText: "Username or Email",
                                    // border: true,
                                    maxWidth: 340,
                                    prefixIcon: const Icon(
                                      Icons.person_outline,
                                    ),
                                  ),
                                  CustomTextField(
                                    controller: passwordController,
                                    hintText: "Password",
                                    // border: true,
                                    maxWidth: 340,
                                    prefixIcon: const Icon(
                                      Icons.lock_outline,
                                    ),
                                    suffix: Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: IconButton(
                                        icon: Icon(
                                          passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          setState(
                                            () {
                                              passwordVisible =
                                                  !passwordVisible;
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    obscure: passwordVisible,
                                  ),
                                  gapH16,
                                  Row(
                                    children: [
                                      gapW24,
                                      Checkbox(
                                          activeColor: CColors.primary,
                                          side: const BorderSide(
                                            color: Colors.white,
                                          ),
                                          value: rememberMe,
                                          onChanged: (value) {
                                            setState(() {
                                              rememberMe = !rememberMe;
                                            });
                                          }),
                                      const Text(
                                        "Remember me",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 32),
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: InkWell(
                                              child: const Padding(
                                                padding:
                                                    EdgeInsets.only(top: 8),
                                                child: Text(
                                                  "Forgot Password",
                                                  style: TextStyle(
                                                    shadows: [
                                                      Shadow(
                                                          color: Colors.blue,
                                                          offset: Offset(0, -5))
                                                    ],
                                                    color: Colors.transparent,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    decorationColor:
                                                        Colors.blue,
                                                    decorationThickness: 2,
                                                  ),
                                                ),
                                              ),
                                              onTap: () {},
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  gapH16,
                                  SizedBox(
                                    height: 75,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 64),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  CColors.primary),
                                        ),
                                        onPressed: () {},
                                        child: const Text(
                                          "Log in",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 28,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  gapH16,
                                  SizedBox(
                                    height: 75,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 64),
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white),
                                          ),
                                          onPressed: () {},
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                "images/google.png",
                                              ),
                                              gapW16,
                                              const Text(
                                                "Log in with Google",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: CColors.textDark,
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ),
                                  gapH32,
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "New to gboardist?",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      InkWell(
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(8, 8, 0, 0),
                                          child: Text(
                                            "Sign up",
                                            style: TextStyle(
                                              shadows: [
                                                Shadow(
                                                    color: Colors.blue,
                                                    offset: Offset(0, -5))
                                              ],
                                              color: Colors.transparent,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor: Colors.blue,
                                              decorationThickness: 2,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
