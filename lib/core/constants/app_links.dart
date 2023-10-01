class AppLinks {
  static const String appDomain = 'https://gpapro.mrecode.com';


  static const String _domain   = 'https://mrecode.com';
  static const String _baseLink = '$_domain/gpapro/api';

  // app information
  static const String appInfo = '$_baseLink/app_info.php';

  // subjects https://mrecode.com/gpapro/api/subject/add_subject.php
  static const String _subject = '$_baseLink/subject';
  // static const String addSubject      = '$_subject/add_subject.php';
  static const String editSubject        = '$_subject/edit_subject.php';
  static const String changCalcSubjects  = '$_subject/change_calc_subjects.php';
  // static const String deleteSubject   = '$_subject/delete_subject.php';
  static const String viewSubjects       = '$_subject/view_subjects.php';
  static const String deleteManySubjects = '$_subject/delete_many_subjects.php';
  static const String addManySubjects    = '$_subject/add_many_subjects.php';
  // static const String deleteSemester  = '$_subject/delete_semester.php';

  // shared subjects in subjects  https://mrecode.com/gpapro/api/subject/shared/share_subject.php
  static const String _shared = '$_subject/shared';
  static const String shareSubjects = '$_shared/share_many_subjects.php';
  static const String deleteSharedSubjects = '$_shared/delete_many_shared.php';
  static const String getShared    = '$_shared/get_shared.php?user_sharedId='; // 8588913772';

  // https://gpapro.mrecode.com/?user_sharedId=8588913772
  static const String shareLink    = '$appDomain/?user_sharedId='; // 8588913772';

  // auth https://mrecode.com/gpapro/api/auth/delete.php
  static const String _auth = '$_baseLink/auth';
  static const String login = '$_auth/login.php';
  static const String signup = '$_auth/signup.php';
  static const String editUserName = '$_auth/edit_name.php';
  static const String changePhoto = '$_auth/change_photo.php';
  static const String changePassword = '$_auth/change_password.php';
  static const String deleteUser = '$_auth/delete.php';
  static const String image = '$_auth/uploaded_images';

  // auth https://mrecode.com/gpapro/api/auth/verify/check_verify.php
  static const String _verify = '$_auth/verify';
  static const String checkVerify = '$_verify/check_verify.php';
  static const String sendVerify  = '$_verify/send_verify.php';
}
