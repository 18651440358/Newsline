import 'package:flutter/material.dart';
import 'package:newsline_app/common/redux/states/theme_state.dart';
import 'package:redux/redux.dart';

import '../reducers/theme_reducer.dart';

final store = Store<ThemeState>( 
    reducers,
    initialState: ThemeState(
        ThemeMode.system
    )
);