import 'package:flutter/material.dart';
import 'package:vagabond_vision/utilities/constants.dart';

class NotificationPill extends StatelessWidget {
  final String titleNotification;
  final String subjectNotification;
  final VoidCallback onDelete;

  const NotificationPill({
    super.key,
    required this.titleNotification,
    required this.subjectNotification,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            titleNotification,
            style: kHeadingInCards,
          ),
          subtitle: Text(
            subjectNotification,
            style: kLocationTextInCards,
          ),
          trailing: GestureDetector(
            onTap: onDelete,
            child: const Icon(
              Icons.delete,
              color: kDeepOrangeAccent,
              size: 30,
            ),
          ),
        ),
        const Divider(
          indent: 20,
          endIndent: 20,
          color: Colors.grey,
          thickness: 1,
        )
      ],
    );
  }
}
