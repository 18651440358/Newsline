import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsline_app/common/config/theme_config.dart';
import 'package:newsline_app/common/redux/states/theme_state.dart';
import 'package:newsline_app/app.dart';
import 'package:newsline_app/common/redux/store/index.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'common/utils/android_back_desktop.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bot_toast/bot_toast.dart';

void main() {
    runApp(const MyApp());
}

class MyApp extends StatefulWidget {
    const MyApp({super.key});

    @override
    MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

    @override
    void initState() {
        // TODO: implement initState
        super.initState();
        
        // 检查状态栏颜色
        handleRenderStatusBar();
        // ignore: deprecated_member_use
        var window = WidgetsBinding.instance.window;
        window.onPlatformBrightnessChanged = () {
            handleRenderStatusBar();
        };
    }

    // 检查状态栏颜色
    handleRenderStatusBar(){
        var window = WidgetsBinding.instance!.window;
        var brightness = window.platformBrightness;
        if (brightness == Brightness.dark){
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
        } else {
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
        }
    }

    @override
    Widget build(BuildContext context) {
        return WillPopScope(
            onWillPop: AndroidBackDesktop.backToDesktop,
            child: StoreProvider(
                store: store,
                child: StoreBuilder<ThemeState>(
                    builder: (BuildContext context, Store<ThemeState> store){
                        return ScreenUtilInit(
                            minTextAdapt: true,
                            splitScreenMode: true,
                            designSize: const Size(430, 932),
                            // minTextAdapt: true,
                            // splitScreenMode: true,
                            builder: (context , child) {
                                return MaterialApp(
                                    themeMode: store.state.themeMode,
                                    title: 'Newsline',
                                    builder: BotToastInit(),
                                    theme: ThemeConfig.light,
                                    darkTheme: ThemeConfig.dark,
                                    home: child,
                                );
                            },
                            child: const AppPage(),
                        );
                    }
                )
            )
        );
    }
}