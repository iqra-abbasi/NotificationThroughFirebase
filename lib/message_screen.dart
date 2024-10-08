import 'package:flutter/material.dart';
class MessageScreen extends StatefulWidget {
  final String type;

  const MessageScreen({super.key,
    required this.type});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('message screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
        Center(
          child:
          Text('${widget.type}',
            style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),),
        )
          ],
        ),
      ),
    );
  }
}
