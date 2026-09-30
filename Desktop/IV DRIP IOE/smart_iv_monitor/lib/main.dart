import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const SmartIVMonitorApp());
}

class SmartIVMonitorApp extends StatelessWidget {
  const SmartIVMonitorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart IV Monitor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F8FC),
        fontFamily: 'Roboto',
      ),
      home: const LoginScreen(),
    );
  }
}

// ============================================================
// LOGIN SCREEN
// ============================================================

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MainNavigation()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 30),

                // Logo
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(
                    Icons.water_drop,
                    color: Colors.white,
                    size: 50,
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  'Smart IV',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),

                const Text(
                  'Monitoring System',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),

                const SizedBox(height: 45),

                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Demo account: nurse@hospital.com',
                  style: TextStyle(color: Colors.grey),
                ),

                const Text(
                  'Password: 123456',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// MAIN NAVIGATION
// ============================================================

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    DashboardScreen(),
    MonitoringScreen(),
    AlertsScreen(),
    HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.water_drop_outlined),
            selectedIcon: Icon(Icons.water_drop),
            label: 'Monitor',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_outlined),
            selectedIcon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: 'History',
          ),
        ],
      ),
    );
  }
}

// ============================================================
// DASHBOARD
// ============================================================

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Good Morning,',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Nurse',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // System status
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.wifi, color: Colors.white, size: 35),
                  const SizedBox(width: 15),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'System Online',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'ESP32 connection ready',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: Colors.greenAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Overview',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: overviewCard(
                    '4',
                    'Active Beds',
                    Icons.bed,
                    Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: overviewCard(
                    '3',
                    'Normal',
                    Icons.check_circle,
                    Colors.green,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: overviewCard(
                    '1',
                    'Warning',
                    Icons.warning,
                    Colors.orange,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            const Text(
              'Attention Required',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            patientCard(
              context,
              bed: 'Bed 102',
              patient: 'Demo Patient',
              percentage: 18,
              remaining: '90 mL',
              timeLeft: '2h 08m',
              warning: true,
            ),

            const SizedBox(height: 15),

            const Text(
              'All Patients',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            patientCard(
              context,
              bed: 'Bed 101',
              patient: 'Patient A',
              percentage: 72,
              remaining: '360 mL',
              timeLeft: '5h 40m',
              warning: false,
            ),

            patientCard(
              context,
              bed: 'Bed 103',
              patient: 'Patient B',
              percentage: 64,
              remaining: '320 mL',
              timeLeft: '4h 55m',
              warning: false,
            ),

            patientCard(
              context,
              bed: 'Bed 104',
              patient: 'Patient C',
              percentage: 55,
              remaining: '275 mL',
              timeLeft: '4h 10m',
              warning: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget overviewCard(String value, String title, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget patientCard(
    BuildContext context, {
    required String bed,
    required String patient,
    required int percentage,
    required String remaining,
    required String timeLeft,
    required bool warning,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PatientDetailsScreen(
              bed: bed,
              patient: patient,
              percentage: percentage,
              remaining: remaining,
              timeLeft: timeLeft,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: warning ? Border.all(color: Colors.orange, width: 1.5) : null,
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: warning
                    ? Colors.orange.withValues(alpha: 0.12)
                    : Colors.green.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                warning ? Icons.warning_amber_rounded : Icons.check_circle,
                color: warning ? Colors.orange : Colors.green,
                size: 30,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bed,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(patient, style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 6),
                  Text(
                    '$remaining • $timeLeft remaining',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),

            Text(
              '$percentage%',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: warning ? Colors.orange : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// PATIENT DETAILS
// ============================================================

class PatientDetailsScreen extends StatelessWidget {
  final String bed;
  final String patient;
  final int percentage;
  final String remaining;
  final String timeLeft;

  const PatientDetailsScreen({
    super.key,
    required this.bed,
    required this.patient,
    required this.percentage,
    required this.remaining,
    required this.timeLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Patient Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 42,
                    backgroundColor: Colors.blue.withValues(alpha: 0.1),
                    child: const Icon(
                      Icons.person,
                      size: 45,
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    patient,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    bed,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),

                  const Divider(height: 35),

                  infoRow('Patient ID', 'P-${bed.substring(4)}'),
                  infoRow('IV Fluid', 'Normal Saline'),
                  infoRow('Initial Volume', '500 mL'),
                  infoRow('Current Volume', remaining),
                  infoRow('Status', percentage <= 20 ? 'LOW' : 'NORMAL'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const MonitoringScreen()),
                  );
                },
                icon: const Icon(Icons.water_drop),
                label: const Text(
                  'OPEN LIVE MONITOR',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// ============================================================
// LIVE MONITORING
// ============================================================

class MonitoringScreen extends StatefulWidget {
  const MonitoringScreen({super.key});

  @override
  State<MonitoringScreen> createState() => _MonitoringScreenState();
}

class _MonitoringScreenState extends State<MonitoringScreen> {
  double currentVolume = 90;
  double currentWeight = 120;
  double consumptionRate = 42;

  Timer? timer;

  @override
  void initState() {
    super.initState();

    // Simulated ESP32 sensor updates
    timer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (mounted) {
        setState(() {
          if (currentVolume > 50) {
            currentVolume -= 1;
            currentWeight -= 1;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double percentage = (currentVolume / 500) * 100;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Live Monitoring',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const Text(
              'Real-time IV bottle monitoring',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 25),

            // Patient
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Demo Patient',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        'Bed 102 • Normal Saline',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // IV level
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  const Text(
                    'IV LEVEL',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 190,
                        height: 190,
                        child: CircularProgressIndicator(
                          value: percentage / 100,
                          strokeWidth: 18,
                          backgroundColor: Colors.grey.shade200,
                          color: percentage <= 20 ? Colors.orange : Colors.blue,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            '${percentage.toStringAsFixed(0)}%',
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: percentage <= 20
                                  ? Colors.orange
                                  : Colors.blue,
                            ),
                          ),
                          const Text(
                            'Remaining',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Text(
                    '${currentVolume.toStringAsFixed(0)} mL',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    percentage <= 20
                        ? 'LOW LEVEL - REPLACEMENT REQUIRED'
                        : 'NORMAL LEVEL',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: percentage <= 20 ? Colors.orange : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: metricCard(
                    'Weight',
                    '${currentWeight.toStringAsFixed(0)} g',
                    Icons.monitor_weight,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: metricCard(
                    'Rate',
                    '$consumptionRate mL/h',
                    Icons.speed,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(child: metricCard('Time Left', '2h 08m', Icons.timer)),
                const SizedBox(width: 12),
                Expanded(
                  child: metricCard('Battery', '87%', Icons.battery_full),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: percentage <= 20
                    ? Colors.orange.withValues(alpha: 0.12)
                    : Colors.green.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Icon(
                    percentage <= 20 ? Icons.warning : Icons.check_circle,
                    color: percentage <= 20 ? Colors.orange : Colors.green,
                    size: 30,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      percentage <= 20
                          ? 'IV level is below the warning threshold.'
                          : 'IV level is currently normal.',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget metricCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.blue, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          Text(title, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

// ============================================================
// ALERTS
// ============================================================

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Alerts',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const Text(
              'Recent system notifications',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 25),

            alertCard(
              title: 'IV Level Critical',
              description: 'Bed 102 fluid level is below 20%.',
              time: '14:32 PM',
              icon: Icons.warning,
              color: Colors.red,
            ),

            alertCard(
              title: 'IV Level Warning',
              description: 'Bed 104 is approaching low level.',
              time: '13:48 PM',
              icon: Icons.warning_amber,
              color: Colors.orange,
            ),

            alertCard(
              title: 'IV Bottle Replaced',
              description: 'Bed 101 monitoring resumed.',
              time: '12:20 PM',
              icon: Icons.check_circle,
              color: Colors.green,
            ),

            alertCard(
              title: 'System Online',
              description: 'ESP32 device connected successfully.',
              time: '11:55 AM',
              icon: Icons.wifi,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  Widget alertCard({
    required String title,
    required String description,
    required String time,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: color),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
                const SizedBox(height: 5),
                Text(
                  time,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// HISTORY
// ============================================================

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'IV History',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const Text(
              'Fluid consumption over time',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 25),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bed 102',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'Fluid remaining',
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    height: 260,
                    child: LineChart(
                      LineChartData(
                        minY: 0,
                        maxY: 550,
                        gridData: const FlGridData(show: true),
                        titlesData: const FlTitlesData(
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        borderData: FlBorderData(show: false),
                        lineBarsData: [
                          LineChartBarData(
                            spots: const [
                              FlSpot(0, 500),
                              FlSpot(1, 450),
                              FlSpot(2, 405),
                              FlSpot(3, 360),
                              FlSpot(4, 310),
                              FlSpot(5, 260),
                              FlSpot(6, 220),
                              FlSpot(7, 180),
                              FlSpot(8, 90),
                            ],
                            isCurved: true,
                            barWidth: 4,
                            dotData: const FlDotData(show: true),
                            belowBarData: BarAreaData(show: true),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Today's Readings",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            historyRow('08:00 AM', '500 mL'),
            historyRow('09:00 AM', '450 mL'),
            historyRow('10:00 AM', '405 mL'),
            historyRow('11:00 AM', '360 mL'),
            historyRow('12:00 PM', '310 mL'),
            historyRow('01:00 PM', '260 mL'),
            historyRow('02:00 PM', '180 mL'),
            historyRow('02:30 PM', '90 mL'),
          ],
        ),
      ),
    );
  }

  Widget historyRow(String time, String volume) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(time, style: const TextStyle(color: Colors.grey)),
          Text(volume, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
