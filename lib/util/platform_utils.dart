import 'dart:io';
import 'dart:async';

import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';

export 'dart:io';

/// 是否是生产环境
const bool inProduction = const bool.fromEnvironment("dart.vm.product");

/// 平台信息工具类
/// 依赖于device_info 与 package_info插件
class PlatformUtils {

  /// 获取app的包信息
  static Future<PackageInfo> getAppPackageInfo() {
    return PackageInfo.fromPlatform();
  }

  /// 获取App版本
  static Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  /// 内部版本号。 iOS上为CFBundleVersion，Android上为versionCode。
  static Future<String> getBuildNum() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

  /// 获取设备信息
  static Future getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      return await deviceInfo.androidInfo;
    } else if (Platform.isIOS) {
      return await deviceInfo.iosInfo;
    } else {
      return null;
    }
  }
}
