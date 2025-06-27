import 'package:flutter/material.dart';
import 'package:TajwidKidz/Game/view/mini_game.dart'; // Sesuaikan path ini
import 'homepage.dart'; // Import HomePageWidget, sesuaikan pathnya

void main() {
  runApp(const LeaderboardApp());
}

class LeaderboardApp extends StatelessWidget {
  const LeaderboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LeaderboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Player {
  final int rank;
  final String name;
  final int xp;

  Player({required this.rank, required this.name, required this.xp});
}

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen>
    with SingleTickerProviderStateMixin {
  final List<Player> players = [
    Player(rank: 1, name: 'Haley James', xp: 500),
    Player(rank: 2, name: 'Brooke Davis', xp: 480),
    Player(rank: 3, name: 'Jamie Scott', xp: 470),
    Player(rank: 4, name: 'Marvin McFadden', xp: 460),
    Player(rank: 5, name: 'Nathan Scott', xp: 450),
    Player(rank: 6, name: 'Antwon Taylor', xp: 440),
    Player(rank: 7, name: 'Jake Jagielski', xp: 430),
    Player(rank: 8, name: 'Peyton Sawyer', xp: 420),
    Player(rank: 9, name: 'Lucas Scott', xp: 410),
    Player(rank: 10, name: 'Karen Roe', xp: 400),
  ];

  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeInAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildMedal(int rank) {
    switch (rank) {
      case 1:
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFFFFD700), Color(0xFFFFA500)], // Emas ke oranye
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: const [
              BoxShadow(color: Color(0xFFFFD700), blurRadius: 12, spreadRadius: 2),
            ],
          ),
          padding: const EdgeInsets.all(8),
          child: const Icon(Icons.emoji_events, color: Colors.black, size: 40),
        );
      case 2:
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Colors.grey.shade400, Colors.grey.shade600], // Silver gradient
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade500, blurRadius: 10, spreadRadius: 1),
            ],
          ),
          padding: const EdgeInsets.all(8),
          child: const Icon(Icons.emoji_events, color: Colors.black, size: 36),
        );
      case 3:
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Colors.brown.shade300, Colors.brown.shade600], // Bronze gradient
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(color: Colors.brown.shade600, blurRadius: 10, spreadRadius: 1),
            ],
          ),
          padding: const EdgeInsets.all(8),
          child: const Icon(Icons.emoji_events, color: Colors.white, size: 36),
        );
      default:
        return CircleAvatar(
          backgroundColor: Colors.blueGrey.shade100,
          child: Text(
            rank.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAD2), // Kuning pucat
      appBar: AppBar(
        backgroundColor: const Color(0xFF037A16), // Hijau gelap
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), // Ikon putih agar kontras
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePageWidget()),
                  (route) => false,
            );
          },
        ),
        title: const Text(
          'Leaderboard',
          style: TextStyle(
            color: Colors.black, // Teks putih agar jelas
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: FadeTransition(
        opacity: _fadeInAnimation,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      _buildMedal(2),
                      const SizedBox(height: 6),
                      const Text('2',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.black)),
                    ],
                  ),
                  Column(
                    children: [
                      _buildMedal(1),
                      const SizedBox(height: 6),
                      const Text('1',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.black)),
                    ],
                  ),
                  Column(
                    children: [
                      _buildMedal(3),
                      const SizedBox(height: 6),
                      const Text('3',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.black)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Selamat Atas Pencampainmu',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '10 Peringkat Terbaik Mini Game',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Scrollbar(
                  controller: _scrollController,
                  thumbVisibility: true,
                  child: ListView.separated(
                    controller: _scrollController,
                    itemCount: players.length,
                    separatorBuilder: (_, __) => const Divider(
                      thickness: 1,
                      color: Colors.grey,
                      indent: 20,
                      endIndent: 20,
                    ),
                    itemBuilder: (context, index) {
                      final player = players[index];
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          color: player.rank == 1
                              ? Colors.amber.shade100.withAlpha(120)
                              : player.rank == 2
                              ? Colors.grey.shade300.withAlpha(120)
                              : player.rank == 3
                              ? Colors.brown.shade200.withAlpha(120)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          leading: _buildMedal(player.rank),
                          title: Text(
                            player.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: player.rank <= 3
                                  ? Colors.black87
                                  : Colors.black,
                            ),
                          ),
                          trailing: Text(
                            '${player.xp} XP',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.green,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                        ),
                      );
                    },
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MiniGameWidget()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Next Game',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
