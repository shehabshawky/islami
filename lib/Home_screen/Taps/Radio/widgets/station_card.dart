import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_style.dart';

class StationCard extends StatelessWidget {
  const StationCard({
    super.key,
    required this.title,
    required this.isPlaying,
    required this.muted,
    required this.onPlay,
    required this.onVolume,
    required this.image,
  });
  final String title;
  final String image;
  final bool isPlaying;
  final bool muted;
  final VoidCallback onPlay;
  final VoidCallback onVolume;

  @override
  Widget build(BuildContext context) => Container(
    height: 103,
    decoration: BoxDecoration(
      color: AppColor.sacondryColor,
      image: DecorationImage(image: AssetImage(image), fit: .cover),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
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
        _PlayerControls(
          isPlaying: isPlaying,
          muted: muted,
          onPlay: onPlay,
          onVolume: onVolume,
        ),
        const SizedBox(height: 2),
      ],
    ),
  );
}

class _PlayerControls extends StatelessWidget {
  const _PlayerControls({
    required this.isPlaying,
    required this.muted,
    required this.onPlay,
    required this.onVolume,
  });
  final bool isPlaying;
  final bool muted;
  final VoidCallback onPlay;
  final VoidCallback onVolume;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
        onPressed: onPlay,
        iconSize: 34,
        color: AppColor.primaryColor,
        icon: Icon(isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded),
        tooltip: isPlaying ? 'Pause' : 'Play',
      ),
      const SizedBox(width: 11),
      IconButton(
        onPressed: onVolume,
        color: AppColor.primaryColor,
        icon: Icon(muted ? Icons.volume_off_rounded : Icons.volume_up_rounded),
        tooltip: muted ? 'Unmute' : 'Mute',
      ),
    ],
  );
}
