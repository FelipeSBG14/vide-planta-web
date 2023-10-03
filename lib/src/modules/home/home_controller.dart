import 'dart:developer';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../core/exceptions/repository_exception.dart';
import '../../models/plants_model.dart';
import '../../services/plants/plants_service.dart';
part 'home_controller.g.dart';

enum HomeStateStatus {
  inital,
  loading,
  success,
  uploaded,
  addOrEdit,
  error;
}

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final PlantsService _plantsService;

  @readonly
  HomeStateStatus _homeStatus = HomeStateStatus.inital;

  @observable
  bool isLoading = false;

  @readonly
  String? _imagePath1;

  @readonly
  List<PlantsModel>? _plantsList;

  @readonly
  List<PlantsModel>? _plantsSearch;

  @readonly
  String? _filterName;

  @readonly
  String? _imagePath2;

  @readonly
  PlantsModel? _plantSelected;

  @readonly
  String? _errorMessage;

  HomeControllerBase(this._plantsService);

  @action
  Future<void> findAllPlants() async {
    try {
      _homeStatus = HomeStateStatus.loading;
      _plantsList = await _plantsService.getPlants(_filterName);
      _plantsSearch = _plantsList;
      _homeStatus = HomeStateStatus.success;
      debugPrint('Lista de Jogadores $_plantsList');
      debugPrint('Tamanho ${_plantsList!.length}');
    } on FirebaseException catch (e, s) {
      log('Não foi possível achar os jogadores', error: e, stackTrace: s);
      _errorMessage = 'Não foi possível achar os jogadores';
      _homeStatus = HomeStateStatus.error;
      _plantsList = [];
    } catch (e, s) {
      log('Erro ao buscar jogadores', error: e, stackTrace: s);
      _errorMessage = 'Erro ao buscar jogadores';
      _homeStatus = HomeStateStatus.error;
      _plantsList = [];
    }
  }

  @action
  Future<void> editProduct(PlantsModel plantsModel) async {
    _homeStatus = HomeStateStatus.loading;
    await Future.delayed(Duration.zero);
    _plantSelected = plantsModel;
    _homeStatus = HomeStateStatus.success;
  }

  @action
  Future<void> addPlant(
    id,
    popularName,
    cientificName,
    image1,
    image2,
    imageFont1,
    imageFont2,
    family,
    vegetalOrgan,
    terapeuticIndication,
    contradictionsandprecautions,
    medicInteration,
    farmaceuticForms,
    utilizationTime,
    superDose,
    toxicologic,
    extractionMethodAndPrepare,
    finalObservation,
  ) async {
    _homeStatus = HomeStateStatus.loading;
    try {
      await _plantsService.addOrEditPlants(
        id,
        popularName,
        cientificName,
        image1,
        image2,
        imageFont1,
        imageFont2,
        family,
        vegetalOrgan,
        terapeuticIndication,
        contradictionsandprecautions,
        medicInteration,
        farmaceuticForms,
        utilizationTime,
        superDose,
        toxicologic,
        extractionMethodAndPrepare,
        finalObservation,
      );
      await findAllPlants();
      _homeStatus = HomeStateStatus.success;
    } on FirebaseException catch (e, s) {
      log('Não possível adicionar a planta', error: e, stackTrace: s);
      _errorMessage = e.message;
      _homeStatus = HomeStateStatus.error;
    }
  }

  @action
  void filterByName(String name) {
    _plantsSearch = _plantsList
        ?.where(
          (p) => (p.popularName)
              .trim()
              .toUpperCase()
              .contains(name.trim().toUpperCase()),
        )
        .toList();
  }

  @action
  Future<void> uploadImagePlant1(
    Uint8List image,
    String imageName,
  ) async {
    try {
      _imagePath1 = await _plantsService.uploadImagePlant(image, imageName);
      _homeStatus = HomeStateStatus.uploaded;
    } on RepositoryException catch (e, s) {
      log('Erro ao fazer o upload', error: e, stackTrace: s);
      _errorMessage = e.message;
      _homeStatus = HomeStateStatus.error;
    } on DioException catch (e, s) {
      log('Ocorreu um dio error', error: e, stackTrace: s);
      _homeStatus = HomeStateStatus.error;
      _errorMessage = e.message;
    }
  }

  @action
  Future<void> uploadImagePlant2(
    Uint8List image,
    String imageName,
  ) async {
    try {
      _imagePath2 = await _plantsService.uploadImagePlant(image, imageName);
      _homeStatus = HomeStateStatus.uploaded;
    } on RepositoryException catch (e, s) {
      log('Erro ao fazer o upload', error: e, stackTrace: s);
      _errorMessage = e.message;
      _homeStatus = HomeStateStatus.error;
    } on DioException catch (e, s) {
      log('Ocorreu um dio error', error: e, stackTrace: s);
      _homeStatus = HomeStateStatus.error;
      _errorMessage = e.message;
    }
  }

  @action
  Future<void> changeImages(image1, image2) async {
    _imagePath1 = image1;
    _imagePath2 = image2;
  }

  @action
  Future<void> clearPaths() async {
    _imagePath1 = null;
    _imagePath2 = null;
  }

  @action
  Future<void> plantDelete(id) async {
    try {
      _homeStatus = HomeStateStatus.loading;
      await _plantsService.plantDelete(id);
      await findAllPlants();
      await Future.delayed(const Duration(seconds: 2));

      _homeStatus = HomeStateStatus.success;
    } on RepositoryException catch (e, s) {
      log(
        'Erro ao deletar planta',
        error: e,
        stackTrace: s,
      );
      _errorMessage = e.message;
      _homeStatus = HomeStateStatus.error;
    }
  }
}
