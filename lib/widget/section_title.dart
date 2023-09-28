import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsline_app/common/config/colors_config.dart';

class WidgetSectionTitle extends StatefulWidget {
    final String title;
    final Function onTap;
    const WidgetSectionTitle({
        super.key,
        required this.title,
        required this.onTap
    });

    @override
    WidgetSectionTitleState createState() => WidgetSectionTitleState();
}

class WidgetSectionTitleState extends State<WidgetSectionTitle> {
    @override
    Widget build(BuildContext context) {
        return Row(
            children: [
                Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleMedium,
                ),
                const Expanded(child: SizedBox()),
                TextButton(
                    onPressed: () => widget.onTap, 
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                            Text(
                                '查看更多',
                                style: Theme.of(context).textTheme.labelLarge
                            ),
                            SizedBox(width: ScreenUtil().setWidth(16)),
                            Icon(
                                CupertinoIcons.chevron_right,
                                color: ColorsConfig.MAIN['Primary'],
                                size: ScreenUtil().setSp(20),
                            )
                        ],
                    )
                )
            ],
        );
    }
}