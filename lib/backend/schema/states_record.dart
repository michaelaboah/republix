import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class StatesRecord extends FirestoreRecord {
  StatesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "elections" field.
  List<DocumentReference>? _elections;
  List<DocumentReference> get elections => _elections ?? const [];
  bool hasElections() => _elections != null;

  // "state_name" field.
  String? _stateName;
  String get stateName => _stateName ?? '';
  bool hasStateName() => _stateName != null;

  // "counties" field.
  List<String>? _counties;
  List<String> get counties => _counties ?? const [];
  bool hasCounties() => _counties != null;

  // "municipalities" field.
  List<String>? _municipalities;
  List<String> get municipalities => _municipalities ?? const [];
  bool hasMunicipalities() => _municipalities != null;

  void _initializeFields() {
    _elections = getDataList(snapshotData['elections']);
    _stateName = snapshotData['state_name'] as String?;
    _counties = getDataList(snapshotData['counties']);
    _municipalities = getDataList(snapshotData['municipalities']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('States');

  static Stream<StatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StatesRecord.fromSnapshot(s));

  static Future<StatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StatesRecord.fromSnapshot(s));

  static StatesRecord fromSnapshot(DocumentSnapshot snapshot) => StatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStatesRecordData({
  String? stateName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'state_name': stateName,
    }.withoutNulls,
  );

  return firestoreData;
}

class StatesRecordDocumentEquality implements Equality<StatesRecord> {
  const StatesRecordDocumentEquality();

  @override
  bool equals(StatesRecord? e1, StatesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.elections, e2?.elections) &&
        e1?.stateName == e2?.stateName &&
        listEquality.equals(e1?.counties, e2?.counties) &&
        listEquality.equals(e1?.municipalities, e2?.municipalities);
  }

  @override
  int hash(StatesRecord? e) => const ListEquality()
      .hash([e?.elections, e?.stateName, e?.counties, e?.municipalities]);

  @override
  bool isValidKey(Object? o) => o is StatesRecord;
}
