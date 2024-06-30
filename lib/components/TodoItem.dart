import 'package:flutter/material.dart';

class Todoitem extends StatelessWidget {
  Todoitem({
    super.key,
    required this.title,
    required this.isDone,
    required this.onChanged,
    required this.onDismissed,
  });

  final String title;
  final bool isDone;
  Function onChanged;
  Function onDismissed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {onChanged(!isDone)},
        child: Dismissible(
          key: ValueKey(title),
          onDismissed: (direction) {
            onDismissed();
          },
          background: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.red,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.delete),
                  Icon(Icons.delete),
                ],
              ),
            ),
          ),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.deepPurple[200],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 16, bottom: 16, left: 16, right: 16),
                child: Row(
                  children: [
                    Checkbox(
                        value: isDone,
                        onChanged: (value) {
                          onChanged(value);
                        }),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
