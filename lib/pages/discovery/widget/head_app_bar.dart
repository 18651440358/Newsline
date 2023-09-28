import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redux/redux.dart';

import '../../../common/redux/states/theme_state.dart';
import '../../../common/redux/store/index.dart';

class HeadAppBar extends StatefulWidget {
    const HeadAppBar({super.key});

    @override
    HeadAppBarState createState() => HeadAppBarState();
}

class HeadAppBarState extends State<HeadAppBar> {
    @override
    Widget build(BuildContext context) {
        return SliverPersistentHeader(
            // pinned: true,
            // floating: true,
            delegate: HeadAppBarDelegate(height: 72.w)
        );
    }
}


class HeadAppBarDelegate extends SliverPersistentHeaderDelegate {

    double height;

    HeadAppBarDelegate({
        required this.height
    });

    @override
    Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

        // 渲染Logo
        Widget handleRenderLogo(){
            return SizedBox(
                width: 28.w,
                height: 28.w,
                child: Center(
                    child: Image.asset(
                        'static/logo/logo.png',
                        width: 28.w,
                        height: 28.w,
                        fit: BoxFit.cover,
                    ),
                ),
            );
        }

        // 渲染标题
        Widget handleRenderTitle() {
            return Text(
                '发现新世界',
                style: Theme.of(context).textTheme.titleLarge,
            );
        }

        // 渲染按钮
        Widget handleRenderSearchButton(){
            return GestureDetector(
                child: Container(
                    color: Colors.transparent,
                    width: 28.w,
                    height: 28.w,
                    child: Icon(
                        CupertinoIcons.search,
                        size: 24.w,
                        color: Theme.of(context).textTheme.titleLarge?.color,
                    ),
                )
            );
        }

        return StoreProvider(
            store: store,
            child: StoreBuilder<ThemeState>(
                builder: (BuildContext context, Store<ThemeState> store){
                    return Container(
                        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
                        height: height,
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 12.w
                        ),
                        child: Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    handleRenderLogo(),
                                    handleRenderTitle(),
                                    handleRenderSearchButton()
                                ],
                            ),
                        ),
                    );
                }
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