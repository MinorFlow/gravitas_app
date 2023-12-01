import 'package:flutter/material.dart';
import 'package:gravitas_app/activity/widgets/activity_tuple.dart';
import 'package:gravitas_app/activity/widgets/activity_dropdown.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Container(
          height: 48,
          color: Colors.black,
          child: Row(
            children: <Widget>[
              const SizedBox(
                width: 12,
              ),
              const Widget090(),
              const Expanded(
                child: SizedBox(width: double.maxFinite),
              ),
              IconButton(
                icon: const Icon(Icons.tune),
                color: Colors.white,
                iconSize: 24,
                onPressed: () {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        const Column(
          children: <Widget>[
            ActivityTuple(),
            ActivityTuple(),
            ActivityTuple(),
            ActivityTuple(),
            ActivityTuple(),
            ActivityTuple(),
            ActivityTuple(),
            ActivityTuple(),
          ],
        ),
      ],
    );
  }
}
