import 'package:flutter/material.dart';
import 'withdrawal_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        // app navigation bar
        title: Row(
          children: [
            //left section
            IconButton(
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                // handel notifications on press
              },
            ),
            const SizedBox(
              width: 30,
            ),
            // middle section
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.blue,
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_sharp,
                      size: 16,
                    ),
                    Expanded(
                        child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        'الهوية الوطنية علي وشك الانتهاء',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.edit_document)
                  ],
                ),
              ),
            ),
            // right section
            const SizedBox(
              width: 12,
            ),
            const CircleAvatar(
              radius: 20,
              child: Icon(
                Icons.person,
                size: 30,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(30.0),

        // balance information section
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: const Icon(Icons.visibility_outlined, size: 30),
            ),
            Expanded(
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                const Text(
                  'الرصيد المتاح',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.right, // Align text right
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.pie_chart, // Balance icon
                      size: 24,
                      color: Colors.black,
                    ),
                    SizedBox(width: 8),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        '870.00 ر.س.',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // withdrawal logic
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WithdrawalScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(76, 40, 116, 1),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.arrow_upward,
                              size: 16,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              'سحب',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      OutlinedButton(
                          onPressed: () {
                            // Deposit logic here
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                color: Color.fromRGBO(76, 40, 116, 1)),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.arrow_downward,
                                size: 16,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text('إيداع'),
                            ],
                          ))
                    ],
                  ),
                ),
              ]),
            )
          ],
        ),
      )),

      // bottom navigation bar
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: BottomNavigationBar(
            showUnselectedLabels: true,
            unselectedItemColor: const Color.fromARGB(255, 187, 187, 187),
            selectedItemColor: Color.fromRGBO(76, 40, 116, 1),
            iconSize: 30,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'الرئيسية'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined), label: 'منتجاتي'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.receipt), label: 'الفواتير'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.payment_outlined), label: 'my cards'),
            ]),
      ),
    );
  }
}
