import 'package:flutter/material.dart';

enum Tag { none, posting, commant, reply, notice }

class ActivityTuple extends StatefulWidget {
  const ActivityTuple({Key? key}) : super(key: key);

  @override
  State<ActivityTuple> createState() => _ActivityTupleState();
}

class _ActivityTupleState extends State<ActivityTuple> {
  String title = "";
  String planet = '';
  String content = "변수로 전달";
  int year = 0;
  int month = 0;
  int dat = 0;
  Tag postTag = Tag.none;

  bool isReply = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 68,
      padding: const EdgeInsets.only(right: 108),
      decoration: BoxDecoration(color: Colors.black),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 68,
            padding: const EdgeInsets.only(top: 22, left: 16, bottom: 22),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '내용내용내용내용',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Kaisei HarunoUmi',
                      fontWeight: FontWeight.w700,
                      height: 1.0, // 조정된 줄 간격
                      letterSpacing: -0.41,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          '블루 아카이브',
                          overflow:
                              TextOverflow.ellipsis, // 길이가 초과될 경우 생략 후 점 표시
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Kaisei HarunoUmi',
                            fontWeight: FontWeight.w400,
                            height: 1.0, // 조정된 줄 간격
                            letterSpacing: -0.41,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '2023.10.09',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Kaisei HarunoUmi',
                            fontWeight: FontWeight.w400,
                            height: 1.0, // 조정된 줄 간격
                            letterSpacing: -0.41,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(width: double.maxFinite),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '댓글댓글댓글',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Kaisei HarunoUmi',
                      fontWeight: FontWeight.w400,
                      height: 1.0, // 조정된 줄 간격
                      letterSpacing: -0.41,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
