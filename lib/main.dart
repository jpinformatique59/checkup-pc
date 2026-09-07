import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// 🎨 Palette de couleurs Checkup PC
const Color checkupGreen = Color(0xFF84CC16);
const Color checkupCyan = Color(0xFF06B6D4);
const Color checkupRed = Color(0xFFEF4444);
const Color checkupOrange = Color(0xFFF59E0B);

// ☀️ Thème Clair (pour le site)
const Color bgLight = Color(0xFFF8FAFC);
const Color cardLight = Color(0xFFFFFFFF);
const Color borderLight = Color(0xFFE2E8F0);

// 🌙 Thème Sombre (pour référence/captures)
const Color bgDark = Color(0xFF0F172A);
const Color cardDark = Color(0xFF1E293B);
const Color borderDark = Color(0xFF334155);

void main() {
  runApp(const CheckupLandingPage());
}

class CheckupLandingPage extends StatelessWidget {
  const CheckupLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkup PC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: bgLight, // Le fond du site
        primaryColor: checkupGreen,
        fontFamily: 'Segoe UI', // Police standard et propre pour le web
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 40.0,
            ),
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 800,
              ), // Limite la largeur pour que ce soit beau sur grand écran
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 1. Le Titre Principal
                  const Text(
                    'Optimisez et Diagnostiquez\nVotre PC en un Clic',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      color: bgDark,
                      height: 1.2,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // 2. Le Sous-titre
                  const Text(
                    'L\'outil complet pour surveiller la santé de vos composants, nettoyer votre système et prévenir les pannes. Reprenez le contrôle de votre machine.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color:
                          borderDark, // Un gris foncé pour le texte secondaire
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // 3. Le Bouton d'Achat (Lemon Squeezy)
                  ElevatedButton(
                    onPressed: () async {
                      final Uri url = Uri.parse(
                        'https://jpinformatique59.lemonsqueezy.com/checkout/buy/0fcee046-92d6-4945-ac55-c82fff7c24a1',
                      );
                      if (!await launchUrl(url)) {
                        debugPrint('Impossible d\'ouvrir le lien');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: checkupGreen, // Ton vert d'action
                      foregroundColor: Colors.white, // Texte en blanc
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          12,
                        ), // Bords légèrement arrondis
                      ),
                    ),
                    child: const Text(
                      'Acheter la licence',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Petit texte de réassurance sous le bouton
                  const Text(
                    'Paiement sécurisé via Lemon Squeezy',
                    style: TextStyle(
                      fontSize: 12,
                      color: checkupCyan, // Ton Cyan d'accentuation
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
