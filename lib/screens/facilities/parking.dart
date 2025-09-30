import 'package:flutter/material.dart';
import 'package:onboardx_tnb_app_main/screens/facilities/car_parking_screen.dart';
import 'motor_parking_screen.dart';

class ParkingPage extends StatefulWidget {
  const ParkingPage({super.key});

  @override
  State<ParkingPage> createState() => _ParkingPageState();
}

class _ParkingPageState extends State<ParkingPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Parking Page',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: Center(
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(224, 124, 124, 1),
                borderRadius: BorderRadius.circular(6),
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 16,
              ),
            ),
          ),
        ),
        // Removed TabBar from AppBar
      ),

      // New Body structure
      body: Column(
        children: [
          // Image + Benefits Overview (Inserted Here)
          Stack(
            children: [
              // Background image
              Image.asset(
                'assets/images/parking2.png', // replace with your image asset
                width: double.infinity,
                height: 280,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: const Color.fromARGB(54, 255, 255, 255).withOpacity(0.8),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Benefits Overview',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'A benefits overview is the support provided by a company '
                        'to its employees, outlined according to the organization’s '
                        'terms and conditions.',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // TabBar (Moved from AppBar's bottom)
          TabBar(
            controller: _tabController,
            indicatorColor: const Color.fromRGBO(224, 124, 124, 1),
            labelColor: const Color.fromRGBO(224, 124, 124, 1),
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            tabs: const [
              Tab(text: 'Car'),
              Tab(text: 'Motorcycle'),
            ],
          ),

          // TabBarView wrapped in Expanded so it fills the rest of the screen
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                CarParkingScreen(),
                MotorParkingScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}