package com.example.newsline_app

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {

    //通讯名称，回到手机桌面
    private final String CHANNEL = "android/back/desktop";
    //返回手机桌面事件
    static final String eventBackDesktop = "backDesktop";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        initBackToDesktop();
    }

    //注册返回到手机桌面事件
    private void initBackToDesktop() {
        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                        if (methodCall.method.equals(eventBackDesktop)) {
                            moveTaskToBack(false);
                            result.success(true);
                        }
                    }
                }
        );
    }
}
