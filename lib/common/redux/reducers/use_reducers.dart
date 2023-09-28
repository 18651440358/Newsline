import 'package:redux/redux.dart';

import '../../modal/user_modal.dart';
import '../../redux/states/user_state.dart';
import '../actions/user_action.dart';

// ignore: non_constant_identifier_names
final UserStateReducer = combineReducers<UserState>([
    TypedReducer<UserState, HandleUserLogin>(_handleUserLogin),
    TypedReducer<UserState, HandleUserLogOut>(_handleUserLogOut),
]);

// 登录
UserState _handleUserLogin(UserState state, HandleUserLogin action) {
    state.user = action.user;
    state.isLogin = true;
    return state;
}
// 登出
UserState _handleUserLogOut(UserState state, HandleUserLogOut action) {
    state.user = User();
    state.isLogin = false;
    return state;
}

UserState reducers(UserState state, action){
    return UserStateReducer(state, action);
}