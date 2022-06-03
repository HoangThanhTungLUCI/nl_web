import 'package:flutter/material.dart';

import 'core/style/style.dart';

class UiForgotPass extends StatefulWidget {
  const UiForgotPass({Key? key}) : super(key: key);

  @override
  State<UiForgotPass> createState() => _UiForgotPassState();
}

class _UiForgotPassState extends State<UiForgotPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        width: double.infinity,
        height: double.infinity,
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/BG.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          // clipBehavior: Clip.hardEdge,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 160, horizontal: 0),
            child: Column(
              // padding: EdgeInsets.symmetric(vertical: 160),
              // crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Container(
                  width: 384,
                  // height: 700,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              setTextTitle(textInput: "Thay đổi mật khẩu"),
                              setMessage(
                                  textInput:
                                      'Mật khẩu của bạn đã hết hạn. Vui lòng đổi mật khẩu mới để bảo mật thông tin.'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          // width: 304,
                          // height: 236,

                          // color: Colors.red,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              inputTextField(
                                  detail: "Mật khẩu hiện tại",
                                  controller: TextEditingController()),
                              const SizedBox(height: 16),
                              inputTextField(
                                  detail: "Mật khẩu mới",
                                  controller: TextEditingController()),
                              const SizedBox(height: 16),
                              inputTextField(
                                detail: "Nhập lại mật khẩu mới",
                                controller: TextEditingController(),
                              ),
                              //////////
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          // width: 304,
                          // height: 120,
                          // color: Colors.cyan,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              checkFormatPassword(
                                  textCheck: "Tối thiểu 10 ký tự",
                                  boolCheck: true),
                              // SizedBox(height: 4),
                              checkFormatPassword(
                                  textCheck: "Có ký tự số", boolCheck: true),
                              // SizedBox(height: 4),
                              checkFormatPassword(
                                  textCheck: "Có chữ hoa", boolCheck: true),
                              // SizedBox(height: 4),
                              checkFormatPassword(
                                  textCheck: "Có chữ thường", boolCheck: true),
                              // SizedBox(height: 4),
                              checkFormatPassword(
                                  textCheck: "Có ký tự đặc biệt",
                                  boolCheck: true),
                              // SizedBox(height: 4),
                              checkFormatPassword(
                                  textCheck:
                                      "Không trùng với 5 mật khẩu gần đây.",
                                  boolCheck: true),
                            ],
                          ),
                        ),
                        const SizedBox(height: 28),
                        buttonLogin(textTitle: 'Thay Đổi', funcition: null),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget setTextTitle({required textInput}) {
  return Text(
    textInput,
    style: TextStyle(
      fontSize: 20,
      fontFamily: mFontRoboto,
      color: AppColor.mCInk900,
    ),
  );
}

Widget setMessage({required String textInput}) {
  return DecoratedBox(
    decoration: BoxDecoration(
      color: AppColor.mCRed50,
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          textInput,
          style: TextStyle(
            fontFamily: mFontRoboto,
            fontWeight: FontWeight.w400,
            fontSize: AppDimens.mFontSizeNormal,
            color: Color(0xff98272B),
          ),
        ),
      ),
    ),
  );
}

Widget inputTextField(
    {required String detail, required TextEditingController controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        detail,
        style: TextStyle(
          color: AppColor.mCInk700,
          fontFamily: mFontRoboto,
          fontWeight: FontWeight.w400,
          fontSize: AppDimens.mFontSizeNormal,
          // height: AppDimens.mLineHeightXSmall,
        ),
      ),
      const SizedBox(height: 4),
      SizedBox(
        width: 304,
        height: 44,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColor.mCInk50,
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
          child: TextField(
            // obscureText: _isObscure,
            // textAlign: TextAlign.center,
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '• • • • • • • • • • •',
              suffixIcon: Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  right: 12,
                ),
                child: Icon(Icons.visibility_outlined),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget checkFormatPassword({@required textCheck, @required boolCheck}) {
  return Container(
    // width: 304,
    // height: 24,
    // color: Colors.pink,
    child: Align(
      alignment: Alignment.center,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 24.0,
              width: 24.0,
              child: Checkbox(
                activeColor: AppColor.mCGreen400,

                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(50)), // Rounded Checkbox
                // checkColor: Colors.red,
                value: boolCheck,
                onChanged: (bool? value) {},
              ),
            ),
          ),
          const SizedBox(width: 4),
          Align(
            alignment: Alignment.center,
            child: Text(
              textCheck,
              style: TextStyle(
                  fontFamily: mFontRoboto,
                  fontWeight: FontWeight.w400,
                  fontSize: AppDimens.mFontSizeNormal),
            ),
          )
        ],
      ),
    ),
  );
}

Widget buttonLogin({required textTitle, required funcition}) {
  return ElevatedButton(
    onPressed: () => {
      funcition,
    },
    child: Text(textTitle),
    style: ElevatedButton.styleFrom(
        fixedSize: const Size(304, 44), primary: AppColor.mCPrimary400),
  );
}
