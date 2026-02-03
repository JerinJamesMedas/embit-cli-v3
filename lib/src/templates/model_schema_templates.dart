/// Model Schema Templates
library;

import '../models/schema/feature_schema.dart';


class ModelSchemaTemplates {
  ModelSchemaTemplates._();

  static String generate(FeatureSchema schema, String projectName) {
    return '''
/// ${schema.pascalCase} Model
///
/// Data model with JSON serialization for ${schema.pascalCase}.
library;

import '../../domain/entities/${schema.snakeCase}_entity.dart';

/// ${schema.pascalCase} model with JSON serialization
class ${schema.pascalCase}Model extends ${schema.pascalCase}Entity {
  const ${schema.pascalCase}Model({
    required super.id,
    required super.createdAt,
    super.updatedAt,
  });

  factory ${schema.pascalCase}Model.fromJson(Map<String, dynamic> json) {
    return ${schema.pascalCase}Model(
      id: json['id'] as String? ?? '',
      createdAt: _parseDateTime(json['created_at'] ?? json['createdAt']) ?? DateTime.now(),
      updatedAt: _parseDateTime(json['updated_at'] ?? json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  factory ${schema.pascalCase}Model.fromEntity(${schema.pascalCase}Entity entity) {
    return ${schema.pascalCase}Model(
      id: entity.id,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  ${schema.pascalCase}Entity toEntity() => this;

  static DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value);
    if (value is int) return DateTime.fromMillisecondsSinceEpoch(value);
    return null;
  }
}
''';
  }
}