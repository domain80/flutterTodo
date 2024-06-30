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
          child: Text("Add"),
        ),
        SizedBox(
          width: 12,
        ),
        MaterialButton(
          color: Colors.red[100],
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Cancel"),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
