import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({Key? key}) : super(key: key);

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int index=0;
  List<String> doaa = [
    "سبحان الله",
    "الحمد لله",
    "الله اكبر",
    "لا إله إلا الله وحده لا شريك له,له الملك والحمد وهو علي كل شيئ قدير"
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/Sebha_pic.png",
            ),
          ),
          Text("عدد التسبيحات",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),),
          ElevatedButton(
            onPressed: () {
              counter++;
              changeState(counter);

            },
            child: Text("$counter"),
          ),
          Text(doaa[index]),
        ],
      ),
    );
  }

  void changeState(int num) {
    if (num > 33) {
      counter = 0;
      index++;
    }
    if(index==3){
      
      index=0;
    }
    setState(() {

    });

  }
}
