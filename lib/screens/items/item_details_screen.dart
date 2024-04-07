import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinit_test_esteban/domain/assistant/item.dart';

class ItemDetailsScreen extends HookConsumerWidget {
  const ItemDetailsScreen({
    required this.item,
    super.key,
  });

  final Item item;

  static const routeName = 'details';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                item.description,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 20),
              Markdown(
                shrinkWrap: true,
                data: item.content,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
