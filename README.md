Project Overview and Features
The Mixer UI app includes:
![Screenshot_2025-09-13-16-47-09-96_76f2194344140efe1b7ebd792aee6999](https://github.com/user-attachments/assets/a9a55362-6e09-4819-afcc-eba193ab995f)
![Screenshot_2025-09-13-16-47-07-89_76f2194344140efe1b7ebd792aee6999](https://github.com/user-attachments/assets/3bbf1809-5d4a-4d5f-8901-092f0edef1de)
![Screenshot_2025-09-13-16-47-16-63_76f2194344140efe1b7ebd792aee6999](https://github.com/user-attachments/assets/882a1a9d-7a19-4fff-afbb-1d06bfb21383)
![Screenshot_2025-09-13-16-47-05-43_76f2194344140efe1b7ebd792aee6999](https://github.com/user-attachments/assets/74e4520c-81c4-4e6b-b109-c0d623b6683d)
![Screenshot_2025-09-13-15-16-56-14_76f2194344140efe1b7ebd792aee6999](https://github.com/user-attachments/assets/2ba2666d-8f30-49c3-ba09-e6180eacbe42)
![Screenshot_2025-09-13-16-47-29-58_76f2194344140efe1b7ebd792aee6999](https://github.com/user-attachments/assets/41056b89-9e6c-4e79-88b4-d4e1c06153aa)
![Screenshot_2025-09-13-16-47-25-87_76f2194344140efe1b7ebd792aee6999](https://github.com/user-attachments/assets/acadc85a-26c4-498c-9916-b467956f44cf)
![Screenshot_2025-09-13-16-47-21-26_76f2194344140efe1b7ebd792aee6999](https://github.com/user-attachments/assets/562783a7-e694-436e-81b6-f680978bd437)
![Screenshot_2025-09-13-16-47-19-45_76f2194344140efe1b7ebd792aee6999](https://github.com/user-attachments/assets/49a53726-6b0b-4321-8f7e-455f541ddea0)

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
