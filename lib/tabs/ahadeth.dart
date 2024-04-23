import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:islami/ahadeth_screen.dart';
import 'package:islami/my_themes.dart';
import 'package:islami/providers/ahadeth_provider.dart';
import 'package:provider/provider.dart';

class AhadethTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => AhadethProvider()..loadFile(),
      builder: (context, child) {
        var provider=Provider.of<AhadethProvider>(context);

        return SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/ahadeth_pic.png"),
              Divider(
                thickness: 3,
                color: Brightness.light==Theme.of(context).brightness?Theme.of(context).primaryColor:MyThemeData.yellowColor,
              ),
              Text(
                  "الأحاديث",
                  style: Theme.of(context).textTheme.bodyMedium
              ),
              Divider(
                thickness: 3,
                color: Brightness.light==Theme.of(context).brightness?Theme.of(context).primaryColor:MyThemeData.yellowColor,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AhadethScreen.routeName,arguments: provider.allAhadeth[index]);
                      },
                      child: Text(
                        provider.allAhadeth[index].hadethName,
                        textAlign: TextAlign.center,
                        style:Theme.of(context).textTheme.bodySmall,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    color: Theme.of(context).primaryColor,
                  ),
                  itemCount: provider.allAhadeth.length),
            ],
          ),
        );
      },

    );
  }
}
