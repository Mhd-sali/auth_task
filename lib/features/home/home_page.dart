import 'package:contactfirestore/features/authentication/view/widgets/bottom_navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navBarIndex = useState(0);
    final pageController = PageController();
    return Scaffold(
        body: PageView(
          onPageChanged: (value) {
            navBarIndex.value = value;
          },
          controller: pageController,
          children: const [
            Center(child: Text('Home')),
            Center(child: Text('All Users')),
            Center(child: Text('Chat')),
            Center(child: Text('Profile')),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  offset: Offset(2, 2),
                  spreadRadius: -2,
                  color: Color.fromARGB(68, 0, 0, 0),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: BottomAppBar(
                shape: const AutomaticNotchedShape(
                  RoundedRectangleBorder(),
                  StadiumBorder(),
                ),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(4, (index) {
                    return NavBarItem(
                      icon: [
                        Icons.home,
                        Icons.group,
                        Icons.chat_bubble_outline,
                        Icons.person,
                      ][index],
                      isSelected: navBarIndex.value == index,
                      onPressed: () {
                        pageController.jumpToPage(index);
                      },
                      selectedColor: Colors.teal,
                      unselectedColor: Colors.grey,
                    );
                  }),
                ),
              ),
            ),
          ),
        ));
  }
}
