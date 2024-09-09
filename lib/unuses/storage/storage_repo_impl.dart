//
//
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:pregancy/storage/storage_repo.dart';
//
// class StorageRepoImpl implements StorageRepo {
//
//   @override
//   Future<void> delete(String key) async {
//     FlutterSecureStorage storage =const FlutterSecureStorage();
//
//     await storage.delete(key: key);
//   }
//
//   @override
//   Future<void> deleteAll() async {
//     FlutterSecureStorage storage =const FlutterSecureStorage();
//
//     await storage.deleteAll();
//   }
//
//   @override
//   Future<String?> read(String key) async {
//     FlutterSecureStorage storage =const FlutterSecureStorage();
//
//     String? value = await storage.read(key: key);
//     return value;
//   }
//
//   @override
//   Future<void> write({required String key, required String value}) async {
//     FlutterSecureStorage storage =const FlutterSecureStorage();
//
//     await storage.write(key: key, value: value);
//   }
//
//   @override
//   Future<bool> isContain(String key) async {
//     FlutterSecureStorage storage =const FlutterSecureStorage();
//
//     String? status = await storage.read(key: key);
//     if (status != null) {
//       return true;
//     }
//     return false;
//   }
//
// }