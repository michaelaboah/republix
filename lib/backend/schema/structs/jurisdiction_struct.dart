// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JurisdictionStruct extends FFFirebaseStruct {
  JurisdictionStruct({
    String? county,
    String? country,
    String? city,
    String? state,
    int? donationLimit,
    int? federalDistrict,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _county = county,
        _country = country,
        _city = city,
        _state = state,
        _donationLimit = donationLimit,
        _federalDistrict = federalDistrict,
        super(firestoreUtilData);

  // "county" field.
  String? _county;
  String get county => _county ?? '';
  set county(String? val) => _county = val;
  bool hasCounty() => _county != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;
  bool hasCountry() => _country != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;
  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;
  bool hasState() => _state != null;

  // "donation_limit" field.
  int? _donationLimit;
  int get donationLimit => _donationLimit ?? 0;
  set donationLimit(int? val) => _donationLimit = val;
  void incrementDonationLimit(int amount) =>
      _donationLimit = donationLimit + amount;
  bool hasDonationLimit() => _donationLimit != null;

  // "federal_district" field.
  int? _federalDistrict;
  int get federalDistrict => _federalDistrict ?? 0;
  set federalDistrict(int? val) => _federalDistrict = val;
  void incrementFederalDistrict(int amount) =>
      _federalDistrict = federalDistrict + amount;
  bool hasFederalDistrict() => _federalDistrict != null;

  static JurisdictionStruct fromMap(Map<String, dynamic> data) =>
      JurisdictionStruct(
        county: data['county'] as String?,
        country: data['country'] as String?,
        city: data['city'] as String?,
        state: data['state'] as String?,
        donationLimit: castToType<int>(data['donation_limit']),
        federalDistrict: castToType<int>(data['federal_district']),
      );

  static JurisdictionStruct? maybeFromMap(dynamic data) => data is Map
      ? JurisdictionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'county': _county,
        'country': _country,
        'city': _city,
        'state': _state,
        'donation_limit': _donationLimit,
        'federal_district': _federalDistrict,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'county': serializeParam(
          _county,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'donation_limit': serializeParam(
          _donationLimit,
          ParamType.int,
        ),
        'federal_district': serializeParam(
          _federalDistrict,
          ParamType.int,
        ),
      }.withoutNulls;

  static JurisdictionStruct fromSerializableMap(Map<String, dynamic> data) =>
      JurisdictionStruct(
        county: deserializeParam(
          data['county'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        donationLimit: deserializeParam(
          data['donation_limit'],
          ParamType.int,
          false,
        ),
        federalDistrict: deserializeParam(
          data['federal_district'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'JurisdictionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is JurisdictionStruct &&
        county == other.county &&
        country == other.country &&
        city == other.city &&
        state == other.state &&
        donationLimit == other.donationLimit &&
        federalDistrict == other.federalDistrict;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([county, country, city, state, donationLimit, federalDistrict]);
}

JurisdictionStruct createJurisdictionStruct({
  String? county,
  String? country,
  String? city,
  String? state,
  int? donationLimit,
  int? federalDistrict,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    JurisdictionStruct(
      county: county,
      country: country,
      city: city,
      state: state,
      donationLimit: donationLimit,
      federalDistrict: federalDistrict,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

JurisdictionStruct? updateJurisdictionStruct(
  JurisdictionStruct? jurisdiction, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    jurisdiction
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addJurisdictionStructData(
  Map<String, dynamic> firestoreData,
  JurisdictionStruct? jurisdiction,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (jurisdiction == null) {
    return;
  }
  if (jurisdiction.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && jurisdiction.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final jurisdictionData =
      getJurisdictionFirestoreData(jurisdiction, forFieldValue);
  final nestedData =
      jurisdictionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = jurisdiction.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getJurisdictionFirestoreData(
  JurisdictionStruct? jurisdiction, [
  bool forFieldValue = false,
]) {
  if (jurisdiction == null) {
    return {};
  }
  final firestoreData = mapToFirestore(jurisdiction.toMap());

  // Add any Firestore field values
  jurisdiction.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getJurisdictionListFirestoreData(
  List<JurisdictionStruct>? jurisdictions,
) =>
    jurisdictions?.map((e) => getJurisdictionFirestoreData(e, true)).toList() ??
    [];
