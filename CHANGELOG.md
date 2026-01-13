# 📜 Changelog

All notable changes to **Embit CLI** will be documented in this file.

This project adheres to:
- **[Keep a Changelog](https://keepachangelog.com/en/1.1.0/)**
- **[Semantic Versioning](https://semver.org/spec/v2.0.0.html)**

---

## [v0.5.0] – 2026-01-14

### ✨ Added
- Feature generation command:  
  `embit feature --name <feature_name>`
- Automatic **Clean Architecture** folder structure:
  - `data`, `domain`, `presentation`
- Entity and Model scaffolding
- Repository interface & implementation
- Five default use cases:
  - `Get`
  - `GetAll`
  - `Create`
  - `Update`
  - `Delete`
- BLoC generation with:
  - Events
  - States
- UI scaffolding:
  - List Page
  - Detail Page
  - Reusable widgets
- Dependency Injection auto-registration
- Route auto-registration for generated features
- CLI success feedback with clear next-step guidance

---

### 🔄 Changed
- Improved command output readability and success banners
- Standardized naming conventions across generated files
- Refined folder hierarchy for better scalability and team adoption

---

### 🐞 Fixed
- Inconsistent imports in generated feature modules
- Edge-case folder creation conflicts on Windows environments
- Minor CLI logging alignment issues

---

### 🧹 Internal
- Refactored template engine for easier future feature expansion
- Improved code generation performance
- Enhanced maintainability of CLI command handlers

---

### ⚠️ Notes
- This release focuses on **feature-first development** with minimal boilerplate.
- API endpoints in generated remote data sources must be configured manually.
- Run `flutter pub get` after generation.

---

## [Unreleased]

### Planned
- Authentication presets (JWT / Firebase / Custom)
- Test scaffolding (Unit & BLoC tests)
- API adapter templates
- Feature export & module packaging
- AI-assisted feature generation

---

