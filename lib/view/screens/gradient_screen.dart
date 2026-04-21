import 'package:flutter/material.dart';
import 'package:roll_dice_app/view/screens/dice_roller_screen.dart';


class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colors.primary,
                colors.secondary,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 8),

                /// 🔹 Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.casino,
                      color: colors.onPrimary,
                      size: 32,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Dice Roller',
                      style: textTheme.headlineMedium?.copyWith(
                        color: colors.onPrimary,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                /// 🔹 Content
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Tagline
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: colors.surface.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        '🎲 Roll for your luck! 🎲',
                        style: textTheme.titleMedium?.copyWith(
                          color: colors.onPrimary,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    const DiceRoller(),
                  ],
                ),

                const Spacer(),

                /// 🔹 Footer
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Tap the button to roll the dice',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colors.onPrimary.withValues(alpha: 0.7),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
