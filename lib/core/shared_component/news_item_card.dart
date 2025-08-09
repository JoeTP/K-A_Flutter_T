
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khatibalamyfluttertask/core/config/color/app_colors.dart';

import '../utils/date_and_time_formatter.dart';

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
    this.imageUrl,
    required this.publishedAt,
    required this.sourceName,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String? formattedDate = dateAndTimeFormatter(publishedAt).first;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.surfaceTint.withAlpha(20),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onClick,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: imageUrl != null
                      ? Image.network(
                    imageUrl!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                      : Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey[300],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.titleMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Divider(height: 16),
                        Text(
                          description,
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(12),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Src: $sourceName",
                    style: Theme.of(context).textTheme.labelSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                  Text(
                    formattedDate,
                    style: Theme.of(context).textTheme.labelSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

