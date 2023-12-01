import 'package:flutter/material.dart';

// import 'package:gravitas_app/shop/images/Eternel.png'


class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

final bearItem = {
  "list": [
    {"https://picsum.photos/id/237/200/300"},
    {"https://picsum.photos/id/237/200/300"},
  ]
};





class _ShopPageState extends State<ShopPage>
    with AutomaticKeepAliveClientMixin {
// 캐러셀 슬라이드 설정(아직 하는중)



  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    // return const Column(
    //   children: [
    //     Text('Shop')
    //   ],
    // );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '스토어',
          ),
        ),
        body: Column(children: <Widget>[
          // 광고 컨테이너
          Container(
            width: 10000,
            height: 120,
            padding: EdgeInsets.only(top: 60),
            margin: EdgeInsets.only(bottom: 5),
            color: Colors.blueAccent,
            child: Center(
              child: Text('구독한 허브 광고',
                  style: TextStyle(fontSize: 35, color: Colors.white)),
            ),
          ),

          // 태그 부분 (캐러셀 추가)
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(
                // child: Text('#이오리  #블루아카이브  #인디게임  #클라이밍'),

                ),
            Text('#이오리',
                style: TextStyle(decoration: TextDecoration.underline)),
            SizedBox(width: 20),
            Text('#블루아카이브',
                style: TextStyle(decoration: TextDecoration.underline)),
            SizedBox(width: 20),
            Text('#인디게임',
                style: TextStyle(decoration: TextDecoration.underline)),
            SizedBox(width: 20),
            Text('#클라이밍',
                style: TextStyle(decoration: TextDecoration.underline)),
          ]),

          // Best items
          Container(
            margin: EdgeInsets.only(bottom: 5),
            padding: EdgeInsets.only(top: 20, right: 280),
            child: Text('Best items', style: TextStyle(fontSize: 20)),
          ),

          

          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Container(
              
              // padding: EdgeInsets.only(right: 100),
            ),

            
            Image.network(
                'https://picsum.photos/id/237/200/300',
                width: 150,
                height: 120,
            ),

            Image.network(
                'https://picsum.photos/id/237/200/300',
                width: 150,
                height: 120,
            ),
          ]),
          // 상품 진열 (캐러셀 슬라이드 적용)


          // 상품 진열
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 30),
            child: Text('방금 등록된 상품', style: TextStyle(fontSize: 20)),
          ),

          // 첫번째 줄
          Row(children: <Widget>[
            Container(
              margin: EdgeInsets.all(35),
            ),
            Image.network(
              'https://picsum.photos/id/237/200/300',
              width: 130,
              height: 100,
            ),
            Image.network(
              'https://picsum.photos/seed/picsum/200/300',
              width: 130,
              height: 100,
            ),
          ]),

          Container(
            margin: EdgeInsets.only(top: 20),
          ),

          // 두번째 줄
          Row(children: <Widget>[
            Container(
              margin: EdgeInsets.all(35),
            ),
            Image.network(
              'https://picsum.photos/seed/picsum/200/300',
              width: 130,
              height: 100,
            ),
            Image.network(
              'https://picsum.photos/200/300?grayscale',
              width: 130,
              height: 100,
            ),
          ]),




        ]),
      ),
    );
  }
}
