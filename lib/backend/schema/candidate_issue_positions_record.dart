import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class CandidateIssuePositionsRecord extends FirestoreRecord {
  CandidateIssuePositionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "issue_ref" field.
  DocumentReference? _issueRef;
  DocumentReference? get issueRef => _issueRef;
  bool hasIssueRef() => _issueRef != null;

  // "issue_position" field.
  bool? _issuePosition;
  bool get issuePosition => _issuePosition ?? false;
  bool hasIssuePosition() => _issuePosition != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _issueRef = snapshotData['issue_ref'] as DocumentReference?;
    _issuePosition = snapshotData['issue_position'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('candidate_issue_positions')
          : FirebaseFirestore.instance
              .collectionGroup('candidate_issue_positions');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('candidate_issue_positions').doc(id);

  static Stream<CandidateIssuePositionsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => CandidateIssuePositionsRecord.fromSnapshot(s));

  static Future<CandidateIssuePositionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CandidateIssuePositionsRecord.fromSnapshot(s));

  static CandidateIssuePositionsRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      CandidateIssuePositionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CandidateIssuePositionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CandidateIssuePositionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CandidateIssuePositionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CandidateIssuePositionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCandidateIssuePositionsRecordData({
  DocumentReference? issueRef,
  bool? issuePosition,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'issue_ref': issueRef,
      'issue_position': issuePosition,
    }.withoutNulls,
  );

  return firestoreData;
}

class CandidateIssuePositionsRecordDocumentEquality
    implements Equality<CandidateIssuePositionsRecord> {
  const CandidateIssuePositionsRecordDocumentEquality();

  @override
  bool equals(
      CandidateIssuePositionsRecord? e1, CandidateIssuePositionsRecord? e2) {
    return e1?.issueRef == e2?.issueRef &&
        e1?.issuePosition == e2?.issuePosition;
  }

  @override
  int hash(CandidateIssuePositionsRecord? e) =>
      const ListEquality().hash([e?.issueRef, e?.issuePosition]);

  @override
  bool isValidKey(Object? o) => o is CandidateIssuePositionsRecord;
}
