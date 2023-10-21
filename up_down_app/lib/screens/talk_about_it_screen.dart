import 'package:flutter/material.dart';

class TalkAboutItScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Talk About It'),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.1,
          ),
          child: TextField(
            controller: controller,
            maxLines: null,
            decoration: InputDecoration(
              hintText: 'Talk about it',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            Navigator.pop(context, controller.text);
          },
        ),
      ),
    );
  }
}