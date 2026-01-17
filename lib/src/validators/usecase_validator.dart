/// UseCase Validator
///
/// Validates usecase names and configurations.
library;

import 'dart:io';

/// Validates usecase inputs
class UseCaseValidator {
  UseCaseValidator._();

  /// Validates usecase name format
  static bool isValidUseCaseName(String name) {
    // Must be snake_case, lowercase, alphanumeric + underscore
    final regex = RegExp(r'^[a-z][a-z0-9_]*$');
    return regex.hasMatch(name);
  }

  /// Validates and throws if invalid
  static void validateOrThrow(String useCaseName) {
    if (useCaseName.isEmpty) {
      throw ArgumentError('UseCase name cannot be empty');
    }

    if (!isValidUseCaseName(useCaseName)) {
      throw ArgumentError(
        'UseCase name must be in snake_case (lowercase, alphanumeric, underscores only)\n'
        'Examples: archive_product, get_featured_items, verify_otp',
      );
    }

    // Additional validations
    if (useCaseName.startsWith('_')) {
      throw ArgumentError('UseCase name cannot start with underscore');
    }

    if (useCaseName.endsWith('_')) {
      throw ArgumentError('UseCase name cannot end with underscore');
    }

    if (useCaseName.contains('__')) {
      throw ArgumentError('UseCase name cannot contain consecutive underscores');
    }

    if (useCaseName.length < 3) {
      throw ArgumentError('UseCase name too short (minimum 3 characters)');
    }

    if (useCaseName.length > 50) {
      throw ArgumentError('UseCase name too long (maximum 50 characters)');
    }
  }

  /// Suggests a valid usecase name
  static String? suggestValidName(String name) {
    if (name.isEmpty) return null;

    var suggestion = name
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9_]'), '_')
        .replaceAll(RegExp(r'_+'), '_')
        .replaceAll(RegExp(r'^_+|_+$'), '');

    return suggestion.isNotEmpty ? suggestion : null;
  }

  /// Checks if feature exists in project
  static bool featureExists(String projectPath, String featureName) {
    final featurePath = Directory('$projectPath/lib/features/$featureName');
    return featurePath.existsSync();
  }

  /// Checks if feature has proper structure
  static bool hasValidFeatureStructure(String projectPath, String featureName) {
    final basePath = '$projectPath/lib/features/$featureName';
    
    final requiredDirs = [
      '$basePath/domain',
      '$basePath/domain/entities',
      '$basePath/domain/repositories',
      '$basePath/domain/usecases',
    ];

    return requiredDirs.every((dir) => Directory(dir).existsSync());
  }

  /// Checks if usecase already exists
  static bool useCaseExists(
    String projectPath,
    String featureName,
    String useCaseName,
  ) {
    final useCasePath = '$projectPath/lib/features/$featureName/domain/usecases/${useCaseName}_usecase.dart';
    return File(useCasePath).existsSync();
  }

  /// Gets entity name from feature
  static String? getEntityName(String projectPath, String featureName) {
    final entitiesDir = Directory('$projectPath/lib/features/$featureName/domain/entities');
    
    if (!entitiesDir.existsSync()) return null;

    final entities = entitiesDir
        .listSync()
        .whereType<File>()
        .where((f) => f.path.endsWith('_entity.dart'))
        .toList();

    if (entities.isEmpty) return null;

    // Get first entity file
    final entityFile = entities.first;
    final content = entityFile.readAsStringSync();

    // Extract class name
    final classRegex = RegExp(r'class\s+(\w+Entity)\s+extends');
    final match = classRegex.firstMatch(content);

    return match?.group(1);
  }

  /// Validates feature has all requirements for usecase generation
  static String? validateFeatureForUseCase(String projectPath, String featureName) {
    if (!featureExists(projectPath, featureName)) {
      return 'Feature "$featureName" does not exist';
    }

    if (!hasValidFeatureStructure(projectPath, featureName)) {
      return 'Feature "$featureName" has invalid structure (missing domain layer)';
    }

    final entityName = getEntityName(projectPath, featureName);
    if (entityName == null) {
      return 'Feature "$featureName" has no entity defined';
    }

    return null; // Valid
  }
}