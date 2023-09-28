import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsline_app/common/config/colors_config.dart';

class FollowButton extends StatefulWidget {
    final Function onTap;
    final int following;

    const FollowButton({
        super.key,
        required this.onTap,
        this.following = 0
    });

    @override
    FollowButtonState createState() => FollowButtonState();
}

class FollowButtonState extends State<FollowButton> {
    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            onTap: () => widget.onTap,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(34.w),
                    border: Border.all(
                        color: widget.following == 0 ?
                            ColorsConfig.MAIN['Primary']:
                            Theme.of(context).dividerColor,
                    ),
                    color: widget.following == 0 ? ColorsConfig.MAIN['Primary'] : Colors.transparent
                ),
                child: Center(
                    child: Text(
                        widget.following == 0 ?  '关注' : '已关注',
                        style: TextStyle(
                            color: widget.following == 0 ?
                                ColorsConfig.OTHERS['White'] :
                                Theme.of(context).textTheme.bodyMedium?.color,
                            fontSize: 14.w
                        )
                            
                    ),
                ),
            ),
        );
    }
}