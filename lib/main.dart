import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'login_page.dart';
void main() {
  runApp(const MyApp());
}
class AppColors {
  static const primary = Color(0xFF1E3A8A); // deep blue
  static const secondary = Color(0xFF3B82F6); // lighter blue
  static const background = Color(0xFFF5F7FA);
  static const cardDark = Color(0xFF111827);
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
Widget drawerItem(IconData icon, String title) {
  return ListTile(
    leading: Icon(icon, color: Colors.grey),
    title: Text(
      title,
      style: TextStyle(color: AppColors.primary, fontSize: 16),
    ),
    trailing: Icon(Icons.arrow_forward_ios, size: 16),
    onTap: () {
      print("$title clicked");
    },
  );
}
class _HomePageState extends State<HomePage> {
  bool isBalanceVisible = false;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String date = DateFormat('dd MMM yyyy hh:mm:ss a').format(DateTime.now());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,

        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),

        title: Text("Accounts", style: TextStyle(color: Colors.black)),

        centerTitle: false,

        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: TextButton(
                onPressed: () {
                  print("Language clicked");
                },
                child: Text(
                  "አማ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),

          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {
              // notification action
            },
          ),

          IconButton(
            icon: Icon(Icons.refresh, color: Colors.black),
            onPressed: () {
              // refresh action
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              accountCard(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.6),
                          blurRadius: 6,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 6),

                ],
              ),

              SizedBox(height: 3),
              quickPayButton(),
              Text("Services"),
              servicesGrid(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: Icon(Icons.qr_code, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.primary,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: "Accounts"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Recents"),
        ],
      ),
      drawer: buildDrawer(),
    );
  }

  Widget accountCard() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.secondary,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*Image.asset(
              'assets/images/cbe.png',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),*/
              CircleAvatar( radius: 25,
                backgroundColor: Colors.white,
                child: Icon(Icons.account_balance,
                  color: AppColors.primary,
                ),
              ),
          SizedBox(width: 10),
          Text(
            "Commercial Bank of Ethiopia",
            style: TextStyle(
              color: Colors.amber,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]
          ),
          Text(
            "The Bank you can always Rely on!",
            style: TextStyle(
              color: Colors.amber.withOpacity(0.8),
              fontSize: 14,
            ),
          ),

          SizedBox(height: 10),

          Text(
            "FIKER MESFIN ERKYIHUN",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),

          SizedBox(height: 10),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isBalanceVisible ? "1,500,000 Birr" : "****** Birr",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),

              SizedBox(width: 10),

              IconButton(
                onPressed: () {
                  setState(() {
                    isBalanceVisible = !isBalanceVisible;
                  });
                },
                icon: Icon(
                  isBalanceVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          SizedBox(height: 10),

          Text(
            "Saving - 1******6628",
            style: TextStyle(color: Colors.amber),
          ),

          SizedBox(height: 10),


          Text(
            DateFormat('dd MMM yyyy hh:mm:ss a')
                .format(DateTime.now()),
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: AppColors.primary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),

                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.account_balance,
                          color: AppColors.primary,),
                    ),
                    SizedBox(width: 10),

                    Expanded(
                      child: Text(
                        "Commercial Bank of Ethiopia Mobile ...",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Row(
                  children: [
                    Icon(Icons.person, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Welcome !",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // MENU ITEMS
          Expanded(
            child: ListView(
              children: [

                drawerItem(Icons.lock, "Change PIN"),
                drawerItem(Icons.phonelink_off, "Unsubscribe"),
                drawerItem(Icons.chat, "M.B. FAQ"),
                drawerItem(Icons.settings, "Security Settings"),
                drawerItem(Icons.power_settings_new, "Lock Application"),

                Divider(),

                drawerItem(Icons.info, "About"),
                drawerItem(Icons.star, "Rate this app"),
                drawerItem(Icons.delete, "Log out Account"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
Widget quickPayButton() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: AppColors.primary,
        elevation: 8,
      ),
      onPressed: () {},
      child: Text("Quick Pay", style: TextStyle(fontSize: 18, color: Colors.white)),
    ),
  );
}
Widget servicesGrid() {
  List<Map<String, dynamic>> services = [
    {"icon": Icons.phone_android, "title": "Telecom Services"},
    {"icon": Icons.swap_horiz, "title": "Transfer"},
    {"icon": Icons.account_balance, "title": "Banking"},
    {"icon": Icons.build, "title": "Utility"},
    {"icon": Icons.settings, "title": "Government Services"},
    {"icon": Icons.directions_bus, "title": "Travel"},
    {"icon": Icons.payment, "title": "Pay for"},
    {"icon": Icons.video_file, "title": "Entertainment"},
    {"icon": Icons.local_gas_station, "title": "Utilities"},
    {"icon": Icons.money_rounded, "title": "Tax"},
  ];

  return GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.all(16),
    itemCount: services.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.2,
    ),
      itemBuilder: (context, index) {
        return TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 6,
          ),
          onPressed: () {
            print("${services[index]["title"]} clicked");
          },
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    services[index]["icon"],
                    color: AppColors.primary,
                    size: 30,
                  ),
                  SizedBox(height: 10),
                  Text(
                    services[index]["title"],
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        );
      }
  );
}
