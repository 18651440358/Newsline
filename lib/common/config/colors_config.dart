import 'package:flutter/material.dart';

class ColorsConfig {
    static Map MAIN = {
        "Primary": const Color.fromRGBO(26, 153, 142, 1),
        "Secondary": const Color.fromRGBO(23, 107, 135, 1),
    };

    static Map ALERT_STATUS = {
        "Info": MAIN["Primary"],
        "Success": const Color.fromRGBO(18, 209, 142, 1),
        "Warning": const Color.fromRGBO(250, 204, 21, 1),
        "Error": const Color.fromRGBO(247, 85, 85, 1),
    };

    static MaterialColor GREYSCALE = MaterialColor(
        _GREYSCALE,
        const <int, Color>{
            50: Color(0xFFFAFAFA),
            100: Color(0xFFF5F5F5),
            200: Color(0xFFEEEEEE),
            300: Color(0xFFE0E0E0),
            400: Color(0xFFBDBDBD),
            500: Color(0xFF9E9E9E),
            600: Color(0xFF757575),
            700: Color(0xFF616161),
            800: Color(0xFF424242),
            900: Color(0xFF212121),
        }
    );
 
    static final int _GREYSCALE = 0xFF9E9E9E;


    static Map GRADIENTS = {
        "GradientTeal": LinearGradient(colors: [MAIN["Primary"]]),
        "GradientPurple": const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
                Color.fromRGBO(182, 88, 255, 1),
                Color.fromRGBO(150, 16, 255, 1),
            ]),
        "GradientRed": const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
                Color.fromRGBO(254, 110, 110, 1),
                Color.fromRGBO(254, 74, 74, 1),
            ]),
        "GradientBlue": const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
                Color.fromRGBO(78, 125, 255, 1),
                Color.fromRGBO(34, 93, 255, 1),
            ]),
        "GradientGreen": const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
                Color.fromRGBO(45, 234, 170, 1),
                Color.fromRGBO(24, 206, 146, 1),
            ]),
        "GradientBrown": const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
                Color.fromRGBO(172, 126,110, 1),
                Color.fromRGBO(164, 99, 77, 1),
            ]),
        "GradientYellow": const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
                Color.fromRGBO(255, 229, 128, 1),
                Color.fromRGBO(250, 204, 20, 1),
            ]),
        "GradientOrange": const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
                Color.fromRGBO(255, 187, 88, 1),
                Color.fromRGBO(248, 147, 0, 1),
            ]),
    };

    static Map DARKOLORS = {
        "Dark1": const Color(0xFF181A20),
        "Dark2": const Color(0xFF1E2025),
        "Dark3": const Color(0xFF1F222A),
        "Dark4": const Color(0xFF262A35),
        "Dark5": const Color(0xFF35383F),
    };

    static Map OTHERS = {
        "White": const Color.fromRGBO(255, 255, 255, 1),
    };

    static Map BACKGROUND = {
        "Teal": const Color.fromRGBO(240, 251, 250, 1),
        "Purple": const Color.fromRGBO(248, 240, 254, 1),
        "Red": const Color.fromRGBO(255, 243, 243, 1),
        "Blue": const Color.fromRGBO(243, 246, 255, 1),
        "Green": const Color.fromRGBO(237, 251, 247, 1),
        "Brown": const Color.fromRGBO(251, 246, 243, 1),
        "Yellow": const Color.fromRGBO(255, 252, 235, 1),
        "Orange": const Color.fromRGBO(255, 248, 238, 1),
    };

    static Map TRANSPARENT = {
        "Teal": const Color.fromRGBO(26, 153, 142, 0.08),
        "Purple": const Color.fromRGBO(150, 16, 255, 0.08),
        "Red": const Color.fromRGBO(255, 74, 74, 0.08),
        "Blue": const Color.fromRGBO(35, 93, 255, 0.08),
        "Green": const Color.fromRGBO(23, 206, 146, 0.08),
        "Brown": const Color.fromRGBO(164, 99, 77, 0.08),
        "Yellow": const Color.fromRGBO(255, 211, 0, 0.08),
        "Orange": const Color.fromRGBO(248, 147, 0, 0.08),
    };
}