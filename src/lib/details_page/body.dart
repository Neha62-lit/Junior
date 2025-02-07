import 'package:Junior/details_page/components/buttons.dart';
import 'package:Junior/details_page/components/chapter_progress.dart';
import 'package:Junior/details_page/components/novel_data.dart';
import 'package:Junior/details_page/components/novel_notes.dart';
import 'package:Junior/details_page/components/novel_title.dart';
import 'package:Junior/details_page/components/star_rating.dart';
import 'package:Junior/homepage/body.dart';
import 'package:Junior/model/novel.dart';
import 'package:Junior/theme.dart';
import 'package:flutter/material.dart';

import 'components/novel_link.dart';

class DetailsPage extends StatelessWidget {
  final Novel novel;
  final bool titleFocus;

  const DetailsPage({this.novel, this.titleFocus = false});

  @override
  Widget build(BuildContext context) {
    NovelData.novel = novel;
    NovelData.isChanged = false;

    return WillPopScope(
      onWillPop: () async {
        if (NovelData.isChanged) {
          NovelData.novel.lastEdited = DateTime.now();
          saveNovelList(novelList);

          final snackBar = SnackBar(
            backgroundColor: backgroundColor,
            duration: const Duration(seconds: 1),
            content: Text(
              'Updated ' + novel.title,
              style: TextStyle(
                color: linkColor,
              ),
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 80, right: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NovelTitle(autoFocus: titleFocus),
                const SizedBox(height: 50),
                ChapterProgress(),
                const SizedBox(height: 50),
                StarRating(),
                const SizedBox(height: 50),
                NovelLink(),
                const SizedBox(height: 50),
                NovelNotes(),
                const SizedBox(height: 50),
                Buttons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
