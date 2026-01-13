# 🚀 Embit CLI – Flutter Feature Generator

**Embit CLI** is a productivity-focused command-line tool designed to supercharge Flutter development by **auto-generating complete feature modules** with clean architecture, BLoC state management, dependency injection, and routing — all with **minimal manual coding**.

This CLI is especially useful for teams and solo developers who want to focus more on **business logic and backend integration** rather than repetitive boilerplate.

---

## ✨ Key Features

- ⚡ Generate full-feature Flutter modules instantly
- 🧱 Clean Architecture (Data, Domain, Presentation)
- 🔁 Repository pattern with interfaces & implementations
- 🧠 BLoC (Events & States) setup
- 🛠️ Dependency Injection wiring
- 🧭 Automatic route registration
- 📄 Ready-to-use pages & widgets
- 📦 Scalable & team-friendly folder structure

---

## 📦 Generated Architecture

When you create a feature, Embit follows **Clean Architecture principles**:

lib/
└── features/
└── feed/
├── data/
│ ├── models/
│ ├── datasources/
│ ├── repositories/
│
├── domain/
│ ├── entities/
│ ├── repositories/
│ └── usecases/
│
├── presentation/
│ ├── bloc/
│ ├── pages/
│ └── widgets/
│
└── feed_route.dart

yaml
Copy code

---

## 🛠️ Usage

### Create a New Feature

```bash
embit feature --name auth
or

bash
Copy code
embit feature --name feed
📟 Example Terminal Output
bash
Copy code
🎯 Creating feature: feed

✅ Feature "feed" generated successfully!

══════════════════════════════════════════════════
🎉 Feature "feed" created successfully!
══════════════════════════════════════════════════

📋 What was created:
   • Entity, Model
   • Repository interface & implementation
   • 5 Use cases (Get, GetAll, Create, Update, Delete)
   • BLoC with Events and States
   • Pages (List & Detail) and Widgets
   • DI registration
   • Route registration

📋 Next steps:
   1. Review the generated code
   2. Customize entity fields as needed
   3. Update API endpoints in the remote datasource
   4. Run: flutter pub get
   5. Navigate to: /feed
🧩 What Gets Generated
For every feature, Embit automatically creates:

📌 Domain Layer
Entity

Repository Interface

Use Cases:

Get

GetAll

Create

Update

Delete

📌 Data Layer
Model

Remote Datasource

Repository Implementation

📌 Presentation Layer
BLoC (Events & States)

List Page

Detail Page

Reusable Widgets

📌 App Wiring
Dependency Injection registration

Route registration

🧠 Philosophy
“Write business logic, not boilerplate.”

Embit CLI is built to:

Reduce repetitive code

Enforce architectural discipline

Improve onboarding for new developers

Make large Flutter apps scalable and maintainable