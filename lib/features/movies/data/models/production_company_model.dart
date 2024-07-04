import '../../domain/entities/production_company_entity.dart';

class ProductionCompanyModel extends ProductionCompanyEntity {
  ProductionCompanyModel({
    required super.id,
    required super.logoPath,
    required super.name,
  });

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) {
    return ProductionCompanyModel(
      id: json['id'],
      logoPath: json['logo_path'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
