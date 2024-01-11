import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';

class OfficialsRecord extends FirestoreRecord {
  OfficialsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "edited_time" field.
  DateTime? _editedTime;
  DateTime? get editedTime => _editedTime;
  bool hasEditedTime() => _editedTime != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "official_email" field.
  String? _officialEmail;
  String get officialEmail => _officialEmail ?? '';
  bool hasOfficialEmail() => _officialEmail != null;

  // "official_position" field.
  String? _officialPosition;
  String get officialPosition => _officialPosition ?? '';
  bool hasOfficialPosition() => _officialPosition != null;

  // "jurisdiction" field.
  JurisdictionStruct? _jurisdiction;
  JurisdictionStruct get jurisdiction => _jurisdiction ?? JurisdictionStruct();
  bool hasJurisdiction() => _jurisdiction != null;

  // "banner_img_url" field.
  String? _bannerImgUrl;
  String get bannerImgUrl => _bannerImgUrl ?? '';
  bool hasBannerImgUrl() => _bannerImgUrl != null;

  // "social_media" field.
  SocialMediaStruct? _socialMedia;
  SocialMediaStruct get socialMedia => _socialMedia ?? SocialMediaStruct();
  bool hasSocialMedia() => _socialMedia != null;

  // "policies" field.
  List<PoliciesStruct>? _policies;
  List<PoliciesStruct> get policies => _policies ?? const [];
  bool hasPolicies() => _policies != null;

  // "party_affiliation" field.
  String? _partyAffiliation;
  String get partyAffiliation => _partyAffiliation ?? '';
  bool hasPartyAffiliation() => _partyAffiliation != null;

  // "level" field.
  GovernanceLevel? _level;
  GovernanceLevel? get level => _level;
  bool hasLevel() => _level != null;

  // "committee_name" field.
  String? _committeeName;
  String get committeeName => _committeeName ?? '';
  bool hasCommitteeName() => _committeeName != null;

  // "re_election" field.
  bool? _reElection;
  bool get reElection => _reElection ?? false;
  bool hasReElection() => _reElection != null;

  void _initializeFields() {
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _editedTime = snapshotData['edited_time'] as DateTime?;
    _bio = snapshotData['bio'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _officialEmail = snapshotData['official_email'] as String?;
    _officialPosition = snapshotData['official_position'] as String?;
    _jurisdiction =
        JurisdictionStruct.maybeFromMap(snapshotData['jurisdiction']);
    _bannerImgUrl = snapshotData['banner_img_url'] as String?;
    _socialMedia = SocialMediaStruct.maybeFromMap(snapshotData['social_media']);
    _policies = getStructList(
      snapshotData['policies'],
      PoliciesStruct.fromMap,
    );
    _partyAffiliation = snapshotData['party_affiliation'] as String?;
    _level = deserializeEnum<GovernanceLevel>(snapshotData['level']);
    _committeeName = snapshotData['committee_name'] as String?;
    _reElection = snapshotData['re_election'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('officials');

  static Stream<OfficialsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OfficialsRecord.fromSnapshot(s));

  static Future<OfficialsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OfficialsRecord.fromSnapshot(s));

  static OfficialsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OfficialsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OfficialsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OfficialsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OfficialsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OfficialsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOfficialsRecordData({
  String? displayName,
  String? photoUrl,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? editedTime,
  String? bio,
  String? userName,
  String? officialEmail,
  String? officialPosition,
  JurisdictionStruct? jurisdiction,
  String? bannerImgUrl,
  SocialMediaStruct? socialMedia,
  String? partyAffiliation,
  GovernanceLevel? level,
  String? committeeName,
  bool? reElection,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'display_name': displayName,
      'photo_url': photoUrl,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'edited_time': editedTime,
      'bio': bio,
      'user_name': userName,
      'official_email': officialEmail,
      'official_position': officialPosition,
      'jurisdiction': JurisdictionStruct().toMap(),
      'banner_img_url': bannerImgUrl,
      'social_media': SocialMediaStruct().toMap(),
      'party_affiliation': partyAffiliation,
      'level': level,
      'committee_name': committeeName,
      're_election': reElection,
    }.withoutNulls,
  );

  // Handle nested data for "jurisdiction" field.
  addJurisdictionStructData(firestoreData, jurisdiction, 'jurisdiction');

  // Handle nested data for "social_media" field.
  addSocialMediaStructData(firestoreData, socialMedia, 'social_media');

  return firestoreData;
}

class OfficialsRecordDocumentEquality implements Equality<OfficialsRecord> {
  const OfficialsRecordDocumentEquality();

  @override
  bool equals(OfficialsRecord? e1, OfficialsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.editedTime == e2?.editedTime &&
        e1?.bio == e2?.bio &&
        e1?.userName == e2?.userName &&
        e1?.officialEmail == e2?.officialEmail &&
        e1?.officialPosition == e2?.officialPosition &&
        e1?.jurisdiction == e2?.jurisdiction &&
        e1?.bannerImgUrl == e2?.bannerImgUrl &&
        e1?.socialMedia == e2?.socialMedia &&
        listEquality.equals(e1?.policies, e2?.policies) &&
        e1?.partyAffiliation == e2?.partyAffiliation &&
        e1?.level == e2?.level &&
        e1?.committeeName == e2?.committeeName &&
        e1?.reElection == e2?.reElection;
  }

  @override
  int hash(OfficialsRecord? e) => const ListEquality().hash([
        e?.displayName,
        e?.photoUrl,
        e?.createdTime,
        e?.phoneNumber,
        e?.editedTime,
        e?.bio,
        e?.userName,
        e?.officialEmail,
        e?.officialPosition,
        e?.jurisdiction,
        e?.bannerImgUrl,
        e?.socialMedia,
        e?.policies,
        e?.partyAffiliation,
        e?.level,
        e?.committeeName,
        e?.reElection
      ]);

  @override
  bool isValidKey(Object? o) => o is OfficialsRecord;
}
