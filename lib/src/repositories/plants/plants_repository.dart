import 'dart:typed_data';
import '../../models/plants_model.dart';

abstract class PlantsRepository {
  Future<List<PlantsModel>> getPlants(String? name);
  Future<void> addOrEditPlants(
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
  Future<void> plantDelete(id);
  Future<String> uploadImagePlant(Uint8List image, String imageName);
}
