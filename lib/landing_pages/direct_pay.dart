import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            buildPage(
              "Direct Pay", 
               Container(
                 padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 202, 218, 205), 
                    shape: BoxShape.circle,
                  ),
                    child: Image.asset(
                      'assets/images/direct_pay_updated.png', 
                       height: 80
                    ),
              ),
              "Pay with crypto across Africa effortlessly.",
              style: GoogleFonts.robotoCondensed(
                  color: Colors.grey[700],
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
              ),
            ),
            buildPage(
              "Pay Bills", 
               Container(
                 padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 202, 218, 205), 
                    shape: BoxShape.circle,
                  ),
                child: Image.asset(
                  'assets/images/pay_bills_color_updated.png', 
                  height: 80
                ),
              ),
              "Pay for utility servicesand earn rewards.",
              style: GoogleFonts.robotoCondensed(
                  color: Colors.grey[700],
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
              ),
            ),
            buildPage(
              "Accept Payments", 
              Container(
                 padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 202, 218, 205), 
                    shape: BoxShape.circle,
                 ),
                child: Image.asset(
                  'assets/images/accept_payments.png', 
                  height: 80
                ),
              ),
              "Accept stable coin payments hassle-free.",
              style: GoogleFonts.robotoCondensed(
                  color: Colors.grey[700],
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
              ),
            ),
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
              child: Text(
                "Skip", 
                style: GoogleFonts.robotoCondensed(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
              ),
              ),
            ),
          ),

           // Bottom controls
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Container(
               margin: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: WormEffect(
                      dotHeight: 10, 
                      dotWidth: 10,
                      dotColor: const Color.fromARGB(255, 147, 179, 148),      
                      activeDotColor: Color.fromARGB(255, 23, 100, 98),  
                    ),
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
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(
                              double.infinity, 50
                            ),
                            backgroundColor: Color.fromARGB(255, 23, 100, 98),
                            foregroundColor: const Color.fromARGB(255, 208, 205, 205),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8), 
                            ),
                        ),
                    child: Text(isLastPage ? "Get Started" : "Next"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildPage(String title,Widget image, String description, {required TextStyle style}) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        image,
        const SizedBox(height: 30),
        Text(
          title,
          style: GoogleFonts.robotoCondensed(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          description,
          style: style,
          textAlign: TextAlign.center,
        ),
      ],
      ),
    );
  }

}