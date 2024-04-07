import 'dart:convert';

import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:infinit_test_esteban/data/assistant/assistant_remote_data_source.dart';
import 'package:infinit_test_esteban/data/assistant/dto/dashboard_data_dto.dart';
import 'package:infinit_test_esteban/data/assistant/dto/item_list_dto.dart';
import 'package:infinit_test_esteban/data/assistant/exceptions.dart';

class AssistantRemoteDataSourceImpl implements AssistantRemoteDataSource {
  const AssistantRemoteDataSourceImpl(this._gemini);

  final Gemini _gemini;

  @override
  Future<ItemListDTO> getItemsList({required int page}) async {
    final prompt = 'Give me a random list of 15 items. Emulate pagination, returning page $page.';

    final json = await _sendChatMessage(prompt + _itemListJSON);

    return ItemListDTO.fromJson(json);
  }

  @override
  Future<DashboardDataDTO> getDashboardData() async {
    const prompt = 'Give me random data to populate a dashboard.';

    final json = await _sendChatMessage(prompt + _dashboardDataJSON);

    return DashboardDataDTO.fromJson(json['dashboard'] as Map<String, dynamic>);
  }

  Future<Map<String, dynamic>> _sendChatMessage(String prompt) async {
    final result = await _gemini.text(prompt);

    if (result?.output == null) {
      throw AssistantResultEmptyException('${result?.finishReason}');
    }

    final output = result!.output!;

    final rawResult = output.substring(output.indexOf('{'), output.lastIndexOf('}') + 1);

    return jsonDecode(rawResult) as Map<String, dynamic>;
  }
}

const _itemListJSON = '''Response must have this JSON structure:
    {items: [{name: String,description: String,content: String}]}
    where description has no more than 30 characters, and content is markdown formatted text of max 100 characters.
    ''';

const _dashboardDataJSON = '''Response must have this JSON structure:
    {dashboard: {period: String,total: double,average: double,nextPeriod: String,nextPeriodEstimation: double}}
    ''';
