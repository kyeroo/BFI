import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import 'tpsr_dashboard.dart';

import 'tpsr/tpsr_dashboard_screen.dart';

final TextEditingController
    emailController =
        TextEditingController();

final TextEditingController
    passwordController =
        TextEditingController();

class LoginScreen extends StatefulWidget {

  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {

  final emailController =
      TextEditingController();

  final passwordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xFFF1F1F1),

      body: Stack(
        children: [

          /// BG PATTERN
          Positioned.fill(
            child: Opacity(
              opacity: 0.2,

              child: Image.asset(
                "assets/images/bg_pattern.png",
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// TOP LEAF
          Positioned(
            top: -110,
            right: -250,

            child: Image.asset(
              "assets/images/top_leaf.png",
              width: 900,
            ),
          ),

          /// BOTTOM LEAF
          Positioned(
            bottom: -10,
            left: -15,

            child: Image.asset(
              "assets/images/bottom_leaf.png",
              width: 165,
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 44,
                right: 0,
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  const SizedBox(height: 145),

                  /// TITLE
                  const Text(
                    "LOGIN",

                    style: TextStyle(
                      fontSize: 38,
                      fontWeight:
                          FontWeight.w700,
                      color:
                          Color(0xFF58C531),
                      letterSpacing: -1,
                    ),
                  ),

                  const SizedBox(height: 2),

                  const Text(
                    "Sign in your account to continue",

                    style: TextStyle(
                      fontSize: 15,
                      color:
                          Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 78),

                  /// USERNAME
                  const Row(
                    children: [

                      Icon(
                        Icons.person,
                        size: 15,
                        color:
                            Colors.black54,
                      ),

                      SizedBox(width: 6),

                      Text(
                        "Username",

                        style: TextStyle(
                          fontSize: 15,
                          color:
                              Colors.black54,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 9),

                  Transform.translate(
                    offset:
                        const Offset(18, 0),

                    child: Container(
                      height: 46,

                      width:
                          MediaQuery.of(context)
                                  .size
                                  .width +
                              40,

                      decoration:
                          BoxDecoration(
                        color: Colors.white,

                        borderRadius:
                            BorderRadius
                                .circular(
                          100,
                        ),

                        boxShadow: [

                          BoxShadow(
                            blurRadius: 8,
                            offset:
                                const Offset(
                              0,
                              3,
                            ),
                            color:
                                Colors.black12,
                          )
                        ],
                      ),

                      child: TextField(
                      controller: emailController,

                        decoration:
                            const InputDecoration(

                          hintText:
                              "Enter username ...",

                          hintStyle:
                              TextStyle(
                            color:
                                Colors.grey,
                            fontSize: 14,
                          ),

                          border:
                              InputBorder.none,

                          contentPadding:
                              EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 13,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// PASSWORD
                  const Row(
                    children: [

                      Icon(
                        Icons.lock,
                        size: 15,
                        color:
                            Colors.black54,
                      ),

                      SizedBox(width: 6),

                      Text(
                        "Password",

                        style: TextStyle(
                          fontSize: 15,
                          color:
                              Colors.black54,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 9),

                  Transform.translate(
                    offset:
                        const Offset(18, 0),

                    child: Container(
                      height: 46,

                      width:
                          MediaQuery.of(context)
                                  .size
                                  .width +
                              40,

                      decoration:
                          BoxDecoration(
                        color: Colors.white,

                        borderRadius:
                            BorderRadius
                                .circular(
                          100,
                        ),

                        boxShadow: [

                          BoxShadow(
                            blurRadius: 8,
                            offset:
                                const Offset(
                              0,
                              3,
                            ),
                            color:
                                Colors.black12,
                          )
                        ],
                      ),

                      child: TextField(
                        controller:
                            passwordController,

                        obscureText: true,

                        decoration:
                            const InputDecoration(

                          hintText:
                              "Enter Password ...",

                          hintStyle:
                              TextStyle(
                            color:
                                Colors.grey,
                            fontSize: 14,
                          ),

                          border:
                              InputBorder.none,

                          contentPadding:
                              EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 13,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Align(
                    alignment:
                        Alignment.centerRight,

                    child: Text(
                      "Forgot Password?",

                      style: TextStyle(
                        color:
                            Color(0xFF58C531),
                        fontSize: 14,
                      ),
                    ),
                  ),

                  const SizedBox(height: 62),

                  /// LOGIN BUTTON
                  Transform.translate(
                    offset:
                        const Offset(-75, 0),

                    child: SizedBox(
                      width: 250,
                      height: 54,

                      child: ElevatedButton(

                        style:
                            ElevatedButton
                                .styleFrom(

                          backgroundColor:
                              const Color(
                            0xFF58C531,
                          ),

                          elevation: 0,

                          shape:
                              const StadiumBorder(),
                        ),

                        onPressed: () async {

                            final result =
                                await AuthService.login(

                              emailController.text,
                              passwordController.text,
                            );

                            if (result != null) {

                              final role =
                                  result["user"]["role"];

                              if (role == "TPSR") {

                                Navigator.pushReplacement(
                                  context,

                                  MaterialPageRoute(
                                    builder: (_) =>
                                        const TpsrDashboardScreen(),
                                  ),
                                );
                              }

                              else if (role == "PETANI") {

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(

                                  const SnackBar(
                                    content: Text(
                                      "Dashboard Petani belum dibuat",
                                    ),
                                  ),
                                );
                              }

                              else if (role == "HORECA") {

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(

                                  const SnackBar(
                                    content: Text(
                                      "Dashboard Horeca belum dibuat",
                                    ),
                                  ),
                                );
                              }
                            }

                            else {

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(

                                const SnackBar(
                                  content: Text(
                                    "Login gagal",
                                  ),
                                ),
                              );
                            }
                          },

                        child: const Text(
                          "LOGIN",

                          style: TextStyle(
                            fontSize: 18,
                            fontWeight:
                                FontWeight
                                    .w500,
                            color:
                                Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),

                  /// FOOTER
                  Center(
                    child: Column(
                      children: [

                        const Text(
                          "Do you have an account ?",

                          style: TextStyle(
                            fontSize: 14,
                            color:
                                Colors.black54,
                          ),
                        ),

                        const SizedBox(height: 3),

                        const Text(
                          "REGISTER",

                          style: TextStyle(
                            fontSize: 16,
                            fontWeight:
                                FontWeight.bold,
                            color:
                                Color(0xFF58C531),

                            decoration:
                                TextDecoration
                                    .underline,
                          ),
                        ),

                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}