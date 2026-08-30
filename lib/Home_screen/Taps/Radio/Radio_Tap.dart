import 'package:flutter/material.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_style.dart';

class RadioTap extends StatefulWidget {
  const RadioTap({super.key});

  @override
  State<RadioTap> createState() => _RadioTapState();
}

class _RadioTapState extends State<RadioTap> {
  bool _showReciters = false;
  int? _playingIndex;
  bool _muted = false;

  static const _radioStations = [
    'Radio Ibrahim Al-Akdar',
    'Radio Al-Qaria Yassen',
    'Radio Ahmed Al-trabulsi',
    'Radio Addokali Mohammad Alalim',
  ];
  static const _reciters = [
    'Sheikh Abdul Basit',
    'Sheikh Mahmoud Khalil Al-Hussary',
    'Sheikh Mohamed Siddiq El-Minshawi',
    'Sheikh Mishary Alafasy',
  ];

  @override
  Widget build(BuildContext context) {
    final stations = _showReciters ? _reciters : _radioStations;
    return Padding(
      padding: const EdgeInsets.fromLTRB(11, 0, 11, 12),
      child: Column(
        children: [
          _RadioSwitcher(
            showReciters: _showReciters,
            onRadioTap: () => setState(() => _showReciters = false),
            onRecitersTap: () => setState(() => _showReciters = true),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: stations.length,
              separatorBuilder: (_, _) => const SizedBox(height: 13),
              itemBuilder: (context, index) => _StationCard(
                title: stations[index],
                isPlaying: _playingIndex == index,
                muted: _muted,
                showEqualizer: _showReciters && index == 1,
                onPlay: () => setState(
                  () => _playingIndex = _playingIndex == index ? null : index,
                ),
                onVolume: () => setState(() => _muted = !_muted),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RadioSwitcher extends StatelessWidget {
  const _RadioSwitcher({
    required this.showReciters,
    required this.onRadioTap,
    required this.onRecitersTap,
  });
  final bool showReciters;
  final VoidCallback onRadioTap;
  final VoidCallback onRecitersTap;

  @override
  Widget build(BuildContext context) => Container(
    height: 40,
    decoration: BoxDecoration(
      color: Colors.black.withValues(alpha: .45),
      borderRadius: BorderRadius.circular(11),
    ),
    child: Row(
      children: [
        _TabButton(label: 'Radio', selected: !showReciters, onTap: onRadioTap),
        _TabButton(
          label: 'Reciters',
          selected: showReciters,
          onTap: onRecitersTap,
        ),
      ],
    ),
  );
}

class _TabButton extends StatelessWidget {
  const _TabButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Expanded(
    child: Material(
      color: selected ? AppColor.sacondryColor : Colors.transparent,
      borderRadius: BorderRadius.circular(11),
      child: InkWell(
        borderRadius: BorderRadius.circular(11),
        onTap: onTap,
        child: Center(
          child: Text(
            label,
            style: AppStyle.black14bold.copyWith(
              color: selected ? AppColor.primaryColor : Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}

class _StationCard extends StatelessWidget {
  const _StationCard({
    required this.title,
    required this.isPlaying,
    required this.muted,
    required this.showEqualizer,
    required this.onPlay,
    required this.onVolume,
  });
  final String title;
  final bool isPlaying;
  final bool muted;
  final bool showEqualizer;
  final VoidCallback onPlay;
  final VoidCallback onVolume;

  @override
  Widget build(BuildContext context) => Container(
    height: 103,
    decoration: BoxDecoration(
      color: AppColor.sacondryColor,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyle.black16bold,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: onPlay,
                  iconSize: 34,
                  color: AppColor.primaryColor,
                  icon: Icon(
                    isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                  ),
                  tooltip: isPlaying ? 'Pause' : 'Play',
                ),
                const SizedBox(width: 11),
                IconButton(
                  onPressed: onVolume,
                  color: AppColor.primaryColor,
                  icon: Icon(
                    muted ? Icons.volume_off_rounded : Icons.volume_up_rounded,
                  ),
                  tooltip: muted ? 'Unmute' : 'Mute',
                ),
              ],
            ),
            const SizedBox(height: 2),
          ],
        ),
      ],
    ),
  );
}
