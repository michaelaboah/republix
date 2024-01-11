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

import 'package:flutter_stripe/flutter_stripe.dart';

import '/backend/stripe/payment_manager.dart';

Future webDonationPayment(
    BuildContext context, dynamic data, String connectedAccountId) async {
  Stripe.stripeAccountId = connectedAccountId;
  await Stripe.instance.applySettings();

  showWebPaymentSheet(
    context,
    paymentId: data['paymentId'],
    paymentIntentSecret: data['paymentIntent'],
    amount: data['amount'],
    currency: data['currency'],
    description: data['description'],
  );

  // 2. initialize the payment sheet
}
