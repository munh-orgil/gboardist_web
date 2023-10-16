import 'package:flutter/material.dart';

class AppConnector extends StatefulWidget {
  const AppConnector({super.key});

  @override
  State<AppConnector> createState() => _AppConnectorState();
}

class _AppConnectorState extends State<AppConnector> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as String;
    final param = Uri.parse(args).queryParameters['param'];
    return Container(
      color: Colors.blue,
      child: Text("Hello AppConnector $param"),
    );
  }
}
