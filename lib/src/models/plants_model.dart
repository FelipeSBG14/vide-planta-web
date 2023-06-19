import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class PlantsModel {
  String? id;
  String popularName;
  String popularNomenclature;
  String cientificName;
  String image1;
  String image2;
  String imageFont1;
  String imageFont2;
  String family;
  String vegetalOrgan;
  String terapeuticIndication;
  String contradictions;
  String precautions;
  String medicInterations;
  String teaPrepare;
  String farmaceuticForms;
  String utilizationTime;
  String superDose;
  String toxicologic;
  String extractionMethod;
  String finalObservation;
  PlantsModel({
    this.id,
    required this.popularName,
    required this.popularNomenclature,
    required this.cientificName,
    required this.image1,
    required this.image2,
    required this.imageFont1,
    required this.imageFont2,
    required this.family,
    required this.vegetalOrgan,
    required this.terapeuticIndication,
    required this.contradictions,
    required this.precautions,
    required this.medicInterations,
    required this.teaPrepare,
    required this.farmaceuticForms,
    required this.utilizationTime,
    required this.superDose,
    required this.toxicologic,
    required this.extractionMethod,
    required this.finalObservation,
  });

  PlantsModel copyWith({
    String? id,
    String? popularName,
    String? popularNomenclature,
    String? cientificName,
    String? image1,
    String? image2,
    String? imageFont1,
    String? imageFont2,
    String? family,
    String? vegetalOrgan,
    String? terapeuticIndication,
    String? contradictions,
    String? precautions,
    String? medicInterations,
    String? teaPrepare,
    String? farmaceuticForms,
    String? utilizationTime,
    String? superDose,
    String? toxicologic,
    String? extractionMethod,
    String? finalObservation,
  }) {
    return PlantsModel(
      id: id ?? this.id,
      popularName: popularName ?? this.popularName,
      popularNomenclature: popularNomenclature ?? this.popularNomenclature,
      cientificName: cientificName ?? this.cientificName,
      image1: image1 ?? this.image1,
      image2: image2 ?? this.image2,
      imageFont1: imageFont1 ?? this.imageFont1,
      imageFont2: imageFont2 ?? this.imageFont2,
      family: family ?? this.family,
      vegetalOrgan: vegetalOrgan ?? this.vegetalOrgan,
      terapeuticIndication: terapeuticIndication ?? this.terapeuticIndication,
      contradictions: contradictions ?? this.contradictions,
      precautions: precautions ?? this.precautions,
      medicInterations: medicInterations ?? this.medicInterations,
      teaPrepare: teaPrepare ?? this.teaPrepare,
      farmaceuticForms: farmaceuticForms ?? this.farmaceuticForms,
      utilizationTime: utilizationTime ?? this.utilizationTime,
      superDose: superDose ?? this.superDose,
      toxicologic: toxicologic ?? this.toxicologic,
      extractionMethod: extractionMethod ?? this.extractionMethod,
      finalObservation: finalObservation ?? this.finalObservation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'popularName': popularName,
      'popularNomenclature': popularNomenclature,
      'cientificName': cientificName,
      'image1': image1,
      'image2': image2,
      'imageFont1': imageFont1,
      'imageFont2': imageFont2,
      'family': family,
      'vegetalOrgan': vegetalOrgan,
      'terapeuticIndication': terapeuticIndication,
      'contradictions': contradictions,
      'precautions': precautions,
      'medicInterations': medicInterations,
      'teaPrepare': teaPrepare,
      'farmaceuticForms': farmaceuticForms,
      'utilizationTime': utilizationTime,
      'superDose': superDose,
      'toxicologic': toxicologic,
      'extractionMethod': extractionMethod,
      'finalObservation': finalObservation,
    };
  }

  factory PlantsModel.fromMap(Map<String, dynamic> map) {
    return PlantsModel(
      id: map['id'] != null ? map['id'] as String : null,
      popularName: map['popularName'] as String,
      popularNomenclature: map['popularNomenclature'] as String,
      cientificName: map['cientificName'] as String,
      image1: map['image1'] as String,
      image2: map['image2'] as String,
      imageFont1: map['imageFont1'] as String,
      imageFont2: map['imageFont2'] as String,
      family: map['family'] as String,
      vegetalOrgan: map['vegetalOrgan'] as String,
      terapeuticIndication: map['terapeuticIndication'] as String,
      contradictions: map['contradictions'] as String,
      precautions: map['precautions'] as String,
      medicInterations: map['medicInterations'] as String,
      teaPrepare: map['teaPrepare'] as String,
      farmaceuticForms: map['farmaceuticForms'] as String,
      utilizationTime: map['utilizationTime'] as String,
      superDose: map['superDose'] as String,
      toxicologic: map['toxicologic'] as String,
      extractionMethod: map['extractionMethod'] as String,
      finalObservation: map['finalObservation'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlantsModel.fromJson(String source) =>
      PlantsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PlantsModel(id: $id, popularName: $popularName, popularNomenclature: $popularNomenclature, cientificName: $cientificName, image1: $image1, image2: $image2, imageFont1: $imageFont1, imageFont2: $imageFont2, family: $family, vegetalOrgan: $vegetalOrgan, terapeuticIndication: $terapeuticIndication, contradictions: $contradictions, precautions: $precautions, medicInterations: $medicInterations, teaPrepare: $teaPrepare, farmaceuticForms: $farmaceuticForms, utilizationTime: $utilizationTime, superDose: $superDose, toxicologic: $toxicologic, extractionMethod: $extractionMethod, finalObservation: $finalObservation)';
  }
}
