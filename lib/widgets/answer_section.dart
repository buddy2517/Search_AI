import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:search_ai/services/chat_web_service.dart';
import 'package:search_ai/theme/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnswerSection extends StatefulWidget {
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

class _AnswerSectionState extends State<AnswerSection> {
  bool isLoading = true;
  String fullResponse = '''
  Rohit Sharma, born on April 30, 1987, in Bansod, India, is a prominent Indian international cricketer known for his exceptional batting skills and leadership qualities. He currently serves as the captain of the Indian cricket team in Test and One-Day International (ODI) formats, having previously captained the Twenty20 International (T20I) team until his retirement from T20s in June 2024 after leading India to victory in the T20 World Cup that year[1][2].

### Early Career and Achievements
Rohit made his international debut on June 23, 2007, in an ODI against Ireland. He initially played as a middle-order batsman but later established himself as one of the best opening batsmen in white-ball cricket. He has been a key player for the Mumbai Indians in the Indian Premier League (IPL), where he captained the team to five titles from 2013 to 2020, making him one of the most successful captains in IPL history[2][5].

### Notable Records
- **ODI Centuries**: Rohit has scored over 30 centuries in ODIs, ranking him third among Indian players behind Sachin Tendulkar and Virat Kohli.
- **T20 World Cups**: He is the only Indian player to win two T20 World Cups and has played in every edition since its inception in 2007.
- **Sixes**: As of June 2024, he became the first player to hit over 600 sixes in international cricket across all formats[1][2][6].

### Leadership
Under his captaincy, India achieved significant milestones, including a record of consecutive T20I victories and a successful campaign in the 2024 T20 World Cup. His strategic approach and calm demeanor have earned him respect both on and off the field[5][6].

### Personal Life
Rohit Sharma is married to Ritika Sajdeh, and they have a daughter named Samaira. He is known for his philanthropic efforts and maintains a strong presence on social media[4][7].

Overall, Rohit Sharma's contributions to cricket have solidified his status as one of the greats of the game, earning him the nickname "Hitman" for his explosive batting style.

Citations:
[1] https://www.britannica.com/biography/Rohit-Sharma
[2] https://en.wikipedia.org/wiki/Rohit_Sharma
[3] https://hi.wikipedia.org/wiki/%E0%A4%B0%E0%A5%8B%E0%A4%B9%E0%A4%BF%E0%A4%A4_%E0%A4%B6%E0%A4%B0%E0%A5%8D%E0%A4%AE%E0%A4%BE
[4] https://unstop.com/blog/rohit-sharma-biography
[5] https://www.espncricinfo.com/cricketers/rohit-sharma-34102
[6] https://sports.ndtv.com/cricket/players/857-rohit-sharma-playerprofile
[7] https://www.instagram.com/rohitsharma45/?hl=en
[8] https://cricketaddictor.com/cricket-news/manoj-tiwary-attacks-gautam-gambhir-uses-rohit-sharma-and-virat-kohli-as-weapons/
  ''';

  @override
  void initState() {
    super.initState();
    ChatWebService().contentStream.listen((data){
      if(isLoading == true){
        fullResponse = "";
      }
        setState(() {
          fullResponse += data["data"];
          isLoading = false;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Search AI',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Skeletonizer(
          enabled: isLoading,
          child: Markdown(
            data: fullResponse,
            shrinkWrap: true,
            styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
              codeblockDecoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              code: const TextStyle(
                fontSize: 16,
          
              )
            ),
          ),
        )
      ],
    );
  }
}

