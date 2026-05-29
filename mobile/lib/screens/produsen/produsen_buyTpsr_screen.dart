import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'produsen_dashboard_screen.dart';
import 'produsen_sellCrops_screen.dart';

class ProdusenBuyTpsrScreen
    extends StatefulWidget {

  const ProdusenBuyTpsrScreen({
    super.key,
  });

  @override
  State<ProdusenBuyTpsrScreen>
      createState() =>
          _ProdusenBuyTpsrScreenState();
}

class _ProdusenBuyTpsrScreenState
    extends State<ProdusenBuyTpsrScreen> {

  String name = "User";
  String role = "";

  int selectedTab = 2;

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
                                "PURCHASE",

                            value: "12",

                            icon:
                                Icons.shopping_bag_outlined,
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

                    const Text(

                      "TPSR PRODUCTS",

                      style: TextStyle(
                        fontSize: 22,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    productCard(
                      title:
                          "Organic Compost",

                      stock:
                          "120 bags available",

                      description:
                          "Premium organic fertilizer for farming",

                      price:
                          "\$ 12 / bag",

                      icon:
                          Icons.eco,
                    ),

                    const SizedBox(
                      height: 18,
                    ),

                    productCard(
                      title:
                          "Bio Solar Fuel",

                      stock:
                          "500 liters available",

                      description:
                          "Alternative fuel from TPSR processing",

                      price:
                          "\$ 1.8 / liter",

                      icon:
                          Icons.local_gas_station,
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

  Widget productCard({
    required String title,
    required String stock,
    required String description,
    required String price,
    required IconData icon,
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

            children: [

              CircleAvatar(

                radius: 30,

                backgroundColor:
                    const Color(
                  0xFF06C167,
                ),

                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),

              const SizedBox(
                width: 16,
              ),

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

                        fontSize: 22,

                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 6,
                    ),

                    Text(

                      stock,

                      style:
                          const TextStyle(
                        color:
                            Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 18,
          ),

          Text(

            description,

            style: const TextStyle(
              color: Colors.black54,
              height: 1.5,
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          Row(

            children: [

              Text(

                price,

                style:
                    const TextStyle(

                  color:
                      Color(0xFF06C167),

                  fontSize: 26,

                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const Spacer(),

              ElevatedButton(

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
                        BorderRadius.circular(
                      14,
                    ),
                  ),
                ),

                onPressed: () {},

                child: const Text(

                  "Buy Now",

                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}