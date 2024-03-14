import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uuid/uuid.dart';

import '../../firebase/firebase_storage.dart';
import '../../model/scheduler_data.dart';
import '../../model/periode_semaine.dart';
import '../ia/ia_page.dart';
import '../settings/settings_page.dart';
import 'widget/home.dart';

class HomeController extends GetxController {
  var page = [const Home(), const IaPage(), const SettingsPage()];

  @override
  void onInit() {
    getLastSemaine();
    super.onInit();
  }

  var storage = FirebaseStorage();
  RxString title = "Semaine".obs;
  var box = GetStorage();
  RxInt currentIndex = 0.obs;
  final uui = const Uuid();
  DateTime? focusDate = DateTime.now();
  final selectedPeride = "semaine".obs;
  chagefocusDate(DateTime? newFocusDate) {
    focusDate = newFocusDate;
  }

  RxString search = "".obs;
  List<DonneeMatiere> selectedDay = [];
  RxString selectedCampus = "".obs;
  RxString selectedLabelSemaine = "".obs;
  DateTime? selectedDebutSemaine;
  DateTime? selectedFinSemaine;

  checkSemaineKey(SchedulerData data, String indexToCheck) {
    for (var semaine in data.semaine!) {
      if (indexToCheck.compareTo(semaine.index!) == 0) {
        selectedDay.addAll(semaine.data!);
        selectedCampus.value = semaine.campus ?? "#";
      }
    }
  }

  PeriodeSemaine semaineData = PeriodeSemaine.nullValue();
  void getLastSemaine() async {
    PeriodeSemaine periode = await storage.getLastSemaineInlisteSemaine();
    if (periode.data.semaine!.isNotEmpty) {
      semaineData = periode;
      selectedCampus.value = "";
      selectedLabelSemaine.value = "";
      selectedLabelSemaine.value = semaineData.labelSemaine;
      selectedDebutSemaine =
          DateTime.parse(semaineData.debutSemaine.toString());
      selectedFinSemaine = DateTime.parse(semaineData.finSemaine.toString());
      checkSemaineKey(semaineData.data,
          "${focusDate!.day}-${focusDate!.month}-${focusDate!.year}");
    }
  }

  // temp() {
  //   var semaine = PeriodeSemaine(
  //       data: SchedulerData.fromJson(dateData),
  //       debutSemaine: DateTime(2024, 03, 11).toString(),
  //       finSemaine: DateTime(2024, 03, 11).toString(),
  //       labelSemaine: "Semaine du 11 mars 2024 au 17 mars 2024",
  //       createAt: DateTime.now().toString(),
  //       id: uui.v6(),
  //       cycleNiveau: "IC3",
  //       departement: "INFTEL",
  //       filiere: "DATA SCIENCE");
  //   storage.saveDateDatas(collection: "semaine", data: semaine);
  // }

  Stream<QuerySnapshot<Map<String, dynamic>>> getStream() {
    return storage.listSemaineComplete();
  }

  void clearForRamplacement() {
    selectedDay.clear();
    selectedCampus.value = "#";
  }
}
