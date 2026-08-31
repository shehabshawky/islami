import 'package:flutter/material.dart';
import 'package:islami/Home_screen/Taps/Radio/widgets/radio_switcher.dart';
import 'package:islami/Home_screen/Taps/Radio/widgets/station_card.dart';
import 'package:islami/utils/app_assets.dart';

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
  static const List<String> _pgImage = [
    AppAssets.maskPG,
    AppAssets.soundPG,
    AppAssets.maskPG,
    AppAssets.soundPG,
  ];

  @override
  Widget build(BuildContext context) {
    final stations = _showReciters ? _reciters : _radioStations;
    return Padding(
      padding: const EdgeInsets.fromLTRB(11, 0, 11, 12),
      child: Column(
        children: [
          RadioSwitcher(
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
              itemBuilder: (context, index) => StationCard(
                image: _pgImage[index],
                title: stations[index],
                isPlaying: _playingIndex == index,
                muted: _muted,
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
