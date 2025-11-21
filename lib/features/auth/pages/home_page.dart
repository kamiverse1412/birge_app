import 'dart:io';

import 'package:flutter/material.dart';

class AIHomePage extends StatefulWidget {
  const AIHomePage({Key? key}) : super(key: key);

  @override
  State<AIHomePage> createState() => _AIHomePageState();
}

class _AIHomePageState extends State<AIHomePage> {
  String selectedCategory = 'Бәрі';

  // your categorized services (unchanged)
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

  // <-- Put the local image path you gave here:
  final String robotImageFilePath =
      '/Users/kamila/Desktop/BIRGE/birge_app/6d68ee56925c4b1b52025305c1172c68b494a078.png';

  @override
  Widget build(BuildContext context) {
    // To match Figma's airy layout, use a white scaffold and large paddings
    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar: minimal with back button only (no title)
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top header area that replicates the Figma composition
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Жаңа әңгіме',
                                    style: TextStyle(
                                      fontSize: 44, // large like figma
                                      fontWeight: FontWeight.w800,
                                      height: 0.95,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'үшін',
                                        style: TextStyle(
                                          fontSize: 44,
                                          fontWeight: FontWeight.w800,
                                          height: 0.95,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      // robot icon (from local path). If not available, fallback to icon
                                      _buildRobotIcon(robotImageFilePath),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        // Chat bot AI big blue text
                        Text(
                          'Chat bot AI',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w800,
                            color: const Color(
                              0xFF0A73FF,
                            ), // bright blue similar to figma
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Right: rounded blue "+ Жазу" button (large pill)
                  Padding(
                    padding: const EdgeInsets.only(top: 120), // LOWER BUTTON
                    child: _buildWriteButton(),
                  ),
                ],
              ),
            ),

            // Search bar, chips and sections follow (kept your existing layout but adjusted spacing)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  // Search bar
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F7F9),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Іздеу..',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Category Chips
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

                  // Display filtered content (kept your logic)
                  if (selectedCategory == 'Бәрі') ...[
                    _buildSectionHeader('Білім'),
                    const SizedBox(height: 12),
                    _buildHorizontalAIList(categorizedServices['Білім']!),
                    const SizedBox(height: 20),

                    _buildSectionHeader('Музыка / Аудио'),
                    const SizedBox(height: 12),
                    _buildHorizontalAIList(categorizedServices['Мұзыка']!),
                    const SizedBox(height: 20),

                    _buildSectionHeader('Контент'),
                    const SizedBox(height: 12),
                    _buildHorizontalAIList(categorizedServices['Контент']!),
                    const SizedBox(height: 20),

                    _buildSectionHeader('Денсаулық'),
                    const SizedBox(height: 12),
                    _buildHorizontalAIList(categorizedServices['Денсаулық']!),
                  ] else ...[
                    _buildSectionHeader(selectedCategory),
                    const SizedBox(height: 12),
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

      // bottom navigation (kept)
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
            _buildNavItem(Icons.home, 'Басты бет', true),
            _buildNavItem(Icons.chat_bubble_outline, 'Чат бот', false),
            _buildNavItem(Icons.person_outline, 'Аккаунт', false),
          ],
        ),
      ),
    );
  }

  Widget _buildRobotIcon(String filePath) {
    // Try to load a local file image (developer provided path). If inaccessible, fallback to icon
    try {
      final file = File(filePath);
      if (file.existsSync()) {
        return Container(
          margin: const EdgeInsets.only(left: 6),
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 6),
            ],
          ),
          child: ClipOval(
            child: Image.file(
              file,
              fit: BoxFit.cover,
              width: 36,
              height: 36,
              errorBuilder: (c, e, st) {
                return const Icon(
                  Icons.smart_toy,
                  color: Colors.black54,
                  size: 22,
                );
              },
            ),
          ),
        );
      }
    } catch (_) {
      // ignore
    }

    // fallback small robot icon
    return Container(
      margin: const EdgeInsets.only(left: 6),
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 6),
        ],
      ),
      child: const Icon(Icons.smart_toy, color: Colors.black54, size: 22),
    );
  }

  Widget _buildWriteButton() {
    return Container(
      width: 130,
      height: 64,
      decoration: BoxDecoration(
        color: const Color(0xFF1162FF),
        borderRadius: BorderRadius.circular(36),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.16),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: TextButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.add, color: Colors.white, size: 20),
        label: const Text(
          'Жазу',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
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
          color: isSelected ? const Color(0xFF0166FF) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF0166FF) : Colors.grey.shade300,
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
                fontWeight: FontWeight.w600,
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
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
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
    );
  }

  Widget _buildAICard(AIService service) {
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              service.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
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
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: const Color(0xFF0A73FF),
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
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
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
