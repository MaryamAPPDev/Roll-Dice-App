import 'dart:math';
import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller>
    with SingleTickerProviderStateMixin {
  final _random = Random();

  int currentDiceRoll = 1;
  int totalRolls = 0;
  bool isRolling = false;

  late final AnimationController _controller;
  late final Animation<double> _scale;
  late final Animation<double> _rotation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _scale = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 1.3)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.3, end: 1.0)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 50,
      ),
    ]).animate(_controller);

    _rotation = Tween(begin: 0.0, end: 2 * pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> rollDice() async {
    if (isRolling) return;

    setState(() {
      isRolling = true;
      totalRolls++;
    });

    await _controller.forward(from: 0);

    // Final value only (cleaner UX)
    if (!mounted) return;

    setState(() {
      currentDiceRoll = _random.nextInt(6) + 1;
      isRolling = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// 🎲 Animated Dice
        AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            return Transform.scale(
              scale: _scale.value,
              child: Transform.rotate(
                angle: _rotation.value,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: colors.surface.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 20,
                        spreadRadius: 5,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/dice-$currentDiceRoll.png',
                    width: 160,
                    height: 160,
                  ),
                ),
              ),
            );
          },
        ),

        const SizedBox(height: 40),

        /// 🔁 Roll Count
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: colors.surface.withValues(alpha: 0.25),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.refresh, color: colors.onPrimary, size: 20),
              const SizedBox(width: 8),
              Text(
                'Total Rolls: $totalRolls',
                style: textTheme.bodyMedium?.copyWith(
                  color: colors.onPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),

        /// 🎯 Button (Material 3 compliant)
        FilledButton.icon(
          onPressed: isRolling ? null : rollDice,
          icon: Icon(
            isRolling ? Icons.hourglass_empty : Icons.casino,
          ),
          label: Text(
            isRolling ? 'Rolling...' : 'Roll Dice',
          ),
        ),

        if (totalRolls > 0) ...[
          const SizedBox(height: 20),

          /// 🎲 Result
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colors.surface.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              'You rolled: $currentDiceRoll',
              style: textTheme.titleMedium?.copyWith(
                color: colors.onPrimary,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
