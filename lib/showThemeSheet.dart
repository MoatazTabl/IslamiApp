import 'package:flutter/material.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

class ShowThemeSheet extends StatelessWidget {
  const ShowThemeSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              provider.changeTheme(ThemeMode.light);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Light",
                ),
                Icon(Icons.done),
              ],
            ),
          ),
          InkWell(
            onTap: (){
              provider.changeTheme(ThemeMode.dark);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark",
                ),
                Icon(Icons.done),
              ],
            ),
          ),
          InkWell(
            onTap: (){
              provider.changeTheme(ThemeMode.system);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "System",
                ),
                Icon(Icons.done),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
