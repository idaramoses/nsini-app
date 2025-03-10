import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharkhub/utils/themes.dart';
import 'package:sharkhub/view/Home/bottom.dart';
import 'package:sharkhub/view/home/home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PaymentPage extends StatefulWidget {
  final String userId;

  PaymentPage({required this.userId});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String publicKey = 'pk_test_6b7d6dd8c00014d18fb45437d92cfca2b0069980';
  final plugin = PaystackPlugin();
  final _emailController = TextEditingController();
  String _selectedCurrency = 'USD'; // Default currency
  bool _isProcessing = false;
  String? _userId;
  final List<String> _currencies = ['USD', 'NGN']; // Add other currencies as needed

  @override
  void initState() {
    super.initState();

    // print("App start from background----------------------");
    plugin.initialize(publicKey: publicKey);
  }

  PaymentCard _getCardFromUI() {
    // Using just the must-required parameters.
    return PaymentCard(
      number: '4084084084084081',
      cvc: '408',
      expiryMonth: 1,
      expiryYear: 25,
    );
  }

  int getAmountInLowestUnit(int amountInMajorUnit) {
    switch (_selectedCurrency) {
      case 'USD':
        return amountInMajorUnit * 100; // Convert USD amount to cents
      case 'NGN':
        return amountInMajorUnit * 100000; // Convert NGN amount to kobo (lowest unit)
    // Add more cases for other currencies as needed
      default:
        return amountInMajorUnit; // Default case (assuming major unit is already in lowest unit)
    }
  }

  void startPayment() async {
    Charge charge = Charge();
    charge.card = _getCardFromUI();
    charge
      ..amount = getAmountInLowestUnit(5)
      ..email = _emailController.text // Use the inputted email
      ..reference = DateTime.now().millisecondsSinceEpoch.toString()
      ..currency = _selectedCurrency; //  as the currency

    CheckoutResponse response = await plugin.checkout(
      context,
      method: CheckoutMethod.card,
      fullscreen: false,
      charge: charge,
    );

    if (response.status == true) {
      await savePaymentData(widget.userId, response.reference!);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('hasPaid', 'true');
      Get.snackbar(
        'Payment successful',
        'Your payment was successful',
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      );
      Get.off(BottomBarScreen(),transition: Transition.rightToLeft);
    }
    else
    {
      print('Payment Failed');
    }
  }

  Future<void> savePaymentData(String userId, String reference) async {
    final response = await Supabase.instance.client.from('transactions').upsert({
      'user_id': userId,
      'email': _emailController.text,
      'transactions_id': reference,
      'amount': getAmountInLowestUnit(5),
      'currency': _selectedCurrency,
      'status': 'successful'
    }).execute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Themes.getPrimaryColor(context),
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child:  Image.asset(
              "assets/images/arrow-narrow-left (1).png",
              scale: 3,
              color: Colors.white
          ),),
        title: Text("Payment".toUpperCase(),style: GoogleFonts.notoSans(fontSize: 17, color:Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                "assets/images/payment.png",
                height: 300,
              ),
              SizedBox(height: 20),
              Text(
                'To complete your payment, please provide your email and select a currency.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 30),
              Card(
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(height: 16),
              Card(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                      value: _selectedCurrency,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCurrency = newValue!;
                        });
                      },
                      items: _currencies.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              _isProcessing
                  ? CircularProgressIndicator()
                  :  Column(
                    children: [
                      Card(
                        color:  Themes.getPrimaryColor(context),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            startPayment();
                          },
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                // Center(
                                //     child: Icon(
                                //       Icons.send,
                                //       color: Colors.white,
                                //     )),
                                // SizedBox(
                                //   width: MediaQuery.of(context).size.width * 0.03,
                                // ),
                                Center(
                                    child: Text(
                                      "Make Payment",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.notoSans(
                                        color: Colors.white,),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
