import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsline_app/widget/card_new_line.dart';

import '../../../common/modal/new_modal.dart';
import '../../../common/utils/simulated_data.dart';
import '../../../widget/card_new_large.dart';

class MyCreation extends StatefulWidget {
    const MyCreation({super.key});

    @override
    MyCreationState createState() => MyCreationState();
}

class MyCreationState extends State<MyCreation> {

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

    @override
    Widget build(BuildContext context) {
        return SliverPadding(
            padding: EdgeInsets.only(
                top: 12.w,
                left: 24.w,
                right: 24.w,
                bottom: 24.w
            ),
            sliver: SliverList.separated(
                itemCount: _newsList.length,
                separatorBuilder: (context, index) {
                    return SizedBox(height: 24.w,);
                },
                itemBuilder: (context, index) {
                    return WidgetCardNewLine(news: _newsList[index]);
                },
            )
        );
    }
}