import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/modal/new_modal.dart';
import '../../../common/modal/type_modal.dart';
import '../../../common/utils/simulated_data.dart';
import '../../../widget/card_new_line.dart';
import '../../../widget/section_title.dart';

class LatestNews extends StatefulWidget {
    const LatestNews({super.key});

    @override
    LatestNewsState createState() => LatestNewsState();
}

class LatestNewsState extends State<LatestNews> with TickerProviderStateMixin {

    // 新闻列表
    List<News> _newsList = [];
    // 新闻类型
    List<NewsType> _typeList = [];
    late TabController _controller;

    @override
    void initState() {
        // TODO: implement initState
        super.initState();
        if(mounted){
            setState(() {
                _typeList = typeList;
                _typeList.insert(0, NewsType(id: '0', title: '全部'));

                _newsList = [];
                
                List<News> _pool = [...newsList];
                for(int i = 0; i < 5; i++){
                    _newsList.add(_pool.removeAt(Random().nextInt(_pool.length)));
                }
            });
        }       
        _controller = TabController(length: _typeList.length, vsync: this);
    }

    // 渲染标题
    Widget _handleRenderTitle() {
        return Container(
            padding: EdgeInsets.only(
                top: ScreenUtil().setWidth(24),
                right: ScreenUtil().setWidth(24),
                left: ScreenUtil().setWidth(24),
            ),
            child: WidgetSectionTitle(
                title: '最新新闻',
                onTap: () {},
            ),
        );
    }

    // 渲染类型导航
    Widget _handleRenderTabbar(){
        return Container(
            margin: EdgeInsets.only(
                top: 20.w,
                bottom: 20.w
            ),
            child: TabBar(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                labelPadding: EdgeInsets.symmetric(horizontal: 20.w),
                isScrollable: true,
                controller: _controller,
                tabs: _typeList.map((e) => Tab(text: e.title, height: 42.w)).toList()
            ),
        );
    }

    // 渲染信息列表
    Widget _handleRenderNewsList() {
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                    return WidgetCardNewLine(news: _newsList[index],);
                }, 
                separatorBuilder: (context, index) {
                    return SizedBox(height: 20.w,);
                }, 
                itemCount: _newsList.length
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return SliverToBoxAdapter(
            child: Column(
                children: [
                    _handleRenderTitle(),
                    _handleRenderTabbar(),
                    _handleRenderNewsList()
                ]
            )
        );
    }
}