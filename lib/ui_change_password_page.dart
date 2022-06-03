import 'package:flutter/material.dart';

import 'core/style/style.dart';
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
            padding: EdgeInsets.symmetric(vertical: 160.w, horizontal: 0),
            child: Column(
              children: [
                Container(
                  // width: 384,
                  // height: 700,
                  width: ScreenUtil().setWidth(384),
                  // height: ScreenUtil().setHeight(700),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text("w: $w"),
                              // Text("h: $h"),
                              setTextTitle(textInput: "Thay đổi mật khẩu"),
                              setMessage(
                                  textInput:
                                      'Mật khẩu của bạn đã hết hạn. Vui lòng đổi mật khẩu mới để bảo mật thông tin.'),
                            ],
                          ),
                        ),
                        SizedBox(height: 24.h),
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
                              SizedBox(height: 16.h),
                              inputTextField(
                                  detail: "Mật khẩu mới",
                                  controller: TextEditingController()),
                              SizedBox(height: 16.h),
                              inputTextField(
                                detail: "Nhập lại mật khẩu mới",
                                controller: TextEditingController(),
                              ),
                              //////////
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),
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
                        SizedBox(height: 28.h),
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
      fontSize: 20.sp,
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
      // padding: EdgeInsets.all(16.0),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          textInput,
          style: TextStyle(
            fontFamily: mFontRoboto,
            fontWeight: FontWeight.w400,
            fontSize: AppDimens.mFontSizeNormal.sp,
            color: Color(0xff98272B),
          ),
        ),
      ),
    ),
  );
}

Widget inputTextField(
    {required String detail, required TextEditingController controller}) {
  bool _isObscure = true;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        detail,
        style: TextStyle(
          color: AppColor.mCInk700,
          fontFamily: mFontRoboto,
          fontWeight: FontWeight.w400,
          fontSize: AppDimens.mFontSizeNormal.sp,
          // height: AppDimens.mLineHeightXSmall,
        ),
      ),
      SizedBox(height: 4.h),
      SizedBox(
        width: 304.w,
        height: 44.h,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColor.mCInk50,
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
          child: Align(
            alignment: Alignment.center,
            child: TextFormField(
              // obscureText: _isObscure,
              // textAlign: TextAlign.center,
              controller: controller,
              obscureText: _isObscure,
              style: TextStyle(color: Colors.red, fontSize: 16.sp),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '• • • • • • • • • • •',
                hintStyle: TextStyle(fontSize: 16.sp, color: AppColor.mCInk900),
                contentPadding:
                    // EdgeInsets.only(left: 12, right: 44, top: 12, bottom: 12),
                    EdgeInsets.symmetric(horizontal: 12.h),
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: SizedBox(
                    // width: 20.w,
                    // height: 24.h,
                    child: Icon(
                      size: 24.r,
                      Icons.visibility_outlined,
                    ),
                  ),
                ),
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
            child: Container(
              // height: 1.h,
              // width: 1.w,
              // size
              child: Transform.scale(
                scale: 1.r,
                child: Checkbox(
                  // splashRadius: 10,
                  activeColor: AppColor.mCGreen400,

                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10)), // Rounded Checkbox
                  // checkColor: Colors.red,
                  value: boolCheck,
                  onChanged: (bool? value) {},
                ),
              ),
            ),
          ),
          SizedBox(width: 4.w),
          Align(
            alignment: Alignment.center,
            child: Text(
              textCheck,
              style: TextStyle(
                  fontFamily: mFontRoboto,
                  fontWeight: FontWeight.w400,
                  fontSize: AppDimens.mFontSizeNormal.sp),
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
    child: Text(
      textTitle,
      style: TextStyle(
          fontFamily: mFontRoboto,
          color: AppColor.mCWhite,
          fontSize: AppDimens.mFontSizeMedium.sp),
    ),
    style: ElevatedButton.styleFrom(
        fixedSize: Size(304.w, 44.h), primary: AppColor.mCPrimary400),
  );
}
