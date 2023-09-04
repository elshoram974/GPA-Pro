class AppLinks {
  static const String _domain = 'https://mrecode.com';
  static const String _baseLink = '$_domain/gpapro/api';

  // app information
  static const String appInfo = '$_baseLink/app_info.php';

  // subjects https://mrecode.com/gpapro/api/subject/add_subject.php
  static const String _subject = '$_baseLink/subject';
  static const String addSubject    = '$_subject/add_subject.php';
  static const String editSubject   = '$_subject/edit_subject.php';
  static const String deleteSubject = '$_subject/delete_subject.php';
  static const String viewSubjects  = '$_subject/view_subjects.php';

  // shared subjects in subjects  https://mrecode.com/gpapro/api/subject/shared/share_subject.php
  static const String _shared = '$_subject/shared';
  static const String shareSubject = '$_shared/share_subject.php';
  static const String deleteShared = '$_shared/delete_shared.php';
  static const String getShared    = '$_shared/get_shared.php'; // ?user_sharedId=8588913772';

  // auth https://mrecode.com/gpapro/api/auth/delete.php
  static const String _auth = '$_baseLink/auth';
  static const String login = '$_auth/login.php';
  static const String signup = '$_auth/signup.php';
  static const String editUser = '$_auth/edit.php';
  static const String deleteUser = '$_auth/delete.php';
  static const String image = '$_auth/uploaded_images';

  // auth https://mrecode.com/gpapro/api/auth/verify/check_verify.php
  static const String _verify = '$_auth/verify';
  static const String checkVerify = '$_verify/check_verify.php';
  static const String sendVerify  = '$_verify/send_verify.php';
}
