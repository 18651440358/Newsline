import 'package:flutter/material.dart';

// 默认主题
class SetLightThemeAction {
    final ThemeMode themeMode;
    SetLightThemeAction(this.themeMode);
}

// 暗夜
class SetDarkThemeAction {
    final ThemeMode themeMode;
    SetDarkThemeAction(this.themeMode);
}

// 跟随系统
class SetAutoThemeAction {
    final ThemeMode themeMode;
    SetAutoThemeAction(this.themeMode);
}
