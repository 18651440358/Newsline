import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/modal/new_modal.dart';
import '../common/utils/format.dart';

class WidgetCardNewLarge extends StatefulWidget {
    final News news;
    const WidgetCardNewLarge({
        super.key,
        required this.news
    });

    @override
    WidgetCardNewLargeState createState() => WidgetCardNewLargeState();
}

class WidgetCardNewLargeState extends State<WidgetCardNewLarge> {

    // 渲染封面
    Widget _handleRenderCover(){
        return Container(
            height: 200.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
                color: const Color(0xFFD9D9D9)
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
                widget.news.cover ?? 'Error',
                width: ScreenUtil().setWidth(280),
                height: 200.w,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                        'static/news/default.png',
                        width: ScreenUtil().setWidth(280),
                        height: ScreenUtil().setWidth(200),
                        fit: BoxFit.cover,
                    );
                },
            ),
        );
    }

    // 渲染标题
    Widget _handleRenderTitle(){
        return Container(
            height: ScreenUtil().setWidth(120),
            padding: EdgeInsets.only(
                top: ScreenUtil().setWidth(8),
                bottom: ScreenUtil().setWidth(8),
            ),
            child: Text(
                '${widget.news.title}',
                style: Theme.of(context).textTheme.titleSmall,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
            ),
        );
    }
    // 渲染作者
    Widget _handleRenderAuthorInfo(){

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

        PopupMenuItem handleRenderPopupMenuDivider() {
            return PopupMenuItem(
                height: 1.w,
                enabled: false,
                padding: EdgeInsets.zero,
                child: Container(
                    height: 1.w,
                    color: Theme.of(context).dividerColor, 
                )
            ); 
        }

        PopupMenuItem handleRenderPopupMenuItem({
            required IconData icon,
            required String text,
            required String data
            }) {
            return PopupMenuItem(
                value: data,
                child: Row(
                    children: [
                        SizedBox(
                            width: 24.w,
                            height: 24.w,
                            child: Icon(
                                icon,
                                size: 22.sp,
                                color: Theme.of(context).textTheme.titleLarge?.color,
                            ),
                        ),
                        SizedBox(width: 12.w,),
                        Text(
                            text,
                            style: TextStyle(
                                color: Theme.of(context).textTheme.titleLarge?.color,
                                fontSize: 14.sp
                            ),
                        )
                    ],
                ),
            );
        }

        return Container(
            height: 24.w,
            margin: EdgeInsets.only(
                top: 10.w,
                bottom: 5.w
            ),
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
                    const Expanded(child: SizedBox()),
                    // 分享
                    handleRenderButton(
                        Icon(
                            Boxicons.bx_share_alt,
                            size: ScreenUtil().setSp(18),
                            color: Theme.of(context).textTheme.titleSmall?.color
                        )
                    ),
                    SizedBox(width: ScreenUtil().setWidth(15),),
                    // 更多操作
                    PopupMenuButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.w))),
                        offset: Offset(0, 28.w),
                        itemBuilder: (context) {
                            return [
                                handleRenderPopupMenuItem(
                                    data: 'bookmark',
                                    text: '添加书签',
                                    icon: CupertinoIcons.bookmark
                                ),
                                handleRenderPopupMenuDivider(),
                                handleRenderPopupMenuItem(
                                    data: 'not_interested',
                                    text: '不感兴趣',
                                    icon: CupertinoIcons.multiply_square 
                                ),
                                handleRenderPopupMenuDivider(),
                                handleRenderPopupMenuItem(
                                    data: 'report',
                                    text: '举报',
                                    icon: CupertinoIcons.exclamationmark_circle 
                                ),
                            ];
                        },
                        child: handleRenderButton(
                            Icon(
                                CupertinoIcons.ellipsis_vertical,
                                size: ScreenUtil().setSp(24),
                                color: Theme.of(context).textTheme.bodySmall?.color
                            )
                        ),
                    )
                    
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

    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            child: Container(
                color: Colors.transparent,
                width: ScreenUtil().setWidth(280),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                        _handleRenderCover(),
                        _handleRenderTitle(),
                        _handleRenderAuthorInfo(),
                        _handleRenderExtraInfo()
                    ],
                ),
            ),
        );
    }
}