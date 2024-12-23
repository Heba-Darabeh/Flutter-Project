import 'package:flutter/material.dart';
import 'withdrawal_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // balance information section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: const Icon(Icons.visibility_outlined, size: 30),
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Insight',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                chartBar(
                                  day: 'Sat',
                                  filledHeight: 30,
                                ),
                                chartBar(
                                  day: 'Sun',
                                  filledHeight: 50,
                                ),
                                chartBar(
                                  day: 'Mon',
                                  filledHeight: 90,
                                ),
                                chartBar(
                                  day: 'Tue',
                                  filledHeight: 70,
                                ),
                                chartBar(
                                  day: 'Wed',
                                  filledHeight: 70,
                                ),
                                chartBar(
                                  day: 'Thu',
                                  filledHeight: 80,
                                ),
                                chartBar(
                                  day: 'Fri',
                                  filledHeight: 80,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
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
                                        builder: (context) =>
                                            WithdrawalScreen()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromRGBO(76, 40, 116, 1),
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
            const SizedBox(
              height: 20,
            ),
            // financial transaction section
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'المعاملات المالية',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'مشاهدة الكل',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        BankTransactionOrder(
                            date: '05-12-2024',
                            time: '02:53',
                            amount: '870.00'),
                        BankTransactionOrder(
                            date: '02-12-2024',
                            time: '15:11',
                            amount: '210.00'),
                        BankTransactionOrder(
                            date: '27-11-2024', time: '09.37', amount: '33.00'),
                        BankTransactionOrder(
                          date: '26-11-2024',
                          time: '09:18',
                          amount: '290.00',
                          isActive: true,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            // products section
            Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'منتجات اخرى',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'مشاهدة الكل',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 250,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        Product(
                          label: 'عرض خاص للعمل مع اوبر',
                        ),
                        Product(label: 'تاجير مركبة'),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),

      // bottom navigation bar
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
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

class BankTransactionOrder extends StatelessWidget {
  final String date;
  final String time;
  final String amount;
  final bool isActive;

  const BankTransactionOrder({
    super.key,
    required this.date,
    required this.time,
    required this.amount,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.currency_exchange,
            size: 25,
            color: isActive ? Colors.black : Color.fromRGBO(125, 125, 125, 1),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'طلب حوالة بنكية',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isActive ? Colors.black : Colors.grey),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                'تم ارسال الطلب في $date الساعة $time',
                style: TextStyle(
                    fontSize: 12,
                    color: isActive
                        ? Color.fromRGBO(158, 158, 158, 1)
                        : Color.fromRGBO(158, 158, 158, 0.7)),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '- $amount ر.س.',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isActive
                      ? Colors.black
                      : Color.fromRGBO(125, 125, 125, 1),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              if (isActive)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 224, 224, 224),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'قيد التنفيذ',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}

class Product extends StatelessWidget {
  final String label;

  const Product({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 247, 244, 236),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.network(
            'https://via.placeholder.com/150',
            height: 160,
            width: 200,
          ),
          // Image.asset(
          //   imagePath,
          //   height: 80,
          // )
        ],
      ),
    );
  }
}

Widget chartBar({
  required String day,
  required double filledHeight,
}) {
  return Column(
    children: [
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 120,
            width: 30,
            color: Colors.grey.shade200,
          ),
          Container(
            height: filledHeight,
            width: 30,
            color: const Color.fromRGBO(76, 40, 116, 1),
          ),
        ],
      ),
      const SizedBox(height: 5),
      Text(day),
    ],
  );
}
