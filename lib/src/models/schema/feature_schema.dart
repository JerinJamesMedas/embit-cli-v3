/// Feature Schema Model
/// 
/// Represents a feature definition from JSON schema.
library;

import 'screen_schema.dart';


/// Feature schema - navigation + domain boundary
class FeatureSchema {
  /// Feature name in snake_case
  final String name;
  
  /// Base route for the feature
  final String route;
  
  /// Whether to add to bottom navigation
  final bool addToBottomNav;
  
  /// Icon name (Material Icons)
  final String? icon;
  
  /// Display label for navigation
  final String? label;
  
  /// Screens within this feature
  final List<ScreenSchema> screens;

  const FeatureSchema({
    required this.name,
    required this.route,
    this.addToBottomNav = false,
    this.icon,
    this.label,
    this.screens = const [],
  });

  /// Parse from JSON
  factory FeatureSchema.fromJson(Map<String, dynamic> json) {
    final featureJson = json['feature'] as Map<String, dynamic>? ?? json;
    final screensJson = json['screens'] as List<dynamic>? ?? [];

    return FeatureSchema(
      name: featureJson['name'] as String,
      route: featureJson['route'] as String? ?? '/${featureJson['name']}',
      addToBottomNav: featureJson['addToBottomNav'] as bool? ?? false,
      icon: featureJson['icon'] as String?,
      label: featureJson['label'] as String?,
      screens: screensJson
          .map((s) => ScreenSchema.fromJson(s as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() => {
    'feature': {
      'name': name,
      'route': route,
      'addToBottomNav': addToBottomNav,
      'icon': icon,
      'label': label,
    },
    'screens': screens.map((s) => s.toJson()).toList(),
  };

  /// Get PascalCase name
  String get pascalCase => _toPascalCase(name);
  
  /// Get camelCase name
  String get camelCase => _toCamelCase(name);
  
  /// Get snake_case name (same as name)
  String get snakeCase => name;

  static String _toPascalCase(String input) {
    return input.split('_').map((word) {
      if (word.isEmpty) return '';
      return '${word[0].toUpperCase()}${word.substring(1)}';
    }).join();
  }

  static String _toCamelCase(String input) {
    final pascal = _toPascalCase(input);
    if (pascal.isEmpty) return '';
    return '${pascal[0].toLowerCase()}${pascal.substring(1)}';
  }

  @override
  String toString() => 'FeatureSchema(name: $name, screens: ${screens.length})';
}