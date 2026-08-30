import 'package:flutter/material.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_style.dart';

class TimeTap extends StatefulWidget {
  const TimeTap({super.key});
  @override
  State<TimeTap> createState() => _TimeTapState();
}

class _TimeTapState extends State<TimeTap> {
  bool _alertsMuted = false;
  int _selectedPrayer = 2;
  static const _prayers = [('Fajr', '04:04', 'AM'), ('Sunrise', '05:31', 'AM'), ('Dhuhr', '01:01', 'PM'), ('ASR', '04:38', 'PM'), ('Maghrib', '07:57', 'PM'), ('Isha', '09:12', 'PM')];

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(14, 0, 14, 18),
    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      _PrayerSchedule(selectedPrayer: _selectedPrayer, alertsMuted: _alertsMuted, onPrayerSelected: (index) => setState(() => _selectedPrayer = index), onAlertsPressed: () => setState(() => _alertsMuted = !_alertsMuted)),
      const SizedBox(height: 19),
      Text('Azkar', style: AppStyle.white14bold),
      const SizedBox(height: 13),
      const Row(children: [Expanded(child: _AzkarCard(title: 'Evening Azkar', icon: Icons.nightlight_round)), SizedBox(width: 15), Expanded(child: _AzkarCard(title: 'Morning Azkar', icon: Icons.wb_sunny_rounded))]),
    ]),
  );
}

class _PrayerSchedule extends StatelessWidget {
  const _PrayerSchedule({required this.selectedPrayer, required this.alertsMuted, required this.onPrayerSelected, required this.onAlertsPressed});
  final int selectedPrayer;
  final bool alertsMuted;
  final ValueChanged<int> onPrayerSelected;
  final VoidCallback onAlertsPressed;
  @override
  Widget build(BuildContext context) => Container(
    height: 233,
    decoration: BoxDecoration(color: AppColor.sacondryColor, borderRadius: BorderRadius.circular(30)),
    child: Column(children: [
      SizedBox(height: 64, child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const _DateText(top: '16 Jul,', bottom: '2024', align: TextAlign.left),
        const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text('Pray Time', style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xff635640))), SizedBox(height: 5), Text('Tuesday', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColor.primaryColor))]),
        const _DateText(top: '09 Muh,', bottom: '1446', align: TextAlign.right),
      ])),
      Expanded(child: ListView.separated(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 7), itemCount: _TimeTapState._prayers.length, separatorBuilder: (_, _) => const SizedBox(width: 7), itemBuilder: (context, index) {
        final prayer = _TimeTapState._prayers[index];
        return _PrayerTile(name: prayer.$1, time: prayer.$2, period: prayer.$3, selected: selectedPrayer == index, onTap: () => onPrayerSelected(index));
      })),
      Padding(padding: const EdgeInsets.fromLTRB(20, 5, 20, 13), child: Row(children: [const Expanded(child: Text('Next Pray - 02:32', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xff5f533e)))), IconButton(onPressed: onAlertsPressed, iconSize: 21, padding: EdgeInsets.zero, constraints: const BoxConstraints(), color: AppColor.primaryColor, icon: Icon(alertsMuted ? Icons.notifications_off_rounded : Icons.notifications_active_rounded))])),
    ]),
  );
}

class _DateText extends StatelessWidget {
  const _DateText({required this.top, required this.bottom, required this.align});
  final String top; final String bottom; final TextAlign align;
  @override
  Widget build(BuildContext context) => SizedBox(width: 65, child: Text('$top\n$bottom', textAlign: align, style: const TextStyle(fontSize: 12, height: 1.55, fontWeight: FontWeight.bold, color: Colors.white)));
}

class _PrayerTile extends StatelessWidget {
  const _PrayerTile({required this.name, required this.time, required this.period, required this.selected, required this.onTap});
  final String name; final String time; final String period; final bool selected; final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => InkWell(onTap: onTap, borderRadius: BorderRadius.circular(17), child: AnimatedContainer(duration: const Duration(milliseconds: 180), width: selected ? 82 : 68, decoration: BoxDecoration(color: selected ? const Color(0xff776749) : AppColor.primaryColor.withValues(alpha: .72), borderRadius: BorderRadius.circular(17)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text(name, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.white)), const SizedBox(height: 6), Text(time, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)), const SizedBox(height: 3), Text(period, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white))])));
}

class _AzkarCard extends StatelessWidget {
  const _AzkarCard({required this.title, required this.icon});
  final String title; final IconData icon;
  @override
  Widget build(BuildContext context) => Material(color: AppColor.primaryColor.withValues(alpha: .84), borderRadius: BorderRadius.circular(16), child: InkWell(borderRadius: BorderRadius.circular(16), onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$title selected'))), child: Container(height: 200, decoration: BoxDecoration(border: Border.all(color: AppColor.sacondryColor, width: 1.5), borderRadius: BorderRadius.circular(16)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Container(padding: const EdgeInsets.all(21), decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.sacondryColor.withValues(alpha: .17)), child: Icon(icon, color: AppColor.sacondryColor, size: 72)), const SizedBox(height: 21), Text(title, style: AppStyle.white16bold)]))));
}
