import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsline_app/pages/discovery/widget/popular_official.dart';

import '../../common/utils/show_toast.dart';
import '../home/widget/fixed_header.dart';
import 'widget/head_app_bar.dart';
import 'widget/popular_authors.dart';
import 'widget/recommendations.dart';
import 'widget/week_top_stories.dart';

class DiscoveryPage extends StatefulWidget {
    const DiscoveryPage({super.key});

    @override
    DiscoveryPageState createState() => DiscoveryPageState();
}

class DiscoveryPageState extends State<DiscoveryPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: CustomScrollView(
                slivers: [
                    // 状态栏顶部遮挡
                    const FixedHeader(),
                    // 顶部AppBar
                    const HeadAppBar(),
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
                    // 本周头条新闻
                    const WeekTopStories(),
                    // 最受欢迎的官方号
                    const PopularOfficial(),
                    // 最受欢迎的个人账户
                    const PopularAuthors(),
                    // 根据您的偏好推荐
                    const Recommendations(),
                    const SliverToBoxAdapter(child: SizedBox(height: 30,),)
                ],
            )
        );
    }
}