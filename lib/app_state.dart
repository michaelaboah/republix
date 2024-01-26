import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_userJurisdiction') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_userJurisdiction') ?? '{}';
          _userJurisdiction = JurisdictionStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _userAddress =
          await secureStorage.getString('ff_userAddress') ?? _userAddress;
    });
    await _safeInitAsync(() async {
      _onboarded = await secureStorage.getBool('ff_onboarded') ?? _onboarded;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  JurisdictionStruct _userJurisdiction = JurisdictionStruct();
  JurisdictionStruct get userJurisdiction => _userJurisdiction;
  set userJurisdiction(JurisdictionStruct value) {
    _userJurisdiction = value;
    secureStorage.setString('ff_userJurisdiction', value.serialize());
  }

  void deleteUserJurisdiction() {
    secureStorage.delete(key: 'ff_userJurisdiction');
  }

  void updateUserJurisdictionStruct(Function(JurisdictionStruct) updateFn) {
    updateFn(_userJurisdiction);
    secureStorage.setString(
        'ff_userJurisdiction', _userJurisdiction.serialize());
  }

  String _userAddress = '';
  String get userAddress => _userAddress;
  set userAddress(String value) {
    _userAddress = value;
    secureStorage.setString('ff_userAddress', value);
  }

  void deleteUserAddress() {
    secureStorage.delete(key: 'ff_userAddress');
  }

  bool _onboarded = false;
  bool get onboarded => _onboarded;
  set onboarded(bool value) {
    _onboarded = value;
    secureStorage.setBool('ff_onboarded', value);
  }

  void deleteOnboarded() {
    secureStorage.delete(key: 'ff_onboarded');
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
