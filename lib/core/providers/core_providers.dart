import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shopify/core/network/dio_factory.dart';
import 'package:shopify/core/storage/storage.dart';

//todo
final flutterSecureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final storageProvider = Provider<Storage>((ref) {
  final flutterSecureStorage = ref.watch(flutterSecureStorageProvider);
  return Storage(flutterSecureStorage);
});

final dioProvider = Provider<Dio>((ref) {
  final storage = ref.watch(storageProvider);
  return DioFactory.getDio(storage);
});
