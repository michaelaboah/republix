// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PaymentStruct extends FFFirebaseStruct {
  PaymentStruct({
    String? customerName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _customerName = customerName,
        super(firestoreUtilData);

  // "customerName" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  set customerName(String? val) => _customerName = val;
  bool hasCustomerName() => _customerName != null;

  static PaymentStruct fromMap(Map<String, dynamic> data) => PaymentStruct(
        customerName: data['customerName'] as String?,
      );

  static PaymentStruct? maybeFromMap(dynamic data) =>
      data is Map ? PaymentStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'customerName': _customerName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'customerName': serializeParam(
          _customerName,
          ParamType.String,
        ),
      }.withoutNulls;

  static PaymentStruct fromSerializableMap(Map<String, dynamic> data) =>
      PaymentStruct(
        customerName: deserializeParam(
          data['customerName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PaymentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PaymentStruct && customerName == other.customerName;
  }

  @override
  int get hashCode => const ListEquality().hash([customerName]);
}

PaymentStruct createPaymentStruct({
  String? customerName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PaymentStruct(
      customerName: customerName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PaymentStruct? updatePaymentStruct(
  PaymentStruct? payment, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    payment
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPaymentStructData(
  Map<String, dynamic> firestoreData,
  PaymentStruct? payment,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (payment == null) {
    return;
  }
  if (payment.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && payment.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final paymentData = getPaymentFirestoreData(payment, forFieldValue);
  final nestedData = paymentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = payment.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPaymentFirestoreData(
  PaymentStruct? payment, [
  bool forFieldValue = false,
]) {
  if (payment == null) {
    return {};
  }
  final firestoreData = mapToFirestore(payment.toMap());

  // Add any Firestore field values
  payment.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPaymentListFirestoreData(
  List<PaymentStruct>? payments,
) =>
    payments?.map((e) => getPaymentFirestoreData(e, true)).toList() ?? [];
