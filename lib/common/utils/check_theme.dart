import 'package:flutter/material.dart';
import 'package:newsline_app/common/config/theme_config.dart';
import 'package:redux/redux.dart';

import '../redux/states/theme_state.dart';

ThemeData getTargetColor(Store<ThemeState> store){
    return store.state.themeMode == ThemeMode.dark ? ThemeConfig.dark : ThemeConfig.light;
}