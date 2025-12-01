import 'package:flutter/material.dart';

class ServiceInfoModal extends StatelessWidget {
  final String serviceName;
  final VoidCallback onStartChat;

  const ServiceInfoModal({
    Key? key,
    required this.serviceName,
    required this.onStartChat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // drag bar
          Center(
            child: Container(
              width: 34,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // title + close
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                serviceName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                  letterSpacing: 0.2,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, size: 22),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),

          const SizedBox(height: 12),

          const Text(
            "Конспект пен мақалаларды қысқаша мазмұндап, маңызды ойды бөліп көрсетеді.",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 1.4,
              letterSpacing: 0.2,
              color: Color(0xFF1D1B20),
            ),
          ),

          const SizedBox(height: 22),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(
                child: _StatItem(
                  icon: Icons.star,
                  title: "4.8",
                  subtitle: "Бағалар (10K+)",
                ),
              ),
              SizedBox(width: 6),
              Expanded(
                child: _StatItem(
                  icon: Icons.leaderboard,
                  title: "#1",
                  subtitle: "Өнімділік бойынша",
                ),
              ),
              SizedBox(width: 6),
              Expanded(
                child: _StatItem(
                  icon: Icons.people,
                  title: "3M+",
                  subtitle: "Белсенді қолданушы",
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          const Text(
            "Талқылауды бастау",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 12),

          Wrap(
            spacing: 10,
            children: const [
              _Chip("Конспектіні қалай тез жасауға болады?"),
              _Chip("Негізгі ойды қалай табу керек?"),
            ],
          ),

          const SizedBox(height: 30),

          const Text(
            "Мүмкіндіктер",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.3,
            ),
          ),

          const SizedBox(height: 12),
          const _CheckItem("Мәтінді қысқаша мазмұндау"),
          const _CheckItem("Маңызды ойларды бөліп көрсету"),
          const _CheckItem("Тақырыпша, тезис, карточка жасау"),
          const _CheckItem("Құжатты талдау"),

          const SizedBox(height: 28),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: onStartChat,
              child: const Text(
                "Чатты бастау",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _StatItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.black87),
        const SizedBox(width: 6),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  height: 1.2,
                ),
              ),
              Text(
                subtitle,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 12,
                  height: 1.3,
                  letterSpacing: 0.3,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  final String text;

  const _Chip(this.text);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(text, style: const TextStyle(fontSize: 13, height: 1.2)),
      backgroundColor: Colors.grey[200],
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    );
  }
}

class _CheckItem extends StatelessWidget {
  final String text;

  const _CheckItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          const Icon(Icons.check, color: Colors.green, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15, height: 1.35),
            ),
          ),
        ],
      ),
    );
  }
}
