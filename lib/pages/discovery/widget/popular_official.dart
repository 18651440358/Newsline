import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/modal/user_modal.dart';
import '../../../common/utils/simulated_data.dart';
import '../../../widget/card_user.dart';
import '../../../widget/section_title.dart';

class PopularOfficial extends StatefulWidget {
    const PopularOfficial({super.key});

    @override
    PopularOfficialState createState() => PopularOfficialState();
}

class PopularOfficialState extends State<PopularOfficial> {

    // 用列表
    List<User> _userList = [];

    @override
    void initState() {
        // TODO: implement initState
        super.initState();

        _userList = userList.where((element) => element.official == 1).toList();
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
                title: '最热官媒榜',
                onTap: () {},
            ),
        );
    }

       // 渲染列表
    Widget _handleRenderNewsList() {
        return SizedBox(
            height: ScreenUtil().setWidth(145),
            child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                itemCount: _userList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                    return UserCard(user: _userList[index],);
                }, 
                separatorBuilder: (BuildContext context, int index) { 
                    return SizedBox(width: ScreenUtil().setWidth(26));
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