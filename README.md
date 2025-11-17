# 📦 Collection App (Flutter)

A modern Flutter application built as a technical assignment, demonstrating clean architecture, offline-first data handling, remote mock API integration, state management with BLoC, dynamic routing with GoRouter, and a polished UI using Google Fonts.

This app displays a list of collectible products, supports filtering, detailed product views, and seamless offline data persistence via `shared_preferences`.

---

## 🚀 Features

### ✔ Welcome & Authentication

- Splash screen using `flutter_native_splash`
- Modern welcome page UI
- Login page with validation (email + password)

### ✔ Product Collection

- Fetches product list from **remote GitHub JSON**
- Caches remote JSON locally for offline usage
- Pull-to-refresh refreshes remote data
- Offline fallback using:
  - Cached data (shared_preferences)
  - Asset file (`assets/mock_data/products.json`)

### ✔ Product Detail Page

- Bottle information
- Three tabs: **Details**, **Tasting Notes**, **History**
- Custom timeline UI design
- CTA: “Add to my collection”

### ✔ Navigation

Powered by **GoRouter**:

- `/` → Welcome page
- `/login`
- `/collection`
- `/product_detail` (receives `ProductModel` via `state.extra`)

### ✔ State Management (BLoC)

- `ProductBloc`
- `ProductEvent` (Load, Filter)
- `ProductState` (all, filtered, loading, error)

---

## 📁 Folder Structure (Clean Architecture Layout)

```
lib/
 ├── core/
 ├── features/
 │    ├── welcome/
 │    ├── auth/
 │    └── collection/
 │         ├── data/
 │         │    ├── datasources/
 │         │    ├── models/
 │         │    └── services/
 │         ├── bloc/
 │         └── presentation/
 ├── shared/
 └── app_router.dart
```

---

## 🌐 Remote Mock API (GitHub)

The app simulates a real API call via:

```
https://raw.githubusercontent.com/<username>/<repo>/main/products.json
```

Configured in `main.dart`:

```dart
final productService = ProductService(
  remoteUrl: 'https://raw.githubusercontent.com/<username>/<repo>/main/products.json',
);
```

---

## 🗂 Offline-First Data Flow

1. Check connectivity
2. If online:
   - Fetch from remote GitHub JSON
   - Save raw JSON to cache
   - Parse and return
3. If offline:
   - Try cached JSON
   - Fallback to asset JSON

```
Remote → Cache → Parse → UI
or
Cache → UI
or
Assets → UI
```

---

## 🗒️ Task Notes

- Built using the latest **Flutter stable** (null-safe).
- Uses **mock JSON** instead of a live API:
  - Online → fetches remote JSON (GitHub) and **stores it in cache**.
  - Offline → loads from **cache**, or falls back to **asset JSON**.
- Implemented **BLoC** for predictable and scalable state management.
- Feature-based project structure for clean separation of concerns.
- Completed the required screens (**My Collection** + **Details Page**) with tabbed sections.
- Version control fully set up with a clean repository structure.
- Total development time: **~10 hours**.

## 📦 Dependencies

### Main:

| Package                             | Purpose               | Explanation                                                           |
| ----------------------------------- | --------------------- | --------------------------------------------------------------------- |
| flutter_bloc                        | State management      | Used to implement predictable UI states and load/filter product data. |
| equatable                           | Easy value comparison | Makes BLoC states/events comparable without boilerplate.              |
| go_router                           | Navigation            | Clean route setup and passing objects (ProductModel) between screens. |
| connectivity_plus                   | Check internet        | Required to detect online/offline mode before fetching remote JSON.   |
| shared_preferences                  | Local caching         | Stores fetched JSON so the app still works when offline.              |
| http                                | Remote fetch          | Performs the “fake API call” to the GitHub-hosted JSON file.          |
| json_annotation / json_serializable | Models                | Generates ProductModel serialization code cleanly and safely.         |
| google_fonts                        | Typography            | Loads EB Garamond + Lato to match the provided design system.         |

### Dev:

| Package               | Purpose            | Explanation                                                 |
| --------------------- | ------------------ | ----------------------------------------------------------- |
| flutter_native_splash | Auto splash screen | Generates splash screen assets and platform configurations. |
| build_runner          | Code generation    | Required to generate JSON model code at build time.         |
| flutter_lints         | Best practices     | Ensures consistent formatting and idiomatic Flutter code.   |

---

## 📁 Assets

```yaml
assets:
  - assets/images/
  - assets/mock_data/products.json
```

---

## ▶️ Running the App

Install dependencies:

```bash
flutter pub get
```

Generate JSON model code:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Run:

```bash
flutter run
```

---

## 🧪 JSON Format

```json
{
  "products": [
    {
      "id": 1,
      "name": "Coca-Cola Diet Can",
      "image": "https://...",
      "quantity": "100/150",
      "description": "..."
    }
  ]
}
```

---

## ✔️ Summary

- Organized, feature-based project architecture
- Offline-aware data loading (remote → cache → local assets)
- Predictable state management using BLoC
- Modular and reusable UI components
- Modern Flutter stack (GoRouter, JSON serialization, shared_preferences)
