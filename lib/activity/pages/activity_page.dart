import 'package:flutter/foundation.dart';
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
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Container(
          child: const SizedBox(height: 80),
          // AD section
        ),
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
        Container(
          height: 451,
          color: Colors.blue,
          child: Column(
            children: <Widget>[
              ActivityTuple(),
            ],
          ),
        ),
        Container(
          height: 48,
          color: Colors.black,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 12,
              ),
              DropdownButton<String>(
                value: dropdownValue,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: const [
                  DropdownMenuItem<String>(
                    value: 'One',
                    child: Text('전체'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Two',
                    child: Text('제목'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Three',
                    child: Text('작성자'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Four',
                    child: Text('제목+작성자'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Five',
                    child: Text('내용'),
                  ),
                ],
                dropdownColor: Colors.black,
              ),
              const SizedBox(width: 12),
              const SizedBox(
                height: 24,
                width: 200,
                child: TextField(
                  textAlignVertical: TextAlignVertical.bottom,
                  cursorHeight: 12,
                  cursorWidth: 1,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    prefixIconColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    hintText: 'search',
                  ),
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 60,
                height: 24,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    minimumSize: const Size(60, 24),
                    padding: EdgeInsets.zero,
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0.0)),
                    ),
                  ),
                  child: const Text(
                    '검색',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
