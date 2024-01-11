// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SocialMediaStruct extends FFFirebaseStruct {
  SocialMediaStruct({
    String? twitterUrl,
    String? facebookUrl,
    String? websiteUrl,
    String? instagramUrl,
    String? snapchatUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _twitterUrl = twitterUrl,
        _facebookUrl = facebookUrl,
        _websiteUrl = websiteUrl,
        _instagramUrl = instagramUrl,
        _snapchatUrl = snapchatUrl,
        super(firestoreUtilData);

  // "twitter_url" field.
  String? _twitterUrl;
  String get twitterUrl => _twitterUrl ?? '';
  set twitterUrl(String? val) => _twitterUrl = val;
  bool hasTwitterUrl() => _twitterUrl != null;

  // "facebook_url" field.
  String? _facebookUrl;
  String get facebookUrl => _facebookUrl ?? '';
  set facebookUrl(String? val) => _facebookUrl = val;
  bool hasFacebookUrl() => _facebookUrl != null;

  // "website_url" field.
  String? _websiteUrl;
  String get websiteUrl => _websiteUrl ?? '';
  set websiteUrl(String? val) => _websiteUrl = val;
  bool hasWebsiteUrl() => _websiteUrl != null;

  // "instagram_url" field.
  String? _instagramUrl;
  String get instagramUrl => _instagramUrl ?? '';
  set instagramUrl(String? val) => _instagramUrl = val;
  bool hasInstagramUrl() => _instagramUrl != null;

  // "snapchat_url" field.
  String? _snapchatUrl;
  String get snapchatUrl => _snapchatUrl ?? '';
  set snapchatUrl(String? val) => _snapchatUrl = val;
  bool hasSnapchatUrl() => _snapchatUrl != null;

  static SocialMediaStruct fromMap(Map<String, dynamic> data) =>
      SocialMediaStruct(
        twitterUrl: data['twitter_url'] as String?,
        facebookUrl: data['facebook_url'] as String?,
        websiteUrl: data['website_url'] as String?,
        instagramUrl: data['instagram_url'] as String?,
        snapchatUrl: data['snapchat_url'] as String?,
      );

  static SocialMediaStruct? maybeFromMap(dynamic data) => data is Map
      ? SocialMediaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'twitter_url': _twitterUrl,
        'facebook_url': _facebookUrl,
        'website_url': _websiteUrl,
        'instagram_url': _instagramUrl,
        'snapchat_url': _snapchatUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'twitter_url': serializeParam(
          _twitterUrl,
          ParamType.String,
        ),
        'facebook_url': serializeParam(
          _facebookUrl,
          ParamType.String,
        ),
        'website_url': serializeParam(
          _websiteUrl,
          ParamType.String,
        ),
        'instagram_url': serializeParam(
          _instagramUrl,
          ParamType.String,
        ),
        'snapchat_url': serializeParam(
          _snapchatUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static SocialMediaStruct fromSerializableMap(Map<String, dynamic> data) =>
      SocialMediaStruct(
        twitterUrl: deserializeParam(
          data['twitter_url'],
          ParamType.String,
          false,
        ),
        facebookUrl: deserializeParam(
          data['facebook_url'],
          ParamType.String,
          false,
        ),
        websiteUrl: deserializeParam(
          data['website_url'],
          ParamType.String,
          false,
        ),
        instagramUrl: deserializeParam(
          data['instagram_url'],
          ParamType.String,
          false,
        ),
        snapchatUrl: deserializeParam(
          data['snapchat_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SocialMediaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SocialMediaStruct &&
        twitterUrl == other.twitterUrl &&
        facebookUrl == other.facebookUrl &&
        websiteUrl == other.websiteUrl &&
        instagramUrl == other.instagramUrl &&
        snapchatUrl == other.snapchatUrl;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([twitterUrl, facebookUrl, websiteUrl, instagramUrl, snapchatUrl]);
}

SocialMediaStruct createSocialMediaStruct({
  String? twitterUrl,
  String? facebookUrl,
  String? websiteUrl,
  String? instagramUrl,
  String? snapchatUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SocialMediaStruct(
      twitterUrl: twitterUrl,
      facebookUrl: facebookUrl,
      websiteUrl: websiteUrl,
      instagramUrl: instagramUrl,
      snapchatUrl: snapchatUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SocialMediaStruct? updateSocialMediaStruct(
  SocialMediaStruct? socialMedia, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    socialMedia
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSocialMediaStructData(
  Map<String, dynamic> firestoreData,
  SocialMediaStruct? socialMedia,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (socialMedia == null) {
    return;
  }
  if (socialMedia.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && socialMedia.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final socialMediaData =
      getSocialMediaFirestoreData(socialMedia, forFieldValue);
  final nestedData =
      socialMediaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = socialMedia.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSocialMediaFirestoreData(
  SocialMediaStruct? socialMedia, [
  bool forFieldValue = false,
]) {
  if (socialMedia == null) {
    return {};
  }
  final firestoreData = mapToFirestore(socialMedia.toMap());

  // Add any Firestore field values
  socialMedia.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSocialMediaListFirestoreData(
  List<SocialMediaStruct>? socialMedias,
) =>
    socialMedias?.map((e) => getSocialMediaFirestoreData(e, true)).toList() ??
    [];
