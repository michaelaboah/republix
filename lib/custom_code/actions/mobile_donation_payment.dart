// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:provider/provider.dart';

import 'package:flutter_stripe/flutter_stripe.dart';

Future<bool> mobileDonationPayment(
    BuildContext context, dynamic data, String connectedAccountId) async {
  try {
    Stripe.stripeAccountId = connectedAccountId;
    await Stripe.instance.applySettings();

    // 2. initialize the payment sheet
    final paymentOption = await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Set to true for custom flow
        customFlow: false,
        // Main params
        merchantDisplayName: 'Assuro Tech',
        paymentIntentClientSecret: data['paymentIntent'],
        // Customer keys
        // customerEphemeralKeySecret: data['ephemeralKey'],
        // customerId: data['customer'],
        // Extra options
        // applePay: const PaymentSheetApplePay(
        //   merchantCountryCode: 'US',
        // ),
        googlePay: const PaymentSheetGooglePay(
          merchantCountryCode: 'US',
          testEnv: true,
        ),
        style: ThemeMode.dark,
      ),
    );

    if (paymentOption != null) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $e')),
    );
    rethrow;
  }
  return false;
}
