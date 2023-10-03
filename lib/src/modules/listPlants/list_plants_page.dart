import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../core/ui/helpers/debouncer.dart';
import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/messages.dart';
import '../../core/ui/styles/colors_app.dart';
import '../../core/ui/styles/text_styles.dart';
import '../home/home_controller.dart';
import 'widgets/plant_item.dart';

class ListPlantsPage extends StatefulWidget {
  const ListPlantsPage({super.key});

  @override
  State<ListPlantsPage> createState() => _ListPlantsPageState();
}

class _ListPlantsPageState extends State<ListPlantsPage> with Loader, Messages {
  final controller = Modular.get<HomeController>();
  final debouncer = Debouncer(milisencods: 200);
  late final ReactionDisposer statusReactionDisposer;
  @override
  void initState() {
    controller.findAllPlants();
    statusReactionDisposer = reaction((_) => controller.homeStatus, (status) {
      switch (status) {
        case HomeStateStatus.inital:
          break;
        case HomeStateStatus.loading:
          showLoader();
          break;
        case HomeStateStatus.success:
          hideLoader();
          showSuccess('Plantas encontradas');
          break;
        case HomeStateStatus.uploaded:
          break;
        case HomeStateStatus.error:
          showError('Não foram encontradas');
          hideLoader();
          break;
        case HomeStateStatus.addOrEdit:
          hideLoader();
          break;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorsApp.i.primary,
      child: LayoutBuilder(
        builder: (
          context,
          constrains,
        ) {
          return Center(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey, //New
                    blurRadius: 25.0,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () {
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          Modular.to.pushNamed('/');
                        });
                      },
                      child: const Text(
                        'Adicionar Planta',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'LISTA DE PLANTAS',
                      style: context.textStyles.textRegular,
                    ),
                  ),
                  SizedBox(
                    width: constrains.maxWidth * .15,
                    child: TextFormField(
                      onChanged: (value) {
                        debouncer.call(
                          () {
                            controller.filterByName(value);
                          },
                        );
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        prefixIcon: Icon(
                          Icons.search,
                          size: constrains.maxWidth * 0.02,
                        ),
                        label: Text(
                          'Buscar por nome popular',
                          style: context.textStyles.textRegular.copyWith(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Observer(
                    builder: (_) {
                      return Visibility(
                        visible:
                            controller.homeStatus == HomeStateStatus.loading
                                ? false
                                : true,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: Expanded(
                          child: Observer(
                            builder: (_) {
                              return controller.plantsSearch!.isEmpty
                                  ? const Text('Nenhuma planta encontrada')
                                  : GridView.builder(
                                      itemCount:
                                          controller.plantsSearch?.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithMaxCrossAxisExtent(
                                        mainAxisExtent: 280,
                                        mainAxisSpacing: 20,
                                        maxCrossAxisExtent: 280,
                                        crossAxisSpacing: 10,
                                      ),
                                      itemBuilder: (context, index) {
                                        return PlantItem(
                                          plant:
                                              controller.plantsSearch![index],
                                        );
                                      },
                                    );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
