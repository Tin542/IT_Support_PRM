import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';


class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Pay"),
          onPressed: () async {
            var request = BraintreeDropInRequest(
              tokenizationKey: 'sandbox_rzfmsfvm_gsnpfscyym7sj4b4',
              collectDeviceData: true,
              paypalRequest: BraintreePayPalRequest(
                amount: '10.00',
                displayName: 'haoDng'
              ),
              cardEnabled: true
            );
            BraintreeDropInResult? result = await BraintreeDropIn.start(request);
                if (result != null){
                  print(result.paymentMethodNonce.description);
                  print(result.paymentMethodNonce.nonce);
                }
          },
        ),
      ),
    );
  }
}

