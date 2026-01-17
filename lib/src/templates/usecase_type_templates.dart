/// UseCase Type Templates
///
/// Templates for different types of usecases.
library;

import '../models/usecase_config.dart';

/// Templates for different usecase types
class UseCaseTypeTemplates {
  UseCaseTypeTemplates._();

  /// Generate usecase based on type
  static String generate(UseCaseConfig config) {
    switch (config.type) {
      case UseCaseType.get:
        return _getTemplate(config);
      case UseCaseType.getList:
        return _getListTemplate(config);
      case UseCaseType.create:
        return _createTemplate(config);
      case UseCaseType.update:
        return _updateTemplate(config);
      case UseCaseType.delete:
        return _deleteTemplate(config);
      case UseCaseType.custom:
        return _customTemplate(config);
    }
  }

  /// Get single entity template
  static String _getTemplate(UseCaseConfig config) => '''
/// ${config.useCasePascalCase} Use Case
///
/// ${config.useCasePascalCase} for ${config.featureName}.
library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/${config.featureSnakeCase}_entity.dart';
import '../repositories/${config.featureSnakeCase}_repository.dart';

/// Parameters for ${config.useCaseClassName}
class ${config.paramsClassName} extends Equatable {
  final String id;

  const ${config.paramsClassName}({required this.id});

  @override
  List<Object?> get props => [id];
}

/// ${config.useCasePascalCase} use case
class ${config.useCaseClassName} implements UseCase<${config.entityName}, ${config.paramsClassName}> {
  final ${config.repositoryName} _repository;

  ${config.useCaseClassName}(this._repository);

  @override
  Future<Either<Failure, ${config.entityName}>> call(${config.paramsClassName} params) async {
    if (params.id.isEmpty) {
      return const Left(ValidationFailure(
        message: 'ID cannot be empty',
        fieldErrors: {'id': ['ID is required']},
      ));
    }

    return await _repository.${config.repositoryMethodName}(params.id);
  }
}
''';

  /// Get list template
  static String _getListTemplate(UseCaseConfig config) => '''
/// ${config.useCasePascalCase} Use Case
///
/// ${config.useCasePascalCase} for ${config.featureName}.
library;

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/${config.featureSnakeCase}_entity.dart';
import '../repositories/${config.featureSnakeCase}_repository.dart';

/// ${config.useCasePascalCase} use case
class ${config.useCaseClassName} implements UseCaseNoParams<List<${config.entityName}>> {
  final ${config.repositoryName} _repository;

  ${config.useCaseClassName}(this._repository);

  @override
  Future<Either<Failure, List<${config.entityName}>>> call() async {
    return await _repository.${config.repositoryMethodName}();
  }
}
''';

  /// Create entity template
  static String _createTemplate(UseCaseConfig config) => '''
/// ${config.useCasePascalCase} Use Case
///
/// ${config.useCasePascalCase} for ${config.featureName}.
library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/${config.featureSnakeCase}_entity.dart';
import '../repositories/${config.featureSnakeCase}_repository.dart';

/// Parameters for ${config.useCaseClassName}
class ${config.paramsClassName} extends Equatable {
  final String name;
  final String? description;

  const ${config.paramsClassName}({
    required this.name,
    this.description,
  });

  @override
  List<Object?> get props => [name, description];
}

/// ${config.useCasePascalCase} use case
class ${config.useCaseClassName} implements UseCase<${config.entityName}, ${config.paramsClassName}> {
  final ${config.repositoryName} _repository;

  ${config.useCaseClassName}(this._repository);

  @override
  Future<Either<Failure, ${config.entityName}>> call(${config.paramsClassName} params) async {
    // Validation
    if (params.name.trim().isEmpty) {
      return const Left(ValidationFailure(
        message: 'Name cannot be empty',
        fieldErrors: {'name': ['Name is required']},
      ));
    }

    return await _repository.${config.repositoryMethodName}(
      name: params.name.trim(),
      description: params.description?.trim(),
    );
  }
}
''';

  /// Update entity template
  static String _updateTemplate(UseCaseConfig config) => '''
/// ${config.useCasePascalCase} Use Case
///
/// ${config.useCasePascalCase} for ${config.featureName}.
library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/${config.featureSnakeCase}_entity.dart';
import '../repositories/${config.featureSnakeCase}_repository.dart';

/// Parameters for ${config.useCaseClassName}
class ${config.paramsClassName} extends Equatable {
  final String id;
  final String? name;
  final String? description;

  const ${config.paramsClassName}({
    required this.id,
    this.name,
    this.description,
  });

  @override
  List<Object?> get props => [id, name, description];
}

/// ${config.useCasePascalCase} use case
class ${config.useCaseClassName} implements UseCase<${config.entityName}, ${config.paramsClassName}> {
  final ${config.repositoryName} _repository;

  ${config.useCaseClassName}(this._repository);

  @override
  Future<Either<Failure, ${config.entityName}>> call(${config.paramsClassName} params) async {
    // Validation
    if (params.id.isEmpty) {
      return const Left(ValidationFailure(
        message: 'ID cannot be empty',
        fieldErrors: {'id': ['ID is required']},
      ));
    }

    return await _repository.${config.repositoryMethodName}(
      id: params.id,
      name: params.name?.trim(),
      description: params.description?.trim(),
    );
  }
}
''';

  /// Delete entity template
  static String _deleteTemplate(UseCaseConfig config) => '''
/// ${config.useCasePascalCase} Use Case
///
/// ${config.useCasePascalCase} for ${config.featureName}.
library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/${config.featureSnakeCase}_repository.dart';

/// Parameters for ${config.useCaseClassName}
class ${config.paramsClassName} extends Equatable {
  final String id;

  const ${config.paramsClassName}({required this.id});

  @override
  List<Object?> get props => [id];
}

/// ${config.useCasePascalCase} use case
class ${config.useCaseClassName} implements UseCase<Unit, ${config.paramsClassName}> {
  final ${config.repositoryName} _repository;

  ${config.useCaseClassName}(this._repository);

  @override
  Future<Either<Failure, Unit>> call(${config.paramsClassName} params) async {
    if (params.id.isEmpty) {
      return const Left(ValidationFailure(
        message: 'ID cannot be empty',
        fieldErrors: {'id': ['ID is required']},
      ));
    }

    return await _repository.${config.repositoryMethodName}(params.id);
  }
}
''';

  /// Custom template (flexible)
  static String _customTemplate(UseCaseConfig config) => '''
/// ${config.useCasePascalCase} Use Case
///
/// ${config.useCasePascalCase} for ${config.featureName}.
library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/${config.featureSnakeCase}_entity.dart';
import '../repositories/${config.featureSnakeCase}_repository.dart';

/// Parameters for ${config.useCaseClassName}
class ${config.paramsClassName} extends Equatable {
  // TODO: Add your parameters here
  final String id;

  const ${config.paramsClassName}({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}

/// ${config.useCasePascalCase} use case
class ${config.useCaseClassName} implements UseCase<${config.entityName}, ${config.paramsClassName}> {
  final ${config.repositoryName} _repository;

  ${config.useCaseClassName}(this._repository);

  @override
  Future<Either<Failure, ${config.entityName}>> call(${config.paramsClassName} params) async {
    // TODO: Add your validation logic here
    
    // TODO: Call repository method
    return await _repository.${config.repositoryMethodName}(params);
  }
}
''';

  /// BLoC event template
  static String blocEvent(UseCaseConfig config) => '''

/// Event to ${config.useCasePascalCase}
class ${config.eventName} extends ${config.featurePascalCase}Event {
  final String id;
  // TODO: Add your event parameters

  const ${config.eventName}({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
''';
}