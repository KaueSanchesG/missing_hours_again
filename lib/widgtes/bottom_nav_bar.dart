import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: TabBar(
        indicatorColor: Theme.of(context).colorScheme.secondary,
        unselectedLabelColor: Colors.grey,
        tabs: const [
          Tab(icon: Icon(Icons.home), text: 'Ponto'),
          Tab(icon: Icon(Icons.settings), text: 'Configurações'),
        ],
      ),
    );
  }
}
