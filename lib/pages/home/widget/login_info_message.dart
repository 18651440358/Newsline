import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsline_app/common/config/colors_config.dart';
import 'package:redux/redux.dart';

import 'package:badges/badges.dart' as badges;
import '../../../common/redux/states/user_state.dart';
import '../../../common/redux/store/user_store.dart';

class LoginInfoMessage extends StatefulWidget {
    const LoginInfoMessage({super.key});

    @override
    LoginInfoMessageState createState() => LoginInfoMessageState();
}

class LoginInfoMessageState extends State<LoginInfoMessage> {

    @override
    void initState(){
        super.initState();
    }

    @override
    Widget build(BuildContext context) {
        return SliverPersistentHeader(
            delegate: LoginInfoMessageDelegate(
                height: 80.w,
            ),
            floating: true,
        );
    }
}

class LoginInfoMessageDelegate extends SliverPersistentHeaderDelegate {

    double height;
    LoginInfoMessageDelegate({
        required this.height
    });

     @override
    Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

        // 有登陆状态
        Widget _handleRenderLoginStatus(Store<UserState> store){
            return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                    // 头像
                    Container(
                        width: ScreenUtil().setWidth(56),
                        height: ScreenUtil().setWidth(56),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(56)),
                            color: const Color(0xFFD9D9D9)
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                            store.state.user.portrait ?? 'Error',
                            width: ScreenUtil().setWidth(56),
                            height: ScreenUtil().setWidth(56),
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                                return Image.asset( 
                                    'static/portrait/portrait.png',
                                    width: ScreenUtil().setWidth(56),
                                    height: ScreenUtil().setWidth(56),
                                    fit: BoxFit.cover
                                );
                            },
                        ),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(16),),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(
                                    '欢迎回来 👋',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: ScreenUtil().setWidth(3),),
                                Text(
                                    store.state.user.nickName!,
                                    style: Theme.of(context).textTheme.titleSmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                ),
                            ],
                        ),
                    )
                ],
            );
        }

        // 无登陆状态
        Widget _handleRenderLogoutStatus(){
            return GestureDetector(
                onTap: () {},
                child: Container(
                    color: Colors.transparent,
                    child: Row(
                        children: [
                            Container(
                                width: ScreenUtil().setWidth(56),
                                height: ScreenUtil().setWidth(56),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(ScreenUtil().setWidth(56)),
                                    color: Theme.of(context).splashColor,
                                ),
                                clipBehavior: Clip.antiAlias,
                            ),
                            SizedBox(width: ScreenUtil().setWidth(16),),
                            Expanded(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(
                                            '点击登录',
                                            style: Theme.of(context).textTheme.bodyMedium,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                            '登录Newsline账户',
                                            style: Theme.of(context).textTheme.titleSmall,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                        ),
                                    ],
                                ),
                            )
                        ],
                    ),
                ),
            );
        }

        // 消息跳转按钮
        Widget _handleRenderMessageButton(){
            return Container(
                width: ScreenUtil().setWidth(52),
                height: ScreenUtil().setWidth(52),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ScreenUtil().setWidth(52)),
                    border: Border.all(
                        color: Theme.of(context).dividerColor,
                    )
                ),
                clipBehavior: Clip.antiAlias,
                child: Center(
                    child: badges.Badge(
                        badgeStyle: badges.BadgeStyle(
                            padding: EdgeInsets.all(ScreenUtil().setSp(4)),
                            badgeColor: ColorsConfig.ALERT_STATUS['Error']
                        ),
                        position: badges.BadgePosition.topEnd(
                            top: ScreenUtil().setSp(3), 
                            end: ScreenUtil().setSp(3), 
                        ),
                        ignorePointer: true,
                        child: Icon(
                            CupertinoIcons.bell,
                            size: ScreenUtil().setSp(28),
                        ),
                    ),
                ),
            );
        }

        return Container(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(24),
                right: ScreenUtil().setWidth(24),
                top: ScreenUtil().setWidth(12),
            ),
            child: StoreProvider(
                store: store,
                child: StoreBuilder<UserState>(
                    builder: (BuildContext context, Store<UserState> store){
                        return Row(
                            children: [
                                Expanded(
                                    child: store.state.isLogin ?
                                    _handleRenderLoginStatus(store) :
                                    _handleRenderLogoutStatus()
                                ),
                                SizedBox(width: ScreenUtil().setWidth(16),),
                                _handleRenderMessageButton()
                            ],
                        );
                    }
                )
            )
        );
    }

    @override
    // TODO: implement maxExtent
    double get maxExtent => height;

    @override
    // TODO: implement minExtent
    double get minExtent => height;

    @override
    bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
        return true;
    }
}