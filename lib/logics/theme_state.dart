import 'package:audio_bible_dramarized/data/constants.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class MainTheme extends ChangeNotifier{

  MainTheme(){
    loadInitial();
  }

  final _box = GetStorage();
  bool _isDark = false;
  int _colorIndex = 0;
  bool get isDark => _isDark;
  int get currentColor => _colorIndex;

  ThemeMode getThemeMode() =>isDark?ThemeMode.dark:ThemeMode.light;

  final List<MaterialColor> primaries = <MaterialColor>[Colors.brown,Colors.indigo,Colors.deepPurple, Colors.teal, Colors.deepOrange];
  MaterialColor get swatchColor => primaries[currentColor];

  void loadInitial(){
    _box.writeIfNull(Constants.DARK_MODE, false);
    _box.writeIfNull(Constants.colorIndex, 0);
    _isDark = _box.read(Constants.DARK_MODE);
    _colorIndex = _box.read(Constants.colorIndex);
    notifyListeners();
  }


  void toggleDarkMode(){
    _isDark =! isDark;
    _box.write(Constants.DARK_MODE, _isDark);
    notifyListeners();
  }


  void changeColor({@required colorIndex}){
    _colorIndex = colorIndex;
    _box.write(Constants.colorIndex, _colorIndex);
    notifyListeners();
  }

}