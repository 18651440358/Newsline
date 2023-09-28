import 'package:flutter/cupertino.dart';
import 'package:newsline_app/pages/home/home_page.dart';

import '../../pages/bookmark/bookmark_page.dart';
import '../../pages/discovery/discovery_page.dart';
import '../../pages/profile/profile_page.dart';

class WidgetHomeTabbar {
    static final Image _ICON_HOME_NORAML = Image.asset('static/tabbar/home_noraml.png', width: 24, fit: BoxFit.cover);
    static final Image _ICON_HOME_PROSSED = Image.asset('static/tabbar/home_prossed.png', width: 24, fit: BoxFit.cover);
    static final Image _ICON_DISCOVERY_NORAML = Image.asset('static/tabbar/discovery_normal.png', width: 24, fit: BoxFit.cover);
    static final Image _ICON_DISCOVERY_PROSSED = Image.asset('static/tabbar/discovery_prossed.png', width: 24, fit: BoxFit.cover);
    static final Image _ICON_BOOKMARK_NORAML = Image.asset('static/tabbar/bookmark_normal.png', width: 24, fit: BoxFit.cover);
    static final Image _ICON_BOOKMARK_PROSSED = Image.asset('static/tabbar/bookmark_prossed.png', width: 24, fit: BoxFit.cover);
    static final Image _ICON_PROFILE_NORAML = Image.asset('static/tabbar/profile_normal.png', width: 24, fit: BoxFit.cover);
    static final Image _ICON_PROFILE_PROSSED = Image.asset('static/tabbar/profile_prossed.png', width: 24, fit: BoxFit.cover);

    static List<dynamic> TABBAR_LIST = [
        {
            "label": "首页",
            "normal": _ICON_HOME_NORAML,
            "prossed": _ICON_HOME_PROSSED
        },
        {
            "label": "探索",
            "normal": _ICON_DISCOVERY_NORAML,
            "prossed": _ICON_DISCOVERY_PROSSED
        },
        {
            "label": "书签",
            "normal": _ICON_BOOKMARK_NORAML,
            "prossed": _ICON_BOOKMARK_PROSSED
        },
        {
            "label": "我的",
            "normal": _ICON_PROFILE_NORAML,
            "prossed": _ICON_PROFILE_PROSSED
        },
    ];

    // 渲染当前选择页面
    static Widget renderCurrentPage(int index) {
        switch(index){
            case 0 : return const HomePage();
            case 1 : return const DiscoveryPage();
            case 2 : return const BookmarkPage();
            case 3: return const ProfilePage();
            default: return const HomePage();
        }
    }
}
