import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CandidatesRecord extends FirestoreRecord {
  CandidatesRecord._(
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

  // "campaign_email" field.
  String? _campaignEmail;
  String get campaignEmail => _campaignEmail ?? '';
  bool hasCampaignEmail() => _campaignEmail != null;

  // "jurisdiction" field.
  JurisdictionStruct? _jurisdiction;
  JurisdictionStruct get jurisdiction => _jurisdiction ?? JurisdictionStruct();
  bool hasJurisdiction() => _jurisdiction != null;

  // "social_media" field.
  SocialMediaStruct? _socialMedia;
  SocialMediaStruct get socialMedia => _socialMedia ?? SocialMediaStruct();
  bool hasSocialMedia() => _socialMedia != null;

  // "policies" field.
  List<PoliciesStruct>? _policies;
  List<PoliciesStruct> get policies => _policies ?? const [];
  bool hasPolicies() => _policies != null;

  // "banner_img_url" field.
  String? _bannerImgUrl;
  String get bannerImgUrl => _bannerImgUrl ?? '';
  bool hasBannerImgUrl() => _bannerImgUrl != null;

  // "party_affilication" field.
  String? _partyAffilication;
  String get partyAffilication => _partyAffilication ?? '';
  bool hasPartyAffilication() => _partyAffilication != null;

  // "comittee_name" field.
  String? _comitteeName;
  String get comitteeName => _comitteeName ?? '';
  bool hasComitteeName() => _comitteeName != null;

  // "followers" field.
  List<DocumentReference>? _followers;
  List<DocumentReference> get followers => _followers ?? const [];
  bool hasFollowers() => _followers != null;

  // "donation_link" field.
  String? _donationLink;
  String get donationLink => _donationLink ?? '';
  bool hasDonationLink() => _donationLink != null;

  // "election_ref" field.
  DocumentReference? _electionRef;
  DocumentReference? get electionRef => _electionRef;
  bool hasElectionRef() => _electionRef != null;

  // "youtube_links" field.
  List<String>? _youtubeLinks;
  List<String> get youtubeLinks => _youtubeLinks ?? const [];
  bool hasYoutubeLinks() => _youtubeLinks != null;

  // "donation_clicks" field.
  int? _donationClicks;
  int get donationClicks => _donationClicks ?? 0;
  bool hasDonationClicks() => _donationClicks != null;

  // "page_views" field.
  int? _pageViews;
  int get pageViews => _pageViews ?? 0;
  bool hasPageViews() => _pageViews != null;

  void _initializeFields() {
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _editedTime = snapshotData['edited_time'] as DateTime?;
    _bio = snapshotData['bio'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _campaignEmail = snapshotData['campaign_email'] as String?;
    _jurisdiction =
        JurisdictionStruct.maybeFromMap(snapshotData['jurisdiction']);
    _socialMedia = SocialMediaStruct.maybeFromMap(snapshotData['social_media']);
    _policies = getStructList(
      snapshotData['policies'],
      PoliciesStruct.fromMap,
    );
    _bannerImgUrl = snapshotData['banner_img_url'] as String?;
    _partyAffilication = snapshotData['party_affilication'] as String?;
    _comitteeName = snapshotData['comittee_name'] as String?;
    _followers = getDataList(snapshotData['followers']);
    _donationLink = snapshotData['donation_link'] as String?;
    _electionRef = snapshotData['election_ref'] as DocumentReference?;
    _youtubeLinks = getDataList(snapshotData['youtube_links']);
    _donationClicks = castToType<int>(snapshotData['donation_clicks']);
    _pageViews = castToType<int>(snapshotData['page_views']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('candidates');

  static Stream<CandidatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CandidatesRecord.fromSnapshot(s));

  static Future<CandidatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CandidatesRecord.fromSnapshot(s));

  static CandidatesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CandidatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CandidatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CandidatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CandidatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CandidatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCandidatesRecordData({
  String? displayName,
  String? photoUrl,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? editedTime,
  String? bio,
  String? userName,
  String? campaignEmail,
  JurisdictionStruct? jurisdiction,
  SocialMediaStruct? socialMedia,
  String? bannerImgUrl,
  String? partyAffilication,
  String? comitteeName,
  String? donationLink,
  DocumentReference? electionRef,
  int? donationClicks,
  int? pageViews,
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
      'campaign_email': campaignEmail,
      'jurisdiction': JurisdictionStruct().toMap(),
      'social_media': SocialMediaStruct().toMap(),
      'banner_img_url': bannerImgUrl,
      'party_affilication': partyAffilication,
      'comittee_name': comitteeName,
      'donation_link': donationLink,
      'election_ref': electionRef,
      'donation_clicks': donationClicks,
      'page_views': pageViews,
    }.withoutNulls,
  );

  // Handle nested data for "jurisdiction" field.
  addJurisdictionStructData(firestoreData, jurisdiction, 'jurisdiction');

  // Handle nested data for "social_media" field.
  addSocialMediaStructData(firestoreData, socialMedia, 'social_media');

  return firestoreData;
}

class CandidatesRecordDocumentEquality implements Equality<CandidatesRecord> {
  const CandidatesRecordDocumentEquality();

  @override
  bool equals(CandidatesRecord? e1, CandidatesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.editedTime == e2?.editedTime &&
        e1?.bio == e2?.bio &&
        e1?.userName == e2?.userName &&
        e1?.campaignEmail == e2?.campaignEmail &&
        e1?.jurisdiction == e2?.jurisdiction &&
        e1?.socialMedia == e2?.socialMedia &&
        listEquality.equals(e1?.policies, e2?.policies) &&
        e1?.bannerImgUrl == e2?.bannerImgUrl &&
        e1?.partyAffilication == e2?.partyAffilication &&
        e1?.comitteeName == e2?.comitteeName &&
        listEquality.equals(e1?.followers, e2?.followers) &&
        e1?.donationLink == e2?.donationLink &&
        e1?.electionRef == e2?.electionRef &&
        listEquality.equals(e1?.youtubeLinks, e2?.youtubeLinks) &&
        e1?.donationClicks == e2?.donationClicks &&
        e1?.pageViews == e2?.pageViews;
  }

  @override
  int hash(CandidatesRecord? e) => const ListEquality().hash([
        e?.displayName,
        e?.photoUrl,
        e?.createdTime,
        e?.phoneNumber,
        e?.editedTime,
        e?.bio,
        e?.userName,
        e?.campaignEmail,
        e?.jurisdiction,
        e?.socialMedia,
        e?.policies,
        e?.bannerImgUrl,
        e?.partyAffilication,
        e?.comitteeName,
        e?.followers,
        e?.donationLink,
        e?.electionRef,
        e?.youtubeLinks,
        e?.donationClicks,
        e?.pageViews
      ]);

  @override
  bool isValidKey(Object? o) => o is CandidatesRecord;
}
