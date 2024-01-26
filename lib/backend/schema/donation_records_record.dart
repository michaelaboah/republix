import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DonationRecordsRecord extends FirestoreRecord {
  DonationRecordsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "candidate_ref" field.
  DocumentReference? _candidateRef;
  DocumentReference? get candidateRef => _candidateRef;
  bool hasCandidateRef() => _candidateRef != null;

  // "donation_limit" field.
  int? _donationLimit;
  int get donationLimit => _donationLimit ?? 0;
  bool hasDonationLimit() => _donationLimit != null;

  // "donation_total" field.
  int? _donationTotal;
  int get donationTotal => _donationTotal ?? 0;
  bool hasDonationTotal() => _donationTotal != null;

  // "candidate_name" field.
  String? _candidateName;
  String get candidateName => _candidateName ?? '';
  bool hasCandidateName() => _candidateName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _candidateRef = snapshotData['candidate_ref'] as DocumentReference?;
    _donationLimit = castToType<int>(snapshotData['donation_limit']);
    _donationTotal = castToType<int>(snapshotData['donation_total']);
    _candidateName = snapshotData['candidate_name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('donation_records')
          : FirebaseFirestore.instance.collectionGroup('donation_records');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('donation_records').doc(id);

  static Stream<DonationRecordsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DonationRecordsRecord.fromSnapshot(s));

  static Future<DonationRecordsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DonationRecordsRecord.fromSnapshot(s));

  static DonationRecordsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DonationRecordsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DonationRecordsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DonationRecordsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DonationRecordsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DonationRecordsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDonationRecordsRecordData({
  DocumentReference? candidateRef,
  int? donationLimit,
  int? donationTotal,
  String? candidateName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'candidate_ref': candidateRef,
      'donation_limit': donationLimit,
      'donation_total': donationTotal,
      'candidate_name': candidateName,
    }.withoutNulls,
  );

  return firestoreData;
}

class DonationRecordsRecordDocumentEquality
    implements Equality<DonationRecordsRecord> {
  const DonationRecordsRecordDocumentEquality();

  @override
  bool equals(DonationRecordsRecord? e1, DonationRecordsRecord? e2) {
    return e1?.candidateRef == e2?.candidateRef &&
        e1?.donationLimit == e2?.donationLimit &&
        e1?.donationTotal == e2?.donationTotal &&
        e1?.candidateName == e2?.candidateName;
  }

  @override
  int hash(DonationRecordsRecord? e) => const ListEquality().hash(
      [e?.candidateRef, e?.donationLimit, e?.donationTotal, e?.candidateName]);

  @override
  bool isValidKey(Object? o) => o is DonationRecordsRecord;
}
