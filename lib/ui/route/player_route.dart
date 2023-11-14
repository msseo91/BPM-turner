import 'package:bpm_turner/data/model/tempo_sheet.dart';
import 'package:bpm_turner/global.dart';
import 'package:bpm_turner/ui/block/circular_progress.dart';
import 'package:bpm_turner/ui/viewmodel/player_viewmodel.dart';
import 'package:bpm_turner/ui/viewmodel/sheet_image_viewmodel.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:provider/provider.dart';

class PlayerScreenArgs {
  final String path;
  final TempoSheet sheet;
  final bool isAsset;

  PlayerScreenArgs({required this.path, required this.isAsset, required this.sheet});
}

class PlayerRoute extends StatelessWidget {
  static const String route = "/player";

  const PlayerRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as PlayerScreenArgs;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (create) => PlayerViewModel(),
        ),
        ChangeNotifierProvider(
          create: (create) => SheetImageViewModel(args),
        )
      ],
      child: PlayerScreen(),
    );
  }
}

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PlayerViewModel viewModel = context.watch();
    var square = viewModel.squareData;

    return Stack(
      children: [
        if (square != null)
          Positioned(
            left: square.left.toDouble(),
            top: square.top.toDouble(),
            height: square.height.toDouble(),
            child: const VerticalDivider(
              color: Colors.red,
            ),
          ),

        SheetImageView(),
      ],
    );
  }
}

class SheetImageView extends StatelessWidget {
  const SheetImageView({super.key});

  @override
  Widget build(BuildContext context) {
    SheetImageViewModel viewModel = context.watch();

    return GestureDetector(
      onTap: viewModel.onScreenTab,
      behavior: HitTestBehavior.translucent,
      onHorizontalDragEnd: (dragEndDetails) {
        var velocity = dragEndDetails.primaryVelocity ?? 0;
        if (velocity < 0) {
          viewModel.nextPage();
        } else if (velocity > 0) {
          viewModel.prevPage();
        }
      },
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        // Show Progress, if no rendered image.
        child: viewModel.currentSheetImage != null
            ? RawImage(image: viewModel.currentSheetImage)
            : const CircularProgress(),
      ),
    );
  }
}

/*
class PlayerRoute extends HookWidget {
  static const String route = "/player";

  const PlayerRoute({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logger.d("build MusicRoute");
    final args = ModalRoute.of(context)!.settings.arguments as PlayerScreenArgs;

    final pdfPath = useState<String?>(args.isAsset ? args.path : null);
    final bpm = useState(180);
    final isPlaying = useState(false);
    final controlOpacity = useState(0.0);
    final ticker = useSingleTickerProvider();
    final makeMetronomeSound = useState(false);
    final currentPage = useState(0);
    final sheetImages = useState<List<Image>>([]);

    if (sheetImages.value.isEmpty) {
      if (args.isAsset) {
        makePdfImage(assetName: args.path).then((value) => sheetImages.value = value);
      } else {
        makePdfImage(path: args.path).then((value) => sheetImages.value = value);
      }
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
        sheet: args.sheet,
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
      PdfPageImage pageImage = await page.render(width: 1200, height: 1920);
      images.add(await pageImage.createImageIfNotAvailable());
    }
    return images;
  }
}

class PlayerScreenArgs {
  final String path;
  final TempoSheett sheet;
  final bool isAsset;

  PlayerScreenArgs({
    required this.path,
    required this.isAsset,
    required this.sheet
  });
}
*/
