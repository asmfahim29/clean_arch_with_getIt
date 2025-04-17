import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_arch_demo/features/daily_news/domain/entities/article.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleTileWidget extends StatelessWidget {
  final ArticleEntity articleEntity;

  const ArticleTileWidget({
    super.key,
    required this.articleEntity,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding:
          const EdgeInsetsDirectional.only(start: 14, end: 14, bottom: 14, top: 14),
      height: size.height / 3.5,
      child: Row(
        children: [
          _buildImage(context),
          _buildTileAndDescription(),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CachedNetworkImage(
      imageUrl: articleEntity.urlToImage!,
      imageBuilder: (context, imageProvider) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Container(
            width: size.width / 3,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Container(
            width: size.width / 3,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
            ),
            child: const CupertinoActivityIndicator(),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Container(
            width: size.width / 3,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
            ),
            child: const Icon(Icons.error),
          ),
        ),
      ),
    );
  }

  Widget _buildTileAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              articleEntity.title!,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  articleEntity.description!,
                  maxLines: 2,
                ),
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.timeline_outlined,
                  size: 16,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  articleEntity.publishedAt!,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
