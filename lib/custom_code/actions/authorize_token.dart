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

import 'package:http/http.dart' as http;

Future<String> authorizeToken(String authCode) async {
  // POST request that sends a "code" variable and returns the response string
  var url = Uri.parse(
      'https://us-central1-uproot-dc685.cloudfunctions.net/stripeOAuthToken');
  var response = await http.post(url, body: {'code': authCode});

  print(response.body);
  if (response.statusCode == 200) {
    return response.body;
  }
  return "";
}
