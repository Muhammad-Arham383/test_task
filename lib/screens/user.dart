import 'package:flutter/material.dart';
import 'package:test_task/widgets/user_tile.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.03,
            ),
            child: FittedBox(
              child: Text(
                'Mitt konto',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        UserTileWidget(),
        SizedBox(height: height * 0.05),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.08, vertical: height * 0.02),
          child: Row(
            children: [
              Icon(Icons.settings_outlined),
              SizedBox(
                width: width * 0.04,
              ),
              Text('Kontoinstallningar')
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.08, vertical: height * 0.02),
          child: Row(
            children: [
              Icon(Icons.payments_outlined),
              SizedBox(
                width: width * 0.04,
              ),
              Text('Mina betalmetoder')
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.08, vertical: height * 0.02),
          child: Row(
            children: [
              Icon(Icons.support),
              SizedBox(
                width: width * 0.04,
              ),
              Text('Support')
            ],
          ),
        ),
      ],
    );
  }
}
