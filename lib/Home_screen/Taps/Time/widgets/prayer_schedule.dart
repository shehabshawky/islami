import 'package:flutter/material.dart';
import 'package:islami/utils/app_color.dart';

typedef Prayer = (String, String, String);

class PrayerSchedule extends StatelessWidget {
  const PrayerSchedule({super.key, required this.prayers, required this.selectedPrayer, required this.alertsMuted, required this.onPrayerSelected, required this.onAlertsPressed});
  final List<Prayer> prayers;
  final int selectedPrayer;
  final bool alertsMuted;
  final ValueChanged<int> onPrayerSelected;
  final VoidCallback onAlertsPressed;

  @override
  Widget build(BuildContext context) => Container(height: 233, decoration: BoxDecoration(color: AppColor.sacondryColor, borderRadius: BorderRadius.circular(30)), child: Column(children: [
        const _ScheduleHeader(),
        Expanded(child: ListView.separated(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 7), itemCount: prayers.length, separatorBuilder: (_, _) => const SizedBox(width: 7), itemBuilder: (context, index) { final prayer = prayers[index]; return PrayerTile(name: prayer.$1, time: prayer.$2, period: prayer.$3, selected: selectedPrayer == index, onTap: () => onPrayerSelected(index)); })),
        _NextPrayerFooter(alertsMuted: alertsMuted, onAlertsPressed: onAlertsPressed),
      ]));
}

class _ScheduleHeader extends StatelessWidget {
  const _ScheduleHeader();
  @override
  Widget build(BuildContext context) => SizedBox(height: 64, child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const _DateText(top: '16 Jul,', bottom: '2024', align: TextAlign.left),
        const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text('Pray Time', style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xff635640))), SizedBox(height: 5), Text('Tuesday', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColor.primaryColor))]),
        const _DateText(top: '09 Muh,', bottom: '1446', align: TextAlign.right),
      ]));
}

class _DateText extends StatelessWidget { const _DateText({required this.top, required this.bottom, required this.align}); final String top; final String bottom; final TextAlign align; @override Widget build(BuildContext context) => SizedBox(width: 65, child: Text('$top\n$bottom', textAlign: align, style: const TextStyle(fontSize: 12, height: 1.55, fontWeight: FontWeight.bold, color: Colors.white))); }

class PrayerTile extends StatelessWidget {
  const PrayerTile({super.key, required this.name, required this.time, required this.period, required this.selected, required this.onTap});
  final String name; final String time; final String period; final bool selected; final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => InkWell(onTap: onTap, borderRadius: BorderRadius.circular(17), child: AnimatedContainer(duration: const Duration(milliseconds: 180), width: selected ? 82 : 68, decoration: BoxDecoration(color: selected ? const Color(0xff776749) : AppColor.primaryColor.withValues(alpha: .72), borderRadius: BorderRadius.circular(17)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text(name, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.white)), const SizedBox(height: 6), Text(time, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)), const SizedBox(height: 3), Text(period, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white))])));
}

class _NextPrayerFooter extends StatelessWidget { const _NextPrayerFooter({required this.alertsMuted, required this.onAlertsPressed}); final bool alertsMuted; final VoidCallback onAlertsPressed; @override Widget build(BuildContext context) => Padding(padding: const EdgeInsets.fromLTRB(20, 5, 20, 13), child: Row(children: [const Expanded(child: Text('Next Pray - 02:32', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xff5f533e)))), IconButton(onPressed: onAlertsPressed, iconSize: 21, padding: EdgeInsets.zero, constraints: const BoxConstraints(), color: AppColor.primaryColor, icon: Icon(alertsMuted ? Icons.notifications_off_rounded : Icons.notifications_active_rounded))])); }
