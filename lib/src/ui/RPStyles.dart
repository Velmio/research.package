part of research_package_ui;

class RPStyles {
  static final h1 = TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w600);
  static final h2 = TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w400);
  static final h3 = TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w200);

  static final bodyText = TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w200);
  static final whiteText = TextStyle(color: Colors.white);
  static final choiceAnswerText = TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300);

  static final cachetBlue = Color(0xff61c3d9);

  static final cachetTheme = ThemeData.light().copyWith(
    accentColor: cachetBlue,
    primaryColor: cachetBlue,
  );
}
