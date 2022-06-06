import 'package:flutter/material.dart';

import 'package:nl_web/core/style/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//////////////////branch 2
////// commit lan 2
class UiForgotPass extends StatefulWidget {
  const UiForgotPass({Key? key}) : super(key: key);

  @override
  State<UiForgotPass> createState() => _UiForgotPassState();
}

class _UiForgotPassState extends State<UiForgotPass> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1440, 926));
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/BG.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 160, horizontal: 0),
            child: Column(
              children: [
                Container(
                  width: 384,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              setTextTitle(textInput: "Thay đổi mật khẩu"),
                              const SizedBox(height: 8),
                              setMessage(
                                  textInput:
                                      'Mật khẩu của bạn đã hết hạn. Vui lòng đổi mật khẩu mới để bảo mật thông tin.'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            inputTextField(
                              detail: "Mật khẩu hiện tại",
                              controller: TextEditingController(),
                              activeAlert: false,
                              messageAlert: '',
                            ),
                            const SizedBox(height: 16),
                            inputTextField(
                              detail: "Mật khẩu mới",
                              controller: TextEditingController(),
                              activeAlert: true,
                              messageAlert:
                                  'Mật khẩu mới không được trùng với mật khẩu đã được sử dụng trong 5 lần gần nhất.',
                            ),
                            const SizedBox(height: 16),
                            inputTextField(
                                detail: "Nhập lại mật khẩu mới",
                                controller: TextEditingController(),
                                activeAlert: false,
                                messageAlert: ''),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            checkFormatPassword(
                                textCheck: "Tối thiểu 10 ký tự",
                                boolCheck: true),
                            checkFormatPassword(
                                textCheck: "Có ký tự số", boolCheck: true),
                            checkFormatPassword(
                                textCheck: "Có chữ hoa", boolCheck: true),
                            checkFormatPassword(
                                textCheck: "Có chữ thường", boolCheck: true),
                            checkFormatPassword(
                                textCheck: "Có ký tự đặc biệt",
                                boolCheck: true),
                            checkFormatPassword(
                                textCheck:
                                    "Không trùng với 5 mật khẩu gần đây.",
                                boolCheck: true),
                          ],
                        ),
                        const SizedBox(height: 28),
                        buttonChange(textTitle: 'Thay Đổi', funcition: null),
                        // const SizedBox(height: 8),
                        // buttonChangeAndCancel(
                        //     textTitleChange: 'Thay Đổi',
                        //     funcitionChange: null,
                        //     textTitleCancel: 'Hủy',
                        //     funcitionCancel: null),
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
    style: const TextStyle(
      fontSize: 20,
      fontFamily: mFontRoboto,
      color: AppColor.mCInk900,
    ),
  );
}

Widget setMessage({required String textInput}) {
  return DecoratedBox(
    decoration: const BoxDecoration(
      color: AppColor.mCRed50,
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          textInput,
          style: const TextStyle(
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
    {required String detail,
    required TextEditingController controller,
    required bool activeAlert,
    required String messageAlert}) {
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
        ),
      ),
      const SizedBox(height: 4),
      SizedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(6.0),
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 304,
                  height: 44,
                  child: TextFormField(
                    controller: controller,
                    style: TextStyle(color: AppColor.mCInk900, fontSize: 16),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColor.mCInk50,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: activeAlert
                              ? AppColor.mCRed400
                              : AppColor.mCInk300,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor.mCBlue300,
                        ),
                      ),
                      hintText: '• • • • • • • • • • •',
                      hintStyle:
                          TextStyle(fontSize: 16, color: AppColor.mCInk900),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      suffixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: IconButton(
                          iconSize: 24,
                          icon: Icon(Icons.visibility_outlined),
                          onPressed: null,
                        ),
                      ),
                    ),
                  ),
                ),
                showAlertInTextField(
                    activeAlert: activeAlert, messageAlert: messageAlert),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget showAlertInTextField(
    {required bool activeAlert, required String messageAlert}) {
  if (activeAlert == false) {
    return Container();
  }
  return Column(
    children: [
      const SizedBox(height: 4),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.dangerous,
            color: AppColor.mCRed400,
            size: 14,
          ),
          const SizedBox(width: 4),
          Container(
            width: 284,
            child: Text(
              messageAlert,
              style: TextStyle(
                fontFamily: mFontRoboto,
                fontWeight: FontWeight.w400,
                fontSize: AppDimens.mFontSizeSmall,
                color: AppColor.mCRed400,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget checkFormatPassword({@required textCheck, @required boolCheck}) {
  return Row(
    children: [
      Align(
        alignment: Alignment.center,
        child: Container(
          height: 24,
          width: 24,
          child: Checkbox(
            activeColor: AppColor.mCGreen400,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)), // Rounded Checkbox
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
  );
}

Widget buttonChange({required textTitle, required funcition}) {
  return ElevatedButton(
    onPressed: () => {
      funcition,
    },
    child: Text(
      textTitle,
      style: const TextStyle(
          fontFamily: mFontRoboto,
          color: AppColor.mCWhite,
          fontSize: AppDimens.mFontSizeMedium),
    ),
    style: ElevatedButton.styleFrom(
        fixedSize: Size(304, 44), primary: AppColor.mCPrimary400),
  );
}

Widget buttonChangeAndCancel(
    {required textTitleChange,
    required funcitionChange,
    required textTitleCancel,
    required funcitionCancel}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ElevatedButton(
        onPressed: () => {
          funcitionChange,
        },
        child: Text(
          textTitleChange,
          style: TextStyle(
              fontFamily: mFontRoboto,
              color: AppColor.mCWhite,
              fontSize: AppDimens.mFontSizeMedium),
        ),
        style: ElevatedButton.styleFrom(
            fixedSize: Size(100, 44), primary: AppColor.mCPrimary400),
      ),
      const SizedBox(width: 4),
      ElevatedButton(
        onPressed: () => {
          funcitionCancel,
        },
        child: Text(
          textTitleCancel,
          style: TextStyle(
              fontFamily: mFontRoboto,
              color: AppColor.mCInk900,
              fontSize: AppDimens.mFontSizeMedium),
        ),
        style: ElevatedButton.styleFrom(
          fixedSize: Size(66, 44),
          primary: AppColor.mCInk300,
        ),
      ),
    ],
  );
}

//hhe
Widget a() {
  return Container();
}
