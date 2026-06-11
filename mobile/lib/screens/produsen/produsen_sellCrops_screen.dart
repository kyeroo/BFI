import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login_screen.dart';
import '../../services/auth_service.dart';
import 'produsen_dashboard_screen.dart';
import 'produsen_buyTpsr_screen.dart';

class produsensellCropsScreen extends StatefulWidget {

  const produsensellCropsScreen({
    super.key,
  });

  @override
  State<produsensellCropsScreen> createState() =>
      _SellCropsScreenState();
}

class _SellCropsScreenState
    extends State<produsensellCropsScreen> {

  String name = "User";
  String role = "";

  int selectedTab = 1;

  @override
  void initState() {
    super.initState();

    loadUser();
  }

  Future<void> loadUser() async {

    final prefs =
        await SharedPreferences
            .getInstance();

    setState(() {

      name =
          prefs.getString("name") ??
          "User";

      role =
          prefs.getString("role") ??
          "PRODUSEN";
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xFFF3F3F3),

      body: SafeArea(

        child: SingleChildScrollView(

          child: Column(

            children: [

              /// HEADER
              Container(

                width: double.infinity,

                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 20,
                ),

                decoration:
                    const BoxDecoration(

                  color:
                      Color(0xFF06C167),

                  borderRadius:
                      BorderRadius.only(

                    bottomLeft:
                        Radius.circular(32),

                    bottomRight:
                        Radius.circular(32),
                  ),
                ),

                child: Column(

                  children: [

                    /// TOP BAR
                    Row(

                      children: [

                        Column(

                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                          children: [

                            const Text(

                              "WELCOME",

                              style: TextStyle(
                                color:
                                    Colors.white,
                                fontSize: 14,
                              ),
                            ),

                            const SizedBox(
                              height: 4,
                            ),

                            Text(

                              name,

                              style:
                                  const TextStyle(

                                color:
                                    Colors.white,

                                fontSize: 24,

                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),

                        Container(

                          padding:
                              const EdgeInsets
                                  .all(12),

                          decoration:
                              BoxDecoration(

                            color:
                                Colors.white24,

                            borderRadius:
                                BorderRadius
                                    .circular(
                              14,
                            ),
                          ),

                          child: const Icon(

                            Icons
                                .notifications_none_rounded,

                            color:
                                Colors.white,
                          ),
                        ),

                        const SizedBox(
                          width: 10,
                        ),

                        Container(

                          padding:
                              const EdgeInsets
                                  .all(10),

                          decoration:
                              BoxDecoration(

                            color:
                                Colors.white24,

                            borderRadius:
                                BorderRadius
                                    .circular(
                              14,
                            ),
                          ),

                          child: const Icon(

                            Icons.person,

                            color:
                                Colors.white,
                          ),
                        ),

                        const SizedBox(
                          width: 10,
                        ),

                        GestureDetector(

                          onTap: () async {

                            await AuthService.logout();

                            Navigator.pushAndRemoveUntil(

                              context,

                              MaterialPageRoute(
                                builder: (_) =>
                                    const LoginScreen(),
                              ),

                              (route) => false,
                            );
                          },

                          child: Container(
                            padding: const EdgeInsets.all(10),

                            decoration: BoxDecoration(
                              color: Colors.white,

                              borderRadius:
                                  BorderRadius.circular(14),

                              boxShadow: [

                                BoxShadow(
                                  blurRadius: 8,
                                  offset: Offset(0, 3),
                                  color: Colors.black12,
                                ),
                              ],
                            ),

                            child: const Icon(
                              Icons.logout_rounded,
                              color: Color(0xFF06C167),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 28,
                    ),

                    /// SUMMARY CARD
                    Row(

                      children: [

                        Expanded(

                          child: summaryCard(

                            title:
                                "BALANCE",

                            value:
                                "\$ 850",

                            icon:
                                Icons.account_balance_wallet_outlined,
                          ),
                        ),

                        const SizedBox(
                          width: 16,
                        ),

                        Expanded(

                          child: summaryCard(

                            title:
                                "ORDERS",

                            value: "24",

                            icon:
                                Icons.shopping_cart_outlined,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 22,
                    ),

                    /// TAB MENU
                    Container(

                      padding:
                          const EdgeInsets.all(
                        6,
                      ),

                      decoration:
                          BoxDecoration(

                        color:
                            Colors.white,

                        borderRadius:
                            BorderRadius.circular(
                          18,
                        ),
                      ),

                      child: Row(

                        children: [

                          tabButton(
                            title:
                                "Dashboard",
                            index: 0,
                          ),

                          tabButton(
                            title:
                                "Sell Crops",
                            index: 1,
                          ),

                          tabButton(
                            title:
                                "Buy TPSR",
                            index: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// BODY
              Padding(

                padding:
                    const EdgeInsets.all(
                  22,
                ),

                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                  children: [

                    /// TITLE
                    Row(

                      children: [

                        const Text(

                          "MARKET LISTING",

                          style: TextStyle(

                            fontSize: 22,

                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const Spacer(),

                        TextButton(

                          onPressed: () {},

                          child: const Text(

                            "+ NEW",

                            style: TextStyle(

                              color:
                                  Color(
                                0xFF06C167,
                              ),

                              fontWeight:
                                  FontWeight
                                      .bold,

                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 18,
                    ),

                    cropCard(
                      title:
                          "Jasmine Rice",

                      stock:
                          "750 kg available",

                      location:
                          "Nusa Dua",

                      price:
                          "\$ 9.2",
                    ),

                    const SizedBox(
                      height: 18,
                    ),

                    cropCard(
                      title:
                          "Sweet Corn",

                      stock:
                          "450 kg available",

                      location:
                          "Jimbaran",

                      price:
                          "\$ 7",
                    ),

                    const SizedBox(
                      height: 18,
                    ),

                    cropCard(
                      title:
                          "Red Snapper",

                      stock:
                          "120 kg available",

                      location:
                          "Kedonganan",

                      price:
                          "\$ 4.6",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget summaryCard({
    required String title,
    required String value,
    required IconData icon,
  }) {

    return Container(

      padding:
          const EdgeInsets.all(18),

      decoration: BoxDecoration(

        border:
            Border.all(
          color: Colors.white,
        ),

        borderRadius:
            BorderRadius.circular(22),
      ),

      child: Column(

        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Icon(
            icon,
            color: Colors.white,
          ),

          const SizedBox(
            height: 18,
          ),

          Text(

            title,

            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),

          const SizedBox(
            height: 6,
          ),

          Text(

            value,

            style: const TextStyle(

              color: Colors.white,

              fontSize: 28,

              fontWeight:
                  FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget tabButton({
    required String title,
    required int index,
  }) {

    final isSelected =
        selectedTab == index;

    return Expanded(

      child: GestureDetector(

        onTap: () {

          if (index == 0) {

            Navigator.pushReplacement(

              context,

              MaterialPageRoute(
                builder: (_) =>
                    const ProdusenDashboardScreen(),
              ),
            );
          }

          if (index == 1) {

            Navigator.pushReplacement(

              context,

              MaterialPageRoute(
                builder: (_) =>
                    const produsensellCropsScreen(),
              ),
            );
          }

          if (index == 2) {

            Navigator.pushReplacement(

              context,

              MaterialPageRoute(
                builder: (_) =>
                    const ProdusenBuyTpsrScreen(),
              ),
            );
          }
        },

        child: Container(

          height: 44,

          decoration: BoxDecoration(

            color: isSelected

                ? const Color(
                    0xFF06C167,
                  )

                : Colors.transparent,

            borderRadius:
                BorderRadius.circular(
              12,
            ),
          ),

          child: Center(

            child: Text(

              title,

              style: TextStyle(

                color: isSelected

                    ? Colors.white
                    : Colors.black54,

                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget cropCard({
    required String title,
    required String stock,
    required String location,
    required String price,
  }) {

    return Container(

      width: double.infinity,

      padding:
          const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
            BorderRadius.circular(
          22,
        ),

        boxShadow: [

          BoxShadow(
            blurRadius: 8,
            color: Colors.black12,
          ),
        ],
      ),

      child: Column(

        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Row(

            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Expanded(

                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                  children: [

                    Text(

                      title,

                      style:
                          const TextStyle(

                        fontSize: 24,

                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 8,
                    ),

                    Text(

                      stock,

                      style:
                          const TextStyle(
                        color:
                            Colors.grey,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(
                      height: 8,
                    ),

                    Row(

                      children: [

                        const Icon(
                          Icons.location_on_outlined,
                          size: 18,
                          color:
                              Colors.grey,
                        ),

                        const SizedBox(
                          width: 4,
                        ),

                        Text(

                          location,

                          style:
                              const TextStyle(
                            color:
                                Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Column(

                crossAxisAlignment:
                    CrossAxisAlignment.end,

                children: [

                  const Text(

                    "Price/Kg",

                    style: TextStyle(
                      color:
                          Colors.black54,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  Text(

                    price,

                    style:
                        const TextStyle(

                      color:
                          Color(
                        0xFF06C167,
                      ),

                      fontSize: 28,

                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(
            height: 22,
          ),

          SizedBox(

            width: double.infinity,
            height: 54,

            child: ElevatedButton(

              style:
                  ElevatedButton
                      .styleFrom(

                backgroundColor:
                    const Color(
                  0xFF06C167,
                ),

                shape:
                    RoundedRectangleBorder(

                  borderRadius:
                      BorderRadius
                          .circular(
                    14,
                  ),
                ),
              ),

              onPressed: () {},

              child: const Text(

                "Publish Listing",

                style: TextStyle(

                  color: Colors.white,

                  fontSize: 20,

                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}