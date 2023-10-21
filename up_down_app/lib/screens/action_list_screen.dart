import 'package:flutter/material.dart';
import 'package:up_down_app/data/up_down_action.dart';

class ActionListScreen extends StatelessWidget {
  final List<UpDownAction> actions = []; // Replace with your list of actions

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Action List'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: actions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(actions[index].whatHappened),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // TODO: Implement edit functionality
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // TODO: Implement delete functionality
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}