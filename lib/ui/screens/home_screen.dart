import 'package:flutter/material.dart';
import '../screens/about_screen.dart';
import '../screens/simulator/simulator_screen.dart';
import '../screens/parameter_estimation/parameter_estimation_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // Content to display based on selection
    Widget contentWidget;
    switch (_selectedIndex) {
      case 0:
        contentWidget = const SimulatorScreen();
        break;
      case 1:
        contentWidget = const ParameterEstimationScreen();
        break;
      case 2:
        contentWidget = const AboutScreen();
        break;
      default:
        contentWidget = const Center(child: Text('Select a menu option'));
    }
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('DRMS'),
      ),
      body: Row(
        children: [
          // Fixed side navigation menu
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.play_circle_filled),
                label: Text('Simulator'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.tune),
                label: Text('Parameter Estimation'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.info_outline),
                label: Text('About'),
              ),
            ],
          ),
          
          // Vertical divider between menu and content
          const VerticalDivider(thickness: 1, width: 1),
          
          // Main content area
          Expanded(
            child: contentWidget,
          ),
        ],
      ),
    );
  }
}
