import 'package:bpm_turner/data/model/tempo_sheet.dart';
import 'package:bpm_turner/global.dart';
import 'package:bpm_turner/ui/block/circular_progress.dart';
import 'package:bpm_turner/ui/viewmodel/player_viewmodel.dart';
import 'package:bpm_turner/ui/viewmodel/sheet_image_viewmodel.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:provider/provider.dart';



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
        // TODO - 여기서 ControlBar 를 구현하고, SheetImageView 는 단순히 image 만 보여주도록 하자.
        topBar(),
      ],
    );
  }

  Widget topBar(SheetImageViewModel viewModel, ColorScheme colors) {
    double iconSize = 40;
    var bpm = 180;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 400),
      opacity: viewModel.controlOpacity,
      child: Align(
          alignment: Alignment.topCenter,
          child: Container(
              color: colors.secondaryContainer,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () => bpm.value -= 5,
                      iconSize: iconSize,
                      color: colors.onSecondaryContainer,
                      icon: const Icon(Icons.remove)),
                  Text(
                    bpm.value.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: colors.onSecondaryContainer,
                    ),
                  ),
                  IconButton(
                      onPressed: () => bpm.value += 5,
                      iconSize: iconSize,
                      color: colors.onSecondaryContainer,
                      icon: const Icon(Icons.add)),
                  IconButton(
                    iconSize: iconSize,
                    color: colors.onSecondaryContainer,
                    icon: Icon(isPlaying.value ? Icons.pause : Icons.play_arrow),
                    onPressed: isPlaying.value ? pause : () => startWithCountDown(context, defaultCountDown),
                  ),
                  IconButton(
                    iconSize: iconSize,
                    color: colors.onSecondaryContainer,
                    icon: const Icon(Icons.stop),
                    onPressed: stop,
                  ),
                  IconButton(
                    iconSize: iconSize,
                    color: colors.onSecondaryContainer,
                    icon: Icon(makeMetronomeSound.value ? Icons.volume_up : Icons.volume_off),
                    onPressed: () => sheet.playMetronome = makeMetronomeSound.value = !makeMetronomeSound.value,
                  ),
                ],
              ))),
    );
  }
}

class SheetImageView extends StatelessWidget {
  const SheetImageView({super.key});

  @override
  Widget build(BuildContext context) {
    SheetImageViewModel viewModel = context.watch();
    var colors = Theme.of(context).colorScheme;

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
