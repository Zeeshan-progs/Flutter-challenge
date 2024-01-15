import 'package:flutter/material.dart';
import 'package:flutter_challenge/widget/light_app_bar.dart';

class Material3Design extends StatefulWidget {
  const Material3Design({super.key});

  @override
  State<Material3Design> createState() => _Material3DesignState();
}

class _Material3DesignState extends State<Material3Design> {
  bool canSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Material 3 floating action button [expanded]
      floatingActionButton: FloatingActionButton.extended(
        label: const Text(
          "Add",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {},
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),

      /// Material 3 floating action button [Large]

/**  floatingActionButton: 
 FloatingActionButton.large(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
*/

      /// Material 3 floating action button [small]

/**  floatingActionButton: 
 FloatingActionButton.small(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
*/

      /// Material 3 floating action button normally
      /**  floatingActionButton: 
 FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
*/

      appBar: LightAppBar(title: "Material 3 Design"),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Badge(
            largeSize: 40,
            isLabelVisible: true,
            label: Text("label"),
            backgroundColor: Color.fromARGB(255, 69, 52, 2),
            offset: Offset(14, 15),
            textColor: Colors.white,
            textStyle: TextStyle(fontSize: 20),
          ),

          // Whats new in modal bottom sheet
          TextButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    useSafeArea: true,
                    isScrollControlled: true,
                    enableDrag: false,
                    elevation: 4,
                    builder: (context) {
                      return SizedBox.expand(
                        child: ListView(
                          children: [
                            ...List.generate(59, (index) => Text("Item $index"))
                          ],
                        ),
                      );
                    });
              },
              child: const Text("Show Modal bottom sheet")),

          // Whats new in show dialog
          TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return const Dialog.fullscreen(
                        // use for web
                        child: Text("Dialog"),
                      );
                    });
              },
              child: const Text("Show Dialog")),
        ],
      ),
    );
  }
}
