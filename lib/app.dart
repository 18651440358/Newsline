import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'common/config/home_tabbar_config.dart';

class AppPage extends StatefulWidget {
    const AppPage({super.key});

    @override
    AppPageState createState() => AppPageState();
}

class AppPageState extends State {

    // 底部导航
    late List<BottomNavigationBarItem> _list;
    // 导航当前指向
    int _currentIndex = 0;

    @override
    void initState() {
        super.initState();

        _handleRenderBottomNavigationBarList();
    }

    // 初始化底部导航
    _handleRenderBottomNavigationBarList() {
        if(mounted){
            setState(() {
                _list = [];
            });
        }

        for(var i = 0; i < WidgetHomeTabbar.TABBAR_LIST.length; i ++){
            _list.add(BottomNavigationBarItem(
                label: WidgetHomeTabbar.TABBAR_LIST[i]['label'],
                icon: WidgetHomeTabbar.TABBAR_LIST[i]['normal'],
                activeIcon: WidgetHomeTabbar.TABBAR_LIST[i]['prossed']
            ));
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: WidgetHomeTabbar.renderCurrentPage(_currentIndex),
            bottomNavigationBar: 
                BottomNavigationBar(
                    selectedFontSize: 12,
                    type: BottomNavigationBarType.fixed,
                    onTap: (value) {
                        HapticFeedback.mediumImpact();
                        if(mounted){
                            setState(() {
                                _currentIndex = value;
                            });
                        }
                    },
                    currentIndex: _currentIndex,
                    items: _list
                )
        );
    }
}