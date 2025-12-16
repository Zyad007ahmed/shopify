class ApiConstants {
  // Base URL
  static const String baseUrl = 'https://api.escuelajs.co/api/v1';

  // Endpoints
  static const String productsEP = '/products';
  static const String categoriesEP = '/categories';
  static const String usersEP = '/users';
  static const String authLoginEP = '/auth/login';
  static const String authProfileEP = '/auth/profile';
  static const String authRefreshEP = '/auth/refresh-token';
  static const String filesEP = '/files/upload';

  // Timeouts
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);

  // Pagination
  static const int defaultPageSize = 10;
  static const int maxPageSize = 50;
}
