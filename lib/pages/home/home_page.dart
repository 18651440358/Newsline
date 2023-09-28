import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/utils/show_toast.dart';
import 'widget/fixed_header.dart';
import 'widget/latest_news.dart';
import 'widget/login_info_message.dart';
import 'widget/trending_news.dart';

class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    HomePageState createState() => HomePageState();
}

class HomePageState extends State {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: CustomScrollView(
                slivers: [
                    // 状态栏顶部遮挡
                    const FixedHeader(),
                    // 顶部登陆状态
                    const LoginInfoMessage(),
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
                    
                    // 热门新闻
                    const TrendingNews(),
                    // 最新的新闻
                    const LatestNews(),
                    const SliverToBoxAdapter(child: SizedBox(height: 30,),)
                ],
            )
        );
    }
}