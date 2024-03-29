import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:omar/firebase/firebase_auth.dart';
import 'package:omar/model/paremetre_notification.dart';
import 'package:omar/model/periode_semaine.dart';
import 'package:uuid/uuid.dart';

import '../model/user.dart';

class FirebaseStorage {
  var firestore = FirebaseFirestore.instance;
  var auth = FirebasesAuth();
  var uuid = const Uuid();
  saveUserDatas({Users? user}) async {
    return await firestore
        .collection("users")
        .doc(user!.id)
        .set(user.toMap())
        .then((value) => value);
  }

  saveDateDatas({PeriodeSemaine? data, String? collection}) async {
    return await firestore
        .collection(collection!)
        .add(data!.toMap())
        .then((value) => value);
  }

  updateUserDatas(
      {Users? users, required String? nom, required String? prenom}) async {
    return await firestore
        .collection("users")
        .doc(users!.id)
        .update({"nom": nom, "prenom": prenom});
  }

  updateUserMessagingToken({Users? user, String? collection}) async {
    await firestore.collection(collection!).doc(user!.id).update(
        {"messagingToken": user.messagingToken}).whenComplete(() => true);
  }

  getUserData({var id}) async {
    try {
      var collection = firestore.collection('users');
      var docSnapshot = await collection.doc(id).get();
      if (docSnapshot.exists) {
        return docSnapshot;
      }
    } catch (e) {
      debugPrint("error $e");
    }
  }

  getLastSemaineInlisteSemaine(
      {required String cycleNiveau,
      required String departement,
      required String parcours}) async {
    QuerySnapshot querySnapshot = await firestore
        .collection("semaine")
        .where("cycleNiveau", isEqualTo: cycleNiveau)
        .where("departement", isEqualTo: departement)
        .where("filiere", isEqualTo: parcours)
        .orderBy("createAt", descending: false)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return PeriodeSemaine.fromMap(
          querySnapshot.docs.first.data() as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> listSemaineComplete() {
    return firestore
        .collection("semaine")
        .orderBy("createAt", descending: false)
        .snapshots();
  }

  Future<PeriodeSemaine?> semaineById({String? id}) async {
    var data = await firestore
        .collection("semaine")
        .where("id", isEqualTo: id)
        .orderBy("createAt", descending: true)
        .get();
    return PeriodeSemaine.fromMap(data.docs.first.data());
  }

  Future<PeriodeSemaine?> lastSemaine() async {
    var data = await firestore
        .collection("semaine")
        .orderBy("createAt", descending: true)
        .get();
    return PeriodeSemaine.fromMap(data.docs.first.data());
  }

  saveNotificationSettings(
      {NotificationsSettingsModels? notificationsSettingsModels}) async {
    var data = await firestore
        .collection("notificationSettings")
        .where("userId", isEqualTo: auth.curentUser!.uid)
        .get();
    if (data.docs.isNotEmpty) {
      await firestore
          .collection("notificationSettings")
          .doc(data.docs.first.id)
          .update(notificationsSettingsModels!.toMap())
          .then((value) => value);
    } else {
      return await firestore
          .collection("notificationSettings")
          .add(notificationsSettingsModels!.toMap())
          .then((value) => value);
    }
  }

  notificationSettingsData() async {
    var data = await firestore
        .collection("notificationSettings")
        .where("userId", isEqualTo: auth.curentUser!.uid)
        .get();
    if (data.docs.isNotEmpty) {
      return NotificationsSettingsModels.fromMap(data.docs.first.data());
    }
    return null;
  }
}
