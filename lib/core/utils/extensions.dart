extension StringExtension on String? {
  bool isNotNullOrEmpty() => this != null || this!.isNotEmpty;
}
