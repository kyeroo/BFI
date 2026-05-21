import 'package:flutter/material.dart';

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
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 44,
                right: 0,
                ),

                child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [
                      const SizedBox(
                        height: 90
                        ),

                        // title
                        const Text(
                          "REGISTER",
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF58C531),
                            letterSpacing: -1,
                          ),
                        ),

                      const SizedBox(
                        height: 2),

                        const   Text(
                          "Create your new account",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                          ),
                        ),
                        
                        const SizedBox(
                          height: 78,
                        ),
                        
                        // USERNAME
                  const Row(
                    children: [

                      Icon(
                        Icons.person,
                        size: 15,
                        color: Colors.black54,
                      ),

                      SizedBox(width: 6),

                      Text(
                        "Username",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 9),

                  Transform.translate(
                    offset: const Offset(18, 0),

                    child: Container(
                      height: 46,
                      width: MediaQuery.of(context).size.width + 40,

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius:
                            BorderRadius.circular(100),

                        boxShadow: [

                          BoxShadow(
                            blurRadius: 8,
                            offset: Offset(0, 3),
                            color: Colors.black12,
                          )
                        ],
                      ),

                      child: const TextField(
                        decoration: InputDecoration(
                        
                          hintText: "Enter username ...",

                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),

                          filled: true,
                          fillColor: Colors.white,

                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(
                              Radius.circular(100),
                            ),

                            borderSide: BorderSide.none,
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(
                              Radius.circular(100),
                            ),

                            borderSide: BorderSide.none,
                          ),

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

                  // Email
                  const Row(
                    children: [
                      Icon(
                        Icons.email,
                        size: 15,
                        color: Colors.black54,
                      ),

                      SizedBox(
                        width: 6
                      ),

                      Text(
                        "Email",

                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 9,
                  ),

                  Transform.translate(
                    offset: const Offset(18, 0),

                    child: Container(
                      height: 50,

                      width:
                          MediaQuery.of(context).size.width + 40,

                      decoration: const BoxDecoration(
                        boxShadow: [
                        
                          BoxShadow(
                            blurRadius: 8,
                            offset: Offset(0, 3),
                            color: Colors.black12,
                          ),
                        ],
                      ),

                      child: const TextField(
                        decoration: InputDecoration(
                        
                          hintText:
                              "Enter your email",

                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),

                          filled: true,
                          fillColor: Colors.white,

                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(
                              Radius.circular(100),
                            ),

                            borderSide: BorderSide.none,
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(
                              Radius.circular(100),
                            ),

                            borderSide: BorderSide.none,
                          ),

                          contentPadding:
                              EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 13,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 24,
                  ),

                  // PASSWORD
                  const Row(
                    children: [

                      Icon(
                        Icons.lock,
                        size: 15,
                        color: Colors.black54,
                      ),

                      SizedBox(
                        width: 6,
                      ),

                      Text(
                        "Password",

                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                  ],
                  ),

                  const SizedBox(
                    height: 9,
                  ),

                  Transform.translate(
                    offset: const Offset(18, 0),

                    child: Container(
                      height: 46,

                      width: 
                      MediaQuery.of(context)
                      .size.width + 40,

                      decoration: const BoxDecoration(
                        boxShadow: [

                          BoxShadow(
                            blurRadius: 8,
                            offset: Offset(0, 3),
                            color: Colors.black12,
                          )
                        ],
                      ),
                      child: const TextField(
                        obscureText: true,

                        decoration: InputDecoration(

                          hintText:
                              "Enter password ...",

                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),

                          filled: true,
                          fillColor: Colors.white,

                          enabledBorder:
                              OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(
                              Radius.circular(100),
                            ),

                            borderSide:
                                BorderSide.none,
                          ),

                          focusedBorder:
                              OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(
                              Radius.circular(100),
                            ),

                            borderSide:
                                BorderSide.none,
                          ),

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

                  /// CONFIRM PASSWORD
                  const Row(
                    children: [

                      Icon(
                        Icons.lock_outline,
                        size: 15,
                        color: Colors.black54,
                      ),

                      SizedBox(width: 6),

                      Text(
                        "Confirm Password",

                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 9),

                  Transform.translate(
                    offset: const Offset(18, 0),

                    child: Container(
                      height: 46,

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
                          )
                        ],
                      ),

                      child: const TextField(
                        obscureText: true,

                        decoration: InputDecoration(

                          hintText:
                              "Confirm password ...",

                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),

                          filled: true,
                          fillColor: Colors.white,

                          enabledBorder:
                              OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(
                              Radius.circular(100),
                            ),

                            borderSide:
                                BorderSide.none,
                          ),

                          focusedBorder:
                              OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(
                              Radius.circular(100),
                            ),

                            borderSide:
                                BorderSide.none,
                          ),

                          contentPadding:
                              EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 13,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 62),

                  /// Register BUTTON
                  Transform.translate(
                    offset: const Offset(-75, 0),

                    child: SizedBox(
                      width: 250,
                      height: 54,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(

                          backgroundColor:
                              const Color(0xFF58C531),

                          elevation: 0,

                          shape:
                              const StadiumBorder(),
                        ),

                        onPressed: () {},

                        child: const Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                                    /// FOOTER
                  const SizedBox(height: 30),

                  Center(
                    child: Column(
                      children: [
                        const Text(
                          "Do you have an account ?",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),

                        const SizedBox(height: 3),

                        const Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF58C531),
                            decoration: TextDecoration.underline,
                          ),
                        ),

                        const SizedBox(height: 16),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                    ],
                ),
                ),
              ),
          ),
        ],
        )

    );
  }

  /// reusable input
  Widget _inputField(String hint, {bool obscure = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            offset: Offset(0, 3),
            color: Colors.black12,
          )
        ],
      ),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 14,
          ),
        ),
      ),
    );
  }
}