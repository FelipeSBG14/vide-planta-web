import 'dart:typed_data';
import '../../models/plants_model.dart';

abstract class PlantsRepository {
  Future<List<PlantsModel>> getPlants(String? name);
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
  );
  Future<void> plantDelete(id);
  Future<String> uploadImagePlant(Uint8List image, String imageName);
}
