class AppUpdateInfo {
  String versionName;
  int versionCode;
  String description;
  String downloadUrl;

  static AppUpdateInfo fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AppUpdateInfo appUpdateInfoBean = AppUpdateInfo();
    appUpdateInfoBean.versionName = map['versionName'];
    appUpdateInfoBean.versionCode = map['versionCode'];
    appUpdateInfoBean.description = map['description'];
    appUpdateInfoBean.downloadUrl = map['downloadUrl'];
    return appUpdateInfoBean;
  }

  Map toJson() => {
    "versionName": versionName,
    "versionCode": versionCode,
    "description": description,
    "downloadUrl": downloadUrl,
  };
}