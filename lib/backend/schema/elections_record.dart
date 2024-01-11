import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ElectionsRecord extends FirestoreRecord {
  ElectionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "election_name" field.
  String? _electionName;
  String get electionName => _electionName ?? '';
  bool hasElectionName() => _electionName != null;

  // "number_of_seats" field.
  int? _numberOfSeats;
  int get numberOfSeats => _numberOfSeats ?? 0;
  bool hasNumberOfSeats() => _numberOfSeats != null;

  // "candidates" field.
  List<DocumentReference>? _candidates;
  List<DocumentReference> get candidates => _candidates ?? const [];
  bool hasCandidates() => _candidates != null;

  // "incumbents" field.
  List<DocumentReference>? _incumbents;
  List<DocumentReference> get incumbents => _incumbents ?? const [];
  bool hasIncumbents() => _incumbents != null;

  // "jurisidiction" field.
  JurisdictionStruct? _jurisidiction;
  JurisdictionStruct get jurisidiction =>
      _jurisidiction ?? JurisdictionStruct();
  bool hasJurisidiction() => _jurisidiction != null;

  // "level" field.
  int? _level;
  int get level => _level ?? 0;
  bool hasLevel() => _level != null;

  // "election_day" field.
  DateTime? _electionDay;
  DateTime? get electionDay => _electionDay;
  bool hasElectionDay() => _electionDay != null;

  // "election_type" field.
  int? _electionType;
  int get electionType => _electionType ?? 0;
  bool hasElectionType() => _electionType != null;

  void _initializeFields() {
    _electionName = snapshotData['election_name'] as String?;
    _numberOfSeats = castToType<int>(snapshotData['number_of_seats']);
    _candidates = getDataList(snapshotData['candidates']);
    _incumbents = getDataList(snapshotData['incumbents']);
    _jurisidiction =
        JurisdictionStruct.maybeFromMap(snapshotData['jurisidiction']);
    _level = castToType<int>(snapshotData['level']);
    _electionDay = snapshotData['election_day'] as DateTime?;
    _electionType = castToType<int>(snapshotData['election_type']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('elections');

  static Stream<ElectionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ElectionsRecord.fromSnapshot(s));

  static Future<ElectionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ElectionsRecord.fromSnapshot(s));

  static ElectionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ElectionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ElectionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ElectionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ElectionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ElectionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createElectionsRecordData({
  String? electionName,
  int? numberOfSeats,
  JurisdictionStruct? jurisidiction,
  int? level,
  DateTime? electionDay,
  int? electionType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'election_name': electionName,
      'number_of_seats': numberOfSeats,
      'jurisidiction': JurisdictionStruct().toMap(),
      'level': level,
      'election_day': electionDay,
      'election_type': electionType,
    }.withoutNulls,
  );

  // Handle nested data for "jurisidiction" field.
  addJurisdictionStructData(firestoreData, jurisidiction, 'jurisidiction');

  return firestoreData;
}

class ElectionsRecordDocumentEquality implements Equality<ElectionsRecord> {
  const ElectionsRecordDocumentEquality();

  @override
  bool equals(ElectionsRecord? e1, ElectionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.electionName == e2?.electionName &&
        e1?.numberOfSeats == e2?.numberOfSeats &&
        listEquality.equals(e1?.candidates, e2?.candidates) &&
        listEquality.equals(e1?.incumbents, e2?.incumbents) &&
        e1?.jurisidiction == e2?.jurisidiction &&
        e1?.level == e2?.level &&
        e1?.electionDay == e2?.electionDay &&
        e1?.electionType == e2?.electionType;
  }

  @override
  int hash(ElectionsRecord? e) => const ListEquality().hash([
        e?.electionName,
        e?.numberOfSeats,
        e?.candidates,
        e?.incumbents,
        e?.jurisidiction,
        e?.level,
        e?.electionDay,
        e?.electionType
      ]);

  @override
  bool isValidKey(Object? o) => o is ElectionsRecord;
}
