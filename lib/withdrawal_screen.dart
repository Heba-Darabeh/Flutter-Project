import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/confirmation_screen.dart';
import 'package:flutter_project/dashboard_screen.dart';
import 'package:country_icons/country_icons.dart';

class WithdrawalScreen extends StatefulWidget {
  @override
  _InputAmountState createState() => _InputAmountState();
}

class _InputAmountState extends State<WithdrawalScreen> {
  final TextEditingController _inputAmountController = TextEditingController();
  bool isButtonEnabled = false;
  bool isFirstTextEnabled = true;
  bool isSecondTextEnabled = false;

  void _checkInput() {
    final input = _inputAmountController.text.trim();
    double? amount = double.tryParse(input);
    setState(() {
      isButtonEnabled = amount != null;
      isFirstTextEnabled = !isButtonEnabled;
      isSecondTextEnabled = isButtonEnabled;
    });
  }

  void _updateInputField(String amount) {
    setState(() {
      _inputAmountController.text = amount;
    });
  }

  @override
  void initState() {
    super.initState();
    _inputAmountController.addListener(_checkInput);
  }

  @override
  void dispose() {
    _inputAmountController.dispose(); // Clean up the controller
    super.dispose();
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
                          builder: (context) => const DashboardScreen()),
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
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text(
                            'أدخل المبلغ الذي تريد سحبه',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'icons/flags/png/sa.png',
                              package: 'country_icons',
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            'ر.س.', // Saudi Riyal symbol
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(119, 119, 119, 1)),
                          ),

                          //input field
                          SizedBox(
                              width: 100,
                              height: 40,
                              child: TextField(
                                controller: _inputAmountController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d*\.?\d*')),
                                ],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: "0.00", // Placeholder
                                  hintStyle: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.withOpacity(0.5)),
                                  border: InputBorder.none,
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Stack(
                        children: [
                          if (isFirstTextEnabled)
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'المبلغ المتاح في رصيدك هو 870.00 ر.س.',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(119, 119, 119, 1)),
                              ),
                            ),
                          if (isSecondTextEnabled)
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'سيتم خصم رسوم بقيمة 5.00 ر.س.',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(119, 119, 119, 1)),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SuggestedAmountButton(
                                amount: '80',
                                onTap: () => _updateInputField('80')),
                            SuggestedAmountButton(
                                amount: '210',
                                onTap: () => _updateInputField('210')),
                            SuggestedAmountButton(
                                amount: '430',
                                onTap: () => _updateInputField('430')),
                            SuggestedAmountButton(
                                amount: '870',
                                onTap: () => _updateInputField('870')),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Row(
                        children: [
                          Text(
                            'طريقة الدفع',
                            style: TextStyle(
                                color: Color.fromRGBO(119, 119, 119, 1),
                                fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const PaymentMethodCard(
                          bankName: 'Al Rajhi',
                          bankNumber: 'SA03800000000000027010'),
                      const SizedBox(
                        height: 225,
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Color.fromRGBO(119, 119, 119, 1),
                            size: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 6),
                            child: Text(
                              'قد تستغرق الحوالات البنكية من 12-24 ساعة حتي تكتمل',
                              style: TextStyle(
                                  color: Color.fromRGBO(119, 119, 119, 1),
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity, // Full-width button
                          height: 50,
                          child: ElevatedButton(
                              onPressed: isButtonEnabled
                                  ? () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ConfirmationScreen()),
                                      );
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isButtonEnabled
                                    ? Color.fromRGBO(89, 25, 101, 1)
                                    : Colors.grey[300],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: const Text(
                                'متابعة',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                      )
                    ]),
              ),
            ),
          ],
        ));
  }
}

class SuggestedAmountButton extends StatelessWidget {
  final String amount;
  final VoidCallback onTap;

  const SuggestedAmountButton(
      {super.key, required this.amount, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 4.0),
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(221, 221, 221, 0.412), // Background color
          borderRadius: BorderRadius.circular(40), // Rounded corners
        ),
        child: Text(
          '$amount ر.س.',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class PaymentMethodCard extends StatelessWidget {
  final String bankName;
  final String bankNumber;

  const PaymentMethodCard(
      {super.key, required this.bankName, required this.bankNumber});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromRGBO(158, 158, 158, 0.2),
            width: 1.0,
          ),
          bottom: BorderSide(
            color: Color.fromRGBO(158, 158, 158, 0.2),
            width: 1.0,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15),
      margin: EdgeInsets.only(left: 12, right: 12),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color.fromRGBO(221, 221, 221, 0.412),
            radius: 25,
            child: Icon(
              Icons.account_balance,
              color: Colors.grey,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bankName,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                bankNumber,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              )
            ],
          ),
          const SizedBox(
            width: 110,
          ),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
