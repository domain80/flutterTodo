import 'package:flutter/material.dart';

class Adddialog extends StatelessWidget {
  Adddialog({super.key, required this.onAdd});
  Function onAdd;

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        MaterialButton(
          color: Colors.deepPurple[100],
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              onAdd(_controller.text);
              Navigator.of(context).pop();
            }
          },
          child: const Text("Add"),
        ),
        const SizedBox(
          width: 12,
        ),
        MaterialButton(
          color: Colors.red[100],
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
            ),
          ),
        ],
      ),
    );
  }
}
