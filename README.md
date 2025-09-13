Project Overview and Features
The Mixer UI app includes:

Profile Management: A 6-slot photo grid with circular placeholders, editable via tap-to-select functionality.
VIP Subscription System: Access control for premium content with a "Mixer VIP" subscription flow using the in_app_purchase plugin.
Custom Navigation: A bottom navbar with unique asset-based icons (mixer.png, your_mix.png, etc.) for a branded experience.
Blind Date & Mixer Screens: Interactive UIs with themed purple gradients and asset-loaded illustrations.
Responsive Design: Optimized for iOS and Android with adaptive layouts.

Challenges Faced and Solutions
Developing this app presented several challenges, which I successfully addressed:

Image Loading Failures: Assets (e.g., profile photos, navbar icons) didn’t load due to pubspec.yaml indentation issues and cache problems. I fixed this by ensuring 2-space indentation, adding errorBuilder fallbacks (e.g., grey person icon), and running flutter clean && flutter pub get with a hot-restart.
Navbar Reversion to Old Icons: The navbar reverted to MaterialIcons (e.g., favorite) instead of custom assets. I removed all IconData fallbacks in bottom_nav.dart, enforced Image.asset with tinting (purple/grey), and added debug prints to confirm asset loading.
Logo Visibility Issues: The "Mixer" logo wasn’t visible on the MixerScreen due to full-screen padding. I adjusted the layout to a Stack with Positioned logo (top: 60px) in main.dart and updated screen padding.
Persistent AppBar: The ProfileScreen retained an AppBar despite removal intent. I removed it entirely, adjusting body padding to 60px top for logo space across all screens.
VIP Cross Button Functionality: The close button in MixerVipScreen wasn’t functional. I added onPressed: () => Navigator.pop(context) with a purple-styled Icon(Icons.close).
