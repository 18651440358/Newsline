import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:newsline_app/common/modal/user_modal.dart';
import 'package:redux/redux.dart';

import '../../../common/redux/states/user_state.dart';
import '../../../common/redux/store/user_store.dart';

class AccountInfo extends StatefulWidget {
    const AccountInfo({super.key});

    @override
    AccountInfoState createState() => AccountInfoState();
}

class AccountInfoState extends State<AccountInfo> {

    @override
    Widget build(BuildContext context) {
        return SliverPersistentHeader(
            floating: true,
            delegate: AccountInfoDelegate(
                height: 290.w
            ),
        );
    }
}

class AccountInfoDelegate extends SliverPersistentHeaderDelegate {

    double height;

    AccountInfoDelegate({
        required this.height
    });

    @override
    Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

        // 渲染头像&昵称
        Widget handleRenderPortraitAndNickName(User user) {

            // 渲染按钮
            Widget handleRenderButton(){
                return GestureDetector(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(34.w),
                            border: Border.all(
                                color: Theme.of(context).dividerColor
                            )
                        ),
                        child: Text(
                            '编辑',
                            style: Theme.of(context).textTheme.bodyMedium
                        ),
                    ),
                );
            }

            // 渲染用户信息
            Widget handleRenderUserInfo(){

                // 渲染头像
                Widget handleRenderPortrait(){
                    return Container(
                        width: 64.w,
                        height: 64.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(64.w),
                            color: const Color(0xFFD9D9D9)
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                            user.portrait ?? 'Error',
                            width: 64.w,
                            height: 64.w,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                    'static/portrait/portrait.png',
                                    width: 64.w,
                                    height: 64.w,
                                    fit: BoxFit.cover
                                );
                            },
                        ),
                    );
                }

                // 渲染昵称信息
                Widget handleRenderInfo(){
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(
                                '${user.nickName}',
                                style: TextStyle(
                                    color: Theme.of(context).textTheme.titleMedium?.color,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w800,
                                    height: 1.6
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 2.w,),
                            Text(
                                '@${user.code}',
                                style: Theme.of(context).textTheme.bodySmall,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                            ),
                        ],
                    );
                }

                return Container(
                    child: Row(
                        children: [
                            handleRenderPortrait(),
                            SizedBox(width: 16.w,),
                            Expanded(
                                child: handleRenderInfo()
                            )
                        ],
                    ),
                );
            }

            return Container(
                height: 64.w,
                child: Row(
                    children: [
                        Expanded(
                            child: handleRenderUserInfo()
                        ),
                        SizedBox(width: 15.w,),
                        handleRenderButton()
                    ],
                ),
            );
        }

        // 未登录
        Widget handleRenderNotLogin(){

            // 渲染按钮
            Widget handleRenderButton(){
                return GestureDetector(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(34.w),
                            border: Border.all(
                                color: Theme.of(context).dividerColor
                            )
                        ),
                        child: Text(
                            '编辑',
                            style: Theme.of(context).textTheme.bodyMedium
                        ),
                    ),
                );
            }

            // 渲染用户信息
            Widget handleRenderUserInfo(){

                // 渲染头像
                Widget handleRenderPortrait(){
                    return Container(
                        width: 64.w,
                        height: 64.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(64.w),
                            color: const Color(0xFFD9D9D9)
                        ),
                        clipBehavior: Clip.antiAlias,
                    );
                }

                // 渲染昵称信息
                Widget handleRenderInfo(){
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(
                                '登录到Newsline',
                                style: TextStyle(
                                    color: Theme.of(context).textTheme.titleMedium?.color,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700,
                                    height: 1.6
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5.w,),
                            Text(
                                '点击登录到Newsline以解锁更多',
                                style: Theme.of(context).textTheme.bodySmall,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                            ),
                        ],
                    );
                }

                return Container(
                    child: Row(
                        children: [
                            handleRenderPortrait(),
                            SizedBox(width: 16.w,),
                            Expanded(
                                child: handleRenderInfo()
                            )
                        ],
                    ),
                );
            }

            return Container(
                height: 64.w,
                child: Row(
                    children: [
                        Expanded(
                            child: handleRenderUserInfo()
                        ),
                        SizedBox(width: 15.w,),
                        handleRenderButton()
                    ],
                ),
            );
        }

        // 渲染简介
        Widget handleRenderUserBrief(User user) {
            return Container(
                height: 80.w,
                margin: EdgeInsets.only(
                    top: 12.w,
                    bottom: 10.w
                ),
                child: Text(
                    user.brief ?? '暂无简介',
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                        fontSize: 16.sp,
                        height: 1.6,
                        letterSpacing: 0.2.sp
                    ),
                    maxLines: 3,
                ),
            );
        }

        // 渲染附加信息
        Widget handleRenderExtraInfo(User user){

            // 渲染节点
            Widget handleRenderItem({
                required int num,
                required String title
                }) {
                return Expanded(
                    child: GestureDetector(
                        child: Container(
                            margin: EdgeInsets.only(
                                top: 10.w
                            ),
                            height: 70.w,
                            color: Colors.transparent,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                    Text(
                                        num <= 9999 ?
                                        NumberFormat.decimalPatternDigits().format(num) :
                                        NumberFormat.compact().format(num),
                                        style: Theme.of(context).textTheme.titleSmall,
                                    ),
                                    SizedBox(height: 8.w,),
                                    Text(
                                        title,
                                        style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                ],
                            ),
                        ),
                    )
                );
            }

            Widget handleRenderDivider(){
                return Container(
                    width: 1.w,
                    height: 70.w,
                    margin: EdgeInsets.symmetric(
                        horizontal: 12.w
                    ),
                    color: Theme.of(context).dividerColor,
                );
            }

            return Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        handleRenderItem(title: '收藏', num: user.collectNum!),
                        handleRenderDivider(),
                        handleRenderItem(title: '关注数', num: user.followNum!),
                        handleRenderDivider(),
                        handleRenderItem(title: '书签', num: user.bookmarkNum!),
                    ],
                ),
            );
        }

        return StoreProvider(
            store: store,
            child: StoreBuilder<UserState>(
                builder: (BuildContext context, Store<UserState> store){
                    return Container(
                        height: height,
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 12.w
                        ),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                                // 渲染用户头像、昵称等
                                store.state.isLogin ?
                                handleRenderPortraitAndNickName(store.state.user) :
                                handleRenderNotLogin(),
                                // 渲染用户简介
                                handleRenderUserBrief(store.state.user),
                                // 附加信息
                                handleRenderExtraInfo(store.state.user),
                                Divider(color: Theme.of(context).dividerColor,)
                            ],
                        )
                    );
                }
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