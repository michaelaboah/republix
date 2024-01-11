// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PoliciesStruct extends FFFirebaseStruct {
  PoliciesStruct({
    String? policyName,
    String? policyDetails,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _policyName = policyName,
        _policyDetails = policyDetails,
        super(firestoreUtilData);

  // "policy_name" field.
  String? _policyName;
  String get policyName => _policyName ?? '';
  set policyName(String? val) => _policyName = val;
  bool hasPolicyName() => _policyName != null;

  // "policy_details" field.
  String? _policyDetails;
  String get policyDetails => _policyDetails ?? '';
  set policyDetails(String? val) => _policyDetails = val;
  bool hasPolicyDetails() => _policyDetails != null;

  static PoliciesStruct fromMap(Map<String, dynamic> data) => PoliciesStruct(
        policyName: data['policy_name'] as String?,
        policyDetails: data['policy_details'] as String?,
      );

  static PoliciesStruct? maybeFromMap(dynamic data) =>
      data is Map ? PoliciesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'policy_name': _policyName,
        'policy_details': _policyDetails,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'policy_name': serializeParam(
          _policyName,
          ParamType.String,
        ),
        'policy_details': serializeParam(
          _policyDetails,
          ParamType.String,
        ),
      }.withoutNulls;

  static PoliciesStruct fromSerializableMap(Map<String, dynamic> data) =>
      PoliciesStruct(
        policyName: deserializeParam(
          data['policy_name'],
          ParamType.String,
          false,
        ),
        policyDetails: deserializeParam(
          data['policy_details'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PoliciesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PoliciesStruct &&
        policyName == other.policyName &&
        policyDetails == other.policyDetails;
  }

  @override
  int get hashCode => const ListEquality().hash([policyName, policyDetails]);
}

PoliciesStruct createPoliciesStruct({
  String? policyName,
  String? policyDetails,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PoliciesStruct(
      policyName: policyName,
      policyDetails: policyDetails,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PoliciesStruct? updatePoliciesStruct(
  PoliciesStruct? policies, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    policies
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPoliciesStructData(
  Map<String, dynamic> firestoreData,
  PoliciesStruct? policies,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (policies == null) {
    return;
  }
  if (policies.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && policies.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final policiesData = getPoliciesFirestoreData(policies, forFieldValue);
  final nestedData = policiesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = policies.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPoliciesFirestoreData(
  PoliciesStruct? policies, [
  bool forFieldValue = false,
]) {
  if (policies == null) {
    return {};
  }
  final firestoreData = mapToFirestore(policies.toMap());

  // Add any Firestore field values
  policies.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPoliciesListFirestoreData(
  List<PoliciesStruct>? policiess,
) =>
    policiess?.map((e) => getPoliciesFirestoreData(e, true)).toList() ?? [];
