import 'package:flutter/material.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),

      body: Stack(
        children: [

          // BG PATTERN
          Positioned.fill(
            child: Opacity(
              opacity: 0.2,
            child: Image.asset(
              "assets/images/bg_pattern.png",
              fit: BoxFit.cover,
            ),
            ),
          ),

          // TOP LEAF
          Positioned(
            top: -110,
            right: -250,

            child: Image.asset(
              "assets/images/top_leaf.png",
              width: 900,
            ),
          ),

          // BOTTOM LEAF
          Positioned(
            bottom: -10,
            left: -15,
            child: Image.asset(
              "assets/images/bottom_leaf.png",
              width: 165,
            ),
          ),

          SafeArea(
            child: Stack(
              children: [

                /// FORM CONTENT
                SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(
                      left: 44,
                      right: 0,
                    ),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        const SizedBox(
                          height: 90,
                        ),

                        /// TITLE
                        const Text(
                          "REGISTER",

                          style: TextStyle(
                            fontSize: 38,
                            fontWeight:
                                FontWeight.w700,
                            color:
                                Color(0xFF58C531),
                            letterSpacing: -1,
                          ),
                        ),

                        const SizedBox(
                          height: 2,
                        ),

                        const Text(
                          "Create your new account",

                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                          ),
                        ),

                        const SizedBox(
                          height: 78,
                        ),

                        /// USERNAME
                        _label(
                          Icons.person,
                          "Username",
                        ),

                        const SizedBox(height: 9),

                        Transform.translate(
                          offset:
                              const Offset(18, 0),

                          child: _inputField(
                            context,
                            "Enter username ...",
                          ),
                        ),

                        const SizedBox(height: 24),

                        /// EMAIL
                        _label(
                          Icons.email,
                          "Email",
                        ),

                        const SizedBox(height: 9),

                        Transform.translate(
                          offset:
                              const Offset(18, 0),

                          child: _inputField(
                            context,
                            "Enter your email",
                          ),
                        ),

                        const SizedBox(height: 24),

                        /// PASSWORD
                        _label(
                          Icons.lock,
                          "Password",
                        ),

                        const SizedBox(height: 9),

                        Transform.translate(
                          offset:
                              const Offset(18, 0),

                          child: _inputField(
                            context,
                            "Enter password ...",
                            obscure: true,
                          ),
                        ),

                        const SizedBox(height: 24),

                        /// CONFIRM PASSWORD
                        _label(
                          Icons.lock_outline,
                          "Confirm Password",
                        ),

                        const SizedBox(height: 9),

                        Transform.translate(
                          offset:
                              const Offset(18, 0),

                          child: _inputField(
                            context,
                            "Confirm password ...",
                            obscure: true,
                          ),
                        ),

                        const SizedBox(height: 150),

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

                              const SizedBox(
                                height: 3,
                              ),

                              GestureDetector(

                                onTap: () {

                                  Navigator.pushReplacement(

                                    context,

                                    MaterialPageRoute(
                                      builder: (_) =>
                                          const LoginScreen(),
                                    ),
                                  );
                                },

                                child: const Text(
                                  "LOGIN",

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
                              ),

                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// REGISTER BUTTON
                Positioned(
                  left: -35,
                  bottom: 110,
                  

                  child: Container(
                    width: 240,
                    height: 54,

                    decoration:
                        const BoxDecoration(
                      color:
                          Color(0xFF58C531),

                      borderRadius:
                          BorderRadius.only(
                        topRight:
                            Radius.circular(100),

                        bottomRight:
                            Radius.circular(100),
                      ),
                    ),

                    child: TextButton(

                      onPressed: () {},

                      child: const Text(
                        "REGISTER",

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight:
                              FontWeight.w600,
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
    );
  }

  /// LABEL
  Widget _label(
    IconData icon,
    String text,
  ) {

    return Row(
      children: [

        Icon(
          icon,
          size: 15,
          color: Colors.black54,
        ),

        const SizedBox(width: 6),

        Text(
          text,

          style: const TextStyle(
            fontSize: 15,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  /// INPUT FIELD
  Widget _inputField(
    BuildContext context,
    String hint, {
    bool obscure = false,
  }) {

    return Container(
      height: 50,

      width:
          MediaQuery.of(context)
                  .size
                  .width +
              40,

      decoration: const BoxDecoration(
        boxShadow: [

          BoxShadow(
            blurRadius: 8,
            offset: Offset(0, 3),
            color: Colors.black12,
          ),
        ],
      ),

      child: TextField(
        obscureText: obscure,

        decoration: InputDecoration(

          hintText: hint,

          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),

          filled: true,
          fillColor: Colors.white,

          enabledBorder:
              const OutlineInputBorder(
            borderRadius:
                BorderRadius.all(
              Radius.circular(100),
            ),

            borderSide:
                BorderSide.none,
          ),

          focusedBorder:
              const OutlineInputBorder(
            borderRadius:
                BorderRadius.all(
              Radius.circular(100),
            ),

            borderSide:
                BorderSide.none,
          ),

          contentPadding:
              const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 13,
          ),
        ),
      ),
    );
  }
}