/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsCardGen {
  const $AssetsCardGen();

  /// File path: assets/card/cake-bday.png
  AssetGenImage get cakeBday =>
      const AssetGenImage('assets/card/cake-bday.png');

  /// File path: assets/card/doge-xmas.png
  AssetGenImage get dogeXmas =>
      const AssetGenImage('assets/card/doge-xmas.png');

  /// File path: assets/card/flower.png
  AssetGenImage get flower => const AssetGenImage('assets/card/flower.png');

  /// File path: assets/card/gift-happy.png
  AssetGenImage get giftHappy =>
      const AssetGenImage('assets/card/gift-happy.png');

  /// File path: assets/card/gift-xmas.png
  AssetGenImage get giftXmas =>
      const AssetGenImage('assets/card/gift-xmas.png');

  /// File path: assets/card/happy-bday.png
  AssetGenImage get happyBday =>
      const AssetGenImage('assets/card/happy-bday.png');

  /// File path: assets/card/hohoho.png
  AssetGenImage get hohoho => const AssetGenImage('assets/card/hohoho.png');

  /// File path: assets/card/sock-xmas.png
  AssetGenImage get sockXmas =>
      const AssetGenImage('assets/card/sock-xmas.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        cakeBday,
        dogeXmas,
        flower,
        giftHappy,
        giftXmas,
        happyBday,
        hohoho,
        sockXmas
      ];
}

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/arrowleft.svg
  SvgGenImage get arrowleft => const SvgGenImage('assets/icon/arrowleft.svg');

  /// File path: assets/icon/arrowright.svg
  SvgGenImage get arrowright => const SvgGenImage('assets/icon/arrowright.svg');

  /// File path: assets/icon/back.svg
  SvgGenImage get back => const SvgGenImage('assets/icon/back.svg');

  /// File path: assets/icon/card.svg
  SvgGenImage get card => const SvgGenImage('assets/icon/card.svg');

  /// File path: assets/icon/color.svg
  SvgGenImage get color => const SvgGenImage('assets/icon/color.svg');

  /// File path: assets/icon/discover.svg
  SvgGenImage get discover => const SvgGenImage('assets/icon/discover.svg');

  /// File path: assets/icon/gift-1.svg
  SvgGenImage get gift1 => const SvgGenImage('assets/icon/gift-1.svg');

  /// File path: assets/icon/gift.svg
  SvgGenImage get gift => const SvgGenImage('assets/icon/gift.svg');

  /// File path: assets/icon/home.svg
  SvgGenImage get home => const SvgGenImage('assets/icon/home.svg');

  /// File path: assets/icon/mc.svg
  SvgGenImage get mc => const SvgGenImage('assets/icon/mc.svg');

  /// File path: assets/icon/paypal.svg
  SvgGenImage get paypal => const SvgGenImage('assets/icon/paypal.svg');

  /// File path: assets/icon/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icon/search.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        arrowleft,
        arrowright,
        back,
        card,
        color,
        discover,
        gift1,
        gift,
        home,
        mc,
        paypal,
        search
      ];
}

class Assets {
  Assets._();

  static const $AssetsCardGen card = $AssetsCardGen();
  static const $AssetsIconGen icon = $AssetsIconGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
