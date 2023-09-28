
import 'package:newsline_app/common/redux/states/user_state.dart';
import 'package:redux/redux.dart';

import '../../modal/user_modal.dart';
import '../reducers/use_reducers.dart';
import 'package:dart_mock/dart_mock.dart' as mock;

final store = Store<UserState>( 
    reducers,
    initialState: UserState(
        // user: User(),
        // isLogin: false
        user: User(
            nickName: 'RabbitDoomsday',
            code: 'rabbit_doomsday',
            brief: mock.sentence(),
            followNum: mock.integer(min: 10, max: 99999),
            collectNum: mock.integer(min: 10, max: 9999),
            bookmarkNum: mock.integer(min: 10, max: 9999),
        ),
        isLogin: true
    )
);