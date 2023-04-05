import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/common/app_textstyles.dart';
import 'package:bt_movie_app/common/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HelloBar extends StatelessWidget {
  const HelloBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            style: AppTextStyles.whiteS18,
            children: const [
              TextSpan(text: 'Hello, '),
              TextSpan(
                text: 'Tuấn Đờ Quy!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SvgPicture.asset(
          AppVectors.notiVector,
          width: 16,
          height: 20,
          colorFilter: ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
      ],
    );
  }
}
