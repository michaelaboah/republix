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

Future setUserJurisdiction(dynamic divisions) async {
  var pattern = r'\d+';
  var regex = new RegExp(pattern);

  var userJurisdiction = new JurisdictionStruct();

  // Convert the LinkedMap to a Map<String, String>
  Map<String, String> jurisdictionNames = divisions.map<String, String>(
      (key, value) => MapEntry(key.toString(), value['name'].toString()));

  for (var entry in jurisdictionNames.entries) {
    var lastDistrict = entry.key.split("/").last;
    if (lastDistrict.contains("cd")) {
      var district = entry.value;
      var match = regex.firstMatch(district);
      userJurisdiction.federalDistrict = int.parse(match!.group(0)!);
    } else if (lastDistrict.contains("county")) {
      userJurisdiction.county =
          entry.value.split("county").first.split(" ").first;
      // } else if (lastDistrict.contains("County")) {
      //   print(entry.value.split("County").first);
      //   userJurisdiction.county = entry.value.split("County").first;
    } else if (lastDistrict.contains("state")) {
      userJurisdiction.state = entry.value;
    } else if (lastDistrict.contains("country")) {
      userJurisdiction.country = entry.value;
    } else {}
  }

  print(userJurisdiction);
  FFAppState().userJurisdiction = userJurisdiction;
}
