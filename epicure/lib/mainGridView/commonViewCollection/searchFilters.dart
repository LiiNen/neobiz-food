import 'package:flutter/material.dart';

List<String> menuFilterList = ['한식', '중식', '일식', '양식', '에스닉', '퓨전', '뷔페', '디저트', '펍&바'];

menuFilter(BuildContext context, List targetList, List checkedMenu) async {
  print(targetList.length);
  await showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            content: Center(child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 18),
                  height: 200,
                  child: GridView.count(
                    crossAxisCount: 3,
                    children: List.generate(menuFilterList.length, (index) {
                      return Container(
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            setState(() {
                              checkedMenu.indexOf(index) != -1 ? checkedMenu.remove(index) : checkedMenu.add(index);
                              print(checkedMenu);
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(menuFilterList[index]),
                              Icon(checkedMenu.indexOf(index) != -1 ? Icons.radio_button_checked : Icons.radio_button_off)
                            ]
                          )
                        ),
                      );
                    }),
                  ),
                ),
                TextButton(
                  onPressed: () { Navigator.pop(context, checkedMenu); },
                  child: Text('적용'),
                )
              ]
            ))
          );
        }
      );
    }
  );
  return checkedMenu;
}

regionFilter(BuildContext context, List targetList, List checkedMenu) async {

}

themeFilter(BuildContext context, List targetList, List checkedMenu) async {

}

setFilteredItemList(List targetList, List checkedRegion, List checkedMenu, List checkedTheme) {
  var _filteredItemList = [];

  return _filteredItemList;
}