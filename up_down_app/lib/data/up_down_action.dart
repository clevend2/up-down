import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:up_down_app/model/action_fields.dart';
import 'package:up_down_app/model/action_levels.dart';
import 'package:up_down_app/model/action_types.dart';

@immutable
class UpDownAction {
  final int? id;

  final ActionType type; // 'Up' or 'Down'
  final ActionLevel level; // 'Little', 'Standard', 'Big', 'Big Big'
  final String whatHappened; // Max 200 chars
  final String? talkAboutIt; // No char max
  final DateTime timestamp;
  final String device; // Device information
  final String? tokenizedWhatHappened; // List of tokens

  UpDownAction({
    this.id,
    required this.type,
    required this.level,
    required this.whatHappened,
    this.talkAboutIt,
    required this.timestamp,
    required this.device,
    this.tokenizedWhatHappened,
  });

  factory UpDownAction.empty() {
    return UpDownAction(
      type: ActionType.up,
      level: ActionLevel.usual,
      whatHappened: '',
      timestamp: DateTime.now(),
      device: '',
    );
  }

  UpDownAction copyWith ({
    int? id,
    ActionType? type,
    ActionLevel? level,
    String? whatHappened,
    String? talkAboutIt,
    DateTime? timestamp,
    String? device,
    String? tokenizedWhatHappened,
  }) {
    return UpDownAction(
      id: id ?? this.id,
      type: type ?? this.type,
      level: level ?? this.level,
      whatHappened: whatHappened ?? this.whatHappened,
      talkAboutIt: talkAboutIt ?? this.talkAboutIt,
      timestamp: timestamp ?? this.timestamp,
      device: device ?? this.device,
      tokenizedWhatHappened: tokenizedWhatHappened ?? this.tokenizedWhatHappened,
    );
  }

  factory UpDownAction.fromMap(Map<String, dynamic> map) {
    return UpDownAction(
      id: map[ActionFields.id],
      level: map[ActionFields.level],
      whatHappened: map[ActionFields.whatHappened],
      talkAboutIt: map[ActionFields.talkAboutIt],
      timestamp: map[ActionFields.timestamp],
      device: map[ActionFields.device],
      type: map[ActionFields.type],
      tokenizedWhatHappened: map[ActionFields.tokenizedWhatHappened],
    );
  }

  factory UpDownAction.fromJson(Map<String, dynamic> json) {
    return UpDownAction(
      id: json['id'],
      level: ActionLevel.values.firstWhere((e) => e.toString() == json['level']),
      whatHappened: json['whatHappened'],
      talkAboutIt: json['talkAboutIt'],
      timestamp: DateTime.parse(json['timestamp']),
      device: json['device'],
      tokenizedWhatHappened: json['tokenizedWhatHappened'],
      type: ActionType.values.firstWhere((e) => e.toString() == json['type']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      ActionFields.id: id,
      ActionFields.level: level.toString(),
      ActionFields.whatHappened: whatHappened,
      ActionFields.talkAboutIt: talkAboutIt,
      ActionFields.timestamp: timestamp.toIso8601String(),
      ActionFields.device: device,
      ActionFields.tokenizedWhatHappened: tokenizedWhatHappened,
      ActionFields.type: type.toString(),
    };
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}