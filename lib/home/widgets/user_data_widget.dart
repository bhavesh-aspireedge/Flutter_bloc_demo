import 'package:bloc/theme/app_colors.dart';
import 'package:bloc/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class UserDataWidget extends StatelessWidget {
  final String name;
  final int id;
  final String phone;

  const UserDataWidget({
    super.key,
    required this.name,
    required this.id,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.all(16),
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: $name',
                style: AppTextStyle.nameStyle,
              ),
              const SizedBox(height: 8),
              Text('ID: $id'),
              const SizedBox(height: 8),
              Text('Address: $phone'),
            ],
          ),
        ),
      ),
    );
  }
}
