
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:smart_class/core/theme/app_dimension.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class CertificateUploadSection extends StatelessWidget {
  final List<File> files;
  final Function(File) onAdd;
  final Function(File) onRemove;

  const CertificateUploadSection({
    super.key,
    required this.files,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final titleColor = isDarkMode ? AppColors.darkText1 : AppColors.lightText1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Certificates",
            style: AppTypography.labelLarge.copyWith(color: titleColor),
          ),
        ),

        const SizedBox(height: AppDimensions.sp3),

        /// Upload Button
        GestureDetector(
          onTap: () => _pickFile(context),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white24),
            ),
            child: Column(
              children: const [
                Icon(Icons.upload_file, size: 40),
                SizedBox(height: 8),
                Text("Upload Certificate (PDF / Image)"),
              ],
            ),
          ),
        ),

        const SizedBox(height: AppDimensions.sp4),

        /// Files List
        ...files.map(
          (file) => Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  _getIcon(file),
                  color: Colors.blue,
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Text(
                    file.path.split('/').last,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => onRemove(file),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// 📎 Pick File
  Future<void> _pickFile(BuildContext context) async {
    final result = await FilePicker.pickFiles(
  type: FileType.custom,
  allowedExtensions: ['pdf', 'jpg', 'png', 'jpeg'],
);

    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      onAdd(file);
    }
  }

  /// 📄 Icon حسب نوع الملف
  IconData _getIcon(File file) {
    final ext = file.path.split('.').last.toLowerCase();

    if (ext == 'pdf') return Icons.picture_as_pdf;
    return Icons.image;
  }
}