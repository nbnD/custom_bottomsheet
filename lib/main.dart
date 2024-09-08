import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  final Color primaryColor = const Color(0xFF042b59);
  final iconsColor = Colors.orange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Bottom Sheet'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              isDismissible: false,   //restricts bottomsheet to close when touched outside bottomsheet
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              builder: (_) => _buildBottomSheetContent(context),
            );
          },
          child: const Text('Show Bottom Sheet'),
        ),
      ),
    );
  }

  Widget _buildBottomSheetContent(BuildContext context) {
    return Wrap(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: primaryColor, // Main background color
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                border: const Border(
                  top: BorderSide(
                    color: Colors.white, // The color of the border
                    width: 10.0, // The width of the border
                    style: BorderStyle.solid, // The style of the border (solid)
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                   Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child:const Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Spacing for the avatar
                  // List of items
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.edit, color: iconsColor),
                    ),
                    title: const Text(
                      'Edit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.share, color: iconsColor),
                    ),
                    title: const Text(
                      'Share',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -40, // Adjust position of the avatar
              left: MediaQuery.of(context).size.width / 2 -
                  40, // Center the avatar
              child: CircleAvatar(
                radius: 40,
                backgroundColor: iconsColor,
                child: CircleAvatar(
                    radius: 35,
                    backgroundColor: const Color(0xFF042b59),
                    child: Image.asset("assets/logo.png")),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: CustomBottomSheet(),
  ));
}
