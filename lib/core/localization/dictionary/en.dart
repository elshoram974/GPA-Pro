import 'package:gpa_pro/core/constants/privacy_policy/privacy_en.dart';

import '../lang_constant.dart';

class EnDictionary {
  static final Map<String, String> _en = {
    AppConstLang.cumulativeGPA: "Cumulative GPA",
    //
    AppConstLang.grades: "Grades",
    AppConstLang.warning: "Warning",
    AppConstLang.cancel: "Cancel",
    AppConstLang.update: "Update",
    AppConstLang.notNow: "Not now",
    AppConstLang.noInternet: "There is no internet connection",
    AppConstLang.openInternetWhenAccountOpenedToAvoidErrorsOnServer: "It is preferable to connect to the Internet when the account is opened to avoid storage errors on the server",
    //
    AppConstLang.settings: "Settings",
    AppConstLang.home: "Home",
    AppConstLang.initialize: "Initialize",
    AppConstLang.pressBackAgainExit: "press back again to exit",

    AppConstLang.instructions: "Instructions",
    AppConstLang.rememberEditGradesBeforeStart:
        "Remember to edit grades before you start !",

    //
    // AppConstLang.homePage: "Home page",
    // AppConstLang.initializePage: "Initialize page",
    // AppConstLang.settingsPage: "Settings page",
    // in initialize body
    AppConstLang.realizedHours: "Realized hours",
    AppConstLang.realizedHoursNotCalculated:
        "Realized hours that not calculated",
    AppConstLang.registeredHours: "Registered hours",
    AppConstLang.totalHours: "Total hours",
    AppConstLang.empty: "Empty",
    AppConstLang.thatNotCalcInCumulative:
        "that is not calculated in cumulative",
    //
    AppConstLang.editGrades: "Edit grades",
    AppConstLang.exampleInGrade: "Ex:- Grade B .. it's meaning 3 <= B < 3.3",
    AppConstLang.grade: "Grade",
    AppConstLang.totalGPA: "Total GPA",
    AppConstLang.degree: "Degree",
    AppConstLang.color: "Color",
    AppConstLang.edit: "Edit",
    AppConstLang.reset: "Reset",
    AppConstLang.saveChanges: "Save changes",
    AppConstLang.dontSave: "Don't save",
    AppConstLang.ifYouReturnChangesNotSaved:
        "If you return, the changes won't be saved",
    AppConstLang.ifCancelBackChangesNotSaved:
        "If you cancel, the changes won't be saved",

    // in settings screen
    AppConstLang.changeMode: "Change mode",
    AppConstLang.pressToChange: "Press here to change",
    AppConstLang.systemMode: "System Mode",
    AppConstLang.lightMode: "Light Mode",
    AppConstLang.darkMode: "Dark Mode",
    AppConstLang.thereIsNoUser: "There is no user",
    AppConstLang.pressOpenYourAccount: "Press to open your account",
    AppConstLang.accountSettings: "Account Settings",
    AppConstLang.logOut: "Log out",
    AppConstLang.areYouSureYouWannaLogOut: "log out? \n\nAll subjects will be deleted, but if they are saved in the account, you can return them when you login again.\nOr you can save them as a txt file and reopen it at any time.",
    //
    // account settings screen
    AppConstLang.change: "Change",
    AppConstLang.noChangeToSave: "There is no change to save",
    //
    // auth screen
    AppConstLang.login: "Login",
    AppConstLang.signUp: "Sign Up",
    AppConstLang.goBack: "Go back",
    //
    // login screen
    AppConstLang.email: "Email",
    AppConstLang.password: "Password",
    AppConstLang.wrongPassword: "Wrong password",
    AppConstLang.yourAccountIsNotVerified: "Your account is not verified",
    AppConstLang.emailDoesNotExist: "This email doesn't exist",
    AppConstLang.verifyAccount: "Verify account",

    //
    // signUp screen
    AppConstLang.firstName: "First Name",
    AppConstLang.lastName: "Last Name",
    AppConstLang.rePassword: "Re-Password",
    AppConstLang.notSamePass: "Not same password",
    AppConstLang.emailAlreadyExists: "This email is already exists",
    AppConstLang.emailIsNotExists: "This email is not exists",
    AppConstLang.codeUEnteredIncorrect: "The code you entered is incorrect.",
    //
    // verifyCode screen
    AppConstLang.verifyCode: "Verify code",
    AppConstLang.confirm: "Confirm",
    AppConstLang.sendAnotherCode: "Send another code",
    AppConstLang.toResendPleaseWait: "To resend please wait",
    AppConstLang.seconds: "seconds",
    AppConstLang.stayHere: "Stay here",
    //
    // forgot password screen
    AppConstLang.forgotPassword: "forgot password",
    //
    AppConstLang.lang: "language",
    AppConstLang.changeLang: "Change language",
    AppConstLang.en: "English",
    AppConstLang.ar: "العربية",
    //
    AppConstLang.resetSettings: "Reset Settings",
    AppConstLang.pressToResetSettings: "Press here to reset all settings",
    AppConstLang.settingsHaveNotBeenChangedToReset:
        "Settings have not been changed to reset",
    AppConstLang.areUSureUWanna: "Are you sure you want to",
    AppConstLang.resetAllSettings: "reset all Settings",
    AppConstLang.sure: "Sure",
    AppConstLang.aboutApp: "About app",
    AppConstLang.by: "By",
    // about screen
    AppConstLang.moreInfo: "More info",
    AppConstLang.pressHereToSee: "Press here to see",
    AppConstLang.pressHereTo: "Press here to",
    AppConstLang.appVersion: "App version",
    AppConstLang.privacyPolicy: "Privacy policy",
    AppConstLang.reviewApp: "Review app",
    AppConstLang.notAvailableNow: "not available right now",
    AppConstLang.notAvailableInThisDevice:
        "not available in this device right now",

    AppConstLang.linkedin: "Linkedin",
    AppConstLang.facebook: "Facebook",
    AppConstLang.gmail: "Gmail",
    AppConstLang.twitter: "Twitter",
    AppConstLang.telegram: "Telegram",
    AppConstLang.whatsapp: "Whatsapp",
    AppConstLang.phone: "Phone",

    //
    //edit grade screen
    //validator
    AppConstLang.fillField: "fill this field",
    AppConstLang.enterValidValue: "Enter valid value",
    AppConstLang.enterValidName: "Enter valid name",
    AppConstLang.enterValidEmail: "Enter valid Email",
    AppConstLang.writeArabicName: "Write Arabic name",
    AppConstLang.writeEnglishName: "Write English name",
    AppConstLang.enterValidGrade: "Enter valid grade",
    AppConstLang.enterValidGPA: "Enter valid gpa",
    AppConstLang.enterValidDegree: "Enter valid degree",
    AppConstLang.enterValidHours: "Enter valid hours",
    AppConstLang.enterValidInt: "Enter valid integer",
    AppConstLang.cantBeLessThan: "Can't be less than",
    AppConstLang.cantBeMoreThan: "Can't be more than",
    AppConstLang.enterPositiveNum: "enter positive number",

    AppConstLang.add: "Add",
    AppConstLang.remove: "Remove",
    AppConstLang.save: "Save",
    AppConstLang.moreOptions: "More options",
    AppConstLang.lightColor: "Light Color",
    AppConstLang.darkColor: "Dark Color",
    AppConstLang.select: "Select",
    AppConstLang.successfullyDone: "Successfully done",
    AppConstLang.thisTableIsEmpty: "This table is empty",
    //
    // home screen
    AppConstLang.delete: "Delete",
    AppConstLang.selectAll: "Select all",
    AppConstLang.deselect: "Deselect",

    AppConstLang.openAppSettings: "Open app settings",
    AppConstLang.uHaveToGivePermission: "You have to give permission",
    AppConstLang.noHour: "No. Hours",
    AppConstLang.theCumulative: "The cumulative",
    AppConstLang.tapToSeeMore: "Tap to see more",
    AppConstLang.addYear: "Add year",
    AppConstLang.preparatoryYear: "Preparatory Year",
    AppConstLang.firstYear: "First year",
    AppConstLang.secondYear: "Second year",
    AppConstLang.thirdYear: "Third year",
    AppConstLang.fourthYear: "Fourth year",
    AppConstLang.fifthYear: "Fifth year",
    AppConstLang.sixthYear: "Sixth year",
    AppConstLang.thatSelected: "that selected",

    AppConstLang.openSavedFiles: "Open saved file",
    AppConstLang.saveFile: "Save as file",
    AppConstLang.savePDF: "Save as PDF",
    AppConstLang.sync: "Sync",
    AppConstLang.needToSync: "Need to Sync !...",

    AppConstLang.savedInDownload: "Saved in download folder",
    AppConstLang.inThisYear: "In this year",
    AppConstLang.inPreviousYears: "In previous years",
    AppConstLang.doUWantToOpenFile: "Do you want to open file ?",
    AppConstLang.saveTXT: "Save as Text",

    AppConstLang.openSavedTxt: "Open saved text file",
    AppConstLang.getSubjectsWithLink: "Get subjects with link",
    AppConstLang.savedSubjects: "Saved subjects",

    AppConstLang.userDoesNotHaveSubjects: "User does't have subjects",
    
    AppConstLang.thereIsNoChangeToUpdate: "There is no changes to update",
    AppConstLang.subjectsNotExistWithUser: "Subjects not exist with this user",
    AppConstLang.subjectsAreNotDeletedMayDeleted: "Subjects are not deleted, may it is already deleted",
    
    AppConstLang.haveToOpenInternetWhenUpdateSubject: "You have to turn internet on when update subjects, Or you can update it by using semester screen not here (screen that contain all subjects in this semester)",
    // add screen
    AppConstLang.semester: "Semester",
    AppConstLang.subject: "Subject",
    AppConstLang.item: "item",
    AppConstLang.error: "Error",
    AppConstLang.addSemester: "Add semester",
    AppConstLang.addSubject: "Add subject",
    AppConstLang.itWillBeSaved: "It will be saved !",
    AppConstLang.done: "Done",
    AppConstLang.firstSemester: "First semester",
    AppConstLang.secondSemester: "Second semester",
    AppConstLang.summerSemester: "Summer semester",
    AppConstLang.removed: "Removed",
    AppConstLang.undo: "Undo",
    AppConstLang.thisSubjectAlreadyExistInAddedList:
        "This subject already exist in added list",
    AppConstLang.nameEn: "Name in English",
    AppConstLang.nameAr: "Name in Arabic",
    AppConstLang.maxDegree: "Max degree",
    AppConstLang.wantToCalcIt: "Want to calculate it!",
    AppConstLang.doUWantToCalculateIt: "Do you want to calculate it ?",
    AppConstLang.subjectsHaveNotBeenChangedToSave:
        "Subjects have not been changed to save !",

    AppConstLang.notice: "Notice",
    AppConstLang.fillMaxBeforeDegrees:
        "you have to fill max degree first before your degrees",
    AppConstLang.dontCloseTillUSaveSubject:
        "don't close it till you save the subject",

    AppConstLang.maxDegrees: "max degrees",
    AppConstLang.yourDegrees: "your degrees",
    AppConstLang.practicalDegree: "Practical degree",
    AppConstLang.yearWorkDegree: "Year work degree",
    AppConstLang.midDegree: "Mid degree",
    AppConstLang.finalDegree: "Final degree",
    AppConstLang.selectSubjectWillBeNotCalculatedIn:
        "select this subject, This subject will be not calculated in",
    AppConstLang.addSubjectUHaveToNotCalculatedItIn:
        "add this subject, you have to make it not calculated in",

    AppConstLang.calculatedOrNot: "change calculate",
    AppConstLang.makeSelectedItemsCalculatedNot:
        "Make all selected items calculated or not",
    AppConstLang.makeSelectedCalc: "Make all selected calculated",
    AppConstLang.makeThemNotCalc: "Make all selected not calculated",
    AppConstLang.unknownErrorSubjectsAreNotAdded: "Unknown error, subjects are not added on your account",
    AppConstLang.savedToDeviceOnly: "Saved to device only",

    // details screen
    AppConstLang.cumulativeDetails: "Cumulative details",
    AppConstLang.numberOfCalcSubject: "Number of calculated subjects",
    AppConstLang.numberOfNotCalcSubject: "Number of not calculated subjects",
    AppConstLang.totalNumberOfSubjects: "Total number of subjects",
    AppConstLang.theSubjects: "The subjects",
    AppConstLang.theCumulativeWithAdded: "The cumulative with added subjects",
    AppConstLang.gradeOfCumulative: "Grade of cumulative",
    AppConstLang.gradeOfAllWithAdded: "Grade of cumulative with added subjects",
    // subject screen
    AppConstLang.notes: "Notes",
    AppConstLang.fillAllFieldCorrectly: "Fill all field correctly !",
    // search screen
    AppConstLang.search: "Search",
    AppConstLang.notCalculated: "Not calculated",
    AppConstLang.numberOfSubjects: "Number of subjects",
    AppConstLang.notFound: "Not found",
    AppConstLang.noSubjectToSearch: "There are no subjects to search",
    // upload screen.
    AppConstLang.makeAllSubjectsWithThisDegree:
        "Make all subjects with this degree",
    AppConstLang.sharedSubjects: "Shared subjects",
    AppConstLang.enterLinkAndGo: "Enter the link and go",
    AppConstLang.go: "Go",
    AppConstLang.errorInLink: "Error in Link",
    "no subject found": "No subject found",

    // privacy policy screen.
    AppConstLang.privacyPolicy1: PrivacyPolicyEnConstants.privacyPolicy1,
    AppConstLang.informationCollectionAndUse:
        PrivacyPolicyEnConstants.informationCollectionAndUse,
    AppConstLang.informationCollectionAndUse1:
        PrivacyPolicyEnConstants.informationCollectionAndUse1,
    AppConstLang.informationCollectionAndUse2:
        PrivacyPolicyEnConstants.informationCollectionAndUse2,
    AppConstLang.logData: PrivacyPolicyEnConstants.logData,
    AppConstLang.logData1: PrivacyPolicyEnConstants.logData1,
    AppConstLang.cookies: PrivacyPolicyEnConstants.cookies,
    AppConstLang.cookies1: PrivacyPolicyEnConstants.cookies1,
    AppConstLang.serviceProviders: PrivacyPolicyEnConstants.serviceProviders,
    AppConstLang.serviceProviders1: PrivacyPolicyEnConstants.serviceProviders1,
    AppConstLang.serviceProviders2: PrivacyPolicyEnConstants.serviceProviders2,
    AppConstLang.serviceProviders3: PrivacyPolicyEnConstants.serviceProviders3,
    AppConstLang.serviceProviders4: PrivacyPolicyEnConstants.serviceProviders4,
    AppConstLang.serviceProviders5: PrivacyPolicyEnConstants.serviceProviders5,
    AppConstLang.serviceProviders6: PrivacyPolicyEnConstants.serviceProviders6,
    AppConstLang.security: PrivacyPolicyEnConstants.security,
    AppConstLang.security1: PrivacyPolicyEnConstants.security1,
    AppConstLang.linksToOtherSites: PrivacyPolicyEnConstants.linksToOtherSites,
    AppConstLang.linksToOtherSites1:
        PrivacyPolicyEnConstants.linksToOtherSites1,
    AppConstLang.childrenPrivacy: PrivacyPolicyEnConstants.childrenPrivacy,
    AppConstLang.childrenPrivacy1: PrivacyPolicyEnConstants.childrenPrivacy1,
    AppConstLang.changesToThisPrivacyPolicy:
        PrivacyPolicyEnConstants.changesToThisPrivacyPolicy,
    AppConstLang.changesToThisPrivacyPolicy1:
        PrivacyPolicyEnConstants.changesToThisPrivacyPolicy1,
    AppConstLang.contactUs: PrivacyPolicyEnConstants.contactUs,
    AppConstLang.contactUs1: PrivacyPolicyEnConstants.contactUs1,
    AppConstLang.orFrom: "Or from",
    AppConstLang.here: "here",

    // rate dialog
    AppConstLang.rateThisApp: "Rate this app",
    AppConstLang.rateMessage:
        "If you like this app, please take a little bit of your time to review it !it really helps us and it shouldn't take you more than one minute.",
    AppConstLang.rate: "RATE",
    AppConstLang.noThanks: "NO THANKS",
    AppConstLang.maybeLater: "MAYBE LATER",
  };

  static Map<String, String> get english => _en;
}
