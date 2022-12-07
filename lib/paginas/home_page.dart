import 'package:flutter/material.dart';
import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:myquestlog/paginas/paginaCabral.dart';
import 'package:myquestlog/paginas/paginaJuliana.dart';
import 'package:myquestlog/paginas/paginaVito.dart';
import 'package:myquestlog/paginas/user_page.dart';
import 'pagina_configuracao.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [
          UserPage(),
          PageJuliana(),
          PaginaCabral(),
        ],
      ),
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        selectedColor: Colors.white,
        unSelectedColor: const Color(0xFFC99F0D),
        backgroundColor: const Color(0xFF606060),
        currentIndex: _selectedIndex,
        selectedIconSize: 20,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            pageController.jumpToPage(index);
          });
        },
        enableLineIndicator: true,
        lineIndicatorWidth: 3,
        indicatorType: IndicatorType.Top,
        customBottomBarItems: [
          CustomBottomBarItems(
            icon: Icons.home,
            label: 'Home',
          ),
          CustomBottomBarItems(
            icon: Icons.list,
            label: 'Terefas',
          ),
          CustomBottomBarItems(
            label: 'Usuário',
            icon: Icons.account_circle,
          ),
        ],
      ),
    );
  }
}
