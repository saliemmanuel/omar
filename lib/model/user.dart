// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Users {
  final String? id;
  final String? nomPrenom;
  final String? dateNaissance;
  final String? lieuNaissance;
  final String? telephone;
  final String? departement;
  final String? parcours;
  final String? filiere;
  final String? cycleNiveau;
  final String? matricule;
  final String? email;
  final String? avatar;
  String? messagingToken;

  set messagingsToken(String? token) {
    messagingToken = token;
  }

  Users({
    this.id,
    this.nomPrenom,
    this.dateNaissance,
    this.lieuNaissance,
    this.telephone,
    this.departement,
    this.parcours,
    this.filiere,
    this.cycleNiveau,
    this.matricule,
    this.email,
    this.avatar,
    this.messagingToken,
  });

  Users copyWith({
    String? id,
    String? nomPrenom,
    String? dateNaissance,
    String? lieuNaissance,
    String? telephone,
    String? departement,
    String? parcours,
    String? filiere,
    String? cycleNiveau,
    String? matricule,
    String? email,
    String? avatar,
    String? messagingToken,
  }) {
    return Users(
      id: id ?? this.id,
      nomPrenom: nomPrenom ?? this.nomPrenom,
      dateNaissance: dateNaissance ?? this.dateNaissance,
      lieuNaissance: lieuNaissance ?? this.lieuNaissance,
      telephone: telephone ?? this.telephone,
      departement: departement ?? this.departement,
      parcours: parcours ?? this.parcours,
      filiere: filiere ?? this.filiere,
      cycleNiveau: cycleNiveau ?? this.cycleNiveau,
      matricule: matricule ?? this.matricule,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      messagingToken: messagingToken ?? this.messagingToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nomPrenom': nomPrenom,
      'dateNaissance': dateNaissance,
      'lieuNaissance': lieuNaissance,
      'telephone': telephone,
      'departement': departement,
      'parcours': parcours,
      'filiere': filiere,
      'cycleNiveau': cycleNiveau,
      'matricule': matricule,
      'email': email,
      'avatar': avatar,
      'messagingToken': messagingToken,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      id: map['id'] != null ? map['id'] as String : null,
      nomPrenom: map['nomPrenom'] != null ? map['nomPrenom'] as String : null,
      dateNaissance:
          map['dateNaissance'] != null ? map['dateNaissance'] as String : null,
      lieuNaissance:
          map['lieuNaissance'] != null ? map['lieuNaissance'] as String : null,
      telephone: map['telephone'] != null ? map['telephone'] as String : null,
      departement:
          map['departement'] != null ? map['departement'] as String : null,
      parcours: map['parcours'] != null ? map['parcours'] as String : null,
      filiere: map['filiere'] != null ? map['filiere'] as String : null,
      cycleNiveau:
          map['cycleNiveau'] != null ? map['cycleNiveau'] as String : null,
      matricule: map['matricule'] != null ? map['matricule'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      messagingToken: map['messagingToken'] != null
          ? map['messagingToken'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) =>
      Users.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Users(id: $id, nomPrenom: $nomPrenom, dateNaissance: $dateNaissance, lieuNaissance: $lieuNaissance, telephone: $telephone, departement: $departement, parcours: $parcours, filiere: $filiere, cycleNiveau: $cycleNiveau, matricule: $matricule, email: $email, avatar: $avatar, messagingToken: $messagingToken)';
  }

  @override
  bool operator ==(covariant Users other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nomPrenom == nomPrenom &&
        other.dateNaissance == dateNaissance &&
        other.lieuNaissance == lieuNaissance &&
        other.telephone == telephone &&
        other.departement == departement &&
        other.parcours == parcours &&
        other.filiere == filiere &&
        other.cycleNiveau == cycleNiveau &&
        other.matricule == matricule &&
        other.email == email &&
        other.avatar == avatar &&
        other.messagingToken == messagingToken;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nomPrenom.hashCode ^
        dateNaissance.hashCode ^
        lieuNaissance.hashCode ^
        telephone.hashCode ^
        departement.hashCode ^
        parcours.hashCode ^
        filiere.hashCode ^
        cycleNiveau.hashCode ^
        matricule.hashCode ^
        email.hashCode ^
        avatar.hashCode ^
        messagingToken.hashCode;
  }
}
