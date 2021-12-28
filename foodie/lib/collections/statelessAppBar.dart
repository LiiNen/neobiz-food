import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/mainNavView/homeView/homeDrawer.dart';

import 'decorationContainers.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  DefaultAppBar({required this.title, this.elevation=true, this.back=true}) : preferredSize = Size.fromHeight(56.0);
  @override
  final Size preferredSize;
  final String title;
  final bool elevation;
  final bool back;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xffffffff),
      centerTitle: true,
      shadowColor: Colors.white,
      elevation: elevation ? 2.0 : 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          back ? GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 16, height: 32,
              child: Center(child: SvgPicture.asset('asset/svgIcon/icoBack.svg', width: 8, height: 16,))
            )
          ) : Container(width: 16),
          Text(title, style: textStyle(color: Colors.black, weight: 700, size: 16.0),),
          Container(width: 16)
        ]
      ),
    );
  }
}

class HomeViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeViewAppBar({this.title}) : preferredSize = Size.fromHeight(56.0);

  final String? title;
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2.0,
      shadowColor: Colors.white,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 29),
          Image.asset('asset/image/logo.png', width: 113),
          Container(),
        ]
      ),
      actions: [
        IconButton(
          onPressed: () { navigatorPush(context: context, widget: HomeDrawer()); },
          icon: Image.asset('asset/image/menuPlusIcon.png', width: 29, height: 29),
        )
      ]
    );
  }
}

class SearchCategoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  SearchCategoryAppBar() : preferredSize = Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: serviceColor(),
      centerTitle: true,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 16, height: 32,
              child: Center(child: SvgPicture.asset('asset/svgIcon/icoBackWhite.svg', width: 8, height: 16,))
            )
          ),
          Image.asset('asset/image/logoSplash.png', width: 113),
          Container(width: 16)
        ]
      ),
    );
  }
}

class SearchTextAppBar extends StatefulWidget implements PreferredSizeWidget {
  SearchTextAppBar({required TextEditingController this.controller, required dynamic this.callback}) : preferredSize = Size.fromHeight(56.0);
  @override
  final Size preferredSize;
  final TextEditingController controller;
  final dynamic callback;

  @override
  State<SearchTextAppBar> createState() => _SearchTextAppBar();
}
class _SearchTextAppBar extends State<SearchTextAppBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leadingWidth: 0,
      automaticallyImplyLeading: false,
      centerTitle: false,
      titleSpacing: 0,
      title: Container(
        width: MediaQuery.of(context).size.width, height: 35,
        margin: EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: const Color(0xffeaeaea), width: 1),
          color: const Color(0xffffffff)
        ),
        child: TextField(
            controller: widget.controller,
            autofocus: true,
            textAlignVertical: TextAlignVertical.center,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              isCollapsed: true,
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(color: Color(0xffeaeaea)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(color: Color(0xffeaeaea)),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(color: Color(0xffeaeaea)),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 16, right: 12),
                child: Tab(
                  iconMargin: EdgeInsets.all(0),
                  icon: Image.asset('asset/image/icoSearch.png', width: 14.5, fit: BoxFit.fill),
                )
              ),
              prefixIconConstraints: BoxConstraints(
                maxWidth: 42.5
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.only(left: 6, right: 10),
                child: Tab(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      widget.callback(widget.controller.text);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 6),
                      child: Text('검색', style: textStyle(color: Color(0xff6c6c6c), weight: 500, size: 13.0), textAlign: TextAlign.right,)
                      // child: Image.asset('asset/image/icoSearch.png')
                    )
                  )
                )
              ),
              suffixIconConstraints: BoxConstraints(
                maxWidth: 52
              ),
              hintText: '키워드를 입력해주세요',
              hintStyle: textStyle(color: Color(0xff8e8e8e), weight: 400, size: 13.0),
            ),
            style: textStyle(weight: 600, size: 13.0),
            onChanged: (value) {setState((){});},
            onSubmitted: (value) {
              widget.callback(value);
            },
          ),
        )
    );
  }
}
