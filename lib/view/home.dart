import 'package:flutter/material.dart';
import 'package:missing_hours_again/viewmodel/home_view_model.dart';
import 'package:missing_hours_again/widgtes/time_container.dart';

class Home extends StatefulWidget {
  final BuildContext context;

  const Home({super.key, required this.context});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final vm = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      children: [
        TimeContainer(
          vm.initTime,
          isTimeOnLeft: true,
          label: "Entrada",
          onPressed: () async {
            await vm.selectInitTime(context);
            setState(() {});
          },
        ),
        const SizedBox(height: 24),
        TimeContainer(
          isTimeOnLeft: false,
          vm.lunchTime,
          label: "Saída pro Almoço",
          onPressed: () async {
            await vm.selectLunchTime(context);
            setState(() {});
          },
        ),
        const SizedBox(height: 40),

        ElevatedButton(
          onPressed: () {
            vm.calculateReturnTime(context);
            setState(() {});
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF81B29A),
            foregroundColor: Colors.white,
            elevation: 4,
            shadowColor: Colors.black.withValues(alpha: 0.12),
            minimumSize: const Size(double.infinity, 70),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          child: const Text(
            "Calcular",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 40),

        Container(
          width: double.infinity,
          height: 160,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                blurRadius: 15,
                spreadRadius: 2,
                offset: const Offset(5, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Você deve voltar às",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.7),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        vm.returnTime ?? "--:--",
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                            scale: animation,
                            child: FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          );
                        },
                    child: vm.returnTime == null
                        ? Image.asset(
                            'assets/images/capybara_waiting.png',
                            key: const ValueKey('waiting'),
                            height: 100,
                          )
                        : Image.asset(
                            'assets/images/capybara_happy.png',
                            key: const ValueKey('done'),
                            height: 120,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
