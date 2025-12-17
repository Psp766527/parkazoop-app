# Parkazoop - Parking Management Mobile Application

A Flutter-based mobile application for managing parking spots, reservations, and parking sessions. This app provides users with an intuitive interface to find, reserve, and manage parking spaces with real-time availability tracking.

## 📱 Project Overview

**Parkazoop** is a cross-platform application built with Flutter that connects to a Spring Boot backend API. The app supports:
- 📱 **Mobile**: Android & iOS native apps
- 🌐 **Web**: Runs in modern web browsers (Chrome, Firefox, Safari, Edge)
- 💻 **Desktop**: Windows, macOS, Linux (configured but not fully tested)

The app enables users to:
- Search and filter available parking spots
- View parking lots in an interactive 3D-style visualization
- Reserve and manage parking sessions
- Authenticate and manage user accounts
- Monitor parking spot status and availability

---

## 🏗️ Architecture & Design Flow

### Architecture Pattern: **Clean Architecture with Repository Pattern**

The application follows a layered architecture pattern separating concerns into distinct layers:

```
┌─────────────────────────────────────────────────────────┐
│                  PRESENTATION LAYER                      │
│  (Screens, Widgets, State Management - Riverpod)         │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│                    DATA LAYER                            │
│  (Repositories → Services → API Client)                 │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│                    CORE LAYER                            │
│  (API Client, Utilities, Error Handling)                │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│                  EXTERNAL API                            │
│  (Spring Boot Backend - localhost:8080/api/v1)          │
└─────────────────────────────────────────────────────────┘
```

### Design Flow

1. **User Interaction** → User interacts with UI components (Screens/Widgets)
2. **State Management** → Riverpod providers manage state and trigger data fetching
3. **Repository Layer** → Repositories abstract business logic from data sources
4. **Service Layer** → Services handle API communication and data transformation
5. **API Client** → Centralized HTTP client with interceptors for auth and logging
6. **Backend API** → Spring Boot REST API processes requests and returns data
7. **Response Flow** → Data flows back through layers, updating UI state

---

## 📁 Directory Structure

```
parkazoop-app/
│
├── lib/
│   ├── main.dart                          # Application entry point
│   │
│   ├── core/                              # Core functionality & utilities
│   │   ├── dio/
│   │   │   └── api_client.dart           # Centralized HTTP client with interceptors
│   │   ├── errors/
│   │   │   └── error_dialog.dart         # Error handling UI components
│   │   └── utils/
│   │       └── auth_storage.dart          # SharedPreferences wrapper for auth
│   │
│   ├── data/                              # Data layer
│   │   ├── models/
│   │   │   ├── dto/                      # Data Transfer Objects (DTOs)
│   │   │   │   ├── api_response.dart     # Generic API response wrapper
│   │   │   │   ├── auth_request.dart     # Login request DTO
│   │   │   │   ├── auth_response.dart    # Login response DTO
│   │   │   │   ├── parking_spot_dto.dart # Parking spot data model
│   │   │   │   ├── parking_session_dto.dart # Parking session data model
│   │   │   │   ├── create_parking_spot_request.dart
│   │   │   │   ├── reserve_parking_spot_request.dart
│   │   │   │   ├── start_parking_session_request.dart
│   │   │   │   ├── location_dto.dart     # GPS coordinates
│   │   │   │   ├── money_dto.dart        # Currency & amount
│   │   │   │   ├── user_dto.dart         # User information
│   │   │   │   ├── role_dto.dart         # User roles
│   │   │   │   ├── permission_dto.dart   # User permissions
│   │   │   │   └── register_user_request.dart
│   │   │   └── enums/
│   │   │       ├── parking_spot_type.dart    # Spot types (STANDARD, HANDICAP, etc.)
│   │   │       ├── parking_spot_status.dart  # Status (AVAILABLE, OCCUPIED, etc.)
│   │   │       └── parking_session_status.dart
│   │   │
│   │   ├── repositories/                 # Repository layer (business logic)
│   │   │   ├── auth_repository.dart      # Authentication operations
│   │   │   ├── parking_spot_repository.dart # Parking spot CRUD operations
│   │   │   ├── parking_session_repository.dart # Session management
│   │   │   └── health_repository.dart    # Health check endpoints
│   │   │
│   │   └── services/                     # Service layer (API communication)
│   │       ├── parking_spot_service.dart # Parking spot API calls
│   │       ├── parking_session_service.dart # Session API calls
│   │       └── health_service.dart       # Health check API calls
│   │
│   └── presentation/                      # Presentation layer (UI)
│       ├── screens/                      # Screen widgets
│       │   ├── home_screen.dart          # Main dashboard/home screen
│       │   ├── available_spots_screen.dart # List view of available spots
│       │   ├── parking/
│       │   │   └── lot/
│       │   │       └── view/
│       │   │           └── parking_lot_screen.dart # 3D parking lot visualization
│       │   └── user/                     # User authentication screens
│       │       ├── login_screen.dart     # Login with Riverpod
│       │       ├── login.dart           # Alternative login UI
│       │       ├── register_screen.dart  # User registration
│       │       ├── register_account.dart # Registration form
│       │       ├── forgot_password.dart  # Password recovery
│       │       ├── confirm_new_password.dart # Password reset confirmation
│       │       ├── otp_validation.dart   # OTP verification
│       │       └── complete_account_registration.dart # Profile completion
│       │
│       └── state/                        # State management (Riverpod)
│           ├── providers.dart           # Main provider definitions
│           └── parking_spot_providers.dart # Parking spot specific providers
│
├── android/                              # Android platform configuration
├── ios/                                  # iOS platform configuration
├── web/                                  # Web platform configuration (Browser support)
│   ├── index.html                       # Web entry point HTML file
│   ├── manifest.json                    # PWA manifest for installable web app
│   ├── favicon.png                      # Browser favicon
│   └── icons/                           # Web app icons (PWA)
├── windows/                              # Windows platform configuration
├── linux/                                # Linux platform configuration
├── macos/                                # macOS platform configuration
│
├── pubspec.yaml                          # Flutter dependencies
└── README.md                             # This file
```

---

## 🧩 Components & Technologies Used

### **Core Framework & Language**
- **Flutter SDK** (^3.5.3) - Cross-platform UI framework
- **Dart** - Programming language

### **State Management**
- **flutter_riverpod** (^2.4.0) - State management solution
- **riverpod_annotation** (^2.3.0) - Code generation for Riverpod
- **riverpod_generator** (^2.3.0) - Build runner for Riverpod

### **Networking & API Communication**
- **dio** (^5.4.0) - HTTP client for API calls
- **http** (^1.2.0) - Additional HTTP utilities

### **Data Persistence**
- **shared_preferences** (^2.2.0) - Local storage for credentials and settings

### **JSON Serialization**
- **json_annotation** (^4.9.0) - JSON serialization annotations
- **json_serializable** (^6.7.0) - Code generation for JSON

### **UI Components & Styling**
- **Material Design 3** - Modern Material Design components
- **cupertino_icons** (^1.0.8) - iOS-style icons
- **flutter_svg** (^2.0.9) - SVG image support

### **Development Tools**
- **build_runner** (^2.4.0) - Code generation tool
- **flutter_lints** (^4.0.0) - Linting rules

---

## 🎨 Screen Components Breakdown

### **1. Authentication Screens**

#### **Login Screen** (`login_screen.dart`)
- **Components Used:**
  - `Scaffold` - Main screen container
  - `TextField` - Email and password input fields
  - `ElevatedButton` - Login action button
  - `CircularProgressIndicator` - Loading state indicator
  - `SnackBar` - Error message display
  - `Icon` - Parking-themed icons (local_parking, directions_car_filled)
- **State Management:** `ConsumerStatefulWidget` with Riverpod
- **Features:** Email/password validation, password visibility toggle, navigation to home

#### **Sign In Screen** (`login.dart`)
- **Components Used:**
  - `SignInForm` - Custom form widget with validation
  - `SocalCard` - Social media login buttons (Google, Facebook, Twitter)
  - `SvgPicture` - SVG icons for social login
  - `NoAccountText` - Registration link widget
- **Features:** Form validation, social login options, registration navigation

#### **Registration Screen** (`register_screen.dart`, `register_account.dart`)
- **Components Used:**
  - `SignUpForm` - Registration form with multiple fields
  - `TextFormField` - Input fields with validation
  - `Form` - Form state management
  - `GlobalKey<FormState>` - Form validation key
- **Features:** User registration, email validation, password strength

#### **Forgot Password** (`forgot_password.dart`)
- **Components Used:**
  - `ForgotPasswordForm` - Password recovery form
  - `TextButton` - Navigation to login
- **Features:** Email-based password recovery

#### **OTP Validation** (`otp_validation.dart`)
- **Components Used:**
  - `OtpForm` - OTP input fields
  - Custom OTP input widgets
- **Features:** Multi-digit OTP verification

#### **Complete Account Registration** (`complete_account_registration.dart`)
- **Components Used:**
  - `ComplateProfileForm` - Profile completion form
  - Multiple input fields for user details
- **Features:** Additional user information collection

### **2. Main Application Screens**

#### **Home Screen** (`home_screen.dart`)
- **Components Used:**
  - `Scaffold` - Main container
  - `AppBar` - Top navigation bar
  - `ElevatedButton` - Navigation buttons
  - `Navigator` - Screen navigation
- **Features:** Dashboard with navigation to key features
- **Navigation Routes:**
  - `/spots` - Available spots list
  - `/create-spot` - Create new parking spot
  - `/health` - Health check

#### **Available Spots Screen** (`available_spots_screen.dart`)
- **Components Used:**
  - `ConsumerStatefulWidget` - Riverpod state management
  - `TextField` - Filter inputs (type, lat, lng, distance, limit)
  - `ListView.separated` - List of parking spots
  - `ListTile` - Individual spot item display
  - `Divider` - List item separator
  - `CircularProgressIndicator` - Loading state
- **State Management:** `availableSpotsProvider` (FutureProvider.family)
- **Features:** 
  - Filter by type (CAR/BIKE/ELECTRIC)
  - Filter by location (latitude/longitude)
  - Filter by maximum distance
  - Limit results
  - Real-time data fetching with Riverpod

#### **Parking Lot 3D Screen** (`parking_lot_screen.dart`)
- **Components Used:**
  - `StatefulWidget` - State management for slot selection
  - `InteractiveViewer` - Zoom and pan functionality
  - `CustomPaint` - Custom drawing for parking lanes
  - `ParkingPainter` - Custom painter for grid and lanes
  - `ParkingSlotWidget` - Individual parking slot widget
  - `AnimatedBuilder` - Slot selection animations
  - `AnimationController` - Scale animation on selection
  - `Transform` - 3D perspective transformation
  - `OverlayEntry` - Popup for booked slots
  - `LegendItem` - Status legend widget
  - `ElevatedButton` - Confirm selection button
- **Features:**
  - Interactive 3D-style parking lot visualization
  - 4x6 grid layout (configurable)
  - Slot status: Available, Selected, Booked
  - Visual feedback with animations
  - Zoom and pan support
  - Row/Column labels (A-D, 1-6)
  - Real-time slot status updates

---

## 🔄 State Management Architecture

### **Riverpod Providers Structure**

#### **Dependency Injection Providers**
```dart
dioProvider → ParkingSpotService → ParkingSpotRepository
dioProvider → ParkingSessionService → ParkingSessionRepository
dioProvider → HealthService → HealthRepository
```

#### **Data Providers**
- `availableSpotsProvider` - FutureProvider.family for fetching available spots with filters
- `parkingSpotDetailProvider` - FutureProvider.family for individual spot details
- `createParkingSpotNotifierProvider` - StateNotifierProvider for creating spots

#### **State Notifiers**
- `CreateSpotNotifier` - Manages create spot operation state (loading, success, error)

---

## 🔌 API Integration

### **Base Configuration**
- **Base URL:** `http://localhost:8080/api/v1`
- **Authentication:** Basic Auth (username:password encoded in Base64)
- **Content-Type:** `application/json`

### **API Client Features** (`api_client.dart`)
- **Interceptors:**
  1. **Logging Interceptor** - Logs all requests/responses
  2. **Auth Interceptor** - Automatically adds Basic Auth header from stored credentials
  3. **Error Interceptor** - Handles timeout errors

### **API Endpoints Used**

#### **Authentication**
- `POST /api/auth/login` - User login

#### **Parking Spots**
- `GET /parking-spots/available` - Get available spots (with filters)
- `GET /parking-spots/{id}` - Get spot by ID
- `POST /parking-spots` - Create new parking spot

#### **Parking Sessions**
- `POST /parking-sessions/reserve` - Reserve a parking spot
- `POST /parking-sessions/start` - Start a parking session
- `POST /parking-sessions/{id}/end` - End a parking session
- `POST /parking-sessions/{id}/cancel` - Cancel a reservation
- `GET /parking-sessions/{id}` - Get session details

#### **Health Check**
- `GET /health` - Application health status
- `GET /health/ready` - Readiness check

### **API Response Format**
All API responses follow the `ApiResponse<T>` wrapper:
```dart
{
  "success": bool,
  "message": String?,
  "data": T?,
  "timestamp": DateTime?,
  "errorCode": String?
}
```

---

## 🗂️ Data Models

### **Parking Spot DTO**
```dart
ParkingSpotDto {
  String id
  String spotNumber
  LocationDto location
  ParkingSpotType type
  ParkingSpotStatus status
  MoneyDto hourlyRate
  String? currentVehicleId
  String? description
  bool isAccessible
  bool hasCharging
}
```

### **Parking Spot Types** (Enum)
- `STANDARD` - Standard parking spot
- `HANDICAP` - Accessible parking spot
- `ELECTRIC_VEHICLE` - Electric vehicle charging spot
- `MOTORCYCLE` - Motorcycle parking spot
- `TRUCK` - Truck parking spot
- `LOADING_ZONE` - Loading zone
- `TIME_LIMITED` - Time-limited parking spot
- `RESERVED` - Reserved parking spot

### **Parking Spot Status** (Enum)
- `AVAILABLE` - Available for parking
- `OCCUPIED` - Currently occupied
- `RESERVED` - Reserved for a specific user
- `MAINTENANCE` - Under maintenance
- `OUT_OF_SERVICE` - Temporarily out of service
- `BLOCKED` - Blocked or restricted

---

## 🚀 Getting Started

### **Prerequisites**
- Flutter SDK (^3.5.3)
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- Spring Boot backend running on `localhost:8080`
- **For Web**: Modern web browser (Chrome, Firefox, Safari, or Edge)

### **Installation Steps**

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd parkazoop-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code** (for JSON serialization and Riverpod)
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Update API base URL** (if needed)
   - Edit `lib/core/dio/api_client.dart` - Update `_baseUrl` constant
   - Edit `lib/data/repositories/auth_repository.dart` - Update `baseUrl` in Dio options
   - **For Web Production**: Update to your deployed backend URL (not localhost)

5. **Run the application**

   **Mobile (Android/iOS):**
   ```bash
   flutter run
   ```

   **Web Browser:**
   ```bash
   flutter run -d chrome
   # or
   flutter run -d edge
   # or
   flutter run -d firefox
   ```

   **Build for Web Deployment:**
   ```bash
   flutter build web
   # Output will be in build/web/ directory
   # Deploy this folder to any web server
   ```

### **Platform-Specific Setup**

#### **Android**
- Minimum SDK: 21
- Target SDK: 33+
- Configured in `android/app/build.gradle`

#### **iOS**
- Minimum iOS: 11.0
- Configured in `ios/Runner/Info.plist`

#### **Web (Browser Support)**
- ✅ **Yes, the app supports web browsers!**
- The app can be compiled and run in modern web browsers
- **Not simple HTML**: Flutter compiles to JavaScript (uses CanvasKit or HTML renderer)
- **Browser Requirements:**
  - Modern browsers with JavaScript enabled
  - Chrome/Edge 90+, Firefox 88+, Safari 14+
  - WebAssembly support recommended for better performance

**To run on web:**
```bash
# Run in Chrome (default)
flutter run -d chrome

# Build for web deployment
flutter build web

# Build with specific renderer (HTML for smaller size, CanvasKit for better performance)
flutter build web --web-renderer html
flutter build web --web-renderer canvaskit
```

**Web Output:**
- After building, the `build/web/` directory contains deployable files
- Can be hosted on any static web server (Apache, Nginx, Firebase Hosting, etc.)
- The `web/index.html` is the entry point that loads the Flutter app

**Important Notes for Web:**
- API calls to `localhost:8080` will work if backend is accessible from browser
- For production, update API base URL to your deployed backend URL
- SharedPreferences works via browser's localStorage
- All Flutter widgets render properly in web browsers

---

## 🔧 Configuration

### **API Configuration**
Update the base URL in:
- `lib/core/dio/api_client.dart` (line 6)
- `lib/data/repositories/auth_repository.dart` (line 7)

### **Authentication Storage**
Credentials are stored using `SharedPreferences`:
- Key: `auth_username`
- Key: `auth_password`

Clear credentials using `AuthStorage.clear()`

---

## 📱 Navigation Flow

```
SignInScreen (/) 
    ↓ (Login Success)
HomeScreen (/home)
    ↓
    ├──→ AvailableSpotsScreen (/spots)
    ├──→ Parking3DScreen (/spots) [3D Visualization]
    ├──→ Create Spot Screen (/create-spot)
    └──→ Health Check Screen (/health)
```

---

## 🌐 Web Browser Support

### **Yes, this app runs in web browsers!**

The Flutter app is compiled to JavaScript and runs in modern web browsers. It's **not plain HTML** - Flutter uses:
- **CanvasKit Renderer**: Better performance, larger bundle size (~2MB)
- **HTML Renderer**: Smaller bundle size, good for simple UIs

### **How It Works**

1. **Development**: Run `flutter run -d chrome` to test in browser
2. **Build**: Run `flutter build web` to create deployable files
3. **Deploy**: Upload `build/web/` folder to any web server

### **Web-Specific Features**

- ✅ All screens work in browsers
- ✅ API calls work (update base URL for production)
- ✅ Authentication via SharedPreferences (uses browser localStorage)
- ✅ Interactive 3D parking lot visualization works
- ✅ Responsive design adapts to browser window size
- ✅ PWA support (can be installed as web app via manifest.json)

### **Browser Compatibility**

| Browser | Minimum Version | Status |
|---------|----------------|--------|
| Chrome  | 90+ | ✅ Fully Supported |
| Edge    | 90+ | ✅ Fully Supported |
| Firefox | 88+ | ✅ Fully Supported |
| Safari  | 14+ | ✅ Fully Supported |
| Opera   | 76+ | ✅ Fully Supported |

### **Web Deployment Options**

- **Firebase Hosting**: `firebase deploy`
- **GitHub Pages**: Deploy `build/web/` folder
- **Netlify/Vercel**: Connect repository, auto-deploy
- **Traditional Web Server**: Upload `build/web/` to Apache/Nginx
- **Docker**: Containerize the web build

### **Important Web Considerations**

⚠️ **API Configuration**: 
- Development: `localhost:8080` works if backend is accessible
- Production: Must update to deployed backend URL (e.g., `https://api.parkazoop.com`)

⚠️ **CORS**: Ensure your Spring Boot backend allows CORS from your web domain

⚠️ **HTTPS**: Use HTTPS in production for secure API calls and PWA features

---

## 🎯 Key Features Implementation

### **1. Authentication Flow**
- Login with email/password
- Credentials stored securely using SharedPreferences
- Automatic Basic Auth header injection
- Error handling with user-friendly dialogs

### **2. Parking Spot Management**
- Search and filter available spots
- Real-time availability updates
- Location-based filtering
- Type-based filtering (CAR/BIKE/ELECTRIC)

### **3. 3D Parking Lot Visualization**
- Interactive grid layout
- Zoom and pan support
- Visual slot status indicators
- Selection animations
- Booked slot popup warnings

### **4. State Management**
- Reactive UI updates with Riverpod
- Efficient data caching
- Error state handling
- Loading state indicators

---

## 🛠️ Development Guidelines

### **Adding New Features**

1. **Create DTOs** in `lib/data/models/dto/`
2. **Create Service** in `lib/data/services/`
3. **Create Repository** in `lib/data/repositories/`
4. **Create Providers** in `lib/presentation/state/`
5. **Create Screen** in `lib/presentation/screens/`
6. **Add Route** in `lib/main.dart`

### **Code Generation**
After modifying models with `@JsonSerializable`:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### **Best Practices**
- Use Riverpod for all state management
- Keep business logic in repositories
- Use services only for API calls
- Follow the repository pattern consistently
- Handle errors gracefully with user feedback
- Use DTOs for all API communication

---

## 🐛 Error Handling

### **Error Display**
- `showErrorDialog()` - Shows alert dialogs for errors
- `SnackBar` - Shows temporary error messages
- Error states in Riverpod providers

### **Network Errors**
- Connection timeout handling
- Request timeout handling
- Error messages displayed to users

---

## 📝 Future Enhancements

### **Planned Features**
- [ ] Real-time parking spot updates via WebSocket
- [ ] Push notifications for reservation reminders
- [ ] Payment integration
- [ ] Map view with GPS integration
- [ ] User profile management
- [ ] Parking history
- [ ] Favorite parking spots
- [ ] Multi-language support

---

## 🤝 Contributing

### **For Future Developers**

1. **Understand the Architecture**
   - Study the layered architecture pattern
   - Understand Riverpod state management
   - Review existing repository and service patterns

2. **Code Style**
   - Follow Flutter/Dart style guide
   - Use meaningful variable and function names
   - Add comments for complex logic

3. **Testing**
   - Write unit tests for repositories and services
   - Write widget tests for UI components
   - Test API integration

4. **Documentation**
   - Document new features
   - Update this README when adding major features
   - Add inline comments for complex code

---

## 📄 License

[Specify your license here]

---

## 👥 Team & Contact

[Add team information and contact details]

---

## 📚 Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Riverpod Documentation](https://riverpod.dev/)
- [Dio HTTP Client](https://pub.dev/packages/dio)
- [Material Design 3](https://m3.material.io/)

---

**Last Updated:** [Current Date]
**Version:** 1.0.0+1
