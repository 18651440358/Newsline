import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsline_app/widget/card_new_line.dart';

import '../../../common/modal/new_modal.dart';
import '../../../common/utils/simulated_data.dart';

class NewsList extends StatefulWidget {
    const NewsList({super.key});

    @override
    NewsListState createState() => NewsListState();
}

class NewsListState extends State<NewsList> {

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
                for(int i = 0; i < newsList.length; i++){
                    _newsList.add(_pool.removeAt(Random().nextInt(_pool.length)));
                }
            });
        }   
    }

    @override
    Widget build(BuildContext context) {
        return SliverPadding(
            padding: EdgeInsets.only(
                left: 24.w, 
                right: 24.w, 
                bottom: 12.w
            ),
            sliver: SliverList.separated(
                itemCount: _newsList.length,
                itemBuilder: (context, index) {
                    return WidgetCardNewLine(news: _newsList[index]);
                }, 
                separatorBuilder: (context, index) {
                    return SizedBox(height: 20.w,);
                },
            )
        );
    }
}