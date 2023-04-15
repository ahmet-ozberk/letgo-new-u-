import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:letgo/data/turkey_cities.dart';
import 'package:letgo/widgets/custom_textfield.dart';
import 'package:letgo/widgets/material_two.dart';

class CustomLocationView extends ConsumerStatefulWidget {
  const CustomLocationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomLocationViewState();
}

class _CustomLocationViewState extends ConsumerState<CustomLocationView> {
  final pageController = PageController();
  final turkeyCities = TurkeyCities();
  String? selectedCity;
  String? selectedDistrict;

  void selectedCityChanged(String? value) {
    setState(() {
      selectedCity = value;
    });
  }

  void selectedDistrictChanged(String? value) {
    setState(() {
      selectedDistrict = value;
    });
  }

  void clearSelected() {
    setState(() {
      selectedCity = null;
      selectedDistrict = null;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konum Seç', style: Theme.of(context).textTheme.bodyLarge),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.clear),
          tooltip: "Kapat",
        ),
      ),
      floatingActionButton: selectedCity != null
          ? MaterialTwo(
              child: FloatingActionButton(
              onPressed: () {
                pageController.previousPage(duration: 300.milliseconds, curve: Curves.easeInOut);
                clearSelected();
              },
              child: const Icon(Icons.arrow_back_ios_rounded),
            ))
          : null,
      body: Column(
        children: [
          const CustomTextField(
            hintText: "İl, ilçe veya semt ara",
            leading: Icon(
              CupertinoIcons.search,
              size: 18,
            ),
          ).paddingHorizontal(16).paddingOnlyBottom(4),
          GrockContainer(
            padding: [28, 12].horizontalAndVerticalP,
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade300,
                width: 1,
              ),
            )),
            child: Row(
              children: [
                Icon(
                  Icons.my_location_rounded,
                  color: Colors.blue.shade900,
                ),
                4.width,
                Text(
                  "Mevcut Konumu Kullan",
                  style: TextStyle(
                    color: Colors.blue.shade900,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SafeArea(
              child: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("İl Seç",
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                decoration: TextDecoration.underline, color: Colors.blue.shade900)),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final item = turkeyCities.cities()[index];
                            return GrockContainer(
                              padding: 12.paddingOnlyTopBottom,
                              onTap: () {
                                selectedCityChanged(item);
                                pageController.nextPage(
                                    duration: 300.milliseconds, curve: Curves.easeInOut);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(item),
                                  const Icon(Icons.chevron_right_outlined, color: Colors.grey),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(height: 0),
                          itemCount: turkeyCities.cities().length,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("İlçe Seç",
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                decoration: TextDecoration.underline, color: Colors.blue.shade900)),
                        if (selectedCity != null) ...{
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final item = turkeyCities.turkeyCitiesList
                                  .where((element) => element.stateName!.startsWith(selectedCity!))
                                  .toList()[index];
                              return GrockContainer(
                                padding: 12.paddingOnlyTopBottom,
                                onTap: () {
                                  selectedDistrictChanged(item.name);
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(item.name!),
                                    const Icon(Icons.check, color: Colors.grey),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => const Divider(height: 0),
                            itemCount: turkeyCities.turkeyCitiesList
                                .where((element) => element.stateName!.startsWith(selectedCity!))
                                .length,
                          ),
                        } else ...{
                          const Text("Lütfen önce il seçiniz"),
                        }
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
