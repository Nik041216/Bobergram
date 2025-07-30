import 'package:flutter/material.dart';

class AppSettings extends ChangeNotifier{
  bool _isDarkTheme = false;
  double _interfaceScale = 1.0;
  double _messageTextSize = 1.0;
  Color _myBubbleColor = Colors.blue;
  Color _otherMessageColor = Colors.grey.shade300;
  Color _myBubbleColorDark = const Color.fromARGB(255, 27, 122, 200);
  Color _otherMessageColorDark = const Color.fromARGB(255, 151, 151, 151);
  String? _chatBackgroundImage;

  bool get isDarkTheme => _isDarkTheme;
  double get interfaceScale => _interfaceScale;
  double get messageTextSize => _messageTextSize;
  Color get myBubbleColor => _myBubbleColor;
  Color get otherMessageColor => _otherMessageColor;
  Color get myBubbleColorDark => _myBubbleColorDark;
  Color get otherMessageColorDark => _otherMessageColorDark;
  String? get chatBackgroundImage => _chatBackgroundImage; 

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  void setInterfaceScale(double scale) {
    _interfaceScale = scale;
    notifyListeners();
  }

  void setMessageTextSize(double scale) {
    _messageTextSize = scale;
    notifyListeners();
  }

  void setMyMessageColor(Color color) {
    _myBubbleColor = color;
    notifyListeners();
  }

  void setOtherMessageColor(Color color) {
    _otherMessageColor = color;
    notifyListeners();
  }

  void setMyMessageColorDark(Color color) {
    _myBubbleColorDark = color;
    notifyListeners();
  }

  void setOtherMessageColorDark(Color color) {
    _otherMessageColorDark = color;
    notifyListeners();
  }

  void setChatBackgroundImage(String? path) {
    _chatBackgroundImage = path;
    notifyListeners();
  }
}