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

Future<List<DocumentReference>> mapCandidates(
    List<DocumentReference> candidateRefs, String? party) async {
  // query all refs in the list and map the party_affiliation, document_id into a JSON array
  List<DocumentReference> candidates = [];

  if (party == null || party == "None") {
    return candidateRefs;
  }

  for (DocumentReference ref in candidateRefs) {
    DocumentSnapshot snapshot = await ref.get();
    Object? data = snapshot.data();

    if (data == null) {
      continue;
    }
    dynamic other = data;
    var afil = other['party_affilication'];

    if (afil == party && afil != null) {
      candidates.add(ref);
    }
  }

  print(candidates);

  return candidates;
}
