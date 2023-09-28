import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_config.dart';

class ThemeConfig {
    static ThemeData light = ThemeData(
        popupMenuTheme: PopupMenuThemeData(
            elevation: 1.w,
            color: Color.fromARGB(251, 251, 251, 251)
        ),
        tabBarTheme: TabBarTheme(
            labelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600
            ),
            labelColor: ColorsConfig.OTHERS['White'],
            unselectedLabelColor:ColorsConfig.GREYSCALE[900],
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(42.w),
                color: ColorsConfig.MAIN['Primary'],
            ),
            indicatorColor: ColorsConfig.MAIN['Primary'],
        ),
        iconTheme: IconThemeData(
            color: ColorsConfig.GREYSCALE[900],
        ),
        splashColor: ColorsConfig.GREYSCALE[300],
        dividerColor: ColorsConfig.GREYSCALE[300],
        textTheme: TextTheme(
            labelLarge: TextStyle(
                fontSize: ScreenUtil().setSp(16),
                color: ColorsConfig.MAIN['Primary'],
                fontWeight: FontWeight.w700
            ),
            titleLarge: TextStyle(
                fontSize: ScreenUtil().setSp(24),
                color: ColorsConfig.GREYSCALE[900],
                fontWeight: FontWeight.w900,
            ),
            titleMedium: TextStyle(
                fontSize: ScreenUtil().setSp(20),
                color: ColorsConfig.GREYSCALE[900],
                fontWeight: FontWeight.w900,
                height: 1.6,
            ),
            titleSmall: TextStyle(
                fontSize: ScreenUtil().setSp(22),
                color: ColorsConfig.GREYSCALE[900],
                height: 1.6,
                fontWeight: FontWeight.w700
            ),
            bodyMedium: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                color: ColorsConfig.GREYSCALE[700]
            ),
            bodySmall: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                color: ColorsConfig.GREYSCALE[700]
            ),
            labelSmall: TextStyle(
                fontSize: ScreenUtil().setSp(12),
                color: ColorsConfig.GREYSCALE[500],
                letterSpacing: ScreenUtil().setSp(0),
            ),
        ),
        scaffoldBackgroundColor: ColorsConfig.OTHERS['White'],
        primaryColor: ColorsConfig.MAIN['Primary'],
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            unselectedItemColor: ColorsConfig.GREYSCALE,
            selectedItemColor: ColorsConfig.MAIN['Primary'],
            backgroundColor: ColorsConfig.OTHERS['White']
        ),
    );

    static ThemeData dark = ThemeData(
        popupMenuTheme: const PopupMenuThemeData(
            elevation: 0,
            color:  Color(0xFF262A35),
        ),
        tabBarTheme: TabBarTheme(
            labelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600
            ),
            labelColor: ColorsConfig.OTHERS['White'],
            unselectedLabelColor: ColorsConfig.OTHERS['White'],
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(42.w),
                color: ColorsConfig.MAIN['Primary'],
            ),
            indicatorColor: ColorsConfig.MAIN['Primary'],
        ),
        iconTheme: IconThemeData(
            color: ColorsConfig.OTHERS['White']
        ),
        splashColor: ColorsConfig.DARKOLORS['Dark5'],
        dividerColor: ColorsConfig.DARKOLORS['Dark5'],
        primaryColor: ColorsConfig.MAIN['Primary'],
        scaffoldBackgroundColor: ColorsConfig.DARKOLORS['Dark1'],
        // backgroundColor: ColorsConfig.OTHERS['White'],
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: ColorsConfig.DARKOLORS['Dark1'],
            unselectedItemColor: ColorsConfig.GREYSCALE,
            selectedItemColor: ColorsConfig.MAIN['Primary'],
        ),
        textTheme: TextTheme(
            labelLarge: TextStyle(
                fontSize: ScreenUtil().setSp(16),
                color: ColorsConfig.MAIN['Primary'],
                fontWeight: FontWeight.w700
            ),
            titleLarge: TextStyle(
                fontSize: ScreenUtil().setSp(24),
                color: ColorsConfig.OTHERS['White'],
                fontWeight: FontWeight.w900,
            ),
            titleMedium: TextStyle(
                fontSize: ScreenUtil().setSp(20),
                color: ColorsConfig.GREYSCALE[300],
                fontWeight: FontWeight.w900
            ),
            titleSmall: TextStyle(
                fontSize: ScreenUtil().setSp(22),
                height: 1.6,
                color: ColorsConfig.GREYSCALE[300],
                fontWeight: FontWeight.w700
            ),
            bodyMedium: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                color: ColorsConfig.OTHERS['White']
            ),
            bodySmall: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                color: ColorsConfig.GREYSCALE[200]
            ),
            labelSmall: TextStyle(
                fontSize: ScreenUtil().setSp(12),
                color: ColorsConfig.GREYSCALE[400],
                letterSpacing: ScreenUtil().setSp(0),
            ),
        ),
    );

    // static TextStyle 
}