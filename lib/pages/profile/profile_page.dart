import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsline_app/pages/profile/widget/my_creation.dart';

import '../../common/utils/show_toast.dart';
import 'widget/account_info.dart';
import 'widget/fixed_header.dart';
import 'widget/head_app_bar.dart';

class ProfilePage extends StatefulWidget {
    const ProfilePage({super.key});

    @override
    ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: CustomScrollView(
                slivers: [
                    // 状态栏顶部遮挡
                    const FixedHeader(),
                    // 顶部AppBar
                    const HeadAppBar(),
                    // 账户信息
                    const AccountInfo(),
                    // 刷新页面
                    CupertinoSliverRefreshControl(
                        onRefresh: () async {
                            //模拟网络请求
                            await Future.delayed(Duration(milliseconds: 1000));
                            AppShowToast(
                                '请求成功!', 
                                // icon: CupertinoIcons.checkmark_alt,
                            );
                            //结束刷新
                            return Future.value(true);
                        },
                    ),
                    // 我的作品
                    const MyCreation()
                ],
            )
        );
    }
}