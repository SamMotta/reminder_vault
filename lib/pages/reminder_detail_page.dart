import 'package:flutter/material.dart';
import 'package:reminder_vault/models/reminder_model.dart';

class ReminderDetailPage extends StatefulWidget {
  final ReminderModel reminder;
  const ReminderDetailPage({super.key, required this.reminder});

  @override
  State<ReminderDetailPage> createState() => _ReminderDetailPageState();
}

class _ReminderDetailPageState extends State<ReminderDetailPage> {
  @override
  Widget build(BuildContext context) {
    final ReminderModel reminder = widget.reminder;
    return Hero(
      tag: reminder.id,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              splashRadius: 24,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.delete_forever),
              splashRadius: 24,
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      reminder.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  reminder.text,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
