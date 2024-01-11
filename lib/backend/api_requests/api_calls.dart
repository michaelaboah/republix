import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Test APIs Group Code

class TestAPIsGroup {
  static String baseUrl = 'https://google.com';
  static Map<String, String> headers = {};
}

/// End Test APIs Group Code

class GoogleCivicAPICall {
  static Future<ApiCallResponse> call({
    String? address = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Google Civic API',
      apiUrl: 'https://www.googleapis.com/civicinfo/v2/representatives',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'key': "AIzaSyBEhPuCCM_3Vyh2GF5vnJ0BiFjlhGmEDaw",
        'address': address,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? jurisdiction(dynamic response) => (getJsonField(
        response,
        r'''$.divisions''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class StripeDirectChargeCall {
  static Future<ApiCallResponse> call({
    int? amount,
    String? currency = 'USD',
    String? connectedAccountId = '',
    String? description = '',
  }) async {
    final ffApiRequestBody = '''
{
  "amount": $amount,
  "currency": "$currency",
  "connectedAccountId": "$connectedAccountId",
  "description": "$description"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Stripe Direct Charge',
      apiUrl:
          'https://us-central1-uproot-dc685.cloudfunctions.net/stripeDirectCharge',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer \$(gcloud auth print-identity-token)',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
