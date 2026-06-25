import 'package:flutter/material.dart';
import 'main.dart';
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          children: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  TextButton(
                    onPressed: () {
                      print("Reset clicked");
                    },
                    child: Text(
                      "Reset",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // RIGHT SIDE
                  Row(
                    children: [

                      TextButton(
                        onPressed: () {
                          print("Language clicked");
                        },
                        child: Text(
                          "አማ",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      SizedBox(width: 10),

                      IconButton(
                        icon: Icon(Icons.notifications, color: AppColors.primary),
                        onPressed: () {
                          print("Notification clicked");
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Icon(Icons.account_balance, size: 80, color: AppColors.primary),
            /*Image.asset(
              'assets/images/cbe.png',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),*/


            SizedBox(height: 20),

            Text(
              "Welcome !",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Commercial Bank of Ethiopia",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Good Morning",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.primary.withOpacity(0.7),
              ),
            ),

            SizedBox(height: 30),

            Center(
              child: SizedBox(
                width: 200, // 👈 control width here
                child: TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    hintText: "PIN",
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.primary, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.primary, width: 2),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 40),

            CircleAvatar(
              radius: 30,
              backgroundColor:AppColors.primary,
              child: IconButton(
                icon: Icon(Icons.arrow_forward, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ),

            Spacer(),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.verified_user, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Non-Financial Services",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 15),

            Text(
              "Copyright © Commercial Bank of Ethiopia",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 14,
              ),
            ),

            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}