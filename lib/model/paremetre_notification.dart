// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NotificationsSettingsModels {
  final String id;
  final bool activeSMSNotification;
  final bool activeNotification;
  final String selectedDaySemaine;
  final String heur;
  final String userId;
  NotificationsSettingsModels({
    required this.id,
    required this.activeSMSNotification,
    required this.activeNotification,
    required this.selectedDaySemaine,
    required this.heur,
    required this.userId,
  });

  NotificationsSettingsModels copyWith({
    String? id,
    bool? activeSMSNotification,
    bool? activeNotification,
    String? selectedDaySemaine,
    String? heur,
    String? userId,
  }) {
    return NotificationsSettingsModels(
      id: id ?? this.id,
      activeSMSNotification:
          activeSMSNotification ?? this.activeSMSNotification,
      activeNotification: activeNotification ?? this.activeNotification,
      selectedDaySemaine: selectedDaySemaine ?? this.selectedDaySemaine,
      heur: heur ?? this.heur,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'activeSMSNotification': activeSMSNotification,
      'activeNotification': activeNotification,
      'selectedDaySemaine': selectedDaySemaine,
      'heur': heur,
      'userId': userId,
    };
  }

  factory NotificationsSettingsModels.fromMap(Map<String, dynamic> map) {
    return NotificationsSettingsModels(
      id: map['id'] as String,
      activeSMSNotification: map['activeSMSNotification'] as bool,
      activeNotification: map['activeNotification'] as bool,
      selectedDaySemaine: map['selectedDaySemaine'] as String,
      heur: map['heur'] as String,
      userId: map['userId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationsSettingsModels.fromJson(String source) =>
      NotificationsSettingsModels.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NotificationsSettingsModels(id: $id, activeSMSNotification: $activeSMSNotification, activeNotification: $activeNotification, selectedDaySemaine: $selectedDaySemaine, heur: $heur, userId: $userId)';
  }

  @override
  bool operator ==(covariant NotificationsSettingsModels other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.activeSMSNotification == activeSMSNotification &&
        other.activeNotification == activeNotification &&
        other.selectedDaySemaine == selectedDaySemaine &&
        other.heur == heur &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        activeSMSNotification.hashCode ^
        activeNotification.hashCode ^
        selectedDaySemaine.hashCode ^
        heur.hashCode ^
        userId.hashCode;
  }
}
