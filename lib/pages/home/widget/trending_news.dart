import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsline_app/widget/card_new_large.dart';

import '../../../common/modal/new_modal.dart';
import '../../../widget/section_title.dart';
import '../../../common/utils/simulated_data.dart';

class TrendingNews extends StatefulWidget {
    const TrendingNews({super.key});

    @override
    TrendingNewsState createState() => TrendingNewsState();
}

class TrendingNewsState extends State<TrendingNews> {

    // 新闻列表
    List<News> _newsList = [];

    @override
    void initState() {
        // TODO: implement initState
        super.initState();
        if(mounted){
            setState(() {
                _newsList = newsList.sublist(0, 5);
            });
        }   
    }

    // 渲染标题
    Widget _handleRenderTitle() {
        return Container(
            padding: EdgeInsets.only(
                top: ScreenUtil().setWidth(24),
                right: ScreenUtil().setWidth(24),
                left: ScreenUtil().setWidth(24),
                
            ),
            margin: EdgeInsets.only(
                bottom: ScreenUtil().setWidth(10),
            ),
            child: WidgetSectionTitle(
                title: '热门新闻',
                onTap: () {},
            ),
        );
    }

    // 渲染列表
    Widget _handleRenderNewsList() {
        return SizedBox(
            height: ScreenUtil().setWidth(385),
            child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                itemCount: _newsList.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                    return SizedBox(width: ScreenUtil().setWidth(24),);
                },
                itemBuilder: (context, index) {
                    return WidgetCardNewLarge(news: _newsList[index]);
                },
            )
        );
    }

    @override
    Widget build(BuildContext context) {
        return SliverToBoxAdapter(
            child: Column(
                children: [
                    _handleRenderTitle(),
                    _handleRenderNewsList()
                ],
            ),
        );
    }
}