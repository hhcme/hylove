part of 'pages.dart';

// 业务用的推路由名称
// ignore_for_file: constant_identifier_names
abstract class Routes {
  // APP首页
  static const APP_HOME = _Paths.appHome;

  // 登陆首页
  static const LOGIN_HOME = _Paths.loginHome;

  // 相册首页
  static const PHOTO_HOME = _Paths.photoHome;

  // 注册账号
  static const REGISTER_USER = _Paths.loginHome + _Paths.registerUser;

  // test测试
  static const TEST = _Paths.test;
}

// 绑定页面用的路由名称
abstract class _Paths {
  // APP首页
  static const appHome = '/app_home';

  // 登陆首页
  static const loginHome = '/login_home';

  // 相册首页
  static const photoHome = '/photo_home';

  // 注册账号
  static const registerUser = '/register_user';

  // test测试
  static const test = '/test';
}
