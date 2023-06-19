import 'dart:developer';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:mobx/mobx.dart';
import '../../core/exceptions/repository_exception.dart';
import '../../services/plants/plants_service.dart';
part 'home_controller.g.dart';

enum HomeStateStatus {
  inital,
  loading,
  success,
  uploaded,
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
  String? _imagePath2;

  @readonly
  String? _errorMessage;

  HomeControllerBase(this._plantsService);

  @action
  Future<void> addPlant(
    id,
    popularName,
    popularNomenclature,
    cientificName,
    image1,
    image2,
    imageFont1,
    imageFont2,
    family,
    vegetalOrgan,
    terapeuticIndication,
    contradictions,
    precautions,
    medicInteration,
    teaPrepare,
    farmaceuticForms,
    utilizationTime,
    superDose,
    toxicologic,
    extractionMethod,
    finalObservation,
  ) async {
    _homeStatus = HomeStateStatus.loading;
    try {
      await _plantsService.addOrEditPlants(
        id,
        popularName,
        popularNomenclature,
        cientificName,
        image1,
        image2,
        imageFont1,
        imageFont2,
        family,
        vegetalOrgan,
        terapeuticIndication,
        contradictions,
        precautions,
        medicInteration,
        teaPrepare,
        farmaceuticForms,
        utilizationTime,
        superDose,
        toxicologic,
        extractionMethod,
        finalObservation,
      );
      //await findAllPlayers();
      _homeStatus = HomeStateStatus.success;
    } on FirebaseException catch (e, s) {
      log('Não possível adicionar a planta', error: e, stackTrace: s);
      _errorMessage = e.message;
      _homeStatus = HomeStateStatus.error;
    }
  }

  @action
  Future<void> uploadImagePlant1(
    Uint8List image,
    String imageName,
  ) async {
    try {
      _homeStatus = HomeStateStatus.loading;
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
      _homeStatus = HomeStateStatus.loading;
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
  Future<void> clearPaths() async {
    _imagePath1 = null;
    _imagePath2 = null;
  }
}
