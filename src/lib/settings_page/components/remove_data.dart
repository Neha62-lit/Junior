import 'package:Junior/model/novel.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

void showRemoveDataDialog(BuildContext context) async {
  removeData();
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text(
        'All Novel Data will be Removed',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      backgroundColor: tileColor,
      contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 14),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('No, wait'),
          ),
          TextButton(
            onPressed: () {
              removeData();
              Navigator.pop(context);
            },
            child: const Text('I\'m Aware, Continue'),
          )
        ],
      ),
    ),
  );
}

void removeData() {
  novelList = [];
  saveNovelList([]);
}
