import 'package:flutter/material.dart';
import 'package:nl_web/core/base/presentation/components/navigation_model.dart';
import 'package:nl_web/core/resources/images_path.dart';
import 'package:nl_web/core/style/style.dart';
import 'package:nl_web/core/utility/app_responsive.dart';

class NavigationOne extends StatefulWidget {
  final User user;
  final List<String> dataList;
  final List<String> infoList;
  const NavigationOne({
    Key? key,
    required this.user,
    required this.dataList,
    required this.infoList,
  }) : super(key: key);

  @override
  State<NavigationOne> createState() => _NavigationOneState();
}

class _NavigationOneState extends State<NavigationOne> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56,
          color: AppColor.mCSecondary900,
          child: Row(
            children: [
              //  if (Responsive.isDesktop(context))
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Image.asset(ImagesPath.logoNavigation,
                          height: AppDimens.mSpaceMedium, width: AppDimens.mSpaceNormal28, fit: BoxFit.fitHeight),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              if (AppResponsive.isDesktop(context))
                Expanded(
                  flex: 15,
                  child: SizedBox(
                    height: 56,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.dataList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TextButton(
                          child: Text(
                            widget.dataList[index].toString(),
                            style: AppStyles.mSTH400
                                .copyWith(color: AppColor.mCWhite),
                          ),
                          onPressed: () {},
                        );
                      },
                      separatorBuilder: (BuildContext context, _) => SizedBox(
                        width: AppDimens.mSpaceMedium,
                      ),
                    ),
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
                      color: AppColor.mCSecondary500,
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
                        style:
                            AppStyles.mSTH700.copyWith(color: AppColor.mCWhite),
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
