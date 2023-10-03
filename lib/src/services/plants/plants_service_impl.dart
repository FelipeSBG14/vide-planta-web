// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';
import '../../models/plants_model.dart';
import '../../repositories/plants/plants_repository.dart';
import 'plants_service.dart';

class PlantsServiceImpl implements PlantsService {
  final PlantsRepository _plantsRepository;
  PlantsServiceImpl(
    this._plantsRepository,
  );
  @override
  Future<void> addOrEditPlants(
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
  ) =>
      _plantsRepository.addOrEditPlants(
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
  @override
  Future<List<PlantsModel>> getPlants(String? name) =>
      _plantsRepository.getPlants(name);

  @override
  Future<void> plantDelete(id) => _plantsRepository.plantDelete(id);

  @override
  Future<String> uploadImagePlant(Uint8List image, String imageName) =>
      _plantsRepository.uploadImagePlant(image, imageName);
}
