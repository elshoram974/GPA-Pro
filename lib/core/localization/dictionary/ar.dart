import 'package:gpa_pro/core/constants/privacy_policy/privacy_ar.dart';
import 'package:gpa_pro/core/constants/terms-conditions/terms_ar.dart';

import '../lang_constant.dart';

class ArDictionary {
  static final Map<String, String> _ar = {
    AppConstLang.cumulativeGPA: "المعدل التراكمي",
    //
    AppConstLang.grades: "التقديرات",
    AppConstLang.warning: "تحذير",
    AppConstLang.cancel: "إلغاء",
    AppConstLang.update: "تحديث",
    AppConstLang.notNow: "ليس الان",
    AppConstLang.noInternet: "لا يوجد اتصال بالإنترنت",
    AppConstLang.openInternetWhenAccountOpenedToAvoidErrorsOnServer:
        "يفضل الإتصال بالانترنت عند فتح الحساب لتجنب حدوث أخطاء في تخزين البيانات على الخادم",

    //
    AppConstLang.settings: "الإعدادات",
    // AppConstLang.home: "الرئيسية",
    AppConstLang.home: "الصفحة الرئيسية",
    AppConstLang.initialize: "التهيئة",
    AppConstLang.pressBackAgainExit: "إضغط مرة أخرى للخروج",

    AppConstLang.instructions: "إرشادات",
    AppConstLang.rememberEditGradesBeforeStart:
        " تذكر أن تقوم بتعديل نظام الدرجات قبل أن تبدأ!",

    //
    // AppConstLang.homePage: "الصفحة الرئيسية",
    // AppConstLang.initializePage: "صفحة التهيئة",
    // AppConstLang.settingsPage: "صفحة الإعدادات",
    // in initialize body
    AppConstLang.realizedHours: "ساعات محققة",
    AppConstLang.registeredHours: "ساعات مسجلة",
    AppConstLang.totalHours: "إجمالي الساعات",
    AppConstLang.realizedHoursNotCalculated: "ساعات محققة لم يتم حسابها",

    AppConstLang.empty: "فارغ",
    AppConstLang.thatNotCalcInCumulative: "تلك الغير محسوبة في التراكمي",
    //
    AppConstLang.editGrades: "تعديل التقديرات",
    AppConstLang.exampleInGrade:
        "مثال:- التقدير B .. معناه ان ال B بين ال 3 و 3.3 ",
    AppConstLang.grade: "التقدير",
    AppConstLang.totalGPA: "إجمالي التراكمي",
    AppConstLang.degree: "الدرجة",
    AppConstLang.color: "اللون",
    AppConstLang.edit: "تعديل",
    AppConstLang.reset: "إعادة تعيين",
    AppConstLang.saveChanges: "حفظ التغييرات",
    AppConstLang.dontSave: "لا تحفظ",
    AppConstLang.ifYouReturnChangesNotSaved: "إذا عدت ، فلن يتم حفظ التغييرات",
    AppConstLang.ifCancelBackChangesNotSaved:
        "إذا قمت بالإلغاء ، فلن يتم حفظ التغييرات",

    // in settings screen
    AppConstLang.changeMode: "تغيير وضع الجهاز",
    AppConstLang.pressToChange: "اضغط هنا لتغيير",
    AppConstLang.systemMode: "وضع النظام",
    AppConstLang.lightMode: "الوضع الفاتح",
    AppConstLang.darkMode: "الوضع الداكن",
    AppConstLang.thereIsNoUser: "لا يوجد مستخدم",
    AppConstLang.pressOpenYourAccount: "اضغط لفتح حسابك",
    AppConstLang.accountSettings: "إعدادات الحساب",
    AppConstLang.logOut: "تسجيل الخروج",
    AppConstLang.areYouSureYouWannaLogOut:
        "تسجيل الخروج ؟ \n\nسيتم حذف جميع المواد، ولكن إذا كانت محفوظة في الحساب، فيمكنك ارجاعهم عند تسجيل الدخول مرة أخرى.\nأو يمكنك حفظهم كملف txt وإعادة فتحها في اي وقت.",
    //
    // account settings screen
    AppConstLang.change: "تغيير",
    AppConstLang.noChangeToSave: "لا يوجد تغيير لحفظه",
    AppConstLang.openCamera: "فتح الكاميرا",
    AppConstLang.openGallery: "فتح المعرض",
    AppConstLang.openFiles: "فتح الملفات",
    AppConstLang.changeName: "تغير الاسم",
    AppConstLang.changePass: "تغيير الرقم السري",
    AppConstLang.deleteAccount: "حذف الحساب نهائيا",
    AppConstLang.pleaseEnterPass: "الرجاء إدخال رقمك السري",
    AppConstLang.toChangeName: "لتغيير اسمك",
    AppConstLang.toChangePass: "لتغيير الرقم السري الخاص بك",
    AppConstLang.toDeleteAccount: "لحذف حسابك",
    AppConstLang.changesNotSaved: "لم يتم حفظ التغييرات",
    AppConstLang.canNotSaveSamePassword: "لا يمكن حفظ نفس الرقم السري الموجود",
    AppConstLang.deleteMessage:
        "إن قمت بحذف الحساب سيتم حذف جميع المواد وستفقد الحساب نهائيا.\n للتأكيد اكتب الجملة الاتية:-",
    AppConstLang.deleteConfirm: "حذف الحساب",
    AppConstLang.wrongCode: "رمز خاطئ",
    AppConstLang.accountSuccessfullyDeleted: "تم حذف الحساب بنجاح.",

    //
    // auth screen
    AppConstLang.login: "تسجيل الدخول",
    AppConstLang.signUp: "إنشاء حساب",
    AppConstLang.goBack: "الرجوع",

    //
    // login screen
    AppConstLang.email: "البريد الإلكتروني",
    AppConstLang.password: "الرقم السري",
    AppConstLang.wrongPassword: "خطأ في الرقم السري",
    AppConstLang.yourAccountIsNotVerified: "لم يتم تفعيل حسابك",
    AppConstLang.emailDoesNotExist: "هذا البريد الإلكتروني غير موجود",
    AppConstLang.verifyAccount: "تأكيد الحساب",

    //
    // signUp screen
    AppConstLang.firstName: "الاسم الأول",
    AppConstLang.lastName: "الاسم الأخير",
    AppConstLang.rePassword: "أعد الرقم السري",
    AppConstLang.notSamePass: "ليس نفس الرقم السري",
    AppConstLang.emailAlreadyExists: "هذا البريد الإلكتروني موجود بالفعل",
    AppConstLang.emailIsNotExists: "هذا البريد الإلكتروني غير موجود",
    AppConstLang.codeUEnteredIncorrect: "الرمز الذي أدخلته غير صحيح",
    AppConstLang.bySigningUpAgreeToOur: "بالتسجيل فإنك توافق على",
    AppConstLang.and: "و",
    AppConstLang.haveToAgreeTermsConditions:
        "أولاً يجب عليك الموافقة على الشروط والأحكام الخاصة بنا.",

    //
    // verifyCode screen
    AppConstLang.verifyCode: "التحقق من الرمز",
    AppConstLang.confirm: "تأكيد",
    AppConstLang.sendAnotherCode: "إرسال رمز أخر",
    AppConstLang.toResendPleaseWait: "لإعادة الإرسال من فضلك انتظر",
    AppConstLang.seconds: "ثوان",
    AppConstLang.stayHere: "ابق هنا",

    //
    // forgot password screen
    AppConstLang.forgotPassword: "نسيت كلمة السر",
    //
    AppConstLang.lang: "اللغة",
    AppConstLang.changeLang: "تغيير اللغة",
    AppConstLang.en: "English",
    AppConstLang.ar: "العربية",
    //
    AppConstLang.resetSettings: "إعادة الضبط",
    AppConstLang.pressToResetSettings: "اضغط هنا لإعادة ضبط جميع الإعدادات",
    AppConstLang.settingsHaveNotBeenChangedToReset:
        "لم يتم تغيير الإعدادات لإعادة الضبط",
    AppConstLang.areUSureUWanna: "هل أنت متأكد من أنك تريد",
    AppConstLang.resetAllSettings: "إعادة الضبط",
    AppConstLang.sure: "بالتأكيد",
    AppConstLang.aboutApp: "عن التطبيق",
    AppConstLang.by: "بواسطة",
    // about screen
    AppConstLang.moreInfo: "المزيد من المعلومات",
    AppConstLang.pressHereToSee: "إضغط هنا لرؤية",
    AppConstLang.pressHereTo: "إضغط هنا ل",
    AppConstLang.appVersion: "إصدار التطبيق",
    AppConstLang.privacyPolicy: "سياسة الخصوصية",
    AppConstLang.reviewApp: "تقييم التطبيق",
    AppConstLang.notAvailableNow: "غير متاح الآن",
    AppConstLang.notAvailableInThisDevice: "غير متاح على هذا الجهاز الآن",

    AppConstLang.linkedin: "لينكدإن",
    AppConstLang.facebook: "فيسبوك",
    AppConstLang.gmail: "البريد الإلكتروني",
    AppConstLang.twitter: "تويتر",
    AppConstLang.telegram: "تيليجرام",
    AppConstLang.whatsapp: "واتساب",
    AppConstLang.phone: "الهاتف",
    //
    //edit grade screen
    //validator
    AppConstLang.fillField: "إملأ هذا الحقل",
    AppConstLang.enterValidValue: "أدخل قيمة صالح",
    AppConstLang.enterValidName: "أدخل إسم صالح",
    AppConstLang.enterValidEmail: "أدخل عنوان بريد صالح",
    AppConstLang.writeArabicName: "إكتب اسم بالعربية",
    AppConstLang.writeEnglishName: "إكتب اسم بالإنجليزية",
    AppConstLang.enterValidGrade: "أدخل تقدير صالح",
    AppConstLang.enterValidGPA: "أدخل GPA صالح",
    AppConstLang.enterValidDegree: "أدخل درجة صالحة",
    AppConstLang.enterValidHours: "أدخل عدد ساعات صالحة",
    AppConstLang.enterValidInt: "أدخل رقم صحيح",
    AppConstLang.cantBeLessThan: "لا يمكن أن تكون أقل من",
    AppConstLang.cantBeMoreThan: "لا يمكن أن تكون أكبر من",
    AppConstLang.enterPositiveNum: "أدخل رقم موجب",

    AppConstLang.add: "إضافة",
    AppConstLang.remove: "حذف",
    AppConstLang.save: "حفظ",
    AppConstLang.moreOptions: "خيارات إضافية",
    AppConstLang.lightColor: "اللون الفاتح",
    AppConstLang.darkColor: "اللون الداكن",
    AppConstLang.select: "اختر",
    AppConstLang.successfullyDone: "تمت بنجاح",
    AppConstLang.thisTableIsEmpty: "هذا الجدول فارغ",
    //
    // home screen
    AppConstLang.delete: "حذف",
    AppConstLang.selectAll: "تحديد الكل",
    AppConstLang.deselect: "إلغاء التحديد",
    AppConstLang.openAppSettings: "فتح إعدادات التطبيق",
    AppConstLang.uHaveToGivePermission: "عليك الموافقة على الاذونات",
    AppConstLang.noHour: "عدد الساعات",
    AppConstLang.theCumulative: "التراكمي",
    AppConstLang.tapToSeeMore: "إضغط للمزيد",
    AppConstLang.addYear: "اضف سنة",
    AppConstLang.preparatoryYear: "الفرقة الإعدادية",
    AppConstLang.firstYear: "الفرقة الأولى",
    AppConstLang.secondYear: "الفرقة الثانية",
    AppConstLang.thirdYear: "الفرقة الثالثة",
    AppConstLang.fourthYear: "الفرقة الرابعة",
    AppConstLang.fifthYear: "الفرقة الخامسة",
    AppConstLang.sixthYear: "الفرقة السادسة",
    AppConstLang.thatSelected: "المحدد",

    AppConstLang.openSavedFiles: "فتح ملف محفوظ",
    AppConstLang.saveFile: "حفظ كملف",
    AppConstLang.savePDF: "حفظ ك PDF",
    AppConstLang.sync: "مزامنة",
    AppConstLang.needToSync: "بحاجة الى المزامنة",

    AppConstLang.savedInDownload: "تم الحفظ في مجلد التنزيل",
    AppConstLang.inThisYear: "في هذه السنه",
    AppConstLang.inPreviousYears: "في السنين السابقة",
    AppConstLang.doUWantToOpenFile: "هل تريد فتح الملف ؟",
    AppConstLang.saveTXT: "حفظ ك Text",

    AppConstLang.openSavedTxt: "فتح ملف Text محفوظ من قبل",
    AppConstLang.getSubjectsWithLink: "الحصول على المواد من رابط",

    AppConstLang.savedSubjects: "المواد المحفوظة",

    AppConstLang.userDoesNotHaveSubjects: "لا يوجد مواد لهذا المستخدم",

    AppConstLang.thereIsNoChangeToUpdate: "لا يوجد تغييرات لتحديثها",
    AppConstLang.subjectsNotExistWithUser:
        "هذه المواد غير موجودة عند هذا المستخدم",
    AppConstLang.subjectsAreNotDeletedMayDeleted:
        "لم يتم حذف المواد، ربما كانت محذوفة من قبل",

    AppConstLang.haveToOpenInternetWhenUpdateSubject:
        "يجب عليك تشغيل الانترنت عند تحديث المواد، أو يمكنك تحديثهم في شاشة الفصل الدراسي ليست هنا (الشاشة التي تحتوي على جميع المواد في هذا الفصل الدراسي)",

    // add screen
    AppConstLang.semester: "فصل",
    AppConstLang.subject: "مادة",
    AppConstLang.item: "عنصر",
    AppConstLang.error: "خطأ",
    AppConstLang.addSemester: "اضف فصل",
    AppConstLang.addSubject: "اضف مادة",
    AppConstLang.itWillBeSaved: "سيتم الحفظ !",
    AppConstLang.done: "تم",
    AppConstLang.firstSemester: "الفصل الأول",
    AppConstLang.secondSemester: "الفصل الثاني",
    AppConstLang.summerSemester: "الفصل الصيفي",
    AppConstLang.removed: "تم حذف",
    AppConstLang.undo: "إلغاء",
    AppConstLang.thisSubjectAlreadyExistInAddedList:
        "هذه المادة بالفعل موجودة في المواد التي يتم إضافتها",
    AppConstLang.nameEn: "الإسم باللغة الإنجليزية",
    AppConstLang.nameAr: "الإسم باللغة العربية",
    AppConstLang.maxDegree: "الدرجة النهائية",
    AppConstLang.wantToCalcIt: "تريد جعلها محسوبة!",
    AppConstLang.doUWantToCalculateIt: "هل تريد حسابها في التراكمي ؟",
    AppConstLang.subjectsHaveNotBeenChangedToSave:
        "لم يتم تغيير المواد لحفظها !",

    AppConstLang.notice: "لاحظ",
    AppConstLang.fillMaxBeforeDegrees:
        "عليك ملء الدرجات النهائية أولاً قبل درجاتك.",
    AppConstLang.dontCloseTillUSaveSubject: "لا تغلقها حتى تقوم بحفظ المادة",
    AppConstLang.maxDegrees: "الدرجات النهائية",
    AppConstLang.yourDegrees: "درجاتك انت",
    AppConstLang.practicalDegree: "درجة العملي",
    AppConstLang.yearWorkDegree: "درجة أعمال السنة",
    AppConstLang.midDegree: "درجة الميد",
    AppConstLang.finalDegree: "درجة الفاينل",
    AppConstLang.selectSubjectWillBeNotCalculatedIn:
        "تختار هذه المادة، سيتم الغائها في",
    AppConstLang.addSubjectUHaveToNotCalculatedItIn:
        "تضيف هذه المادة، سيتوجب عليك الغاءها في",

    AppConstLang.calculatedOrNot: "تغيير حسابهم",
    AppConstLang.makeSelectedItemsCalculatedNot:
        "جعل جميع العناصر المحددة محسوبة أو غير محسوبة",
    AppConstLang.makeSelectedCalc: "جعلهم محسوبين",
    AppConstLang.makeThemNotCalc: "جعلهم غير محسوبين",
    AppConstLang.unknownErrorSubjectsAreNotAdded:
        "خطأ غير معروف، لم يتم إضافة المواد على الحساب",
    AppConstLang.savedToDeviceOnly: "تم الحفظ على الجهاز فقط",
    AppConstLang.share: "مشاركة",
    AppConstLang.openSharedScreen: "فتح صفحة المشاركة",
    AppConstLang.doNotHaveSharedSubjects: "لم تقم بمشاركة المواد",
    AppConstLang.copyToClipboard: "نسخ الى الحافظة",
    AppConstLang.copied: "تم النسخ",
    AppConstLang.watchTheAdFirst: "شاهد الإعلان أولاً",

    // details screen
    AppConstLang.cumulativeDetails: "تفاصيل التراكمي",
    AppConstLang.numberOfCalcSubject: "عدد المواد المحسوبة",
    AppConstLang.numberOfNotCalcSubject: "عدد المواد الغير محسوبة",
    AppConstLang.totalNumberOfSubjects: "إجمالي عدد المواد",
    AppConstLang.theSubjects: "المواد",
    AppConstLang.theCumulativeWithAdded: "التراكمي مع المواد المضافة",
    AppConstLang.gradeOfCumulative: "التقدير التراكمي",
    AppConstLang.gradeOfAllWithAdded: "تقدير التراكمي مع المواد المضافة",

    // subject screen
    AppConstLang.notes: "ملحوظات",
    AppConstLang.fillAllFieldCorrectly: "إملأ جميع الحقول بالشكل الصحيح !",

    // search screen
    AppConstLang.search: "بحث",
    AppConstLang.notCalculated: "الغير محسوبة",
    AppConstLang.numberOfSubjects: "عدد المواد",
    AppConstLang.notFound: "غير موجود",
    AppConstLang.noSubjectToSearch: "لا توجد مواد للبحث فيها",
    // upload screen.
    AppConstLang.makeAllSubjectsWithThisDegree: "جعل كل المواد بهذه الدرجة",
    AppConstLang.sharedSubjects: "مواد مشاركة",
    AppConstLang.enterLinkAndGo: "ادخل الرابط واضغط موافق",
    AppConstLang.go: "موافق",
    AppConstLang.errorInLink: "خطأ في الرابط",
    "no subject found": "لا يوجد مواد",

    // privacy policy screen.
    AppConstLang.privacyPolicy1: PrivacyPolicyArConstants.privacyPolicy1,
    AppConstLang.informationCollectionAndUse:
        PrivacyPolicyArConstants.informationCollectionAndUse,
    AppConstLang.informationCollectionAndUse1:
        PrivacyPolicyArConstants.informationCollectionAndUse1,
    AppConstLang.informationCollectionAndUse2:
        PrivacyPolicyArConstants.informationCollectionAndUse2,
    AppConstLang.logData: PrivacyPolicyArConstants.logData,
    AppConstLang.logData1: PrivacyPolicyArConstants.logData1,
    AppConstLang.cookies: PrivacyPolicyArConstants.cookies,
    AppConstLang.cookies1: PrivacyPolicyArConstants.cookies1,
    AppConstLang.serviceProviders: PrivacyPolicyArConstants.serviceProviders,
    AppConstLang.serviceProviders1: PrivacyPolicyArConstants.serviceProviders1,
    AppConstLang.serviceProviders2: PrivacyPolicyArConstants.serviceProviders2,
    AppConstLang.serviceProviders3: PrivacyPolicyArConstants.serviceProviders3,
    AppConstLang.serviceProviders4: PrivacyPolicyArConstants.serviceProviders4,
    AppConstLang.serviceProviders5: PrivacyPolicyArConstants.serviceProviders5,
    AppConstLang.serviceProviders6: PrivacyPolicyArConstants.serviceProviders6,
    AppConstLang.security: PrivacyPolicyArConstants.security,
    AppConstLang.security1: PrivacyPolicyArConstants.security1,
    AppConstLang.linksToOtherSites: PrivacyPolicyArConstants.linksToOtherSites,
    AppConstLang.linksToOtherSites1:
        PrivacyPolicyArConstants.linksToOtherSites1,
    AppConstLang.childrenPrivacy: PrivacyPolicyArConstants.childrenPrivacy,
    AppConstLang.childrenPrivacy1: PrivacyPolicyArConstants.childrenPrivacy1,
    AppConstLang.changesToThisPrivacyPolicy:
        PrivacyPolicyArConstants.changesToThisPrivacyPolicy,
    AppConstLang.changesToThisPrivacyPolicy1:
        PrivacyPolicyArConstants.changesToThisPrivacyPolicy1,
    AppConstLang.contactUs: PrivacyPolicyArConstants.contactUs,
    AppConstLang.contactUs1: PrivacyPolicyArConstants.contactUs1,
    AppConstLang.orFrom: "أو من",
    AppConstLang.here: "هنا",

    // Terms & Conditions
    AppConstLang.termsConditions: "الشروط والأحكام",
    AppConstLang.termsConditions1: TermsArConstants.termsConditions1,
    AppConstLang.termsConditions2: TermsArConstants.termsConditions2,

    AppConstLang.changesToThisTermsConditions:
        TermsArConstants.changesToThisTermsConditions,
    AppConstLang.changesToThisTermsConditions1:
        TermsArConstants.changesToThisTermsConditions1,

    AppConstLang.contactUsTerms: TermsArConstants.contactUs1,

    // rate dialog
    AppConstLang.rateThisApp: "قيم هذا التطبيق",
    AppConstLang.rateMessage:
        "إذا أعجبك هذا التطبيق ، فالرجاء تخصيص القليل من وقتك لمراجعته! فهذا يساعدنا حقًا ولن يستغرق الأمر أكثر من دقيقة واحدة.",
    AppConstLang.rate: "تقييم",
    AppConstLang.noThanks: "ًلا شكرا",
    AppConstLang.maybeLater: "ربما في وقت لاحق",
  };

  static Map<String, String> get arabic => _ar;
}
