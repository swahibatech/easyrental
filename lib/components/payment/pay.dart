import 'dart:io';

import 'package:easyrental/components/payment/payment_config.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class MyPay extends StatefulWidget {
  const MyPay({super.key});

  @override
  State<MyPay> createState() => _MyPayState();
}

class _MyPayState extends State<MyPay> {
  String os = Platform.operatingSystem;

  //apple pay 
var applePayButton = ApplePayButton(
    paymentConfiguration: PaymentConfiguration.fromJsonString(defaultGooglePay), 
    paymentItems: const[
      PaymentItem(
        label: 'Rent',
        amount: '4500',
        status: PaymentItemStatus.final_price,
        )
    ],
    width:  double.infinity,
    type: ApplePayButtonType.checkout,
    margin: const EdgeInsets.only(top: 15.0),
    onPaymentResult: (result) => debugPrint('Payment Result $result'),
    loadingIndicator: const Center(child: CircularProgressIndicator(),),
     );
  // google PAy
  var googlePayButton = GooglePayButton(
    paymentConfiguration: PaymentConfiguration.fromJsonString(defaultGooglePay), 
    paymentItems: const[
      PaymentItem(
        label: 'Rent',
        amount: '4500',
        status: PaymentItemStatus.final_price,
        ),

        PaymentItem(
        label: 'Water',
        amount: '150',
        status: PaymentItemStatus.final_price,
        ),
        PaymentItem(
        label: 'Electricity',
        amount: '300',
        status: PaymentItemStatus.final_price,
        )
    ],
    width:  double.infinity,
    type: GooglePayButtonType.pay,
    margin: const EdgeInsets.only(top: 15.0),
    onPaymentResult: (result) => debugPrint('Payment Result $result'),
    loadingIndicator: const Center(child: CircularProgressIndicator(),),
     );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(10),
      child: Center(child: Platform.isAndroid? googlePayButton : applePayButton),
      ),

    );
  }
}