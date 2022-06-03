import 'package:flutter/material.dart';
import 'package:nl_web/core/base/presentation/components/navigation_model.dart';
import 'package:nl_web/core/resources/images_path.dart';
import 'package:nl_web/core/style/style.dart';
import 'package:nl_web/core/utility/app_responsive.dart';

class NavigationTwo extends StatefulWidget {

  final List<String> infoList;
  final User user;
  const NavigationTwo({
    Key? key,
    required this.infoList,required this.user,
  }) : super(key: key);

  @override
  State<NavigationTwo> createState() => _NavigationTwoState();
}

class _NavigationTwoState extends State<NavigationTwo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56,
          color: const Color(0xff07175B),
          child: Row(
            children: [
              //   if (Responsive.isDesktop(context))
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.home_outlined,
                          color: AppColor.mCWhite,
                          size: AppDimens.mIconNormal,
                        ))
                  ],
                ),
              ),
              if (AppResponsive.isDesktop(context))
                Expanded(
                  flex: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children:  [
                      Container(width: 280,
                        height: double.infinity  ,
                        color:const Color(0xff008688) ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(ImagesPath.waterPointLogo,height: AppDimens.mSpaceNormal,width: AppDimens.mSpaceNormal,),
                             Text("WATERPOINT",style:AppStyles.mSTL400.copyWith(color: AppColor.mCWhite),),
                            const SizedBox(width: 25,),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_drop_down,color: AppColor.mCWhite,)),
                          ],
                        ),),
                      Container(),
                    ],
                  ),
                ),

              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none_outlined,
                          color: AppColor.mCWhite,
                          size: AppDimens.mIconNormal,

                        )),
                    const VerticalDivider(
                      color: Color(0xff144372),
                      width: 1,
                      indent: 16,
                      endIndent: 16,
                      thickness: 1,
                    ),
                    InkWell(
                        child: Image.asset(widget.user.avatarUrl),
                        onTap: () {}),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        widget.user.name,
                        style: AppStyles.mSTH700.copyWith(color: AppColor.mCWhite),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: AppColor.mCWhite,
                          size: AppDimens.mIconSmall,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (!AppResponsive.isMobile(context))
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: AppDimens.mSpaceLarge,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.infoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TextButton(
                      child: Text(
                        widget.infoList[index].toString(),
                        style: AppStyles.mSTH400
                            .copyWith(color: AppColor.mCSecondary400),
                      ),
                      onPressed: () {},
                    );
                  },
                  separatorBuilder: (BuildContext context, _) => Center(
                    child: Text(
                      "/",
                      style: AppStyles.mSTH700.copyWith(color: AppColor.mCInk700),
                    ),
                  ),
                )),
          ],
        ),
      ],
    );
  }
}
