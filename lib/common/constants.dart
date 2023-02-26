class Constants {
  final String url = "192.168.1.8:8080";

  Constants._hiddenConstructor();
  static final Constants constants = Constants._hiddenConstructor();

  factory Constants() {
    return constants;
  }
}