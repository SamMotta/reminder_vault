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
      child: Hero(
        tag: reminder.id,
        child: Card(
          color: Colors.red,
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
    );
  }
}
