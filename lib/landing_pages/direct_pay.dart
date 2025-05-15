import 'package:flutter/material.dart';
import 'package:pretium_app/screens/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class DirectPay extends StatefulWidget {
    const DirectPay({super.key});

  @override
   State<DirectPay> createState() => _DirectPayState();
}

class _DirectPayState extends State<DirectPay> {
   final PageController _controller = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
         children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            buildPage("DirectPay", "Send and receive money instantly with DirectPay."),
            buildPage("PayBills", "Easily pay utility bills, internet, and more."),
            buildPage("AcceptPayments", "Accept secure payments from your customers."),
          ],
        ),
        // Skip Button
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: Text("Skip", style: TextStyle(fontSize: 16)),
            ),
          ),

           // Bottom controls
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: WormEffect(dotHeight: 10, dotWidth: 10),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (isLastPage) {
                     Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
                    } else {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
                  child: Text(isLastPage ? "Get Started" : "Next"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget buildPage(String title, String description) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text(description, textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
        ],  
      //   children: [
      //   Icon(icon, size: 100),
      //   SizedBox(height: 20),
      //   Text(title, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
      //   SizedBox(height: 12),
      //   Text(subtitle, textAlign: TextAlign.center),
      // ],    
      ),
    );
  }

}