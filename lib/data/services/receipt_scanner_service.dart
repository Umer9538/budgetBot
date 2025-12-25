import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/enums/enums.dart';

/// Parsed receipt data from OCR
class ParsedReceiptData {
  const ParsedReceiptData({
    this.merchantName,
    this.totalAmount,
    this.subtotal,
    this.tax,
    this.date,
    this.items = const [],
    this.rawText = '',
    this.confidence = 0.0,
  });

  final String? merchantName;
  final double? totalAmount;
  final double? subtotal;
  final double? tax;
  final DateTime? date;
  final List<ReceiptLineItem> items;
  final String rawText;
  final double confidence;

  /// Convert to map for storing in TransactionReceipt.ocrData
  Map<String, dynamic> toOcrData() {
    return {
      'merchantName': merchantName,
      'totalAmount': totalAmount,
      'subtotal': subtotal,
      'tax': tax,
      'date': date?.toIso8601String(),
      'items': items.map((i) => i.toJson()).toList(),
      'rawText': rawText,
      'confidence': confidence,
    };
  }

  /// Suggest a category based on merchant name
  CategoryType get suggestedCategory {
    if (merchantName == null) return CategoryType.miscellaneous;

    final name = merchantName!.toLowerCase();

    // Grocery stores
    if (_matchesAny(name, [
      'walmart',
      'target',
      'costco',
      'kroger',
      'safeway',
      'whole foods',
      'trader joe',
      'aldi',
      'publix',
      'grocery',
      'supermarket',
      'market',
      'foods',
    ])) {
      return CategoryType.groceries;
    }

    // Restaurants / Fast food
    if (_matchesAny(name, [
      'mcdonald',
      'starbucks',
      'chipotle',
      'subway',
      'burger',
      'pizza',
      'taco',
      'wendy',
      'kfc',
      'chick-fil-a',
      'dunkin',
      'restaurant',
      'cafe',
      'coffee',
      'diner',
      'grill',
      'kitchen',
      'eatery',
      'bistro',
    ])) {
      return CategoryType.restaurants;
    }

    // Gas stations
    if (_matchesAny(name, [
      'shell',
      'exxon',
      'chevron',
      'bp',
      'mobil',
      'gas',
      'fuel',
      'petro',
      'texaco',
      'citgo',
      'speedway',
    ])) {
      return CategoryType.fuel;
    }

    // Healthcare / Pharmacy
    if (_matchesAny(name, [
      'cvs',
      'walgreens',
      'pharmacy',
      'rite aid',
      'medical',
      'hospital',
      'clinic',
      'doctor',
      'health',
      'dental',
      'vision',
    ])) {
      return CategoryType.pharmacy;
    }

    // Entertainment
    if (_matchesAny(name, [
      'cinema',
      'movie',
      'theater',
      'amc',
      'regal',
      'netflix',
      'spotify',
      'game',
      'arcade',
      'bowling',
      'concert',
    ])) {
      return CategoryType.streamingServices;
    }

    // Shopping
    if (_matchesAny(name, [
      'amazon',
      'best buy',
      'apple',
      'nike',
      'adidas',
      'nordstrom',
      'macy',
      'home depot',
      'lowe',
      'ikea',
      'store',
      'shop',
      'mall',
    ])) {
      return CategoryType.onlineShopping;
    }

    // Utilities
    if (_matchesAny(name, [
      'electric',
      'water',
      'gas co',
      'utility',
      'power',
      'energy',
      'comcast',
      'verizon',
      'at&t',
      'sprint',
      't-mobile',
    ])) {
      return CategoryType.utilities;
    }

    return CategoryType.miscellaneous;
  }

  bool _matchesAny(String text, List<String> patterns) {
    return patterns.any((p) => text.contains(p));
  }

  ParsedReceiptData copyWith({
    String? merchantName,
    double? totalAmount,
    double? subtotal,
    double? tax,
    DateTime? date,
    List<ReceiptLineItem>? items,
    String? rawText,
    double? confidence,
  }) {
    return ParsedReceiptData(
      merchantName: merchantName ?? this.merchantName,
      totalAmount: totalAmount ?? this.totalAmount,
      subtotal: subtotal ?? this.subtotal,
      tax: tax ?? this.tax,
      date: date ?? this.date,
      items: items ?? this.items,
      rawText: rawText ?? this.rawText,
      confidence: confidence ?? this.confidence,
    );
  }
}

/// Individual line item from receipt
class ReceiptLineItem {
  const ReceiptLineItem({
    required this.description,
    this.quantity,
    this.unitPrice,
    this.totalPrice,
  });

  final String description;
  final int? quantity;
  final double? unitPrice;
  final double? totalPrice;

  Map<String, dynamic> toJson() => {
        'description': description,
        'quantity': quantity,
        'unitPrice': unitPrice,
        'totalPrice': totalPrice,
      };

  factory ReceiptLineItem.fromJson(Map<String, dynamic> json) {
    return ReceiptLineItem(
      description: json['description'] as String,
      quantity: json['quantity'] as int?,
      unitPrice: (json['unitPrice'] as num?)?.toDouble(),
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
    );
  }
}

/// Result of receipt scanning operation
class ReceiptScanResult {
  const ReceiptScanResult._({
    this.imagePath,
    this.parsedData,
    this.error,
    this.isSuccess = false,
  });

  final String? imagePath;
  final ParsedReceiptData? parsedData;
  final String? error;
  final bool isSuccess;

  factory ReceiptScanResult.success({
    required String imagePath,
    required ParsedReceiptData parsedData,
  }) {
    return ReceiptScanResult._(
      imagePath: imagePath,
      parsedData: parsedData,
      isSuccess: true,
    );
  }

  factory ReceiptScanResult.failure(String error) {
    return ReceiptScanResult._(
      error: error,
      isSuccess: false,
    );
  }
}

/// Service for scanning receipts and extracting transaction data
class ReceiptScannerService {
  ReceiptScannerService();

  final ImagePicker _imagePicker = ImagePicker();
  final TextRecognizer _textRecognizer = TextRecognizer(
    script: TextRecognitionScript.latin,
  );

  /// Pick image from camera and scan
  Future<ReceiptScanResult> scanFromCamera() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
        preferredCameraDevice: CameraDevice.rear,
      );

      if (image == null) {
        return ReceiptScanResult.failure('No image captured');
      }

      return _processImage(image.path);
    } catch (e) {
      return ReceiptScanResult.failure('Failed to capture image: $e');
    }
  }

  /// Pick image from gallery and scan
  Future<ReceiptScanResult> scanFromGallery() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (image == null) {
        return ReceiptScanResult.failure('No image selected');
      }

      return _processImage(image.path);
    } catch (e) {
      return ReceiptScanResult.failure('Failed to select image: $e');
    }
  }

  /// Process an image file and extract receipt data
  Future<ReceiptScanResult> _processImage(String imagePath) async {
    try {
      final inputImage = InputImage.fromFilePath(imagePath);
      final recognizedText = await _textRecognizer.processImage(inputImage);

      if (recognizedText.text.isEmpty) {
        return ReceiptScanResult.failure('No text found in image');
      }

      final parsedData = _parseReceiptText(recognizedText);

      return ReceiptScanResult.success(
        imagePath: imagePath,
        parsedData: parsedData,
      );
    } catch (e) {
      return ReceiptScanResult.failure('Failed to process image: $e');
    }
  }

  /// Parse recognized text into structured receipt data
  ParsedReceiptData _parseReceiptText(RecognizedText recognizedText) {
    final rawText = recognizedText.text;
    final lines = rawText.split('\n').map((l) => l.trim()).toList();

    String? merchantName;
    double? totalAmount;
    double? subtotal;
    double? tax;
    DateTime? date;
    final items = <ReceiptLineItem>[];
    double totalConfidence = 0;
    int confidenceCount = 0;

    // Calculate average confidence from text blocks
    for (final block in recognizedText.blocks) {
      for (final line in block.lines) {
        totalConfidence += line.confidence ?? 0;
        confidenceCount++;
      }
    }

    // Extract merchant name (usually first few lines)
    merchantName = _extractMerchantName(lines);

    // Extract total amount
    totalAmount = _extractTotal(lines);

    // Extract subtotal
    subtotal = _extractSubtotal(lines);

    // Extract tax
    tax = _extractTax(lines);

    // Extract date
    date = _extractDate(lines);

    // Extract line items
    items.addAll(_extractLineItems(lines));

    final avgConfidence =
        confidenceCount > 0 ? totalConfidence / confidenceCount : 0.0;

    return ParsedReceiptData(
      merchantName: merchantName,
      totalAmount: totalAmount,
      subtotal: subtotal,
      tax: tax,
      date: date,
      items: items,
      rawText: rawText,
      confidence: avgConfidence,
    );
  }

  /// Extract merchant name from receipt lines
  String? _extractMerchantName(List<String> lines) {
    // Merchant name is usually in the first few lines
    // Skip very short lines (likely store number, date, etc.)
    for (int i = 0; i < lines.length && i < 5; i++) {
      final line = lines[i];
      // Look for lines with mostly letters and reasonable length
      if (line.length >= 3 &&
          line.length <= 40 &&
          !_isDateLine(line) &&
          !_isPriceLine(line) &&
          !_isAddressLine(line)) {
        // Clean up common prefixes
        return _cleanMerchantName(line);
      }
    }
    return null;
  }

  String _cleanMerchantName(String name) {
    // Remove common store number patterns
    name = name.replaceAll(RegExp(r'#\d+'), '').trim();
    name = name.replaceAll(RegExp(r'Store\s*\d+', caseSensitive: false), '').trim();
    return name;
  }

  bool _isDateLine(String line) {
    return RegExp(r'\d{1,2}[/-]\d{1,2}[/-]\d{2,4}').hasMatch(line);
  }

  bool _isPriceLine(String line) {
    return RegExp(r'\$?\d+\.\d{2}').hasMatch(line);
  }

  bool _isAddressLine(String line) {
    final lower = line.toLowerCase();
    return lower.contains('street') ||
        lower.contains('ave') ||
        lower.contains('road') ||
        lower.contains('blvd') ||
        RegExp(r'\d{5}').hasMatch(line); // ZIP code
  }

  /// Extract total amount from receipt
  double? _extractTotal(List<String> lines) {
    final totalPatterns = [
      RegExp(r'total[:\s]*\$?(\d+\.?\d*)', caseSensitive: false),
      RegExp(r'grand\s*total[:\s]*\$?(\d+\.?\d*)', caseSensitive: false),
      RegExp(r'amount\s*due[:\s]*\$?(\d+\.?\d*)', caseSensitive: false),
      RegExp(r'balance\s*due[:\s]*\$?(\d+\.?\d*)', caseSensitive: false),
    ];

    // Search from bottom up (total is usually at the end)
    for (int i = lines.length - 1; i >= 0; i--) {
      final line = lines[i];
      for (final pattern in totalPatterns) {
        final match = pattern.firstMatch(line);
        if (match != null) {
          final value = double.tryParse(match.group(1) ?? '');
          if (value != null && value > 0) {
            return value;
          }
        }
      }
    }

    return null;
  }

  /// Extract subtotal from receipt
  double? _extractSubtotal(List<String> lines) {
    final subtotalPattern =
        RegExp(r'subtotal[:\s]*\$?(\d+\.?\d*)', caseSensitive: false);

    for (final line in lines) {
      final match = subtotalPattern.firstMatch(line);
      if (match != null) {
        return double.tryParse(match.group(1) ?? '');
      }
    }
    return null;
  }

  /// Extract tax from receipt
  double? _extractTax(List<String> lines) {
    final taxPatterns = [
      RegExp(r'tax[:\s]*\$?(\d+\.?\d*)', caseSensitive: false),
      RegExp(r'sales\s*tax[:\s]*\$?(\d+\.?\d*)', caseSensitive: false),
      RegExp(r'vat[:\s]*\$?(\d+\.?\d*)', caseSensitive: false),
    ];

    for (final line in lines) {
      for (final pattern in taxPatterns) {
        final match = pattern.firstMatch(line);
        if (match != null) {
          // Make sure it's not "subtotal" or "total"
          if (!line.toLowerCase().contains('subtotal') &&
              !line.toLowerCase().startsWith('total')) {
            return double.tryParse(match.group(1) ?? '');
          }
        }
      }
    }
    return null;
  }

  /// Extract date from receipt
  DateTime? _extractDate(List<String> lines) {
    final datePatterns = [
      // MM/DD/YYYY or MM-DD-YYYY
      RegExp(r'(\d{1,2})[/-](\d{1,2})[/-](\d{4})'),
      // MM/DD/YY or MM-DD-YY
      RegExp(r'(\d{1,2})[/-](\d{1,2})[/-](\d{2})'),
      // Month DD, YYYY
      RegExp(
          r'(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\w*\s+(\d{1,2}),?\s+(\d{4})',
          caseSensitive: false),
    ];

    for (final line in lines) {
      for (final pattern in datePatterns) {
        final match = pattern.firstMatch(line);
        if (match != null) {
          try {
            if (match.groupCount >= 3) {
              final g1 = match.group(1)!;
              final g2 = match.group(2)!;
              final g3 = match.group(3)!;

              // Check if first group is a month name
              if (RegExp(r'[a-zA-Z]').hasMatch(g1)) {
                final month = _monthFromString(g1);
                final day = int.parse(g2);
                final year = int.parse(g3);
                return DateTime(year, month, day);
              } else {
                // Numeric format
                final month = int.parse(g1);
                final day = int.parse(g2);
                var year = int.parse(g3);
                if (year < 100) year += 2000;
                return DateTime(year, month, day);
              }
            }
          } catch (_) {
            continue;
          }
        }
      }
    }
    return null;
  }

  int _monthFromString(String month) {
    const months = {
      'jan': 1,
      'feb': 2,
      'mar': 3,
      'apr': 4,
      'may': 5,
      'jun': 6,
      'jul': 7,
      'aug': 8,
      'sep': 9,
      'oct': 10,
      'nov': 11,
      'dec': 12,
    };
    return months[month.toLowerCase().substring(0, 3)] ?? 1;
  }

  /// Extract line items from receipt
  List<ReceiptLineItem> _extractLineItems(List<String> lines) {
    final items = <ReceiptLineItem>[];

    // Pattern for item with price: description followed by price
    final itemPattern = RegExp(r'^(.+?)\s+\$?(\d+\.?\d{0,2})$');

    for (final line in lines) {
      // Skip header/footer lines
      if (_isHeaderOrFooter(line)) continue;

      final match = itemPattern.firstMatch(line);
      if (match != null) {
        final description = match.group(1)?.trim() ?? '';
        final priceStr = match.group(2);

        // Skip if description is too short or looks like total/tax
        if (description.length < 2) continue;
        if (_isTotal(description) || _isTax(description)) continue;

        final price = double.tryParse(priceStr ?? '');
        if (price != null && price > 0 && price < 10000) {
          items.add(ReceiptLineItem(
            description: description,
            totalPrice: price,
          ));
        }
      }
    }

    return items;
  }

  bool _isHeaderOrFooter(String line) {
    final lower = line.toLowerCase();
    return lower.contains('thank you') ||
        lower.contains('welcome') ||
        lower.contains('receipt') ||
        lower.contains('transaction') ||
        lower.contains('card ending') ||
        lower.contains('approval') ||
        lower.contains('customer copy');
  }

  bool _isTotal(String text) {
    final lower = text.toLowerCase();
    return lower.contains('total') ||
        lower.contains('balance') ||
        lower.contains('amount due');
  }

  bool _isTax(String text) {
    final lower = text.toLowerCase();
    return lower == 'tax' ||
        lower.contains('sales tax') ||
        lower.contains('vat');
  }

  /// Clean up resources
  void dispose() {
    _textRecognizer.close();
  }
}

/// Riverpod provider for ReceiptScannerService
final receiptScannerServiceProvider = Provider<ReceiptScannerService>((ref) {
  final service = ReceiptScannerService();
  ref.onDispose(() => service.dispose());
  return service;
});

/// State for receipt scanning process
class ReceiptScanState {
  const ReceiptScanState({
    this.isScanning = false,
    this.result,
    this.error,
  });

  final bool isScanning;
  final ReceiptScanResult? result;
  final String? error;

  ReceiptScanState copyWith({
    bool? isScanning,
    ReceiptScanResult? result,
    String? error,
  }) {
    return ReceiptScanState(
      isScanning: isScanning ?? this.isScanning,
      result: result ?? this.result,
      error: error,
    );
  }
}

/// ViewModel for receipt scanning
class ReceiptScannerViewModel extends StateNotifier<ReceiptScanState> {
  ReceiptScannerViewModel(this._service) : super(const ReceiptScanState());

  final ReceiptScannerService _service;

  /// Scan receipt from camera
  Future<void> scanFromCamera() async {
    state = state.copyWith(isScanning: true, error: null);

    final result = await _service.scanFromCamera();

    if (result.isSuccess) {
      state = state.copyWith(isScanning: false, result: result);
    } else {
      state = state.copyWith(isScanning: false, error: result.error);
    }
  }

  /// Scan receipt from gallery
  Future<void> scanFromGallery() async {
    state = state.copyWith(isScanning: true, error: null);

    final result = await _service.scanFromGallery();

    if (result.isSuccess) {
      state = state.copyWith(isScanning: false, result: result);
    } else {
      state = state.copyWith(isScanning: false, error: result.error);
    }
  }

  /// Clear current result
  void clearResult() {
    state = const ReceiptScanState();
  }

  /// Update parsed data (for user corrections)
  void updateParsedData(ParsedReceiptData updatedData) {
    if (state.result != null) {
      state = state.copyWith(
        result: ReceiptScanResult.success(
          imagePath: state.result!.imagePath!,
          parsedData: updatedData,
        ),
      );
    }
  }
}

/// Riverpod provider for ReceiptScannerViewModel
final receiptScannerViewModelProvider =
    StateNotifierProvider<ReceiptScannerViewModel, ReceiptScanState>((ref) {
  final service = ref.watch(receiptScannerServiceProvider);
  return ReceiptScannerViewModel(service);
});
