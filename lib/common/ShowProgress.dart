import 'package:flutter/material.dart';

class ShowProgress extends StatefulWidget {
  @override
  _ShowProgressState createState() => _ShowProgressState();
}

class _ShowProgressState extends State<ShowProgress> {
  @override
  Widget build(BuildContext context) {
    return _showProgress();
  }

  Widget _showProgress() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: SizedBox(
                width: 20.0, height: 20.0, child: CircularProgressIndicator()),
          ),
          Center(
            child: Text(
              "Fetching data..",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
