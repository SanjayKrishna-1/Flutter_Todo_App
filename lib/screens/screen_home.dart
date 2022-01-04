import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:todo_app/db/functions/db_function.dart';
import 'package:todo_app/screens/bottom_slide_up.dart';
import 'package:todo_app/screens/todo_list.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);
  final double tabBarHeight = 85;

  @override
  Widget build(BuildContext context) {
    getAllTodo();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Todo App",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.amber[800],
        ),
        body: SlidingUpPanel(
          minHeight: 75,
          maxHeight: 550,
          panelBuilder: (scrollController) => buildSlidingPanel(
            scrollController: scrollController,
          ),
          body:const TodoList(),
        ));
  }

  Widget buildSlidingPanel({
    required ScrollController scrollController,
  }) =>
      DefaultTabController(
        length: 1,
        child: Scaffold(
          // AppBar
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(tabBarHeight - 8),
            child: AppBar(
              title: buildDragIcon(),
              centerTitle: true,
              backgroundColor: Colors.white,
              bottom: const TabBar(
                tabs: [
                  Tab(
                    child: const Text(
                     "Add Todo",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ),

          // Login Section Body
          body: TabBarView(
            children: [
              SlidingPanel(scrollController: scrollController),
            
            ],
          ),
        ),
      );

    Widget buildDragIcon() => Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10)
      ),
      width: 52,
      height: 8
    );
}
