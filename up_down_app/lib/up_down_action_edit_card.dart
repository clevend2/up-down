import 'package:flutter/material.dart';
import 'package:up_down_app/model/action_levels.dart';
import 'package:up_down_app/model/action_types.dart';
import 'package:up_down_app/data/up_down_action.dart';

/// widget that displays inputs for creating a new up_down_action, or takes in an existing action for editing.
class UpDownActionEditCard extends StatefulWidget {
  @override
  State<UpDownActionEditCard> createState() => _State();
}

class _State extends State<UpDownActionEditCard> {
  final _formKey = GlobalKey<FormState>();

  UpDownAction newAction = UpDownAction(
    level: ActionLevel.usual,
    whatHappened: '',
    talkAboutIt: '',
    timestamp: DateTime.now(),
    device: 'iPhone 12 Pro Max',
    tokenizedWhatHappened: [],
    type: ActionType.down,
  );

  TextEditingController talkAboutItController = TextEditingController();

  /// TODO: up and down buttons get deeper in shade the more relatively frequent they are
  @override
  Widget build(BuildContext context) {
    final UpDownAction action =
        ModalRoute.of(context)!.settings.arguments as UpDownAction? ??
            newAction;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    // Set the action type
                    setState(() {
                      action.type = ActionType.up;
                    });
                  },
                  child: const Text('Up'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    // Set the action type
                    setState(() {
                      action.type = ActionType.down;
                    });
                  },
                  child: const Text('Down'),
                ),
              ),
            ],
          )
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "What happened? (200 characters max))",
            ),
            maxLength: 200,
            onChanged: (value) {
              setState(() {
                action.talkAboutIt = value;
              });

              // TODO: changenotifierhwhhh
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: const Text('Submit'),
          ),
        ),
      ],
    );
  }
}
