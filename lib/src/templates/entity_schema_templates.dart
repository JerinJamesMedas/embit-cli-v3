/// Entity Schema Templates
library;

import '../models/schema/schema_models.dart';

class EntitySchemaTemplates {
  EntitySchemaTemplates._();

  static String generate(FeatureSchema schema, String projectName) {
    return '''
/// ${schema.pascalCase} Entity
///
/// Core business entity for ${schema.pascalCase} feature.
library;

import 'package:equatable/equatable.dart';

/// ${schema.pascalCase} entity
class ${schema.pascalCase}Entity extends Equatable {
  final String id;
  // TODO: Add your entity fields here
  final DateTime createdAt;
  final DateTime? updatedAt;

  const ${schema.pascalCase}Entity({
    required this.id,
    required this.createdAt,
    this.updatedAt,
  });

  ${schema.pascalCase}Entity copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ${schema.pascalCase}Entity(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory ${schema.pascalCase}Entity.empty() {
    return ${schema.pascalCase}Entity(
      id: '',
      createdAt: DateTime.now(),
    );
  }

  bool get isEmpty => id.isEmpty;
  bool get isNotEmpty => id.isNotEmpty;

  @override
  List<Object?> get props => [id, createdAt, updatedAt];

  @override
  String toString() => '${schema.pascalCase}Entity(id: \$id)';
}
''';
  }
}