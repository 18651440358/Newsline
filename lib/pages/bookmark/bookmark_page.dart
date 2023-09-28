import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/utils/show_toast.dart';
import 'widget/bookmark_tabbar.dart';
import 'widget/fixed_header.dart';
import 'widget/head_app_bar.dart';
import 'widget/news_list.dart';

class BookmarkPage extends StatefulWidget {
    const BookmarkPage({super.key});

    @override
    BookmarkPageState createState() => BookmarkPageState();
}

class BookmarkPageState extends State<BookmarkPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: CustomScrollView(
                slivers: [
                    // 状态栏顶部遮挡
                    const FixedHeader(),
                    // 顶部AppBar
                    const HeadAppBar(),
                    // 标签
                    const BookmarkTabbar(),
                    // 刷新页面
                    CupertinoSliverRefreshControl(
                        onRefresh: () async {
                            //模拟网络请求
                            await Future.delayed(const Duration(milliseconds: 1000));
                            AppShowToast(
                                '请求成功!', 
                                // icon: CupertinoIcons.checkmark_alt,
                            );
                            //结束刷新
                            return Future.value(true);
                        },
                    ),
                    // 新闻列表
                    const NewsList()
                ],
            )
        );
    }
}