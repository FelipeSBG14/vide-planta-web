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
    try {
      final List<PlantsModel> _plantsList = [];
      final response = await _dio.get(
        '$baseUrl/Plants.json',
      );

      if (response.data != null) {
        response.data.forEach(
          (plantId, plantData) {
            _plantsList.add(
              PlantsModel(
                id: plantId,
                popularName: plantData['popularName'],
                cientificName: plantData['cientificName'],
                image1: plantData['image1'],
                image2: plantData['image2'],
                imageFont1: plantData['imageFont1'],
                imageFont2: plantData['imageFont2'],
                family: plantData['family'],
                vegetalOrgan: plantData['vegetalOrgan'],
                terapeuticIndication: plantData['terapeuticIndication'],
                contradictionsandprecautions:
                    plantData['contradictionsandprecautions'],
                medicInterations: plantData['medicInterations'],
                farmaceuticForms: plantData['farmaceuticForms'],
                utilizationTime: plantData['utilizationTime'],
                superDose: plantData['superDose'],
                toxicologic: plantData['toxicologic'],
                extractionMethodAndPrepare:
                    plantData['extractionMethodAndPrepare'],
                finalObservation: plantData['finalObservation'],
              ),
            );
          },
        );
      }
      return _plantsList;
    } on DioException catch (e, s) {
      log('Erro ao buscar plantas', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar plantas');
    } catch (e, s) {
      log('Não deu para buscar os jogadores', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar plantas');
    }
  }

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
  ) async {
    try {
      PlantsModel plant = PlantsModel(
        popularName: popularName,
        cientificName: cientificName,
        image1: image1,
        image2: image2,
        imageFont1: imageFont1,
        imageFont2: imageFont2,
        family: family,
        vegetalOrgan: vegetalOrgan,
        terapeuticIndication: terapeuticIndication,
        contradictionsandprecautions: contradictionsandprecautions,
        medicInterations: medicInteration,
        farmaceuticForms: farmaceuticForms,
        utilizationTime: utilizationTime,
        superDose: superDose,
        toxicologic: toxicologic,
        extractionMethodAndPrepare: extractionMethodAndPrepare,
        finalObservation: finalObservation,
      );
      if (id == null) {
        plant = PlantsModel(
          id: math.Random().nextDouble().toString(),
          popularName: popularName,
          cientificName: cientificName,
          image1: image1,
          image2: image2,
          imageFont1: imageFont1,
          imageFont2: imageFont2,
          family: family,
          vegetalOrgan: vegetalOrgan,
          terapeuticIndication: terapeuticIndication,
          contradictionsandprecautions: contradictionsandprecautions,
          medicInterations: medicInteration,
          farmaceuticForms: farmaceuticForms,
          utilizationTime: utilizationTime,
          superDose: superDose,
          toxicologic: toxicologic,
          extractionMethodAndPrepare: extractionMethodAndPrepare,
          finalObservation: finalObservation,
        );
      } else {
        plant = PlantsModel(
          id: id,
          popularName: popularName,
          cientificName: cientificName,
          image1: image1,
          image2: image2,
          imageFont1: imageFont1,
          imageFont2: imageFont2,
          family: family,
          vegetalOrgan: vegetalOrgan,
          terapeuticIndication: terapeuticIndication,
          contradictionsandprecautions: contradictionsandprecautions,
          medicInterations: medicInteration,
          farmaceuticForms: farmaceuticForms,
          utilizationTime: utilizationTime,
          superDose: superDose,
          toxicologic: toxicologic,
          extractionMethodAndPrepare: extractionMethodAndPrepare,
          finalObservation: finalObservation,
        );
      }
      if (id != null) {
        await _dio.patch(
          '$baseUrl/Plants/$id.json',
          data: {
            'popularName': plant.popularName,
            'cientificName': plant.cientificName,
            'image1': plant.image1,
            'image2': plant.image2,
            'imageFont1': plant.imageFont1,
            'imageFont2': plant.imageFont2,
            'family': plant.family,
            'vegetalOrgan': plant.vegetalOrgan,
            'terapeuticIndication': plant.terapeuticIndication,
            'contradictionsandprecautions': plant.contradictionsandprecautions,
            'medicInterations': plant.medicInterations,
            'farmaceuticForms': plant.farmaceuticForms,
            'utilizationTime': plant.utilizationTime,
            'superDose': plant.superDose,
            'toxicologic': plant.toxicologic,
            'finalObservation': plant.finalObservation,
            'extractionMethodAndPrepare': plant.extractionMethodAndPrepare,
          },
        );
      } else {
        await _dio.post(
          '$baseUrl/Plants.json',
          data: {
            'id': plant.id,
            'popularName': plant.popularName,
            'cientificName': plant.cientificName,
            'image1': plant.image1,
            'image2': plant.image2,
            'imageFont1': plant.imageFont1,
            'imageFont2': plant.imageFont2,
            'family': plant.family,
            'vegetalOrgan': plant.vegetalOrgan,
            'terapeuticIndication': plant.terapeuticIndication,
            'contradictionsandprecautions': plant.contradictionsandprecautions,
            'medicInterations': plant.medicInterations,
            'farmaceuticForms': plant.farmaceuticForms,
            'utilizationTime': plant.utilizationTime,
            'superDose': plant.superDose,
            'toxicologic': plant.toxicologic,
            'finalObservation': plant.finalObservation,
            'extractionMethodAndPrepare': plant.extractionMethodAndPrepare,
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
