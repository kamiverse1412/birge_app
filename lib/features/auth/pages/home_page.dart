import 'package:birge_app/features/auth/pages/auth_page_route.dart';
import 'package:birge_app/features/auth/pages/login_page.dart';
import 'package:flutter/material.dart';

class AIHomePage extends StatelessWidget {
  const AIHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Жаңа әңгіме үшін 😊',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
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
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 'Басты бет', true),
            _buildNavItem(Icons.chat_bubble_outline, 'Чат бот', false),
            _buildNavItem(Icons.person_outline, 'Аккаунт', false),
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
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const Icon(Icons.arrow_forward_ios, size: 16),
      ],
    );
  }

  Widget _buildAIGrid(BuildContext context, List<AIService> services) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.85,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        return _buildAICard(context, services[index]);
      },
    );
  }

  Widget _buildAICard(BuildContext context, AIService service) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.grey[100],
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
            overflow: TextOverflow.ellipsis,
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
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Colors.blue,
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
        Icon(icon, color: isActive ? Colors.blue : Colors.grey, size: 28),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: isActive ? Colors.blue : Colors.grey,
          ),
        ),
      ],
    );
  }
}

class AIService {
  final String name;
  final String iconPath;
  final String description;

  AIService(this.name, this.iconPath, this.description);
}
