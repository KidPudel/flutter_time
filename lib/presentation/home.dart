import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time/common/constants.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var constants = Constants.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter time"),
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: constants?.bakerMilkPink,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Click to discover characters"),
                  ElevatedButton(
                    onPressed: () {
                      _showSnackBar(context);
                    },
                    child: Text("Click"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context) {
    final snackBar = ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Navigate to character list"),
      ),
    );
  }
}
