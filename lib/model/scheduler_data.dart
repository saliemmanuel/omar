class SchedulerData {
  List<Semaine>? semaine;

  SchedulerData({this.semaine});

  SchedulerData.fromJson(Map<String, dynamic> json) {
    if (json['semaine'] != null) {
      semaine = <Semaine>[];
      json['semaine'].forEach((v) {
        semaine!.add(Semaine.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (semaine != null) {
      data['semaine'] = semaine!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() => toJson().toString();
}

class Semaine {
  String? index;
  String? jour;
  String? campus;
  List<DonneeMatiere>? data;

  Semaine({this.index, this.jour, this.campus, this.data});

  Semaine.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    jour = json['jour'];
    campus = json['campus'];
    if (json['data'] != null) {
      data = <DonneeMatiere>[];
      json['data'].forEach((v) {
        data!.add(DonneeMatiere.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['index'] = index;
    data['jour'] = jour;
    data['campus'] = campus;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() => toJson().toString();
}

class DonneeMatiere {
  String? nomUnite;
  String? codeUnite;
  String? heurCM;
  String? heurTD;
  String? heurTP;
  String? heurTPE;
  String? heurDebut;
  String? heurFin;
  String? nomEnseignant;
  String? nomSalle;

  DonneeMatiere(
      {this.nomUnite,
      this.codeUnite,
      this.heurCM,
      this.heurTD,
      this.heurTP,
      this.heurTPE,
      this.heurDebut,
      this.heurFin,
      this.nomEnseignant,
      this.nomSalle});

  DonneeMatiere.fromJson(Map<String, dynamic> json) {
    nomUnite = json['nomUnite'];
    codeUnite = json['codeUnite'];
    heurCM = json['heurCM'];
    heurTD = json['heurTD'];
    heurTP = json['heurTP'];
    heurTPE = json['heurTPE'];
    heurDebut = json['heurDebut'];
    heurFin = json['heurFin'];
    nomEnseignant = json['nomEnseignant'];
    nomSalle = json['nomSalle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nomUnite'] = nomUnite;
    data['codeUnite'] = codeUnite;
    data['heurCM'] = heurCM;
    data['heurTD'] = heurTD;
    data['heurTP'] = heurTP;
    data['heurTPE'] = heurTPE;
    data['heurDebut'] = heurDebut;
    data['heurFin'] = heurFin;
    data['nomEnseignant'] = nomEnseignant;
    data['nomSalle'] = nomSalle;
    return data;
  }
}
