import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../../../data/services/receipt_scanner_service.dart';
import '../../common/widgets/widgets.dart';

/// Screen for scanning receipts and extracting transaction data
class ReceiptScannerScreen extends ConsumerStatefulWidget {
  const ReceiptScannerScreen({super.key});

  @override
  ConsumerState<ReceiptScannerScreen> createState() =>
      _ReceiptScannerScreenState();
}

class _ReceiptScannerScreenState extends ConsumerState<ReceiptScannerScreen> {
  @override
  Widget build(BuildContext context) {
    final scanState = ref.watch(receiptScannerViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Receipt'),
        actions: [
          if (scanState.result?.isSuccess == true)
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                ref.read(receiptScannerViewModelProvider.notifier).clearResult();
              },
              tooltip: 'Scan Another',
            ),
        ],
      ),
      body: scanState.isScanning
          ? const _ScanningView()
          : scanState.result?.isSuccess == true
              ? _ResultView(result: scanState.result!)
              : _InitialView(error: scanState.error),
    );
  }
}

/// Initial view with scan options
class _InitialView extends ConsumerWidget {
  const _InitialView({this.error});

  final String? error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Padding(
      padding: AppDimensions.screenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.receipt_long_outlined,
            size: 80,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(height: AppDimensions.spacingLg),
          Text(
            'Scan Your Receipt',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingSm),
          Text(
            'Take a photo of your receipt or select from gallery.\nWe\'ll automatically extract the transaction details.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          if (error != null) ...[
            const SizedBox(height: AppDimensions.spacingMd),
            Container(
              padding: const EdgeInsets.all(AppDimensions.spacingMd),
              decoration: BoxDecoration(
                color: theme.colorScheme.errorContainer,
                borderRadius: AppDimensions.borderRadiusMd,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.error_outline,
                    color: theme.colorScheme.error,
                  ),
                  const SizedBox(width: AppDimensions.spacingSm),
                  Expanded(
                    child: Text(
                      error!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onErrorContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: AppDimensions.spacingXl),
          Row(
            children: [
              Expanded(
                child: _ScanOptionCard(
                  icon: Icons.camera_alt_outlined,
                  label: 'Camera',
                  subtitle: 'Take a photo',
                  onTap: () {
                    ref
                        .read(receiptScannerViewModelProvider.notifier)
                        .scanFromCamera();
                  },
                ),
              ),
              const SizedBox(width: AppDimensions.spacingMd),
              Expanded(
                child: _ScanOptionCard(
                  icon: Icons.photo_library_outlined,
                  label: 'Gallery',
                  subtitle: 'Choose existing',
                  onTap: () {
                    ref
                        .read(receiptScannerViewModelProvider.notifier)
                        .scanFromGallery();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacingXl),
          // Tips section
          Container(
            padding: const EdgeInsets.all(AppDimensions.spacingMd),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: AppDimensions.borderRadiusMd,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      size: 20,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: AppDimensions.spacingXs),
                    Text(
                      'Tips for best results',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimensions.spacingSm),
                _TipItem(text: 'Place receipt on a flat, contrasting surface'),
                _TipItem(text: 'Ensure good lighting without shadows'),
                _TipItem(text: 'Keep the entire receipt in frame'),
                _TipItem(text: 'Hold camera steady to avoid blur'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TipItem extends StatelessWidget {
  const _TipItem({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScanOptionCard extends StatelessWidget {
  const _ScanOptionCard({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: AppDimensions.borderRadiusLg,
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.spacingLg),
        decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.outline),
          borderRadius: AppDimensions.borderRadiusLg,
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(AppDimensions.spacingMd),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 32,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Text(
              label,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              subtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Scanning in progress view
class _ScanningView extends StatelessWidget {
  const _ScanningView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: AppDimensions.spacingLg),
          Text(
            'Processing Receipt...',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: AppDimensions.spacingSm),
          Text(
            'Extracting transaction details',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

/// Result view showing extracted data
class _ResultView extends ConsumerStatefulWidget {
  const _ResultView({required this.result});

  final ReceiptScanResult result;

  @override
  ConsumerState<_ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends ConsumerState<_ResultView> {
  late TextEditingController _merchantController;
  late TextEditingController _amountController;
  late DateTime _date;
  late CategoryType _category;

  @override
  void initState() {
    super.initState();
    final data = widget.result.parsedData!;
    _merchantController = TextEditingController(text: data.merchantName ?? '');
    _amountController = TextEditingController(
      text: data.totalAmount?.toStringAsFixed(2) ?? '',
    );
    _date = data.date ?? DateTime.now();
    _category = data.suggestedCategory;
  }

  @override
  void dispose() {
    _merchantController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _createTransaction() {
    // Navigate to add transaction screen with pre-filled data
    context.push('/add-transaction', extra: {
      'merchantName': _merchantController.text,
      'amount': double.tryParse(_amountController.text),
      'date': _date,
      'category': _category,
      'receipt': widget.result,
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final data = widget.result.parsedData!;

    return SingleChildScrollView(
      padding: AppDimensions.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Receipt Image Preview
          if (widget.result.imagePath != null) ...[
            ClipRRect(
              borderRadius: AppDimensions.borderRadiusMd,
              child: Image.file(
                File(widget.result.imagePath!),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingMd),
          ],

          // Confidence indicator
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spacingMd,
              vertical: AppDimensions.spacingSm,
            ),
            decoration: BoxDecoration(
              color: _getConfidenceColor(data.confidence).withOpacity(0.1),
              borderRadius: AppDimensions.borderRadiusSm,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _getConfidenceIcon(data.confidence),
                  size: 16,
                  color: _getConfidenceColor(data.confidence),
                ),
                const SizedBox(width: AppDimensions.spacingXs),
                Text(
                  'Confidence: ${(data.confidence * 100).toInt()}%',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: _getConfidenceColor(data.confidence),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppDimensions.spacingLg),

          // Extracted Data Section
          Text(
            'Extracted Information',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingSm),
          Text(
            'Review and edit the extracted details before creating the transaction.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingMd),

          // Editable fields
          AppTextField(
            controller: _merchantController,
            label: 'Merchant',
            prefixIcon: Icons.store_outlined,
          ),
          const SizedBox(height: AppDimensions.spacingMd),

          AppMoneyField(
            controller: _amountController,
            label: 'Total Amount',
          ),
          const SizedBox(height: AppDimensions.spacingMd),

          // Date picker
          Text(
            'Date',
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(height: AppDimensions.spacingSm),
          InkWell(
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: _date,
                firstDate: DateTime(2020),
                lastDate: DateTime.now(),
              );
              if (picked != null) {
                setState(() => _date = picked);
              }
            },
            borderRadius: AppDimensions.borderRadiusMd,
            child: Container(
              padding: const EdgeInsets.all(AppDimensions.spacingMd),
              decoration: BoxDecoration(
                border: Border.all(color: theme.colorScheme.outline),
                borderRadius: AppDimensions.borderRadiusMd,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: AppDimensions.spacingSm),
                  Text(
                    '${_date.month}/${_date.day}/${_date.year}',
                    style: theme.textTheme.bodyLarge,
                  ),
                  const Spacer(),
                  Icon(
                    Icons.chevron_right,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.spacingMd),

          // Category selector
          Text(
            'Category (Suggested)',
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(height: AppDimensions.spacingSm),
          Wrap(
            spacing: AppDimensions.spacingSm,
            runSpacing: AppDimensions.spacingSm,
            children: CategoryType.values
                .where((c) => c.group != CategoryGroup.income)
                .take(10)
                .map((category) {
              final isSelected = category == _category;
              return FilterChip(
                selected: isSelected,
                label: Text(category.displayName),
                avatar: Icon(
                  category.iconData,
                  size: 18,
                  color: isSelected
                      ? theme.colorScheme.onPrimary
                      : category.color,
                ),
                onSelected: (_) => setState(() => _category = category),
              );
            }).toList(),
          ),

          // Line items if available
          if (data.items.isNotEmpty) ...[
            const SizedBox(height: AppDimensions.spacingLg),
            Text(
              'Line Items',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: theme.colorScheme.outline),
                borderRadius: AppDimensions.borderRadiusMd,
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.items.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final item = data.items[index];
                  return ListTile(
                    dense: true,
                    title: Text(
                      item.description,
                      style: theme.textTheme.bodyMedium,
                    ),
                    trailing: item.totalPrice != null
                        ? Text(
                            '\$${item.totalPrice!.toStringAsFixed(2)}',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : null,
                  );
                },
              ),
            ),
          ],

          // Tax and subtotal info
          if (data.subtotal != null || data.tax != null) ...[
            const SizedBox(height: AppDimensions.spacingMd),
            Container(
              padding: const EdgeInsets.all(AppDimensions.spacingMd),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: AppDimensions.borderRadiusMd,
              ),
              child: Column(
                children: [
                  if (data.subtotal != null)
                    _InfoRow(
                      label: 'Subtotal',
                      value: '\$${data.subtotal!.toStringAsFixed(2)}',
                    ),
                  if (data.tax != null) ...[
                    if (data.subtotal != null)
                      const SizedBox(height: AppDimensions.spacingXs),
                    _InfoRow(
                      label: 'Tax',
                      value: '\$${data.tax!.toStringAsFixed(2)}',
                    ),
                  ],
                ],
              ),
            ),
          ],

          const SizedBox(height: AppDimensions.spacingXl),

          // Action buttons
          AppButton(
            label: 'Create Transaction',
            onPressed: _createTransaction,
            isFullWidth: true,
            size: AppButtonSize.large,
          ),
          const SizedBox(height: AppDimensions.spacingSm),
          AppButton(
            label: 'Scan Another Receipt',
            onPressed: () {
              ref.read(receiptScannerViewModelProvider.notifier).clearResult();
            },
            variant: AppButtonVariant.outlined,
            isFullWidth: true,
          ),
        ],
      ),
    );
  }

  Color _getConfidenceColor(double confidence) {
    if (confidence >= 0.8) return Colors.green;
    if (confidence >= 0.5) return Colors.orange;
    return Colors.red;
  }

  IconData _getConfidenceIcon(double confidence) {
    if (confidence >= 0.8) return Icons.check_circle;
    if (confidence >= 0.5) return Icons.info;
    return Icons.warning;
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
