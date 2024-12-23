import 'package:flutter/material.dart';
import 'package:flutter_project/dashboard_screen.dart';
import 'package:flutter_project/withdrawal_screen.dart';
import 'package:flutter_project/TransactionConfirmationMessage.dart';

class ConfirmationScreen extends StatelessWidget {
  final double? amount;
  final double? finalAmount;

  const ConfirmationScreen(
      {super.key, required this.amount, required this.finalAmount});

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: SizedBox(
              height: 450,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor:
                            const Color.fromRGBO(221, 221, 221, 0.412),
                        child: IconButton(
                          onPressed: () => {Navigator.pop(context)},
                          icon: const Icon(
                            Icons.close,
                            color: Colors.black,
                            weight: 600,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Color.fromRGBO(221, 221, 221, 0.412),
                    child: Text(
                      'i',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Are You Sure You Want to Cancel ?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'By canceling this transaction, the amount will not be credited to your balance. Do you wish to proceed?',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashboardScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[400],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          'Yes, I Want to CANCEL This Transaction',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashboardScreen()))
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: const Text(
                        'Go Back',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            Container(
              padding: const EdgeInsets.only(right: 20),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: const Color.fromRGBO(221, 221, 221, 0.412),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WithdrawalScreen()),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10, 30, 20, 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          'تأكيد السحب',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Text(
                          'أنت على وشك تحويل أموال من حسابك في ثرايف',
                          style: TextStyle(
                              color: Color.fromRGBO(99, 99, 99, 1),
                              fontSize: 18),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TransactionAmountCard(
                        label: 'المبلغ الذي تريد تحويله',
                        amount: amount!.toStringAsFixed(2)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TimeLineRow(
                            icon: Icons.wallet,
                            text: 'سيتم خصم رسوم بقيمة 5 ر.س.'),
                        const TimeLineRow(
                            icon: Icons.watch_later_outlined,
                            text: 'قد تستغرق عملية التحويل ما بين 12 و24 ساعة'),
                        const TimeLineRow(
                            icon: Icons.account_balance_outlined,
                            text: 'سيتم تحويل المبلغ إلى حسابك في Al Rajhi \n'
                                ' SA03800000000000027010'),
                        Padding(
                          padding: const EdgeInsets.only(right: 43),
                          child: Container(
                            height: 70,
                            width: 2,
                            color: const Color.fromRGBO(136, 136, 136, 0.2),
                          ),
                        ),
                      ],
                    ),
                    TransactionAmountCard(
                        label: 'المبلغ الذي سيتم استلامه',
                        amount: finalAmount!.toStringAsFixed(2)),
                    const SizedBox(
                      height: 70,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Color.fromRGBO(119, 119, 119, 1),
                          size: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text(
                            'الطلب قيد التحقيق',
                            style: TextStyle(
                                color: Color.fromRGBO(119, 119, 119, 1),
                                fontSize: 14),
                          ),
                        )
                      ],
                    ),
                    const Divider(),
                    TextButton(
                        onPressed: () => showBottomSheet(context),
                        child: const Text(
                          'Cancel this transaction',
                          style: TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity, // Full-width button
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TransactionConfirmationMessage()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(89, 25, 101, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: const Text(
                              'تأكيد',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class TransactionAmountCard extends StatelessWidget {
  final String label;
  final String amount;

  const TransactionAmountCard(
      {super.key, required this.label, required this.amount});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
            width: 1, color: const Color.fromRGBO(136, 136, 136, 0.2)),
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      margin: EdgeInsets.only(top: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 16, color: Color.fromRGBO(119, 119, 119, 1))),
          const SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 18),
                child: ClipOval(
                  child: Image.asset(
                    'icons/flags/png/sa.png',
                    package: 'country_icons',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Text('ر.س.',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromRGBO(119, 119, 119, 1))),
              const SizedBox(
                width: 30,
              ),
              Text(amount as String,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

class TimeLineRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const TimeLineRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 40,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            children: [
              Container(
                height: 70,
                width: 2,
                color: const Color.fromRGBO(136, 136, 136, 0.2),
              ),
              Container(
                height: 10,
                width: 10,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(136, 136, 136, 0.348),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 16,
          ),
          Row(
            children: [
              Icon(
                icon,
                color: const Color.fromARGB(168, 119, 119, 119),
                size: 30,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: const TextStyle(
                  color: Color.fromRGBO(119, 119, 119, 1),
                  fontSize: 16,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
