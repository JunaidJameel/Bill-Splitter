// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow.png
  AssetGenImage get arrow => const AssetGenImage('assets/icons/arrow.png');

  /// File path: assets/icons/money.png
  AssetGenImage get money => const AssetGenImage('assets/icons/money.png');

  /// List of all assets
  List<AssetGenImage> get values => [arrow, money];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/p1.png
  AssetGenImage get p1 => const AssetGenImage('assets/images/p1.png');

  /// File path: assets/images/p2.png
  AssetGenImage get p2 => const AssetGenImage('assets/images/p2.png');

  /// File path: assets/images/p3.png
  AssetGenImage get p3 => const AssetGenImage('assets/images/p3.png');

  /// File path: assets/images/p4.png
  AssetGenImage get p4 => const AssetGenImage('assets/images/p4.png');

  /// File path: assets/images/p5.png
  AssetGenImage get p5 => const AssetGenImage('assets/images/p5.png');

  /// File path: assets/images/p6.png
  AssetGenImage get p6 => const AssetGenImage('assets/images/p6.png');

  /// File path: assets/images/p7.png
  AssetGenImage get p7 => const AssetGenImage('assets/images/p7.png');

  /// List of all assets
  List<AssetGenImage> get values => [p1, p2, p3, p4, p5, p6, p7];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/humans.json
  String get humans => 'assets/lottie/humans.json';

  /// List of all assets
  List<String> get values => [humans];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
