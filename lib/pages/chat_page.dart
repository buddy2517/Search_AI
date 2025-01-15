import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:search_ai/theme/colors.dart';
import 'package:search_ai/widgets/answer_section.dart';
import 'package:search_ai/widgets/side_bar.dart';
import 'package:search_ai/widgets/sources_section.dart';

class ChatPage extends StatelessWidget {
  final String question;
  const ChatPage({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          kIsWeb ? SideBar() : SizedBox(),
          kIsWeb
              ? const SizedBox(
                  width: 100,
                )
              : SizedBox(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question,
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    //sources
                    SourcesSection(),
                    const SizedBox(
                      height: 24,
                    ),
                    //answer section
                    AnswerSection()
                  ],
                ),
              ),
            ),
          ),
          kIsWeb
              ? Placeholder(
                  strokeWidth: 0,
                  color: AppColors.background,
                )
              : SizedBox()
        ],
      ),
    );
  }
}
