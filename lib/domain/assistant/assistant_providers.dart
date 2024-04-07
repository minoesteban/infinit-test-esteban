import 'package:flutter/foundation.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:infinit_test_esteban/core/storage/core_providers.dart';
import 'package:infinit_test_esteban/data/assistant/assistant_remote_data_source.dart';
import 'package:infinit_test_esteban/data/assistant/assistant_remote_data_source_impl.dart';
import 'package:infinit_test_esteban/domain/assistant/repository/assistant_repository.dart';
import 'package:infinit_test_esteban/domain/assistant/repository/assistant_repository_impl.dart';
import 'package:infinit_test_esteban/utils/platform.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'assistant_providers.g.dart';

@riverpod
Future<AssistantRepository> assistantRepository(AssistantRepositoryRef ref) async {
  final assistantRemoteDataSource = await ref.read(assistantRemoteDataSourceProvider.future);

  return AssistantRepositoryImpl(assistantRemoteDataSource);
}

@riverpod
@visibleForTesting
Future<AssistantRemoteDataSource> assistantRemoteDataSource(AssistantRemoteDataSourceRef ref) async {
  final gemini = await ref.read(geminiInstanceProvider.future);

  return AssistantRemoteDataSourceImpl(gemini);
}

@riverpod
@visibleForTesting
Future<Gemini> geminiInstance(GeminiInstanceRef ref) async {
  final geminiAPIKey = ref.read(geminiAPIKeyProvider);
  final packageInfo = await ref.read(packageInfoProvider.future);

  Gemini.init(
    enableDebugging: true,
    apiKey: geminiAPIKey,
    headers: {
      if (isIOS) 'X-Ios-Bundle-Identifier': packageInfo.packageName,
      if (isAndroid) 'X-Android-Package': packageInfo.packageName,
      if (isAndroid) 'X-Android-Cert': packageInfo.buildSignature,
    },
  );

  return Gemini.instance;
}
