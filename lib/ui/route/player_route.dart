import 'dart:ui';

import 'package:bpm_turner/global.dart';
import 'package:bpm_turner/ui/player/player_widget.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pdf_render/pdf_render.dart';

class PlayerRoute extends HookWidget {
  static const String route = "/player";

  const PlayerRoute({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logger.d("build MusicRoute");

    final pdfPath = useState<String?>(null);
    final bpm = useState(160);
    final isPlaying = useState(false);
    final controlOpacity = useState(0.0);
    final ticker = useSingleTickerProvider();
    final makeMetronomeSound = useState(false);
    final currentPage = useState(0);
    final sheetImages = useState<List<Image>>([]);

    if(sheetImages.value.isEmpty) {
      makePdfImage(assetName: "assets/rach-tarantella.pdf").then((value) => sheetImages.value = value);
    }

    useValueChanged(pdfPath.value, (_, __) {
      if (pdfPath.value != null) {
        // Load pdf
        makePdfImage(path: pdfPath.value).then((value) => sheetImages.value = value);
      }
      return true;
    });

    return PlayerWidget(
        pdfPath: pdfPath,
        sheetImages: sheetImages.value,
        bpm: bpm,
        isPlaying: isPlaying,
        controlOpacity: controlOpacity,
        ticker: ticker,
        makeMetronomeSound: makeMetronomeSound,
        currentPage: currentPage);
  }

  Future<List<Image>> makePdfImage({String? path, String? assetName}) async {
    var doc = path != null ? await PdfDocument.openFile(path) : await PdfDocument.openAsset(assetName!);

    int pageCount = doc.pageCount;
    List<Image> images = [];
    for (var i = 1; i <= pageCount; i++) {
      logger.d("Making $i page to image.");
      PdfPage page = await doc.getPage(i);
      PdfPageImage pageImage = await page.render(
        width: 1200,
        height: 1920
      );
      images.add(await pageImage.createImageIfNotAvailable());
    }
    return images;
  }
}
