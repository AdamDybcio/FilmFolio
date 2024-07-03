extension StringExtensions on String {
  String changeToMilion() {
    if (length < 4) return this;
    if (length < 7) return {substring(0, length - 3), ' K'}.join();
    if (length < 10) return {substring(0, length - 6), ' M'}.join();
    return {substring(0, length - 9), ' B'}.join();
  }
}
