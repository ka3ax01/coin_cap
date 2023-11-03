import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  Map? rates;
  DetailPage({required this.rates});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: rates!.length,
            itemBuilder: (context, index) {
              final key = rates!.keys.elementAt(index);
              final value = rates![key];
              return ListTile(
                title: Text("$key: $value",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w300)),
              );
            }),
      ),
    );
  }
}
