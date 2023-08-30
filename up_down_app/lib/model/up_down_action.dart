import 'package:up_down_app/model/action_fields.dart';
import 'package:up_down_app/model/action_levels.dart';
import 'package:up_down_app/model/action_types.dart';

class UpDownAction  {
  int? id;

  ActionLevels level; // 'Little', 'Standard', 'Big', 'Big Big'
  String talkAboutIt; // Max 200 chars
  String? reallyTalkAboutIt; // No char max
  DateTime timestamp;
  String device; // Device information
  List<String>? tokenizedTalkAboutIt; // List of tokens
  ActionTypes type; // 'Up' or 'Down'

  UpDownAction({
    this.id,
    required this.level,
    required this.talkAboutIt,
    this.reallyTalkAboutIt,
    required this.timestamp,
    required this.device,
    this.tokenizedTalkAboutIt,
    required this.type,
  });


  factory UpDownAction.fromMap(Map<String, dynamic> map) {
    return UpDownAction(
      id: map[ActionFields.id],
      level: map[ActionFields.level],
      talkAboutIt: map[ActionFields.talkAboutIt],
      reallyTalkAboutIt: map[ActionFields.reallyTalkAboutIt],
      timestamp: map[ActionFields.timestamp],
      device: map[ActionFields.device],
      type: map[ActionFields.type],
      tokenizedTalkAboutIt: map[ActionFields.tokenizedTalkAboutIt],
    );
  }

  factory UpDownAction.fromJson(Map<String, dynamic> json) {
    return UpDownAction(
      id: json['id'],
      level: ActionLevels.values.firstWhere((e) => e.toString() == json['level']),
      talkAboutIt: json['talkAboutIt'],
      reallyTalkAboutIt: json['reallyTalkAboutIt'],
      timestamp: DateTime.parse(json['timestamp']),
      device: json['device'],
      tokenizedTalkAboutIt: json['tokenizedTalkAboutIt'],
      type: ActionTypes.values.firstWhere((e) => e.toString() == json['type']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      ActionFields.id: id,
      ActionFields.level: level.toString(),
      ActionFields.talkAboutIt: talkAboutIt,
      ActionFields.reallyTalkAboutIt: reallyTalkAboutIt,
      ActionFields.timestamp: timestamp.toIso8601String(),
      ActionFields.device: device,
      ActionFields.tokenizedTalkAboutIt: tokenizedTalkAboutIt,
      ActionFields.type: type.toString(),
    };
  }

  void setId(int id) {
    this.id = id;
  }
}