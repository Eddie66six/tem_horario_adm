import 'package:flutter/material.dart';
import 'package:tem_horario_adm/app/components/buttons/button_widget.dart';
import 'package:tem_horario_adm/app_theme.dart';

class SelectWorkplace extends StatefulWidget {
  @override
  _SelectWorkplaceState createState() => _SelectWorkplaceState();
}

class _SelectWorkplaceState extends State<SelectWorkplace> {
  var listWorkPlace = [
    "1",
    "2",
    "3"
  ];
  var selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: AppThemeData.to.defaultHorizontalMargin),
        child: Column(
          children: <Widget>[
            //appbar
            Expanded(
              child: ListView(
                children: List.generate(listWorkPlace.length, (index) {
                  return GestureDetector(
                    onTap: (){ 
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      color: selectedIndex == index ? Colors.grey : Colors.transparent,
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Icon(selectedIndex == index ? Icons.check:  Icons.compare_arrows)),
                          Text(listWorkPlace[index])
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            ButtonWidget(text: "Ok", callback: (){
              if(selectedIndex > -1)
                Navigator.pop(context, listWorkPlace[selectedIndex]);
            })
          ],
        ),
      ),
    );
  }
}