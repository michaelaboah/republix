import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class IssuesRecord extends FirestoreRecord {
  IssuesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('issues')
          : FirebaseFirestore.instance.collectionGroup('issues');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('issues').doc();

  static Stream<IssuesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IssuesRecord.fromSnapshot(s));

  static Future<IssuesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IssuesRecord.fromSnapshot(s));

  static IssuesRecord fromSnapshot(DocumentSnapshot snapshot) => IssuesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IssuesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IssuesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IssuesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IssuesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIssuesRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class IssuesRecordDocumentEquality implements Equality<IssuesRecord> {
  const IssuesRecordDocumentEquality();

  @override
  bool equals(IssuesRecord? e1, IssuesRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(IssuesRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is IssuesRecord;
}
