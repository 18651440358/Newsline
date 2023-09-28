import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/modal/new_modal.dart';
import '../common/utils/format.dart';

// ignore: must_be_immutable
class WidgetCardNewLine extends StatefulWidget {
    final News news;
    const WidgetCardNewLine({
        super.key,
        required this.news
    });

    @override
    WidgetCardNewLineState createState() => WidgetCardNewLineState();
}

class WidgetCardNewLineState extends State<WidgetCardNewLine> {

    // 左侧
    Widget _handleRenderLeft() {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
                Expanded(
                    child: _handleRenderTitle()
                ),
                _handleRenderAuthorInfo(),
                _handleRenderExtraInfo()
            ],
        );
    }

    // 右侧
    Widget _handleRenderRight() {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
                _handleRenderCover(),
                const Expanded(child: SizedBox()),
                _handleActionButton()
            ],
        );
    }

    // 渲染标题
    Widget _handleRenderTitle(){
        return Container(
            height: ScreenUtil().setWidth(115),
            child: Text(
                '${widget.news.title}',
                style: TextStyle(
                    color: Theme.of(context).textTheme.titleSmall?.color,
                    fontSize: ScreenUtil().setSp(18),
                    height: 1.6,
                    fontWeight: FontWeight.w700
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
            ),
        );
    }
    // 渲染封面
    Widget _handleRenderCover(){
        return Container(
            width: 120.w,
            height: 100.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.w),
                color: const Color(0xFFD9D9D9)
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
                widget.news.cover ?? 'Error',
                width: 120.w,
                height: 100.w,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                        'static/news/default.png',
                        width: 120.w,
                        height: 100.w,
                        fit: BoxFit.cover,
                    );
                },
            ),
        );
    }

    // 渲染作者
    Widget _handleRenderAuthorInfo(){

        return Container(
            height: 24.w,
            child: Row(
                children: [
                    // 作者
                    GestureDetector(
                        child: Container(
                            color: Colors.transparent,
                            child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                    Container(
                                        width: ScreenUtil().setWidth(24),
                                        height: ScreenUtil().setWidth(24),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(16)),
                                            color: const Color(0xFFD9D9D9)
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        child: Image.asset(
                                            widget.news.authorInfo?.portrait ?? 'Error',
                                            width: ScreenUtil().setWidth(24),
                                            height: ScreenUtil().setWidth(24),
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error, stackTrace) {
                                                return Image.asset(
                                                    'static/portrait/portrait.png',
                                                    width: ScreenUtil().setWidth(24),
                                                    height: ScreenUtil().setWidth(24),
                                                    fit: BoxFit.cover,
                                                );
                                            },
                                        ),
                                    ),
                                    SizedBox(width: ScreenUtil().setWidth(8),),
                                    Text(
                                        widget.news.authorInfo?.nickName ?? 'Newsline用户',
                                        style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                ],
                            ),
                        ),
                    ),
                ],
            ),
        );
    }

    // 渲染附加信息
    Widget _handleRenderExtraInfo() {

        // 渲染信息条目
        Widget handleRenderInfoItem({
            Widget? icon,
            required Widget content
            }){
            return Container(
                color: Colors.transparent,
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                        icon != null ? 
                        Container(
                            margin: EdgeInsets.only(
                                right: ScreenUtil().setWidth(5),
                            ),
                            width: ScreenUtil().setWidth(16),
                            height: ScreenUtil().setWidth(16),
                            child: Center(
                                child: icon,
                            ),
                        ) : const SizedBox(),
                        content
                    ],
                ),
            );
        }

        return Container(
            margin: EdgeInsets.only(
                top: ScreenUtil().setWidth(10)
            ),
            child: Row(
                children: [
                    // 发布时间
                    handleRenderInfoItem(
                        content: Text(
                            getComparedTime(widget.news.creation!),
                            style: Theme.of(context).textTheme.labelSmall,
                        )
                    ),
                    SizedBox(width: ScreenUtil().setWidth(15),),
                    // 访问人数
                    handleRenderInfoItem(
                        icon: Icon(
                            CupertinoIcons.eye,
                            size: ScreenUtil().setSp(16),
                            color: Theme.of(context).textTheme.labelSmall?.color
                        ),
                        content: Text(
                            formattedNumber(widget.news.visitsNum!),
                            style: Theme.of(context).textTheme.labelSmall,
                        )
                    ),
                    SizedBox(width: ScreenUtil().setWidth(15),),
                    // 评论数量
                    handleRenderInfoItem(
                        icon: Icon(
                            CupertinoIcons.text_bubble,
                            size: ScreenUtil().setSp(14),
                            color: Theme.of(context).textTheme.labelSmall?.color
                        ),
                        content: Text(
                            formattedNumber(widget.news.reviewNum!),
                            style: Theme.of(context).textTheme.labelSmall,
                        )
                    ),
                ],
            ),
        );
    }

    Widget _handleActionButton(){
        Widget handleRenderButton(Widget icon) {
            return GestureDetector(
                child: Container(
                    color: Colors.transparent,
                    width: ScreenUtil().setWidth(24),
                    height: ScreenUtil().setWidth(24),
                    child: Center(
                        child: icon,
                    )
                ),
            );
        }

        return Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                    // 分享
                    handleRenderButton(
                        Icon(
                            Boxicons.bx_share_alt,
                            size: ScreenUtil().setSp(14),
                            color: Theme.of(context).textTheme.titleSmall?.color
                        )
                    ),
                    SizedBox(width: ScreenUtil().setWidth(15),),
                    // 更多操作
                    handleRenderButton(
                        Icon(
                            CupertinoIcons.ellipsis_vertical,
                            size: ScreenUtil().setSp(18),
                            color: Theme.of(context).textTheme.bodySmall?.color
                        )
                    ),
                ],
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            child: Container(
                height: 150.w,
                color: Colors.transparent,
                child: Row(
                    children: [
                        Expanded(
                            child: _handleRenderLeft(),
                        ),
                        SizedBox(width: 14.w,),
                        _handleRenderRight()
                    ],
                ),
            ),
        );
    }
}