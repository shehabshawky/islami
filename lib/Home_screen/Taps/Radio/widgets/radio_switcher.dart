import 'package:flutter/material.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_style.dart';

class RadioSwitcher extends StatelessWidget {
  const RadioSwitcher({
    super.key,
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
        _SwitcherButton(
          label: 'Radio',
          selected: !showReciters,
          onTap: onRadioTap,
        ),
        _SwitcherButton(
          label: 'Reciters',
          selected: showReciters,
          onTap: onRecitersTap,
        ),
      ],
    ),
  );
}

class _SwitcherButton extends StatelessWidget {
  const _SwitcherButton({
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
