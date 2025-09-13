import 'dart:async';

import 'package:docdoc/features/inbox/data/data_source/messages_list.dart';
import 'package:docdoc/features/inbox/data/model/message_item_model.dart';
import 'package:docdoc/features/inbox/presentaion/ui/widget/search_and_view_appbar.dart';

import 'messages_list.dart';
import 'package:flutter/material.dart';

class MessagesViewBody extends StatefulWidget {
  const MessagesViewBody({super.key});

  @override
  State<MessagesViewBody> createState() => _MessagesViewBodyState();
}

class _MessagesViewBodyState extends State<MessagesViewBody> {
  List<MessageItemModel> filteredMessages = [];
  Timer? debounce;

  @override
  void initState() {
    super.initState();
    filteredMessages = messagesList;
  }

  void _filterMessages(String query) {
    setState(() {
      filteredMessages = messagesList
          .where((message) => message.name.toLowerCase().contains(
                query.toLowerCase(),
              ))
          .toList();
    });
  }

  void _onSearchChanged(String query) {
    if (debounce?.isActive ?? false) debounce!.cancel();

    debounce = Timer(
      const Duration(milliseconds: 300),
      () {
        _filterMessages(query);
      },
    );
  }

  @override
  void dispose() {
    debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(16),
      child: Column(
        children: [
          SearchAndFilterBar(
            onChanged: (value) {
              _onSearchChanged(value);
            },
          ),
          const SizedBox(height: 24),
          Expanded(
            child: filteredMessages.isEmpty
                ? const Center(
                    child: Text('No messages found'),
                  )
                : MessagesList(filteredMessages: filteredMessages),
          ),
        ],
      ),
    );
  }
}
