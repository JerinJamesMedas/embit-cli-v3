/// String Utilities
library;

class StringUtils {
  StringUtils._();

  /// Converts string to snake_case
  static String toSnakeCase(String input) {
    return input
        .replaceAllMapped(
          RegExp(r'[A-Z]'),
          (match) => '_${match.group(0)!.toLowerCase()}',
        )
        .replaceAll(RegExp(r'^_'), '')
        .replaceAll(RegExp(r'_+'), '_');
  }

  /// Converts string to PascalCase
  static String toPascalCase(String input) {
    return input
        .split('_')
        .map((word) => word.isEmpty ? '' : '${word[0].toUpperCase()}${word.substring(1)}')
        .join('');
  }

  /// Converts string to camelCase
  static String toCamelCase(String input) {
    final pascal = toPascalCase(input);
    return pascal.isEmpty ? '' : '${pascal[0].toLowerCase()}${pascal.substring(1)}';
  }
}