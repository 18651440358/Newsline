import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/colors_config.dart';

void AppShowToast(String text, {
        IconData? icon,
        Duration? duration = const Duration(seconds: 1)
    }){
    BotToast.showCustomText(
        align: Alignment.center,
        duration: duration,
        toastBuilder: (cancelFunc) {
            return Container(
                padding: EdgeInsets.only(
                    left: icon != null ? 16.w : 30.w,
                    right: 30.w,
                    bottom: 10.w,
                    top: 10.w
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    border: Border.all(
                        color: ColorsConfig.MAIN['Primary'],
                        width: 2.w
                    ),
                    color: ColorsConfig.BACKGROUND['Teal']
                ),
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                        icon != null ?
                        Container(
                            margin: EdgeInsets.only(right: 5.w),
                            width: 32.w,
                            height: 32.w,
                            child: Center(
                                child: Icon(
                                    icon,
                                    size: 24.sp,
                                    color: ColorsConfig.MAIN['Primary'],
                                ),
                            ),
                        ) : const SizedBox(),
                        Text(
                            '刷新完成',
                            style: TextStyle(
                                color: ColorsConfig.MAIN['Primary'],
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp
                            ),
                        ),
                    ],
                )
                
            );
        },
    );
}