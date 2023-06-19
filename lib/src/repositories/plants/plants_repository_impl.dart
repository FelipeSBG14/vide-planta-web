// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../../core/env.dart';
import '../../core/exceptions/repository_exception.dart';
import '../../models/plants_model.dart';
import 'plants_repository.dart';

class PlantsRepositoryImpl implements PlantsRepository {
  final _dio = Dio();
  String baseUrl = Env.instance.get('backend_base_url');
  @override
  Future<List<PlantsModel>> getPlants(String? name) async {
    throw UnimplementedError();
    // try {
    //   final List<PlantsModel> _PlantsList = [];
    //   final response = await _dio.get(
    //     '$baseUrl/Plants.json',
    //   );
    //   final Map<String, dynamic>? data = response.data;
    //   if (data != null) {
    //     data.forEach(
    //       (playerId, playerData) {
    //         _PlantsList.add(
    //           PlantsModel(
    //             id: playerId,
    //             name: playerData['name'],
    //             coins: playerData['coins'],
    //           ),
    //         );
    //       },
    //     );
    //   }
    //   return _PlantsList;
    // } catch (e, s) {
    //   log('Não deu para buscar os jogadores', error: e, stackTrace: s);
    //   throw RepositoryException(message: 'Erro ao buscar jogadores');
    // }
  }

  @override
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
  ) async {
    try {
      PlantsModel plant = PlantsModel(
          popularName: popularName,
          popularNomenclature: popularNomenclature,
          cientificName: cientificName,
          image1: image1,
          image2: image2,
          imageFont1: imageFont1,
          imageFont2: imageFont2,
          family: family,
          vegetalOrgan: vegetalOrgan,
          terapeuticIndication: terapeuticIndication,
          contradictions: contradictions,
          precautions: precautions,
          medicInterations: medicInteration,
          teaPrepare: teaPrepare,
          farmaceuticForms: farmaceuticForms,
          utilizationTime: utilizationTime,
          superDose: superDose,
          toxicologic: toxicologic,
          extractionMethod: extractionMethod,
          finalObservation: finalObservation);
      if (id == null) {
        plant = PlantsModel(
            id: math.Random().nextDouble().toString(),
            popularName: popularName,
            popularNomenclature: popularNomenclature,
            cientificName: cientificName,
            image1: image1,
            image2: image2,
            imageFont1: imageFont1,
            imageFont2: imageFont2,
            family: family,
            vegetalOrgan: vegetalOrgan,
            terapeuticIndication: terapeuticIndication,
            contradictions: contradictions,
            precautions: precautions,
            medicInterations: medicInteration,
            teaPrepare: teaPrepare,
            farmaceuticForms: farmaceuticForms,
            utilizationTime: utilizationTime,
            superDose: superDose,
            toxicologic: toxicologic,
            extractionMethod: extractionMethod,
            finalObservation: finalObservation);
      } else {
        plant = PlantsModel(
          id: id,
          popularName: popularName,
          popularNomenclature: popularNomenclature,
          cientificName: cientificName,
          image1: image1,
          image2: image2,
          imageFont1: imageFont1,
          imageFont2: imageFont2,
          family: family,
          vegetalOrgan: vegetalOrgan,
          terapeuticIndication: terapeuticIndication,
          contradictions: contradictions,
          precautions: precautions,
          medicInterations: medicInteration,
          teaPrepare: teaPrepare,
          farmaceuticForms: farmaceuticForms,
          utilizationTime: utilizationTime,
          superDose: superDose,
          toxicologic: toxicologic,
          extractionMethod: extractionMethod,
          finalObservation: finalObservation,
        );
      }
      if (id != null) {
        await _dio.patch(
          '$baseUrl/Plants/$id.json',
          data: {
            'popularName': plant.popularName,
            'popularNomenclature': plant.popularNomenclature,
            'cientificName': plant.cientificName,
            'image1': plant.image1,
            'image2': plant.image2,
            'imageFont1': plant.imageFont1,
            'imageFont2': plant.imageFont2,
            'family': plant.family,
            'vegetalOrgan': plant.vegetalOrgan,
            'terapeuticIndication': plant.terapeuticIndication,
            'contradictions': plant.contradictions,
            'precautions': plant.precautions,
            'medicInterations': plant.medicInterations,
            'teaPrepare': plant.teaPrepare,
            'farmaceuticForms': plant.farmaceuticForms,
            'utilizationTime': plant.utilizationTime,
            'superDose': plant.superDose,
            'toxicologic': plant.toxicologic,
            'finalObservation': plant.finalObservation,
            'extractionMethod': plant.extractionMethod,
          },
        );
      } else {
        await _dio.post(
          '$baseUrl/Plants.json',
          data: {
            'id': plant.id,
            'popularName': plant.popularName,
            'popularNomenclature': plant.popularNomenclature,
            'cientificName': plant.cientificName,
            'image1': plant.image1,
            'image2': plant.image2,
            'imageFont1': plant.imageFont1,
            'imageFont2': plant.imageFont2,
            'family': plant.family,
            'vegetalOrgan': plant.vegetalOrgan,
            'terapeuticIndication': plant.terapeuticIndication,
            'contradictions': plant.contradictions,
            'precautions': plant.precautions,
            'medicInterations': plant.medicInterations,
            'teaPrepare': plant.teaPrepare,
            'farmaceuticForms': plant.farmaceuticForms,
            'utilizationTime': plant.utilizationTime,
            'superDose': plant.superDose,
            'toxicologic': plant.toxicologic,
            'finalObservation': plant.finalObservation,
            'extractionMethod': plant.extractionMethod,
          },
        );
      }
    } on DioException catch (e, s) {
      log('Aconteceu um erro na requisição', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro na requisição');
    } catch (e, s) {
      log('Não deu para adicionar o jogador', error: e, stackTrace: s);
      debugPrint(e.toString());
      throw RepositoryException(message: 'Erro ao buscar jogadores');
    }
  }

  @override
  Future<void> plantDelete(id) async {
    try {
      if (id != null) {
        await _dio.delete(
          '$baseUrl/Plants/$id.json',
        );
      } else {
        throw RepositoryException(message: 'Id não identificado');
      }
    } on DioException catch (e, s) {
      log('Aconteceu um erro na requisição', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro na requisição');
    } catch (e, s) {
      log('Não deu para adicionar o jogador', error: e, stackTrace: s);
      debugPrint(e.toString());
      throw RepositoryException(message: 'Erro ao buscar jogadores');
    }
  }

  @override
  Future<String> uploadImagePlant(Uint8List image, String imageName) async {
    try {
      final storageRef = FirebaseStorage.instance.ref('images/$imageName');
      final uploadTaskSnapshot = await storageRef.putData(image);
      final String imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
      return imageUri;
      // final formData = FormData.fromMap(
      //   {
      //     'images': MultipartFile.fromBytes(
      //       file,
      //       filename: fileName,
      //     ),
      //   },
      // );
      // final response = await _dio.post(
      //   baseUrl,
      //   data: formData,
      // );
      // return response.data['url'];
    } on FirebaseException catch (e, s) {
      log('Erro no firebase', error: e, stackTrace: s);
      throw RepositoryException(message: e.message!);
    } on DioException catch (e, s) {
      log('Ocorreu uma excessão do dio', error: e, stackTrace: s);
      throw ErrorDescription(e.message.toString());
    } catch (e, s) {
      log(
        'Erro ao fazer o upload do arquivo',
        error: e,
        stackTrace: s,
      );
      throw RepositoryException(
        message: e.toString(),
      );
    }
  }
}
