import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class IssuePositionsRecord extends FirestoreRecord {
  IssuePositionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "issue_ref" field.
  DocumentReference? _issueRef;
  DocumentReference? get issueRef => _issueRef;
  bool hasIssueRef() => _issueRef != null;

  // "position" field.
  bool? _position;
  bool get position => _position ?? false;
  bool hasPosition() => _position != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _issueRef = snapshotData['issue_ref'] as DocumentReference?;
    _position = snapshotData['position'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('issue_positions')
          : FirebaseFirestore.instance.collectionGroup('issue_positions');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('issue_positions').doc();

  static Stream<IssuePositionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IssuePositionsRecord.fromSnapshot(s));

  static Future<IssuePositionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IssuePositionsRecord.fromSnapshot(s));

  static IssuePositionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IssuePositionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IssuePositionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IssuePositionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IssuePositionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IssuePositionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIssuePositionsRecordData({
  DocumentReference? issueRef,
  bool? position,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'issue_ref': issueRef,
      'position': position,
    }.withoutNulls,
  );

  return firestoreData;
}

class IssuePositionsRecordDocumentEquality
    implements Equality<IssuePositionsRecord> {
  const IssuePositionsRecordDocumentEquality();

  @override
  bool equals(IssuePositionsRecord? e1, IssuePositionsRecord? e2) {
    return e1?.issueRef == e2?.issueRef && e1?.position == e2?.position;
  }

  @override
  int hash(IssuePositionsRecord? e) =>
      const ListEquality().hash([e?.issueRef, e?.position]);

  @override
  bool isValidKey(Object? o) => o is IssuePositionsRecord;
}
