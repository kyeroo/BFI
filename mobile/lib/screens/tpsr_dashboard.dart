import 'package:flutter/material.dart';

import '../services/tpsr_service.dart';

class TpsrDashboard
    extends StatefulWidget {

  const TpsrDashboard({
    super.key,
  });

  @override
  State<TpsrDashboard> createState() =>
      _TpsrDashboardState();
}

class _TpsrDashboardState
    extends State<TpsrDashboard> {

  List composterData = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    getData();
  }

  Future<void> getData() async {

    try {

      final result =
          await TpsrService
              .getComposter();

      setState(() {

        composterData = result;

        isLoading = false;
      });

    } catch (e) {

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xFFF5F5F5),

      appBar: AppBar(
        title: const Text(
          "TPSR Dashboard",
        ),

        backgroundColor:
            const Color(0xFF58C531),
      ),

      body: isLoading

          ? const Center(
              child:
                  CircularProgressIndicator(),
            )

          : composterData.isEmpty

              ? const Center(
                  child: Text(
                    "No Data",
                  ),
                )

              : Padding(
                  padding:
                      const EdgeInsets.all(
                    20,
                  ),

                  child: Column(
                    children: [

                      dashboardCard(
                        title: "Temperature",
                        value:
                            "${composterData[0]["temperature"]} °C",
                        icon: Icons.thermostat,
                      ),

                      const SizedBox(
                        height: 16,
                      ),

                      dashboardCard(
                        title: "Humidity",
                        value:
                            "${composterData[0]["humidity"]} %",
                        icon:
                            Icons.water_drop,
                      ),

                      const SizedBox(
                        height: 16,
                      ),

                      dashboardCard(
                        title: "Weight",
                        value:
                            "${composterData[0]["weight"]} KG",
                        icon:
                            Icons.scale,
                      ),

                      const SizedBox(
                        height: 16,
                      ),

                      dashboardCard(
                        title:
                            "Estimated Compost",
                        value:
                            "${composterData[0]["estimatedCompost"]} KG",
                        icon:
                            Icons.eco,
                      ),

                      const SizedBox(
                        height: 16,
                      ),

                      dashboardCard(
                        title:
                            "Estimated Duration",
                        value:
                            "${composterData[0]["estimatedDuration"]} Minutes",
                        icon:
                            Icons.timer,
                      ),
                    ],
                  ),
                ),
    );
  }

  Widget dashboardCard({
    required String title,
    required String value,
    required IconData icon,
  }) {

    return Container(

      width: double.infinity,

      padding:
          const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(20),

        boxShadow: [

          BoxShadow(
            blurRadius: 10,
            color: Colors.black12,
          ),
        ],
      ),

      child: Row(
        children: [

          CircleAvatar(
            radius: 28,

            backgroundColor:
                const Color(0xFF58C531),

            child: Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
          ),

          const SizedBox(width: 16),

          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Text(
                title,

                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                value,

                style: const TextStyle(
                  fontSize: 22,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}