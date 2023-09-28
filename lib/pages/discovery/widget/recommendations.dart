import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/modal/new_modal.dart';
import '../../../common/utils/simulated_data.dart';
import '../../../widget/card_new_large.dart';
import '../../../widget/section_title.dart';

class Recommendations extends StatefulWidget {
    const Recommendations({super.key});

    @override
    RecommendationsState createState() => RecommendationsState();
}

class RecommendationsState extends State<Recommendations> {

    // 新闻列表
    List<News> _newsList = [];

    @override
    void initState() {
        // TODO: implement initState
        super.initState();
        if(mounted){
            setState(() {
                _newsList = [];
                
                List<News> _pool = [...newsList];
                for(int i = 0; i < 5; i++){
                    _newsList.add(_pool.removeAt(Random().nextInt(_pool.length)));
                }
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
                title: '根据您的偏好推荐',
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