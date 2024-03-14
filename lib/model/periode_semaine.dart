// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:omar/model/scheduler_data.dart';

class PeriodeSemaine {
  final String id;
  final String labelSemaine;
  final SchedulerData data;
  final String createAt;
  final String debutSemaine;
  final String finSemaine;
  final String departement;
  final String cycleNiveau;
  final String filiere;
  PeriodeSemaine({
    required this.id,
    required this.labelSemaine,
    required this.data,
    required this.createAt,
    required this.debutSemaine,
    required this.finSemaine,
    required this.departement,
    required this.cycleNiveau,
    required this.filiere,
  });

  PeriodeSemaine copyWith({
    String? id,
    String? labelSemaine,
    SchedulerData? data,
    String? createAt,
    String? debutSemaine,
    String? finSemaine,
    String? departement,
    String? cycleNiveau,
    String? filiere,
  }) {
    return PeriodeSemaine(
      id: id ?? this.id,
      labelSemaine: labelSemaine ?? this.labelSemaine,
      data: data ?? this.data,
      createAt: createAt ?? this.createAt,
      debutSemaine: debutSemaine ?? this.debutSemaine,
      finSemaine: finSemaine ?? this.finSemaine,
      departement: departement ?? this.departement,
      cycleNiveau: cycleNiveau ?? this.cycleNiveau,
      filiere: filiere ?? this.filiere,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'labelSemaine': labelSemaine,
      'data': data.toJson(),
      'createAt': createAt,
      'debutSemaine': debutSemaine,
      'finSemaine': finSemaine,
      'departement': departement,
      'cycleNiveau': cycleNiveau,
      'filiere': filiere,
    };
  }

  factory PeriodeSemaine.nullValue() {
    return PeriodeSemaine(
      id: "",
      labelSemaine: "",
      data: SchedulerData(),
      createAt: "",
      debutSemaine: "",
      finSemaine: "",
      departement: "",
      cycleNiveau: "",
      filiere: "",
    );
  }
  factory PeriodeSemaine.fromMap(Map<String, dynamic> map) {
    return PeriodeSemaine(
      id: map['id'] as String,
      labelSemaine: map['labelSemaine'] as String,
      data: SchedulerData.fromJson(map['data'] as Map<String, dynamic>),
      createAt: map['createAt'] as String,
      debutSemaine: map['debutSemaine'] as String,
      finSemaine: map['finSemaine'] as String,
      departement: map['departement'] as String,
      cycleNiveau: map['cycleNiveau'] as String,
      filiere: map['filiere'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PeriodeSemaine.fromJson(String source) =>
      PeriodeSemaine.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PeriodeSemaine(id: $id, labelSemaine: $labelSemaine, data: ${data.toJson()}, createAt: $createAt, debutSemaine: $debutSemaine, finSemaine: $finSemaine, departement: $departement, cycleNiveau: $cycleNiveau, filiere: $filiere)';
  }

  @override
  bool operator ==(covariant PeriodeSemaine other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.labelSemaine == labelSemaine &&
        other.data == data &&
        other.createAt == createAt &&
        other.debutSemaine == debutSemaine &&
        other.finSemaine == finSemaine &&
        other.departement == departement &&
        other.cycleNiveau == cycleNiveau &&
        other.filiere == filiere;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        labelSemaine.hashCode ^
        data.hashCode ^
        createAt.hashCode ^
        debutSemaine.hashCode ^
        finSemaine.hashCode ^
        departement.hashCode ^
        cycleNiveau.hashCode ^
        filiere.hashCode;
  }
}
