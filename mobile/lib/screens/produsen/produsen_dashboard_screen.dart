import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login_screen.dart';
import '../../services/auth_service.dart';
import 'produsen_buyTpsr_screen.dart';
import 'produsen_sellCrops_screen.dart';

class ProdusenDashboardScreen
    extends StatefulWidget {

  const ProdusenDashboardScreen({
    super.key,
  });

  @override
  State<ProdusenDashboardScreen>
      createState() =>
          _ProdusenDashboardScreenState();
}

class _ProdusenDashboardScreenState
    extends State<ProdusenDashboardScreen> {

  String name = "User";
  String role = "";

  int selectedTab = 0;

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
                        Radius.circular(
                      32,
                    ),

                    bottomRight:
                        Radius.circular(
                      32,
                    ),
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
                                    FontWeight
                                        .bold,
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
                          const EdgeInsets
                              .all(6),

                      decoration:
                          BoxDecoration(

                        color:
                            Colors.white,

                        borderRadius:
                            BorderRadius
                                .circular(
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

                      "RECENT ACTIVITY",

                      style: TextStyle(
                        fontSize: 20,

                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 22,
                    ),

                    activityCard(

                      title:
                          "Rice - 500kg",

                      date:
                          "22 May 2026",

                      price:
                          "\$ 450",

                      status:
                          "complete",

                      statusColor:
                          Colors.greenAccent,
                    ),

                    const SizedBox(
                      height: 18,
                    ),

                    activityCard(

                      title:
                          "Organic Compost - 10 bags",

                      date:
                          "20 May 2026",

                      price:
                          "\$ 50",

                      status:
                          "shipped",

                      statusColor:
                          Colors.deepPurpleAccent,
                    ),

                    const SizedBox(
                      height: 24,
                    ),

                    /// PROMO CARD
                    Container(

                      width:
                          double.infinity,

                      padding:
                          const EdgeInsets
                              .all(24),

                      decoration:
                          BoxDecoration(

                        color:
                            const Color(
                          0xFF06C167,
                        ),

                        borderRadius:
                            BorderRadius
                                .circular(
                          26,
                        ),
                      ),

                      child: Column(

                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                        children: [

                          const Text(

                            "TPSR Partner Ship",

                            style:
                                TextStyle(

                              color:
                                  Colors.white,

                              fontSize: 22,

                              fontWeight:
                                  FontWeight
                                      .bold,
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          const Text(

                            "Get 15% off on your first compost order this month",

                            style:
                                TextStyle(

                              color:
                                  Colors.white,

                              height: 1.5,
                            ),
                          ),

                          const SizedBox(
                            height: 26,
                          ),

                          Container(

                            padding:
                                const EdgeInsets
                                    .symmetric(

                              horizontal:
                                  20,

                              vertical:
                                  12,
                            ),

                            decoration:
                                BoxDecoration(

                              color:
                                  Colors.white,

                              borderRadius:
                                  BorderRadius
                                      .circular(
                                14,
                              ),
                            ),

                            child:
                                const Row(

                              mainAxisSize:
                                  MainAxisSize
                                      .min,

                              children: [

                                Text(

                                  "Shop now",

                                  style:
                                      TextStyle(

                                    fontWeight:
                                        FontWeight
                                            .bold,

                                    color:
                                        Color(
                                      0xFF06C167,
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  width: 10,
                                ),

                                Icon(

                                  Icons
                                      .arrow_forward,

                                  color:
                                      Color(
                                    0xFF06C167,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
    );
  }

  Widget summaryCard({
    required String title,
    required String value,
    required IconData icon,
  }) {

    return Container(

      padding:
          const EdgeInsets.all(
        18,
      ),

      decoration:
          BoxDecoration(

        border:
            Border.all(
          color:
              Colors.white,
        ),

        borderRadius:
            BorderRadius.circular(
          22,
        ),
      ),

      child: Column(

        crossAxisAlignment:
            CrossAxisAlignment
                .start,

        children: [

          Icon(
            icon,
            color:
                Colors.white,
          ),

          const SizedBox(
            height: 18,
          ),

          Text(

            title,

            style:
                const TextStyle(

              color:
                  Colors.white70,

              fontSize: 12,
            ),
          ),

          const SizedBox(
            height: 6,
          ),

          Text(

            value,

            style:
                const TextStyle(

              color:
                  Colors.white,

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

          decoration:
              BoxDecoration(

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

  Widget activityCard({
    required String title,
    required String date,
    required String price,
    required String status,
    required Color statusColor,
  }) {

    return Container(

      width:
          double.infinity,

      padding:
          const EdgeInsets.all(
        18,
      ),

      decoration:
          BoxDecoration(

        color:
            Colors.white,

        borderRadius:
            BorderRadius.circular(
          22,
        ),
      ),

      child: Column(

        crossAxisAlignment:
            CrossAxisAlignment
                .start,

        children: [

          Row(

            children: [

              Text(

                title,

                style:
                    const TextStyle(

                  fontSize: 18,

                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const Spacer(),

              Container(

                padding:
                    const EdgeInsets
                        .symmetric(

                  horizontal: 14,
                  vertical: 6,
                ),

                decoration:
                    BoxDecoration(

                  color:
                      statusColor,

                  borderRadius:
                      BorderRadius
                          .circular(
                    20,
                  ),
                ),

                child: Text(

                  status,

                  style:
                      const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 10,
          ),

          Row(

            children: [

              const Icon(
                Icons.calendar_today,
                size: 16,
                color: Colors.grey,
              ),

              const SizedBox(
                width: 6,
              ),

              Text(

                date,

                style:
                    const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 18,
          ),

          Text(

            price,

            style:
                const TextStyle(

              color:
                  Color(0xFF06C167),

              fontSize: 24,

              fontWeight:
                  FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}