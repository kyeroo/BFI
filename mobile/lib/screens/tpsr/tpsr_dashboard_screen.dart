import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login_screen.dart';
import '../../services/auth_service.dart';

class TpsrDashboardScreen
    extends StatefulWidget {

  const TpsrDashboardScreen({
    super.key,
  });

  @override
  State<TpsrDashboardScreen>
      createState() =>
          _TpsrDashboardScreenState();
}

class _TpsrDashboardScreenState
    extends State<TpsrDashboardScreen> {

  String name = "User";
  String role = "";

  String selectedPlastic = "PE";

  @override
  void initState() {
    super.initState();

    loadUser();
  }

  Future<void> loadUser()
  async {

    final prefs =
        await SharedPreferences
            .getInstance();

    setState(() {

      name =
          prefs.getString("name") ??
          "User";

      role =
          prefs.getString("role") ??
          "TPSR";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),

          child: Column(
            children: [

              /// HEADER
              Row(
                children: [

                  const CircleAvatar(
                    radius: 26,

                    backgroundImage: AssetImage(
                      "assets/images/profile.jpg",
                    ),
                  ),

                  const SizedBox(width: 12),

                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      Text(
                        "Welcome $name",

                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 2),

                      Text(
                        role.toUpperCase(),

                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

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
                        color: Color(0xFF58C531),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              /// REALTIME CARD
              Container(
                padding:
                    const EdgeInsets.all(16),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(24),

                  border: Border.all(
                    color:
                        const Color(0xFF72D04D),
                  ),

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      color:
                          Colors.black12,
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    const Text(
                      "REAL-TIME MONITORING",
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 18),

                    Row(
                      children: [

                        Expanded(
                          child:
                              monitoringBox(
                            title:
                                "Reactor Temperature",
                            value: "26.6°C",
                          ),
                        ),

                        const SizedBox(
                          width: 14,
                        ),

                        Expanded(
                          child:
                              monitoringBox(
                            title:
                                "Waste Weight",
                            value: "70g",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              /// PROCESS CARD
              Container(
                padding:
                    const EdgeInsets.all(16),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(24),

                  border: Border.all(
                    color:
                        const Color(0xFF72D04D),
                  ),

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      color:
                          Colors.black12,
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    const Text(
                      "PROCESS CONFIGURATION",
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 18),

                    const Text(
                      "Plastik type",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [

                        Expanded(
                          child:
                              plasticButton(
                            "PE",
                          ),
                        ),

                        const SizedBox(
                          width: 10,
                        ),

                        Expanded(
                          child:
                              plasticButton(
                            "PP",
                          ),
                        ),

                        const SizedBox(
                          width: 10,
                        ),

                        Expanded(
                          child:
                              plasticButton(
                            "MIXED",
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Container(
                      padding:
                          const EdgeInsets.all(
                        14,
                      ),

                      decoration:
                          BoxDecoration(
                        borderRadius:
                            BorderRadius
                                .circular(
                          14,
                        ),

                        border: Border.all(
                          color:
                              Colors.black12,
                        ),
                      ),

                      child: Column(
                        children: [

                          processRow(
                            "Processing Time",
                            "60 Min",
                          ),

                          const SizedBox(
                            height: 8,
                          ),

                          processRow(
                            "Electricity Cost",
                            "\$0.29",
                          ),

                          const SizedBox(
                            height: 8,
                          ),

                          processRow(
                            "Fuel Oil Output",
                            "58 Ml",
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 56,

                      child: ElevatedButton(
                        style:
                            ElevatedButton
                                .styleFrom(
                          backgroundColor:
                              const Color(
                            0xFF58C531,
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

                        child: const Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .center,

                          children: [

                            Icon(
                              Icons.play_arrow,
                              color:
                                  Colors.white,
                            ),

                            SizedBox(
                              width: 8,
                            ),

                            Text(
                              "START PROCESS",
                              style: TextStyle(
                                color:
                                    Colors.white,
                                fontSize: 18,
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              /// STATUS BOX
              Container(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 16,
                ),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(20),

                  border: Border.all(
                    color:
                        const Color(0xFF72D04D),
                  ),

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      color:
                          Colors.black12,
                    ),
                  ],
                ),

                child: const Row(
                  children: [

                    CircleAvatar(
                      radius: 6,
                      backgroundColor:
                          Color(0xFF58C531),
                    ),

                    SizedBox(width: 10),

                    Text(
                      "Status : Idle",
                    ),

                    Spacer(),

                    Text(
                      "System Ready + Sensors Active",
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

  Widget monitoringBox({
    required String title,
    required String value,
  }) {

    return Container(
      height: 130,

      padding:
          const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(16),

        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black12,
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Text(
            title,
            style: const TextStyle(
              fontSize: 11,
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          const Spacer(),

          Center(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight:
                    FontWeight.bold,
                color:
                    Color(0xFF58C531),
              ),
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }

Widget plasticButton(String text) {
  final isSelected = selectedPlastic == text;

  return GestureDetector(
    onTap: () {
      setState(() {
        selectedPlastic = text;
      });
    },
    child: Container(
      height: 46,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF58C531) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black12,
          ),
        ],
        border: Border.all(
          color: isSelected
              ? const Color(0xFF58C531)
              : Colors.black12,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    ),
  );
}

  Widget processRow(
    String title,
    String value,
  ) {

    return Row(
      children: [

        const CircleAvatar(
          radius: 4,
          backgroundColor:
              Color(0xFF58C531),
        ),

        const SizedBox(width: 8),

        Text(title),

        const Spacer(),

        Text(value),
      ],
    );
  }
}