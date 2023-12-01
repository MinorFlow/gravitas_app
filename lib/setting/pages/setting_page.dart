import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
// ignore_for_file: prefer_const_constructors

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  bool isLogined = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SettingsList(
      lightTheme: SettingsThemeData(
        settingsListBackground: Colors.white,
        dividerColor: Colors.green,

      ),
      platform: DevicePlatform.android,
      sections: [
        CustomSettingsSection(
          child: CustomSettingsTile(
            child: Card(
              elevation: 2,
              margin: EdgeInsets.all(16),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 57.5,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(isLogined ? 'lib/setting/assets/sample_profile.jpeg' : 'lib/setting/assets/default_profile.png'),
                        radius: 52.5,
                      ),
                    ),
                    /*
                    ClipRRect(
                      borderRadius: BorderRadius.circular(105),
                      child: Image(
                        width: 105,
                        height: 105,
                        fit: BoxFit.fill,
                        image: AssetImage(isLogined ? 'lib/setting/assets/sample_profile.jpeg' : 'lib/setting/assets/default_profile.png')
                      ),
                    ),
                    */
                    SizedBox(width: 24,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(isLogined ? '닉네임일까?' : '로그인해주세요!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                            SizedBox(width: 8,),
                            Visibility(
                              visible: isLogined,
                              child: Icon(
                                Icons.check_circle_outline,
                                color: Colors.green,
                                size: 22
                              ),
                            )

                          ],
                        ),
                        Visibility(
                          visible: isLogined,
                          child: Text('계정생성: 2023.11.28', style: TextStyle(fontSize: 12)),
                        ),
                        SizedBox(height: 12,),
                        isLogined ? Row(
                          children: [
                            GestureDetector(
                              child: Text('프로필수정', style: TextStyle(decoration: TextDecoration.underline, fontSize: 13),),
                              onTap: () {

                              }
                            ),
                            SizedBox(width: 8,),
                            GestureDetector(
                              child: Text('정보수정', style: TextStyle(decoration: TextDecoration.underline, fontSize: 13),),
                              onTap: () {

                              }
                            ),
                            SizedBox(width: 8,),
                            GestureDetector(
                              child: Text('로그아웃', style: TextStyle(decoration: TextDecoration.underline, fontSize: 13),),
                              onTap: () {
                                setState(() {
                                  isLogined = false;
                                });
                              }
                            ),
                          ],
                        ) : Row(
                          children: [
                            GestureDetector(
                              child: Text('로그인', style: TextStyle(decoration: TextDecoration.underline, fontSize: 13),),
                              onTap: () {
                                setState(() {
                                  isLogined = true;
                                });
                              }
                            ),
                            SizedBox(width: 8,),
                            GestureDetector(
                              child: Text('회원가입', style: TextStyle(decoration: TextDecoration.underline, fontSize: 13),),
                              onTap: () {

                              }
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        SettingsSection(
          tiles: <SettingsTile>[
            if (isLogined) SettingsTile.navigation(
              leading: Icon(Icons.edit),
              title: Text('작성한 게시글'),
              value: Text('10개의 항목'),
              onPressed: (BuildContext context) {},
            ),
            if (isLogined) SettingsTile.navigation(
              leading: Icon(Icons.thumb_up),
              title: Text('추천한 게시글'),
              value: Text('10개의 항목'),
              onPressed: (BuildContext context) {},
            ),
            if (isLogined) SettingsTile.navigation(
              leading: Icon(Icons.bookmark),
              title: Text('북마크 게시글'),
              value: Text('10개의 항목'),
              onPressed: (BuildContext context) {},
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.settings),
              title: Text('환경 설정'),
              onPressed: (BuildContext context) {},
            ),
            if (isLogined) SettingsTile.navigation(
              leading: Icon(Icons.emoji_emotions),
              title: Text('이모티콘 관리'),
              onPressed: (BuildContext context) {},
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.help),
              title: Text('고객센터'),
              onPressed: (BuildContext context) {},
            ),
          ],
        ),
      ],
    );
  }
}
