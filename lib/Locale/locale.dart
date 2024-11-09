import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "1": "الصفحة الرئيسية",
          "2": "الإنكليزية",
          "3": "العربية",
          "4": "تسجيل",
          "5": "تسجيل الدخول",
          "6": "مرحباً",
          "7": "قم بتسجيل الدخول للمتابعة",
          "8": "بريد إلكتروني",
          "9": "كلمة المرور",
          "10": "هل نسيت كلمة السر؟",
          "11": "-أو-",
          "12": "سجيل الدخول باستخدام جوجل",
          "13": "سجيل الدخول باستخدام الفيسبوك",
          "14": "الاسم الكامل",
          "15": "الفئات",
        },
        "en": {
          "1": "Home Page",
          "2": "English",
          "3": "Arabic",
          "4": "Sign Up",
          "5": "Sign In",
          "6": "Welcome,",
          "7": "Sign in to Continue",
          "8": "Email",
          "9": "Password",
          "10": "Forgot Password?",
          "11": "-OR-",
          "12": "Sign In with Google",
          "13": "Sign In with Facebook",
          "14": "Full Name",
          "15": "Categories",
        },
      };
}
