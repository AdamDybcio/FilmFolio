extension StringExtensions on String {
  String intelligentTrim() {
    return length > 20 ? '${substring(0, 20)}...' : this;
  }
}
