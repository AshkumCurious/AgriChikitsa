import 'package:flutter/material.dart';

import '../../res/color.dart';

class BaseText extends StatelessWidget {
  final String title;
  final TextStyle style;
  const BaseText({super.key, required this.title, required this.style});

  @override
  Widget build(BuildContext context) {
    return (Text(
      title,
      style: style,
    ));
  }
}

class HeadingText extends StatelessWidget {
  final String title;
  const HeadingText(this.title, {super.key});
  @override
  Widget build(BuildContext context) {
    return BaseText(
      title: title,
      style: const TextStyle(
          color: AppColor.extraDark, fontWeight: FontWeight.w500, fontSize: 24),
    );
  }
}

class SubHeadingText extends StatelessWidget {
  final String title;
  const SubHeadingText(this.title, {super.key});
  @override
  Widget build(BuildContext context) {
    return BaseText(
      title: title,
      style: const TextStyle(
          color: AppColor.extraDark, fontWeight: FontWeight.w400, fontSize: 18),
    );
  }
}

class ParagraphHeadingText extends StatelessWidget {
  final String title;
  const ParagraphHeadingText(this.title, {super.key});
  @override
  Widget build(BuildContext context) {
    return BaseText(
      title: title,
      style: const TextStyle(
          color: AppColor.extraDark, fontWeight: FontWeight.w500, fontSize: 16),
    );
  }
}

class ParagraphText extends StatelessWidget {
  final String title;
  const ParagraphText(this.title, {super.key});
  @override
  Widget build(BuildContext context) {
    return BaseText(
      title: title,
      style: const TextStyle(
          color: AppColor.extraDark, fontWeight: FontWeight.w400, fontSize: 16),
    );
  }
}
