import 'dart:io';
import 'dart:ui';
import 'package:birge_app/app/widgets/service_info_modal.dart';
import 'package:birge_app/features/auth/widgets/auth_modal.dart';
import 'package:flutter/material.dart';
import 'chatbot_page.dart';
import 'login_page.dart';

class AIHomePage extends StatelessWidget {
  const AIHomePage({Key? key}) : super(key: key);

  @override
  State<AIHomePage> createState() => _AIHomePageState();
}

class _AIHomePageState extends State<AIHomePage> {
  String selectedCategory = 'Бәрі';
  bool _isAuthenticated = false;

  final Map<String, List<AIService>> categorizedServices = {
    'Білім': [
      AIService('NotebookLM', 'assets/notebooklm.png', 'Зерттеу көмекшісі'),
      AIService('Gradescope', 'assets/gradescope.png', 'Бағалау жүйесі'),
      AIService('Eduaide', 'assets/eduaide.png', 'Білім көмекшісі'),
      AIService('QuestionWell', 'assets/questionwell.png', 'Сұрақ жинағы'),
    ],
    'Мұзыка': [
      AIService('AIVA', 'assets/aiva.png', 'AI музыка композитор'),
      AIService('Suno', 'assets/suno.png', 'Музыка жасау'),
      AIService('Boomy', 'assets/boomy.png', 'Тренд музыка жасау'),
    ],
    'Контент': [
      AIService('ChatGPT', 'assets/chatgpt.png', 'Білім беру контенті'),
      AIService('Copy', 'assets/copy.png', 'AI жазу көмекшісі'),
      AIService('Writesonic', 'assets/writesonic.png', 'AI контент жасау'),
    ],
    'Денсаулық': [
      AIService('PathAI', 'assets/pathai.png', 'Жасанды интеллект'),
      AIService('Aidence', 'assets/aidence.png', 'Денсаулық диагностикасы'),
      AIService('DeepScribe', 'assets/deepscribe.png', 'Медициналық транскрип'),
    ],
  };

  final String robotImageFilePath =
      '/Users/kamila/Desktop/BIRGE/birge_app/6d68ee56925c4b1b52025305c1172c68b494a078.png';
  void _handleAIServiceTap(AIService service) {
    final pageContext = context; // ❤️ save the REAL context once

    showModalBottomSheet(
      context: pageContext,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (modalContext) {
        return ServiceInfoModal(
          serviceName: service.name,
          onStartChat: () async {
            Navigator.pop(modalContext); // close service modal

            // open auth modal
            final result = await showModalBottomSheet(
              context:
                  pageContext, // ❤️ IMPORTANT: use page context, NOT modal context
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (authContext) {
                return AuthModal(
                  isLogin: false,
                  onToggleMode: () {},
                  emailController: TextEditingController(),
                  passwordController: TextEditingController(),
                  confirmPasswordController: TextEditingController(),
                  rememberMe: false,
                  onRememberMeChanged: (_) {},
                  onPrimaryAction: () {
                    Navigator.pop(authContext, true);
                  },
                  onGoogleSignIn: () {},
                );
              },
            );

            if (!mounted) return;

            if (result == true) {
              Navigator.push(
                pageContext, // ❤️ safe context guaranteed to work!
                MaterialPageRoute(
                  builder: (_) => ChatBotPage(serviceName: service.name),
                ),
              );
            }
          },
        );
      },
    );
  }

  void _handleAccountTap() async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return AuthModal(
          isLogin: true,
          onToggleMode: () {},
          emailController: TextEditingController(),
          passwordController: TextEditingController(),
          rememberMe: false,
          onRememberMeChanged: (v) {},
          onPrimaryAction: () {
            Navigator.pop(context, {
              'success': true,
              'email': 'example@gmail.com',
              'name': 'User',
            });
          },
          onGoogleSignIn: () {},
        );
      },
    );

    if (result != null && result['success'] == true) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              AccountPage(email: result['email'], name: result['name']),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 1),
                const SizedBox(width: 48),
              ],
            ),
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () => _openLoginPage(context),
            icon: const Icon(Icons.add, color: Colors.blue),
            label: const Text(
              'Жану',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Іздеу...',
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Quick Actions
              Row(
                children: [
                  _buildQuickActionChip('Білім', Icons.school, Colors.blue),
                  const SizedBox(width: 8),
                  _buildQuickActionChip(
                    'Мұзыка',
                    Icons.music_note,
                    Colors.blue,
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Білім Section
              _buildSectionHeader('Білім'),
              const SizedBox(height: 16),
              _buildAIGrid(context, [
                AIService(
                  'NotebookLM',
                  'assets/notebooklm.png',
                  'Зерттеу көмекшісі',
                ),
                AIService(
                  'Gradescope',
                  'assets/gradescope.png',
                  'Бағалау жүйесі',
                ),
                AIService('Eduaide', 'assets/eduaide.png', 'Білім көмекшісі'),
                AIService(
                  'QuestionWell',
                  'assets/questionwell.png',
                  'Сұрақ жинағы',
                ),
                AIService('Yippity', 'assets/yippity.png', 'AI тест генератор'),
                AIService(
                  'MagicSchool',
                  'assets/magicschool.png',
                  'Мұғалімдер үшін',
                ),
                AIService('Twee', 'assets/twee.png', 'Сабақ жоспарлау'),
                AIService('Gamma', 'assets/gamma.png', 'Презентация жасау'),
                AIService(
                  'Sendsteps',
                  'assets/sendsteps.png',
                  'Интерактив презент',
                ),
              ]),
              const SizedBox(height: 32),

              // Музыка / Аудио Section
              _buildSectionHeader('Музыка / Аудио'),
              const SizedBox(height: 16),
              _buildAIGrid(context, [
                AIService('AIVA', 'assets/aiva.png', 'AI музыка композитор'),
                AIService('Suno', 'assets/suno.png', 'Музыка жасау'),
                AIService('Boomy', 'assets/boomy.png', 'Тренд музыка жасау'),
                AIService(
                  'Orb Produ...',
                  'assets/orb.png',
                  'Әуенді аудио үлгілері',
                ),
                AIService(
                  'Soundraw',
                  'assets/soundraw.png',
                  'Бесплатная музыка',
                ),
                AIService(
                  'LANDR Ma...',
                  'assets/landr.png',
                  'MASTERING жазу үшін',
                ),
                AIService(
                  'Mubert',
                  'assets/mubert.png',
                  'Тұрақты бағдарламасы',
                ),
                AIService(
                  'Ecrett Music',
                  'assets/ecrett.png',
                  'Бейнеге музыка',
                ),
                AIService('Mureka', 'assets/mureka.png', 'Музыкалық генератор'),
                AIService(
                  'Orb Chords',
                  'assets/orbchords.png',
                  'Аккорд өңдеуші',
                ),
              ]),
              const SizedBox(height: 32),

              // Контент Section
              _buildSectionHeader('Контент'),
              const SizedBox(height: 16),
              _buildAIGrid(context, [
                AIService(
                  'ChatGPT',
                  'assets/chatgpt.png',
                  'Білім беру контенті',
                ),
                AIService('Copy', 'assets/copy.png', 'AI жазу көмекшісі'),
                AIService(
                  'Writesonic',
                  'assets/writesonic.png',
                  'AI контент жасау',
                ),
                AIService('Canva', 'assets/canva.png', 'Графикалық дизайн'),
                AIService(
                  'Adobe Firefly',
                  'assets/firefly.png',
                  'Креативті контент',
                ),
                AIService(
                  'Synthesia',
                  'assets/synthesia.png',
                  'AI бейне жасау',
                ),
                AIService(
                  'Runway ML',
                  'assets/runway.png',
                  'Бейне өңдеу құралы',
                ),
                AIService('Pixlr', 'assets/pixlr.png', 'Фото өңдеуіші'),
                AIService('QuillBot', 'assets/quillbot.png', 'Парафраз құралы'),
                AIService(
                  'SEOWriting',
                  'assets/seowriting.png',
                  'SEO мақалалар',
                ),
              ]),
              const SizedBox(height: 32),

              // Денсаулық Section
              _buildSectionHeader('Денсаулық'),
              const SizedBox(height: 16),
              _buildAIGrid(context, [
                AIService('PathAI', 'assets/pathai.png', 'Жасанды интеллект'),
                AIService(
                  'Aidence',
                  'assets/aidence.png',
                  'Денсаулық диагностикасы',
                ),
                AIService(
                  'DeepScribe',
                  'assets/deepscribe.png',
                  'Медициналық транскрип',
                ),
                AIService(
                  'Enlitic',
                  'assets/enlitic.png',
                  'Медициналық бейнелеу',
                ),
                AIService('Ada', 'assets/ada.png', 'Виртуалды медициналық'),
                AIService('Aidoc', 'assets/aidoc.png', 'Медициналық құралы'),
                AIService(
                  'IBM Watso...',
                  'assets/ibm.png',
                  'Персондалған емдеу',
                ),
                AIService(
                  'Microsoft He...',
                  'assets/microsoft.png',
                  'Денсаулық AI',
                ),
                AIService(
                  'Google Health',
                  'assets/google.png',
                  'Медициналық көмек',
                ),
                AIService(
                  'Butterfly IQ...',
                  'assets/butterfly.png',
                  'Портативті ультрадыбыс',
                ),
              ]),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 22),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.06),
              spreadRadius: 1,
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 'Басты бет', true, () {}),
            _buildNavItem(Icons.chat_bubble_outline, 'Чат бот', false, () {}),
            _buildNavItem(
              Icons.person_outline,
              'Аккаунт',
              false,
              _handleAccountTap,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionChip(String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 18),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,

          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),

        ),
        const Icon(Icons.arrow_forward_ios, size: 16),
      ],
    );
  }


  Widget _buildHorizontalAIList(List<AIService> services) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index < services.length - 1 ? 12 : 0,
            ),
            child: _buildAICard(services[index]),
          );
        },

      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        return _buildAICard(context, services[index]);
      },
    );
  }

  Widget _buildAICard(BuildContext context, AIService service) {
    return Container(

      width: 110,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.01), blurRadius: 6),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.smart_toy_outlined, color: Colors.grey),
          ),
          const SizedBox(height: 8),

          Text(
            service.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            maxLines: 2,

          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              service.description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 9, color: Colors.grey[600]),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: const Color(0xFF0A73FF),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => _openLoginPage(context),
              icon: const Icon(Icons.add, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }

  void _openLoginPage(BuildContext context) {
    Navigator.of(context).push(AuthPageRoute(child: const LoginPage()));
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive ? const Color(0xFF0A73FF) : Colors.grey,
          size: 26,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,


            color: isActive ? const Color(0xFF0A73FF) : Colors.grey,
            size: 26,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: isActive ? const Color(0xFF0A73FF) : Colors.grey,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class AIService {
  final String name;
  final String iconPath;
  final String description;

  AIService(this.name, this.iconPath, this.description);
}

class AccountPage extends StatelessWidget {
  final String email;
  final String name;

  const AccountPage({Key? key, required this.email, required this.name})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFF0A73FF),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person, size: 60, color: Colors.white),
              ),
              const SizedBox(height: 24),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF0A73FF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.workspace_premium,
                      color: Colors.white,
                      size: 16,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'ChatGPT Premium',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'ChatGPT Премиум тарифы аяқталуына 278 күн қалды.',
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              _buildInfoRow('Аты-жөні', name),
              _buildInfoRow('Поштасы', email),
              _buildInfoRow('Режим', 'Жүйе бойынша әдепкі'),
              _buildActionRow(
                'Құпиясөз ауыстыру',
                Icons.arrow_forward_ios,
                () {},
              ),
              _buildActionRow(
                'Тарифтар',
                Icons.arrow_forward_ios,
                () {},
                subtitle: 'Бағаларды көру',
                subtitleColor: const Color(0xFF0A73FF),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          Text(value, style: TextStyle(fontSize: 15, color: Colors.grey[600])),
        ],
      ),
    );
  }

  Widget _buildActionRow(
    String label,
    IconData icon,
    VoidCallback onTap, {
    String? subtitle,
    Color? subtitleColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
            Row(
              children: [
                if (subtitle != null)
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: subtitleColor ?? Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                const SizedBox(width: 8),
                Icon(icon, size: 16, color: Colors.grey[400]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
