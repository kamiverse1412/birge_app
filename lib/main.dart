import 'package:flutter/material.dart';
import 'app/app.dart';

void main() {
  runApp(const App());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const ChatBotHomePage(),
//     );
//   }
// }

// class ChatBotHomePage extends StatelessWidget {
//   const ChatBotHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Header Section
//             Container(
//               padding: const EdgeInsets.all(20),
//               color: Colors.white,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'Жаңа әңгіме',
//                               style: TextStyle(
//                                 fontSize: 28,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 const Text(
//                                   'үшін ',
//                                   style: TextStyle(
//                                     fontSize: 28,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Image.asset(
//                                   'assets/images/6d4f9c3f-robot-icon-png_252135.png',
//                                   width: 28,
//                                   height: 28,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                         child: const Padding(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 12,
//                             vertical: 8,
//                           ),
//                           child: Text(
//                             '+ Жазу',
//                             style: TextStyle(color: Colors.white, fontSize: 16),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   // IMAGE HERE!!! - Chat bot AI logo placeholder
//                   const Row(
//                     children: [
//                       Icon(Icons.chat_bubble, color: Colors.blue, size: 24),
//                       SizedBox(width: 4),
//                       Text(
//                         'Chat bot AI',
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 16),

//             // Search Bar
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Іздеу..',
//                   prefixIcon: const Icon(Icons.search, color: Colors.grey),
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             // Category Tabs
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Row(
//                 children: [
//                   _buildTab('Бәрі', true),
//                   const SizedBox(width: 12),
//                   _buildTab('Білім', false),
//                   const SizedBox(width: 12),
//                   _buildTab('Музыка', false),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Content
//             Expanded(
//               child: ListView(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 children: [
//                   _buildSection('Білім', [
//                     _AITool(
//                       'NotebookLM',
//                       'Кеңейткіш кіссәлік мазмұндауды',
//                       Icons.rss_feed,
//                     ),
//                     _AITool(
//                       'Gradescope',
//                       'Жазба жұмыстарын бағалаушы',
//                       Icons.bar_chart,
//                     ),
//                     _AITool(
//                       'Eduaide',
//                       'Сабақ жоспарлау және генератор',
//                       Icons.remove_red_eye,
//                     ),
//                   ]),
//                   const SizedBox(height: 24),
//                   _buildSection('Музыка / Аудио', [
//                     _AITool(
//                       'AIVA',
//                       'Көңілдерін AI композитор',
//                       Icons.graphic_eq,
//                     ),
//                     _AITool(
//                       'Suno',
//                       'Мәтіннен ән жасайтын AI мүдісі',
//                       Icons.music_note,
//                     ),
//                     _AITool('Boomy', 'Бірнеше минут музыка жасау', Icons.album),
//                   ]),
//                   const SizedBox(height: 24),
//                   _buildSection('Контент', [
//                     _AITool('ChatGPT', 'Әмбебап мәтіндік өміршең', Icons.hub),
//                     _AITool(
//                       'Copy',
//                       'Маркетинг мәтіндерін жасаушы',
//                       Icons.content_copy,
//                     ),
//                     _AITool(
//                       'Writesonic',
//                       'Блог және мақала жазушы',
//                       Icons.edit_note,
//                     ),
//                   ]),
//                   const SizedBox(height: 24),
//                   _buildSection('Денсаулық', [
//                     _AITool(
//                       'PathAI',
//                       'Діагноз қоюуы жәндендері',
//                       Icons.biotech,
//                     ),
//                     _AITool(
//                       'Aidence',
//                       'Өкпе КТ рентген скриниңдері талдаушы',
//                       Icons.grid_on,
//                     ),
//                     _AITool(
//                       'DeepScribe',
//                       'Дәрігер сайын жазба есеп жасаушы',
//                       Icons.graphic_eq,
//                     ),
//                   ]),
//                   const SizedBox(height: 100),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         currentIndex: 0,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Басты бет'),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.chat_bubble_outline),
//             label: 'Чат-бот',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_outline),
//             label: 'Аккаунт',
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTab(String text, bool isActive) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       decoration: BoxDecoration(
//         color: isActive ? Colors.blue : Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Text(
//         text,
//         style: TextStyle(
//           color: isActive ? Colors.white : Colors.black,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     );
//   }

//   Widget _buildSection(String title, List<_AITool> tools) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const Icon(Icons.arrow_forward_ios, size: 16),
//           ],
//         ),
//         const SizedBox(height: 16),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: tools.map((tool) => _buildToolCard(tool)).toList(),
//         ),
//       ],
//     );
//   }

//   Widget _buildToolCard(_AITool tool) {
//     return Expanded(
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 4),
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.grey[100],
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(tool.icon, size: 28),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               tool.name,
//               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 4),
//             Text(
//               tool.description,
//               style: TextStyle(fontSize: 10, color: Colors.grey[600]),
//               textAlign: TextAlign.center,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const SizedBox(height: 12),
//             Container(
//               padding: const EdgeInsets.all(8),
//               decoration: const BoxDecoration(
//                 color: Colors.blue,
//                 shape: BoxShape.circle,
//               ),
//               child: const Icon(Icons.add, color: Colors.white, size: 20),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _AITool {
//   final String name;
//   final String description;
//   final IconData icon;

//   _AITool(this.name, this.description, this.icon);
// }
