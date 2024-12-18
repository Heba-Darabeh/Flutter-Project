import 'package:flutter/material.dart';
import 'package:flutter_project/dashboard_screen.dart';

class TransactionConfirmationMessage extends StatefulWidget {
  @override
  _confirmationMessageState createState() => _confirmationMessageState();
}

class _confirmationMessageState extends State<TransactionConfirmationMessage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _textOffsetAnimation;
  late Animation<double> _textFadeAnimation;

  @override
  void initState() {
    super.initState();

    // Animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0, // Start invisible
      end: 1.0, // End fully visible
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _textOffsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0.4), // Start slightly down
      end: Offset.zero, // Move to original position
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _textFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => DashboardScreen(),
        ),
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                  radius: 50,
                  backgroundColor: Color.fromRGBO(25, 121, 23, 1),
                  child: Icon(
                    Icons.check,
                    size: 40,
                    color: Colors.white,
                  )),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'تم الحفظ بنجاح',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              FadeTransition(
                opacity: _textFadeAnimation,
                child: SlideTransition(
                  position: _textOffsetAnimation,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'تم إرسال طلب التحويل بنجاح. سنقوم بإبلاغك بمجرد تحويل المبلغ إلى حسابك البنكي.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
