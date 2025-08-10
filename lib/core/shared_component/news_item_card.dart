import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khatibalamyfluttertask/core/config/theme/app_text_styles.dart';
import 'package:khatibalamyfluttertask/core/constants/assets.dart';
import 'package:khatibalamyfluttertask/core/utils/extensions/clipping.dart';
import 'package:khatibalamyfluttertask/core/utils/extensions/easy_sizing.dart';

import 'network_image.dart';

class NewsItemCard extends StatelessWidget {
  final String title;
  final String description;
  final String? imageUrl;
  final String publishedAt;
  final String sourceName;
  final VoidCallback onClick;

  const NewsItemCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.publishedAt,
    required this.sourceName,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.surfaceTint.withAlpha(50),
              blurRadius: 8.r,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.r),
          onTap: onClick,
          child: Column(
            children: [
              Row(
                children: [
                  imageUrl != null
                      ? EasyNetworkImage(
                        imageUrl!,
                        cacheSize: 100,
                      ).clipOnly(topLeft: 12.r).size(100.h, 100.w)
                      : Image.asset(Assets.Noimage, fit:  BoxFit.cover,).size(100.h, 100.w),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 16.h,
                            child: Text(
                              title,
                              style: AppTextStyles.titleStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Divider(height: 16.h),
                          Text(
                            description,
                            style: AppTextStyles.descriptionStyle,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(12.r),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Src: $sourceName",
                        style: AppTextStyles.dateTimeStyle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      publishedAt,
                      style: AppTextStyles.dateTimeStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
