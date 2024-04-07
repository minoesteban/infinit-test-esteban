import 'package:infinit_test_esteban/utils/platform.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'core_providers.g.dart';

@riverpod
Future<PackageInfo> packageInfo(PackageInfoRef ref) async {
  return await PackageInfo.fromPlatform();
}

@riverpod
String geminiAPIKey(GeminiAPIKeyRef ref) {
  if (isAndroid) {
    return 'AIzaSyAOEXhNWDfUYaUs80ZHwYfX6KBk8C2JwcY';
  }

  if (isIOS) {
    return 'AIzaSyC2P9Y8Ar-rHjjb9d5GuWiWwoV1xAwX3rE';
  }

  throw Exception('Platform not supported');
}
