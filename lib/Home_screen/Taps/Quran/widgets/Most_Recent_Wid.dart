import 'package:flutter/material.dart';
import 'package:islami/Home_screen/Taps/Quran/widgets/Most_Recent_Itme.dart';
import 'package:islami/cash/Shared_Pref.dart';
import 'package:islami/providers/Most_Recent_Provider.dart';
import 'package:provider/provider.dart';

class MostRecentWid extends StatefulWidget {
  const MostRecentWid({super.key});

  @override
  State<MostRecentWid> createState() => _MostRecentWidState();
}

class _MostRecentWidState extends State<MostRecentWid> {
  late MostRecentProvider mostRecentProvider;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => mostRecentProvider.getRecentData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mostRecentProvider = Provider.of<MostRecentProvider>(context);

    return Visibility(
      visible: mostRecentProvider.mostRecent.isNotEmpty,
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          Text(
            "Most Recently",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return MostRecent(index: mostRecentProvider.mostRecent[index]);
              },
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemCount: mostRecentProvider.mostRecent.length,
            ),
          ),
        ],
      ),
    );
  }
}
