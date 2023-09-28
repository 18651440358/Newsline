import '../../modal/user_modal.dart';

class UserState {
    User user;
    bool isLogin;

    UserState({
        required this.user,
        this.isLogin = false
    });
}