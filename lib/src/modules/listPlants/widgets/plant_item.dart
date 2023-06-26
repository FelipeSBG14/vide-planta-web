import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../main.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../models/plants_model.dart';
import 'delete_modal.dart';
import 'plant_modal.dart';

class PlantItem extends StatelessWidget {
  final PlantsModel plant;

  const PlantItem({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      child: LayoutBuilder(
        builder: (_, constrains) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: constrains.minHeight * 0.6,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      plant.image1,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Tooltip(
                message: plant.popularName,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    plant.popularName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.textTitle,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        plant.cientificName,
                        style: context.textStyles.textRegular,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => PlantModal(
                                  controller: controller,
                                  plant: plant,
                                ),
                              );
                            },
                            child: const Text(
                              'Ver',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => DeleteModal(
                                  plant: plant,
                                  controller: controller,
                                ),
                              );
                            },
                            child: const Text(
                              'Remover',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => PlantModal(
                                  controller: controller,
                                  plant: plant,
                                ),
                              );
                            },
                            child: const Text(
                              'Editar',
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
