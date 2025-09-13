# Mixer UI - Flutter App

A pixel-perfect Flutter recreation of the Mixer dating app screens with responsive design and modern UI components.

## Features

This app recreates 5 key screens from the Mixer app:

1. **Subscription Screen** - Plan selection with Mixer and Mixer VIP options
2. **Mixer Screen** - Main discovery screen with profile cards and filters
3. **Mixer VIP Screen** - VIP subscription screen with enhanced features
4. **Upgrade Homepage Screen** - Profile discovery with filter options
5. **Blind Mixer Screen** - Blind date feature with two variants (Sign-up and Applied)

## Design Features

- **Pixel-perfect accuracy** matching the original designs
- **Responsive design** that adapts to different screen sizes
- **Modern UI components** with proper shadows, gradients, and animations
- **Consistent color scheme** using the official Mixer brand colors
- **Clean architecture** with reusable widgets and modular code structure

## Color Palette

- Primary Purple: `#7B1FA2`
- Light Pink: `#F8E1F5`
- Gold: `#F1C40F`
- White: `#FFFFFF`
- Gray: Various shades for text and backgrounds

## Getting Started

### Prerequisites

- Flutter SDK (3.7.2 or higher)
- Dart SDK
- Android Studio or VS Code with Flutter extensions

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd mixerui
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

### Project Structure

```
lib/
├── main.dart                 # App entry point with navigation
├── screens/                  # Individual screen implementations
│   ├── mixer_screen.dart
│   ├── mixer_vip_screen.dart
│   ├── upgrade_homepage_screen.dart
│   └── blind_mixer_screen.dart
└── widgets/                  # Reusable UI components
    ├── top_bar.dart
    ├── bottom_nav.dart
    ├── plan_card.dart
    └── profile_avatar.dart
```

## Screen Descriptions

### Subscription Screen
- Plan selection between Mixer ($24.99) and Mixer VIP ($99.99)
- Feature comparison with checkmarks
- Gradient call-to-action button
- Terms and conditions disclaimer

### Mixer Screen
- Profile discovery with circular avatars
- Filter options (Age, Height, Habits)
- "You've seen everyone nearby" message
- Location adjustment button

### Mixer VIP Screen
- Similar to subscription screen but focused on VIP features
- Enhanced feature list
- Premium pricing display

### Upgrade Homepage Screen
- Profile cards with colored borders
- "You've seen them all" message with annotation
- Filter controls
- Location adjustment functionality

### Blind Mixer Screen
- 3D-style illustration of blind date scenario
- Two variants: Sign-up form and Applied status
- Navigation tabs (Sign Up, Smart Match, Blind Date)
- Date and time display

## Responsive Design

The app is designed to work seamlessly across different screen sizes:
- **Small screens** (iPhone SE): Elements stack vertically where needed
- **Medium screens** (iPhone 12): Standard layout with proper spacing
- **Large screens** (iPad): Expanded layouts with better use of space

## Dependencies

- `flutter/material.dart` - Core Flutter widgets
- `google_fonts: ^6.2.1` - Custom typography matching iOS SF Pro
- `cupertino_icons: ^1.0.8` - iOS-style icons

## Customization

### Adding New Screens
1. Create a new file in `lib/screens/`
2. Add the screen to the navigation in `main.dart`
3. Update the bottom navigation if needed

### Modifying Colors
Update the color constants in `main.dart` theme configuration:
```dart
primaryColor: const Color(0xFF7B1FA2),
```

### Adding Assets
Place images in the `assets/images/` directory and update `pubspec.yaml` if needed.

## Testing

The app has been tested on:
- iOS Simulator (iPhone SE, iPhone 12, iPad)
- Android Emulator (various screen sizes)
- Physical devices

## Future Enhancements

- Add actual profile images and illustrations
- Implement real navigation between screens
- Add animations and transitions
- Integrate with backend APIs
- Add user authentication flow

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is for educational purposes and demonstrates Flutter UI development skills.