
import 'package:get/get.dart';

import '../../../firebase/firebase_storage.dart';
import '../../../model/periode_semaine.dart';
import '../../../model/scheduler_data.dart';

class MoreDetailPeriodeController extends GetxController {
  var storage = FirebaseStorage();
  DateTime? focusDate = DateTime.now();
  final selectedPeride = "semaine".obs;
  List<DonneeMatiere> selectedDay = [];
  RxString selectedCampus = "".obs;
  RxString selectedLabelSemaine = "".obs;
  DateTime? selectedDebutSemaine;
  DateTime? selectedFinSemaine;

  chagefocusDate(DateTime? newFocusDate) {
    focusDate = newFocusDate;
  }

  @override
  void onInit() {
    PeriodeSemaine periodeSemaine = Get.arguments;
    getSemaineById(id: periodeSemaine.id);
    super.onInit();
  }

  PeriodeSemaine semaineData = PeriodeSemaine.nullValue();
  void getSemaineById({required String id}) async {
    PeriodeSemaine? periode = await storage.semaineById(id: id);
    if (periode!.data.semaine!.isNotEmpty) {
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

  checkSemaineKey(SchedulerData data, String indexToCheck) {
    for (var semaine in data.semaine!) {
      if (indexToCheck.compareTo(semaine.index!) == 0) {
        selectedDay.addAll(semaine.data!);
        selectedCampus.value = semaine.campus ?? "#";
      }
    }
  }

  void clearForRamplacement() {
    selectedDay.clear();
    selectedCampus.value = "#";
  }
}
