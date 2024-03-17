import 'package:bpm_turner/feature/player/view/player_page.dart';
import 'package:flutter/material.dart';

import 'editor/view/editor_page.dart';

class SheetDrawer extends StatelessWidget {
  const SheetDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('BPM Turner'),
        ),
        ListTile(
          title: const Text('Player'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const PlayerPage()),
            );
          },
        ),
        ListTile(
          title: const Text('Editor'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EditorPage()),
            );
          },
        ),
      ],
    ));
  }
}
