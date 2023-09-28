import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import '../actions/theme_action.dart';
import '../states/theme_state.dart';

// ignore: non_constant_identifier_names
final ThemeStateReducer = combineReducers<ThemeState>([
    TypedReducer<ThemeState, SetLightThemeAction>(_setLightTheme),
    TypedReducer<ThemeState, SetDarkThemeAction>(_setDarkTheme),
    TypedReducer<ThemeState, SetAutoThemeAction>(_setAutoTheme),
]);

ThemeState _setLightTheme(ThemeState state, SetLightThemeAction action) => ThemeState(ThemeMode.light);
ThemeState _setDarkTheme(state, action) => ThemeState(ThemeMode.dark);
ThemeState _setAutoTheme(state, action) => ThemeState(ThemeMode.system);

ThemeState reducers(ThemeState state, action){
    return ThemeStateReducer(state, action);
}