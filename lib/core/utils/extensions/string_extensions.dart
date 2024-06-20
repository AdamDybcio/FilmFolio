extension StringExtensions on String {
  String intelligentTrim() {
    return length > 15 ? '${substring(0, 15)}...' : this;
  }
}
