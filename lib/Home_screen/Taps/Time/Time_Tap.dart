import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_style.dart';
import 'package:islami/Home_screen/Taps/Time/widgets/azkar_card.dart';
import 'package:islami/Home_screen/Taps/Time/widgets/prayer_schedule.dart';

class TimeTap extends StatefulWidget {
  const TimeTap({super.key});
  @override
  State<TimeTap> createState() => _TimeTapState();
}

class _TimeTapState extends State<TimeTap> {
  bool _alertsMuted = false;
  int _selectedPrayer = 2;
  static const _prayers = [
    ('Fajr', '04:04', 'AM'),
    ('Sunrise', '05:31', 'AM'),
    ('Dhuhr', '01:01', 'PM'),
    ('ASR', '04:38', 'PM'),
    ('Maghrib', '07:57', 'PM'),
    ('Isha', '09:12', 'PM'),
  ];

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(14, 0, 14, 18),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PrayerSchedule(
          prayers: _prayers,
          selectedPrayer: _selectedPrayer,
          alertsMuted: _alertsMuted,
          onPrayerSelected: (index) => setState(() => _selectedPrayer = index),
          onAlertsPressed: () => setState(() => _alertsMuted = !_alertsMuted),
        ),
        const SizedBox(height: 19),
        Text('Azkar', style: AppStyle.white14bold),
        const SizedBox(height: 13),
        Row(
          children: [
            Expanded(
              child: AzkarCard(
                title: 'Evening Azkar',
                image: AppAssets.evening,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: AzkarCard(
                title: 'Morning Azkar',
                image: AppAssets.morning,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
