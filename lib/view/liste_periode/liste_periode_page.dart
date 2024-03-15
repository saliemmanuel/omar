import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:omar/model/periode_semaine.dart';
import 'package:omar/view/home/home_controller.dart';
import '../../routes/routes.dart';
import '../global/custom_search_bar.dart';

class ListePeriodePage extends GetView<HomeController> {
  const ListePeriodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(title: Text(controller.title.value)),
          body: ListView(
            children: [
              CustomSearchBar(onChanged: (value) {
                controller.search.value = value;
              }),
              Text(controller.search.value,
                  style: const TextStyle(
                      fontSize: 0.0, color: Colors.transparent)),
              StreamBuilder(
                  stream: controller.getStream(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.docs.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: Center(child: Text("Aucune période trouvé")),
                        );
                      }
                      return ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var periodeSemaine = PeriodeSemaine.fromMap(
                              snapshot.data!.docs[index].data());
                          if (controller.search.isEmpty) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Card(
                                child: ListTile(
                                  leading:
                                      const HeroIcon(HeroIcons.calendarDays),
                                  title: Text(periodeSemaine.labelSemaine),
                                  onTap: () {
                                    Get.toNamed(NamePageRoute.detailPeriode,
                                        arguments: periodeSemaine);
                                  },
                                ),
                              ),
                            );
                          }
                          if (periodeSemaine.labelSemaine
                              .toLowerCase()
                              .contains(controller.search.toLowerCase())) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Card(
                                child: ListTile(
                                  leading:
                                      const HeroIcon(HeroIcons.calendarDays),
                                  title: Text(periodeSemaine.labelSemaine),
                                  onTap: () {
                                    Get.toNamed(NamePageRoute.detailPeriode,
                                        arguments: periodeSemaine);
                                  },
                                ),
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  }),
              const SizedBox(height: 100.0),
            ],
          ),
        ));
  }
}
