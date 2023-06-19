// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$_homeStatusAtom =
      Atom(name: 'HomeControllerBase._homeStatus', context: context);

  HomeStateStatus get homeStatus {
    _$_homeStatusAtom.reportRead();
    return super._homeStatus;
  }

  @override
  HomeStateStatus get _homeStatus => homeStatus;

  @override
  set _homeStatus(HomeStateStatus value) {
    _$_homeStatusAtom.reportWrite(value, super._homeStatus, () {
      super._homeStatus = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'HomeControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_imagePath1Atom =
      Atom(name: 'HomeControllerBase._imagePath1', context: context);

  String? get imagePath1 {
    _$_imagePath1Atom.reportRead();
    return super._imagePath1;
  }

  @override
  String? get _imagePath1 => imagePath1;

  @override
  set _imagePath1(String? value) {
    _$_imagePath1Atom.reportWrite(value, super._imagePath1, () {
      super._imagePath1 = value;
    });
  }

  late final _$_imagePath2Atom =
      Atom(name: 'HomeControllerBase._imagePath2', context: context);

  String? get imagePath2 {
    _$_imagePath2Atom.reportRead();
    return super._imagePath2;
  }

  @override
  String? get _imagePath2 => imagePath2;

  @override
  set _imagePath2(String? value) {
    _$_imagePath2Atom.reportWrite(value, super._imagePath2, () {
      super._imagePath2 = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'HomeControllerBase._errorMessage', context: context);

  String? get errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  String? get _errorMessage => errorMessage;

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$addPlantAsyncAction =
      AsyncAction('HomeControllerBase.addPlant', context: context);

  @override
  Future<void> addPlant(
      dynamic id,
      dynamic popularName,
      dynamic popularNomenclature,
      dynamic cientificName,
      dynamic image1,
      dynamic image2,
      dynamic imageFont1,
      dynamic imageFont2,
      dynamic family,
      dynamic vegetalOrgan,
      dynamic terapeuticIndication,
      dynamic contradictions,
      dynamic precautions,
      dynamic medicInteration,
      dynamic teaPrepare,
      dynamic farmaceuticForms,
      dynamic utilizationTime,
      dynamic superDose,
      dynamic toxicologic,
      dynamic extractionMethod,
      dynamic finalObservation) {
    return _$addPlantAsyncAction.run(() => super.addPlant(
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
        finalObservation));
  }

  late final _$uploadImagePlant1AsyncAction =
      AsyncAction('HomeControllerBase.uploadImagePlant1', context: context);

  @override
  Future<void> uploadImagePlant1(Uint8List image, String imageName) {
    return _$uploadImagePlant1AsyncAction
        .run(() => super.uploadImagePlant1(image, imageName));
  }

  late final _$uploadImagePlant2AsyncAction =
      AsyncAction('HomeControllerBase.uploadImagePlant2', context: context);

  @override
  Future<void> uploadImagePlant2(Uint8List image, String imageName) {
    return _$uploadImagePlant2AsyncAction
        .run(() => super.uploadImagePlant2(image, imageName));
  }

  late final _$clearPathsAsyncAction =
      AsyncAction('HomeControllerBase.clearPaths', context: context);

  @override
  Future<void> clearPaths() {
    return _$clearPathsAsyncAction.run(() => super.clearPaths());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
