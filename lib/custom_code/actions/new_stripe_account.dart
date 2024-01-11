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

import 'dart:convert';
import 'package:http/http.dart' as http;

Future newStripeAccount(
  String email,
  String businessType,
  String phone,
  String businessName,
  String? websiteUrl,
) async {
  // Define the body of the request as a JSON string
  final String body = json.encode({
    'type': 'standard',
    'country': 'US',
    'email': email,
    'business_type': businessType,
    'requested_capabilities': ['card_payments', 'transfers'],
    'company': {'name': businessName, 'phone': phone}
  });

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': '*',
  };

  // Send the POST request to the Stripe API
  final response = await http.post(
    Uri.parse(
        "https://us-east4-uproot-dc685.cloudfunctions.net/stripeOnboarding"),
    headers: headers,
    body: body,
  );

  // Check if the request was successful
  if (response.statusCode == 200) {
    // Parse the response body as JSON
    final Map<String, dynamic> data = json.decode(response.body);
    // Return the Stripe account ID
    return data['id'];
  } else {
    // Throw an error if the request failed
    throw Exception('Failed to onboard new Stripe account');
  }
}
