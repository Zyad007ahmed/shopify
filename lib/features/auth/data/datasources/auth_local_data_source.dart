import 'package:shopify/core/storage/storage.dart';

abstract class AuthLocalDataSource {
  Future<void> saveTokens(String accessToken, String refreshToken);
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> saveUserId(int userid);
  Future<int?> getCachedUserId();
  Future<void> clearAuthData();
  Future<bool> isLoggedIn();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final Storage storage;

  AuthLocalDataSourceImpl(this.storage);

  @override
  Future<void> saveTokens(String accessToken, String refreshToken) async {
    await storage.saveTokens(accessToken, refreshToken);
  }

  @override
  Future<String?> getAccessToken() async {
    return await storage.getAccessToken();
  }

  @override
  Future<String?> getRefreshToken() async {
    return await storage.getRefreshToken();
  }

  //todo
  @override
  Future<void> saveUserId(int userId) async {
    await storage.saveUserId(userId.toString());
  }

  //todo
  @override
  Future<int?> getCachedUserId() async {
    final userId = await storage.getUserId();
    return userId == null ? null : int.parse(userId);
  }

  @override
  Future<void> clearAuthData() async {
    return await storage.clearAll();
  }

  @override
  Future<bool> isLoggedIn() async {
    return await storage.hasToken();
  }
}
