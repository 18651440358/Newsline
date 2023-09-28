import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsline_app/common/config/colors_config.dart';

import '../../../common/modal/type_modal.dart';
import '../../../common/utils/simulated_data.dart';

class BookmarkTabbar extends StatefulWidget {
    const BookmarkTabbar({super.key});

    @override
    BookmarkTabbarState createState() => BookmarkTabbarState();
}

class BookmarkTabbarState extends State<BookmarkTabbar> with TickerProviderStateMixin {

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
            });
        }
        _controller = TabController(length: _typeList.length, vsync: this);
    }

    @override
    Widget build(BuildContext context) {
        return SliverPersistentHeader(
            delegate: BookmarkTabbarDelegate(
                height: 67.w,
                controller: _controller,
                typeList: _typeList
            ),
            floating: true,
        );
    }
}

class BookmarkTabbarDelegate extends SliverPersistentHeaderDelegate {

    double height;
    TabController controller;
    List<NewsType> typeList;

    BookmarkTabbarDelegate({
        required this.height,
        required this.controller,
        required this.typeList
    });

    @override
    Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

        // 渲染增加按钮
        Widget handleRenderAddButton(){
            return GestureDetector(
                child: Container(
                    width: 43.w,
                    height: 43.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(43.w),
                        color: ColorsConfig.MAIN['Primary']
                    ),
                    child: Center(
                        child: Icon(
                            CupertinoIcons.plus,
                            color: Colors.white,
                            size: 20.sp,
                        ),
                    )
                ),
            );
        }

        return Container(
            padding: EdgeInsets.only(
                top: 12.w,
                bottom: 12.w,
                left: 24.w
            ),
            child: Row(
                children: [
                    handleRenderAddButton(),
                    SizedBox(width: 12.w,),
                    Expanded(
                        child: TabBar(
                            padding: EdgeInsets.only(right: 24.w),
                            labelPadding: EdgeInsets.symmetric(horizontal: 20.w),
                            isScrollable: true,
                            controller: controller,
                            tabs: typeList.map((e) => Tab(text: e.title, height: 42.w)).toList()
                        ),
                    )
                ],
            )
        );
    }

    @override
    // TODO: implement maxExtent
    double get maxExtent => height;

    @override
    // TODO: implement minExtent
    double get minExtent => height;

    @override
    bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
        return false;
    }
}