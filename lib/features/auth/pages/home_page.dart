import 'package:flutter/material.dart';

class AIHomePage extends StatefulWidget {
  const AIHomePage({Key? key}) : super(key: key);

  @override
  State<AIHomePage> createState() => _AIHomePageState();
}

class _AIHomePageState extends State<AIHomePage> {
  String selectedCategory = 'Бәрі';

  final Map<String, List<AIService>> categorizedServices = {
    'Білім': [
      AIService('NotebookLM', 'assets/notebooklm.png', 'Зерттеу көмекшісі'),
      AIService('Gradescope', 'assets/gradescope.png', 'Бағалау жүйесі'),
      AIService('Eduaide', 'assets/eduaide.png', 'Білім көмекшісі'),
      AIService('QuestionWell', 'assets/questionwell.png', 'Сұрақ жинағы'),
      AIService('Yippity', 'assets/yippity.png', 'AI тест генератор'),
      AIService('MagicSchool', 'assets/magicschool.png', 'Мұғалімдер үшін'),
      AIService('Twee', 'assets/twee.png', 'Сабақ жоспарлау'),
      AIService('Gamma', 'assets/gamma.png', 'Презентация жасау'),
      AIService('Sendsteps', 'assets/sendsteps.png', 'Интерактив презент'),
    ],
    'Мұзыка': [
      AIService('AIVA', 'assets/aiva.png', 'AI музыка композитор'),
      AIService('Suno', 'assets/suno.png', 'Музыка жасау'),
      AIService('Boomy', 'assets/boomy.png', 'Тренд музыка жасау'),
      AIService('Orb Produ...', 'assets/orb.png', 'Әуенді аудио үлгілері'),
      AIService('Soundraw', 'assets/soundraw.png', 'Бесплатная музыка'),
      AIService('LANDR Ma...', 'assets/landr.png', 'MASTERING жазу үшін'),
      AIService('Mubert', 'assets/mubert.png', 'Тұрақты бағдарламасы'),
      AIService('Ecrett Music', 'assets/ecrett.png', 'Бейнеге музыка'),
      AIService('Mureka', 'assets/mureka.png', 'Музыкалық генератор'),
      AIService('Orb Chords', 'assets/orbchords.png', 'Аккорд өңдеуші'),
    ],
    'Контент': [
      AIService('ChatGPT', 'assets/chatgpt.png', 'Білім беру контенті'),
      AIService('Copy', 'assets/copy.png', 'AI жазу көмекшісі'),
      AIService('Writesonic', 'assets/writesonic.png', 'AI контент жасау'),
      AIService('Canva', 'assets/canva.png', 'Графикалық дизайн'),
      AIService('Adobe Firefly', 'assets/firefly.png', 'Креативті контент'),
      AIService('Synthesia', 'assets/synthesia.png', 'AI бейне жасау'),
      AIService('Runway ML', 'assets/runway.png', 'Бейне өңдеу құралы'),
      AIService('Pixlr', 'assets/pixlr.png', 'Фото өңдеуіші'),
      AIService('QuillBot', 'assets/quillbot.png', 'Парафраз құралы'),
      AIService('SEOWriting', 'assets/seowriting.png', 'SEO мақалалар'),
    ],
    'Денсаулық': [
      AIService('PathAI', 'assets/pathai.png', 'Жасанды интеллект'),
      AIService('Aidence', 'assets/aidence.png', 'Денсаулық диагностикасы'),
      AIService('DeepScribe', 'assets/deepscribe.png', 'Медициналық транскрип'),
      AIService('Enlitic', 'assets/enlitic.png', 'Медициналық бейнелеу'),
      AIService('Ada', 'assets/ada.png', 'Виртуалды медициналық'),
      AIService('Aidoc', 'assets/aidoc.png', 'Медициналық құралы'),
      AIService('IBM Watso...', 'assets/ibm.png', 'Персондалған емдеу'),
      AIService('Microsoft He...', 'assets/microsoft.png', 'Денсаулық AI'),
      AIService('Google Health', 'assets/google.png', 'Медициналық көмек'),
      AIService(
        'Butterfly IQ...',
        'assets/butterfly.png',
        'Портативті ультрадыбыс',
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
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
                const Text(
                  'Жаңа әңгіме үшін',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add, color: Colors.blue, size: 20),
                  label: const Text(
                    'Жаңу',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Robot icon and Chat bot AI banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  // Robot icon
                  Image.asset(
                    'assets/robot_icon.png',
                    width: 50,
                    height: 50,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.smart_toy,
                          color: Colors.grey,
                          size: 28,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  // Yellow striped banner with gradient text
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.yellow.shade700,
                          Colors.yellow.shade600,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [Color(0xFF0066FF), Color(0xFF00CCFF)],
                        ).createShader(bounds),
                        child: const Text(
                          'Chat bot AI',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Rest of the content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Bar
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Іздеу...',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        icon: Icon(Icons.search, color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Category Filter Chips
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildCategoryChip('Бәрі', null),
                        const SizedBox(width: 8),
                        _buildCategoryChip('Білім', Icons.school),
                        const SizedBox(width: 8),
                        _buildCategoryChip('Мұзыка', Icons.music_note),
                        const SizedBox(width: 8),
                        _buildCategoryChip('Контент', Icons.content_copy),
                        const SizedBox(width: 8),
                        _buildCategoryChip(
                          'Денсаулық',
                          Icons.health_and_safety,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Display filtered content
                  if (selectedCategory == 'Бәрі') ...[
                    // Білім Section
                    _buildSectionHeader('Білім'),
                    const SizedBox(height: 16),
                    _buildHorizontalAIList(categorizedServices['Білім']!),
                    const SizedBox(height: 24),

                    // Музыка / Аудио Section
                    _buildSectionHeader('Музыка / Аудио'),
                    const SizedBox(height: 16),
                    _buildHorizontalAIList(categorizedServices['Мұзыка']!),
                    const SizedBox(height: 24),

                    // Контент Section
                    _buildSectionHeader('Контент'),
                    const SizedBox(height: 16),
                    _buildHorizontalAIList(categorizedServices['Контент']!),
                    const SizedBox(height: 24),

                    // Денсаулық Section
                    _buildSectionHeader('Денсаулық'),
                    const SizedBox(height: 16),
                    _buildHorizontalAIList(categorizedServices['Денсаулық']!),
                  ] else ...[
                    // Show only selected category
                    _buildSectionHeader(selectedCategory),
                    const SizedBox(height: 16),
                    _buildHorizontalAIList(
                      categorizedServices[selectedCategory]!,
                    ),
                  ],
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
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

  Widget _buildCategoryChip(String label, IconData? icon) {
    final bool isSelected = selectedCategory == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: isSelected ? Colors.white : Colors.grey[700],
                size: 18,
              ),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[700],
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
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
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ],
    );
  }

  Widget _buildHorizontalAIList(List<AIService> services) {
    return SizedBox(
      height: 155,
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
    );
  }

  Widget _buildAICard(AIService service) {
    return Container(
      width: 100,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              service.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
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
          const Spacer(),
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: Colors.white, size: 18),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
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
            fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
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
