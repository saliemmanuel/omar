import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import '../../home/widget/card_programme.dart';
import './more_detail_periode_controller.dart';

class MoreDetailPeriodePage extends StatefulWidget {
  const MoreDetailPeriodePage({Key? key}) : super(key: key);

  @override
  State<MoreDetailPeriodePage> createState() => _MoreDetailPeriodePageState();
}

class _MoreDetailPeriodePageState extends State<MoreDetailPeriodePage> {
  var controller = Get.put(MoreDetailPeriodeController());
  DateTime? focusDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Omar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => ListView(
            children: [
              if (controller.selectedDebutSemaine != null)
                EasyInfiniteDateTimeLine(
                  headerBuilder: (context, date) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: ListTile(
                        leading: const HeroIcon(HeroIcons.calendarDays),
                        title: AutoSizeText(
                          controller.selectedLabelSemaine.value,
                          style: const TextStyle(fontSize: 20),
                        ),
                        onTap: () {
                          // Get.toNamed(NamePageRoute.periode);
                        },
                      ),
                    );
                  },
                  showTimelineHeader: true,
                  dayProps: EasyDayProps(
                    inactiveDayStyle: DayStyle(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.4)),
                        ),
                        dayNumStyle: const TextStyle(color: Colors.grey)),
                    todayStyle: DayStyle(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff3371FF)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        dayNumStyle:
                            const TextStyle(fontWeight: FontWeight.bold)),
                    activeDayStyle: const DayStyle(
                      dayStrStyle: TextStyle(color: Colors.white),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff3371FF),
                            Color(0xff8426D6),
                          ],
                        ),
                      ),
                    ),
                  ),
                  firstDate: DateTime(
                      controller.selectedDebutSemaine!.year,
                      controller.selectedDebutSemaine!.month,
                      controller.selectedDebutSemaine!.day),
                  focusDate: controller.focusDate,
                  lastDate: DateTime(
                      controller.selectedFinSemaine!.year,
                      controller.selectedFinSemaine!.month,
                      controller.selectedFinSemaine!.day),
                  onDateChange: (selectedDate) {
                    controller.focusDate = selectedDate;
                    controller.clearForRamplacement();
                    controller.checkSemaineKey(controller.semaineData.data,
                        "${focusDate!.day}-${focusDate!.month}-${focusDate!.year}");
                    setState(() {});
                  },
                ),
              const SizedBox(height: 20),
              Text(controller.selectedCampus.value),
              const Divider(),
              ...controller.selectedDay
                  .map((element) => CardProgramme(
                      codeUnite: element.codeUnite!,
                      nomUnite: element.nomUnite!,
                      heurCM: element.heurCM!,
                      heurTD: element.heurTD!,
                      heurTP: element.heurTP!,
                      heurDebut: element.heurDebut!,
                      heurFin: element.heurFin!,
                      heurTPE: element.heurTPE!,
                      nomEnseignant: element.nomEnseignant!,
                      nomSalle: element.nomSalle!))
                  .toList()
            ],
          ),
        ),
      ),
    );
  }
}
