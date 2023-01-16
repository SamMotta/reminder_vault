import 'package:flutter/material.dart';
import 'package:reminder_vault/models/reminder_model.dart';
import 'package:reminder_vault/pages/reminder_detail_page.dart';

class ReminderCardWidget extends StatefulWidget {
  final ReminderModel reminder;
  const ReminderCardWidget({super.key, required this.reminder});

  @override
  State<ReminderCardWidget> createState() => _ReminderCardWidgetState();
}

class _ReminderCardWidgetState extends State<ReminderCardWidget> {
  @override
  Widget build(BuildContext context) {
    final ReminderModel reminder = widget.reminder;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReminderDetailPage(reminder: reminder),
          ),
        );
      },
      child: Dismissible(
        background: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Container(
            padding: const EdgeInsets.only(left: 20),
            color: Colors.red,
            alignment: Alignment.centerLeft,
            child: const Icon(
              Icons.delete_forever,
              color: Colors.white,
              size: 42,
            ),
          ),
        ),
        secondaryBackground: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Container(
            padding: const EdgeInsets.only(right: 20),
            color: Colors.blue,
            alignment: Alignment.centerRight,
            child: const Icon(
              Icons.archive,
              color: Colors.white,
              size: 42,
            ),
          ),
        ),
        key: Key("${reminder.id}"),
        child: Hero(
          tag: reminder.id,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.black26),
            ),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.check),
                      const SizedBox(width: 12),
                      Text(
                        reminder.title,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${reminder.text.substring(0, 120).trim()}...",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
