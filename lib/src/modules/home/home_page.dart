import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:validatorless/validatorless.dart';
import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/messages.dart';
import '../../core/ui/helpers/upload_html_helper.dart';
import '../../core/ui/styles/colors_app.dart';
import '../../models/plants_model.dart';
import '../listPlants/list_plants_page.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final controller = Modular.get<HomeController>();

final popularNameEC = TextEditingController();
final popularNomenclatureEC = TextEditingController();
final cientificNameEC = TextEditingController();
final imageFont1EC = TextEditingController();
final imageFont2EC = TextEditingController();
final familyEC = TextEditingController();
final vegetalOrganEC = TextEditingController();
final terapeuticIndicationEC = TextEditingController();
final contradictionsEC = TextEditingController();
final precautionsEC = TextEditingController();
final medicInterationsEC = TextEditingController();
final teaPrepareEC = TextEditingController();
final farmaceuticFormsEC = TextEditingController();
final utilizationTimeEC = TextEditingController();
final superDoseEC = TextEditingController();
final toxicologicEC = TextEditingController();
final extractionMethodEC = TextEditingController();
final finalObservationEC = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _HomePageState extends State<HomePage> with Loader, Messages {
  late final ReactionDisposer statusReactionDisposer;
  final String id = '';
  @override
  void initState() {
    statusReactionDisposer = reaction((_) => controller.homeStatus, (status) {
      switch (status) {
        case HomeStateStatus.inital:
          break;
        case HomeStateStatus.loading:
          showLoader();
          break;
        case HomeStateStatus.success:
          hideLoader();
          showSuccess('Planta Enviada Com Sucesso');
          controller.isLoading = false;
          popularNameEC.clear();
          cientificNameEC.clear();
          imageFont1EC.clear();
          imageFont2EC.clear();
          familyEC.clear();
          vegetalOrganEC.clear();
          terapeuticIndicationEC.clear();
          contradictionsEC.clear();
          precautionsEC.clear();
          teaPrepareEC.clear();
          farmaceuticFormsEC.clear();
          utilizationTimeEC.clear();
          superDoseEC.clear();
          extractionMethodEC.clear();
          finalObservationEC.clear();
          popularNomenclatureEC.clear();
          medicInterationsEC.clear();
          toxicologicEC.clear();
          controller.clearPaths();
          break;
        case HomeStateStatus.error:
          hideLoader();
          showError(controller.errorMessage ?? 'Erro');
          controller.isLoading = false;
          break;
        case HomeStateStatus.uploaded:
          hideLoader();
          break;
        case HomeStateStatus.addOrEdit:
          // TODO: Handle this case.
          break;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    statusReactionDisposer();
    popularNameEC.dispose();
    cientificNameEC.dispose();
    imageFont1EC.dispose();
    imageFont2EC.dispose();
    familyEC.dispose();
    vegetalOrganEC.dispose();
    terapeuticIndicationEC.dispose();
    contradictionsEC.dispose();
    precautionsEC.dispose();
    teaPrepareEC.dispose();
    farmaceuticFormsEC.dispose();
    utilizationTimeEC.dispose();
    superDoseEC.dispose();
    extractionMethodEC.dispose();
    finalObservationEC.dispose();
    popularNomenclatureEC.dispose();
    medicInterationsEC.dispose();
    toxicologicEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void submitForm() async {
      final isValid = _formKey.currentState?.validate() ?? false;
      if (controller.imagePath1 == null || controller.imagePath2 == null) {
        showWarning('Envie as duas fotos !');
      } else {
        if (isValid) {
          await controller.addPlant(
            null,
            popularNameEC.text,
            popularNomenclatureEC.text,
            cientificNameEC.text,
            controller.imagePath1,
            controller.imagePath2,
            imageFont1EC.text,
            imageFont2EC.text,
            familyEC.text,
            vegetalOrganEC.text,
            terapeuticIndicationEC.text,
            contradictionsEC.text,
            precautionsEC.text,
            medicInterationsEC.text,
            teaPrepareEC.text,
            farmaceuticFormsEC.text,
            utilizationTimeEC.text,
            superDoseEC.text,
            toxicologicEC.text,
            extractionMethodEC.text,
            finalObservationEC.text,
          );
        }
      }
    }

    return Scaffold(
      backgroundColor: ColorsApp.i.primary,
      body: Center(
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
              )
            ],
          ),
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width * 0.7,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () {
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          Modular.to.pushNamed('/listPlants/');
                        });
                      },
                      child: Text(
                        'Ver Plantas',
                        style: TextStyle(
                          color: Colors.brown,
                        ),
                      ),
                    ),
                  ),
                  Image.asset('assets/LogoTipo.png'),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      controller: popularNameEC,
                      decoration: const InputDecoration(
                        isDense: true,
                        labelText: 'Nome Popular',
                      ),
                      validator:
                          Validatorless.required('Nome Popular é obrigatório'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      controller: popularNomenclatureEC,
                      decoration: const InputDecoration(
                        isDense: true,
                        labelText: 'Nomenclaturas Populares',
                      ),
                      validator: Validatorless.required(
                        'Informe Nomenclaturas Populares',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      controller: cientificNameEC,
                      decoration: const InputDecoration(
                        isDense: true,
                        labelText: 'Nome Ciêntifico',
                      ),
                      validator: Validatorless.required(
                        'Nome Ciêntifico é obrigatório',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Observer(
                            builder: (_) {
                              if (controller.imagePath1 != null) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                    controller.imagePath1!,
                                    width: 200,
                                  ),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: TextButton(
                              onPressed: () {
                                UploadHtmlHelper().startUpload(
                                  controller.uploadImagePlant1,
                                );
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white.withOpacity(
                                  0.9,
                                ),
                              ),
                              child: Observer(
                                builder: (_) {
                                  return Text(
                                    '${controller.imagePath1 == null ? 'Adicionar' : 'Alterar'} Foto 1',
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Observer(
                            builder: (_) {
                              return Visibility(
                                visible:
                                    controller.isLoading == true ? false : true,
                                replacement: CircularProgressIndicator(
                                  color: Colors.green,
                                ),
                                child: Observer(
                                  builder: (_) {
                                    if (controller.imagePath2 != null) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(
                                          controller.imagePath2!,
                                          width: 200,
                                        ),
                                      );
                                    }
                                    return const SizedBox.shrink();
                                  },
                                ),
                              );
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: TextButton(
                                onPressed: () {
                                  UploadHtmlHelper().startUpload(
                                    controller.uploadImagePlant2,
                                  );
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white.withOpacity(
                                    0.9,
                                  ),
                                ),
                                child: Observer(
                                  builder: (_) {
                                    return Visibility(
                                      visible: controller.isLoading == true
                                          ? false
                                          : true,
                                      replacement: CircularProgressIndicator(
                                        color: Colors.green,
                                      ),
                                      child: Observer(
                                        builder: (_) {
                                          return Text(
                                            '${controller.imagePath2 == null ? 'Adicionar' : 'Alterar'} Foto 2',
                                          );
                                        },
                                      ),
                                    );
                                  },
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      controller: imageFont1EC,
                      decoration: const InputDecoration(
                        isDense: true,
                        labelText: 'Fonte da Imagem 1',
                      ),
                      validator:
                          Validatorless.required('Coloque a Fonte da Imagem'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      controller: imageFont2EC,
                      decoration: const InputDecoration(
                        isDense: true,
                        labelText: 'Fonte da Imagem 2',
                      ),
                      validator:
                          Validatorless.required('Coloque a Fonte da Imagem'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      controller: familyEC,
                      decoration: const InputDecoration(
                        isDense: true,
                        labelText: 'Família',
                      ),
                      validator: Validatorless.required('Informe a Família'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      controller: vegetalOrganEC,
                      decoration: const InputDecoration(
                        isDense: true,
                        labelText: 'Parte utilizada / órgão vegetal',
                      ),
                      validator: Validatorless.required('Informe o dado'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      controller: terapeuticIndicationEC,
                      decoration: const InputDecoration(
                        isDense: false,
                        label: Text(
                          'Indicações Terapêuticas',
                        ),
                        hintText: 'Descreva',
                        alignLabelWithHint: true,
                      ),
                      maxLines: 5,
                      minLines: null,
                      keyboardType: TextInputType.multiline,
                      validator:
                          Validatorless.required('Descreva as Indicações'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      controller: contradictionsEC,
                      decoration: const InputDecoration(
                        isDense: false,
                        label: Text(
                          'Contradições',
                        ),
                        hintText: 'Descreva',
                        alignLabelWithHint: true,
                      ),
                      maxLines: 5,
                      minLines: null,
                      keyboardType: TextInputType.multiline,
                      validator:
                          Validatorless.required('Coloque as contradições'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      controller: precautionsEC,
                      decoration: const InputDecoration(
                        isDense: false,
                        label: Text(
                          'Precauções de Uso',
                        ),
                        hintText: 'Descreva',
                        alignLabelWithHint: true,
                      ),
                      maxLines: 5,
                      minLines: null,
                      keyboardType: TextInputType.multiline,
                      validator:
                          Validatorless.required('Coloque as precauções'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      controller: medicInterationsEC,
                      decoration: const InputDecoration(
                        labelText: 'Interações Medicamentosas',
                      ),
                      validator: Validatorless.required(
                        'Informe as Interações Medicamentosas',
                      ),
                      maxLines: 5,
                      minLines: null,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      controller: teaPrepareEC,
                      decoration: const InputDecoration(
                        isDense: false,
                        label: Text(
                          'Preparo do Chá',
                        ),
                        hintText: 'Descreva',
                        alignLabelWithHint: true,
                      ),
                      maxLines: 5,
                      minLines: null,
                      keyboardType: TextInputType.multiline,
                      validator: Validatorless.required('Coloque o preparo'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      controller: farmaceuticFormsEC,
                      decoration: const InputDecoration(
                        isDense: false,
                        label: Text(
                          'Formas Farmacêuticas Encontradas',
                        ),
                        hintText: 'Descreva',
                        alignLabelWithHint: true,
                      ),
                      maxLines: 5,
                      minLines: null,
                      keyboardType: TextInputType.multiline,
                      validator: Validatorless.required(
                        'Coloque as formas Farmacêuticas',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      controller: utilizationTimeEC,
                      decoration: const InputDecoration(
                        isDense: false,
                        label: Text(
                          'Tempo de Utilização e Via de Administração',
                        ),
                        hintText: 'Descreva',
                        alignLabelWithHint: true,
                      ),
                      maxLines: 5,
                      minLines: null,
                      keyboardType: TextInputType.multiline,
                      validator: Validatorless.required(
                        'Informe o Tempo de Utilização',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      controller: superDoseEC,
                      decoration: const InputDecoration(
                        isDense: false,
                        label: Text(
                          'Superdosagem',
                        ),
                        hintText: 'Descreva',
                        alignLabelWithHint: true,
                      ),
                      maxLines: 5,
                      minLines: null,
                      keyboardType: TextInputType.multiline,
                      validator: Validatorless.required('Informe Superdosagem'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      controller: toxicologicEC,
                      decoration: const InputDecoration(
                        labelText: 'Toxicologia',
                      ),
                      validator: Validatorless.required(
                        'Informe a toxicologia',
                      ),
                      maxLines: 5,
                      minLines: null,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      controller: extractionMethodEC,
                      decoration: const InputDecoration(
                        isDense: false,
                        label: Text(
                          'Método de Extração Corretos',
                        ),
                        hintText: 'Descreva',
                        alignLabelWithHint: true,
                      ),
                      maxLines: 5,
                      minLines: null,
                      keyboardType: TextInputType.multiline,
                      validator: Validatorless.required(
                        'Coloque o método de extração',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      controller: finalObservationEC,
                      decoration: const InputDecoration(
                        labelText: 'Observação Final',
                      ),
                      validator: Validatorless.required(
                        'Informe a observação final',
                      ),
                      maxLines: 5,
                      minLines: null,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: ElevatedButton(
                      onPressed: submitForm,
                      child: const Text(
                        'Enviar',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
