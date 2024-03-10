import 'dart:ui';

import 'package:bpm_turner/data/model/sheet_bar.dart';
import 'package:bpm_turner/data/model/sheet_page.dart';

import '../model/tempo_sheet.dart';

/// Rachmaninoff Suite No.2, Op.17 Tarantella
TempoSheet tarantella = TempoSheet("Rachmaninoff Suite No.2, Op.17 Tarantella", pages: _makePages());

List<MusicPage> _makePages() {
  return [
    // 71
    MusicPage(0, [
      Bar(halfBar: true, barRectInPercent: const Rect.fromLTRB(0.235, 0.139, 0.307, 0.342)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.307, 0.139, 0.438, 0.342)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.438, 0.139, 0.536, 0.342)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.536, 0.139, 0.653, 0.342)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.653, 0.139, 0.776, 0.342)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.776, 0.139, 0.907, 0.342)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.182, 0.415, 0.316, 0.631)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.316, 0.415, 0.439, 0.631)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.439, 0.415, 0.573, 0.631)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.573, 0.415, 0.739, 0.631)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.739, 0.415, 0.903, 0.631)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.177, 0.697, 0.333, 0.915)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.333, 0.697, 0.468, 0.915)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.468, 0.697, 0.612, 0.915)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.612, 0.697, 0.735, 0.915)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.735, 0.697, 0.904, 0.915)),
    ]),
    MusicPage(1, [
      Bar(barRectInPercent: const Rect.fromLTRB(0.176, 0.073, 0.339, 0.287)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.339, 0.073, 0.544, 0.287)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.544, 0.073, 0.672, 0.287)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.672, 0.073, 0.801, 0.287)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.801, 0.073, 0.902, 0.287)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.801, 0.073, 0.902, 0.287)),

      Bar(barRectInPercent: const Rect.fromLTRB(0.179, 0.349, 0.319, 0.584)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.319, 0.349, 0.456, 0.584)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.456, 0.349, 0.582, 0.584)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.582, 0.349, 0.737, 0.584)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.737, 0.349, 0.901, 0.584)),

      Bar(barRectInPercent: const Rect.fromLTRB(0.179, 0.658, 0.319, 0.88)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.319, 0.658, 0.48, 0.88)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.48, 0.658, 0.646, 0.88)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.646, 0.658, 0.763, 0.88)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.763, 0.658, 0.901, 0.88)),
    ]),
    MusicPage(2, [
      Bar(barRectInPercent: const Rect.fromLTRB(0.154, 0.151, 0.313, 0.322)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.313, 0.151, 0.477, 0.322)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.477, 0.151, 0.633, 0.322)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.633, 0.151, 0.769, 0.322)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.769, 0.151, 0.931, 0.322)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.156, 0.396, 0.321, 0.586)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.321, 0.396, 0.506, 0.586)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.506, 0.396, 0.636, 0.586)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.636, 0.396, 0.783, 0.586)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.783, 0.396, 0.931, 0.586)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.156, 0.666, 0.33, 0.855)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.33, 0.666, 0.463, 0.855)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.463, 0.666, 0.619, 0.855)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.619, 0.666, 0.764, 0.855)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.764, 0.666, 0.937, 0.855)),
    ]),

    /**
     *
        Bar(barRectInPercent: const Rect.fromLTRB()),
        Bar(barRectInPercent: const Rect.fromLTRB()),
        Bar(barRectInPercent: const Rect.fromLTRB()),
        Bar(barRectInPercent: const Rect.fromLTRB()),
        Bar(barRectInPercent: const Rect.fromLTRB()),
     */
    MusicPage(3, [
      Bar(barRectInPercent: const Rect.fromLTRB(0.156, 0.155, 0.313, 0.325)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.307, 0.155, 0.482, 0.325)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.48, 0.155, 0.633, 0.325)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.636, 0.155, 0.775, 0.325)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.767, 0.155, 0.929, 0.325)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.151, 0.396, 0.293, 0.596)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.293, 0.396, 0.463, 0.596)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.463, 0.396, 0.622, 0.596)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.622, 0.396, 0.789, 0.596)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.789, 0.396, 0.934, 0.596)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.156, 0.661, 0.313, 0.863)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.313, 0.661, 0.493, 0.863)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.493, 0.661, 0.633, 0.863)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.633, 0.661, 0.778, 0.863)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.778, 0.661, 0.929, 0.863)),
    ]),
    MusicPage(4, [
      Bar(barRectInPercent: const Rect.fromLTRB(0.157, 0.166, 0.315, 0.358)),
      Bar(barRectInPercent: const Rect.fromLTRB(.315, 0.166, 0.472, 0.358)),
      Bar(barRectInPercent: const Rect.fromLTRB(.472, 0.166, 0.628, 0.358)),
      Bar(barRectInPercent: const Rect.fromLTRB(.628, 0.166, 0.787, 0.358)),
      Bar(barRectInPercent: const Rect.fromLTRB(.787, 0.166, 0.929, 0.358)),
      Bar(barRectInPercent: const Rect.fromLTRB(.156, .41, .315, .605)),
      Bar(barRectInPercent: const Rect.fromLTRB(.315, .41, .472, .605)),
      Bar(barRectInPercent: const Rect.fromLTRB(.472, .41, .614, .605)),
      Bar(barRectInPercent: const Rect.fromLTRB(.614, .41, .769, .605)),
      Bar(barRectInPercent: const Rect.fromLTRB(.769, .41, .932, .605)),
      Bar(barRectInPercent: const Rect.fromLTRB(.152, .658, .315, .84)),
      Bar(barRectInPercent: const Rect.fromLTRB(.315, .658, .470, .84)),
      Bar(barRectInPercent: const Rect.fromLTRB(.470, .658, .626, .84)),
      Bar(barRectInPercent: const Rect.fromLTRB(.626, .658, .783, .84)),
      Bar(barRectInPercent: const Rect.fromLTRB(.783, .658, .938, .84)),
    ]),
    // 76
    MusicPage(5, [
      Bar(barRectInPercent: const Rect.fromLTRB(.157, .182, .329, .396)),
      Bar(barRectInPercent: const Rect.fromLTRB(.329, .182, .486, .396)),
      Bar(barRectInPercent: const Rect.fromLTRB(.486, .182, .616, .396)),
      Bar(barRectInPercent: const Rect.fromLTRB(.616, .182, .773, .396)),
      Bar(barRectInPercent: const Rect.fromLTRB(.773, .182, .931, .396)),
      Bar(barRectInPercent: const Rect.fromLTRB(.16, .449, .304, .613)),
      Bar(barRectInPercent: const Rect.fromLTRB(.304, .449, .449, .613)),
      Bar(barRectInPercent: const Rect.fromLTRB(.449, .449, .589, .613)),
      Bar(barRectInPercent: const Rect.fromLTRB(.589, .449, .752, .613)),
      Bar(barRectInPercent: const Rect.fromLTRB(.752, .449, .934, .613)),
      Bar(barRectInPercent: const Rect.fromLTRB(.152, .668, .309, .844)),
      Bar(barRectInPercent: const Rect.fromLTRB(.309, .668, .468, .844)),
      Bar(barRectInPercent: const Rect.fromLTRB(.468, .668, .620, .844)),
      Bar(barRectInPercent: const Rect.fromLTRB(.62, .668, .768, .844)),
      Bar(barRectInPercent: const Rect.fromLTRB(.768, .668, .934, .844)),
    ]),

    MusicPage(6, [
      Bar(barRectInPercent: const Rect.fromLTRB(.154, .168, .331, .365)),
      Bar(barRectInPercent: const Rect.fromLTRB(.331, .168, .445, .365)),
      Bar(barRectInPercent: const Rect.fromLTRB(.445, .168, .62, .365)),
      Bar(barRectInPercent: const Rect.fromLTRB(.62, .168, .775, .365)),
      Bar(barRectInPercent: const Rect.fromLTRB(.775, .168, .931, .365)),

      Bar(barRectInPercent: const Rect.fromLTRB(.154, .41, .27, .592)),
      Bar(barRectInPercent: const Rect.fromLTRB(.27, .41, .416, .592)),
      Bar(barRectInPercent: const Rect.fromLTRB(.416, .41, .571, .592)),
      Bar(barRectInPercent: const Rect.fromLTRB(.571, .41, .736, .592)),
      Bar(barRectInPercent: const Rect.fromLTRB(.736, .41, .863, .592)),

      Bar(barRectInPercent: const Rect.fromLTRB(.173, .644, .332, .833)),
      Bar(barRectInPercent: const Rect.fromLTRB(.332, .644, .474, .833)),
      Bar(barRectInPercent: const Rect.fromLTRB(.474, .644, .618, .833)),
      Bar(barRectInPercent: const Rect.fromLTRB(.618, .644, .756, .833)),
      Bar(barRectInPercent: const Rect.fromLTRB(.756, .644, .931, .833)),
    ]),

    MusicPage(7, [
      Bar(barRectInPercent: const Rect.fromLTRB(.183, .17, .36, .354)),
      Bar(barRectInPercent: const Rect.fromLTRB(.36, .17, .525, .354)),
      Bar(barRectInPercent: const Rect.fromLTRB(.525, .17, .681, .354)),
      Bar(barRectInPercent: const Rect.fromLTRB(.681, .17, .826, .354)),
      Bar(barRectInPercent: const Rect.fromLTRB(.826, .17, .934, .354)),

      Bar(barRectInPercent: const Rect.fromLTRB(.185, .407, .329, .59)),
      Bar(barRectInPercent: const Rect.fromLTRB(.329, .407, .484, .59)),
      Bar(barRectInPercent: const Rect.fromLTRB(.484, .407, .624, .59)),
      Bar(barRectInPercent: const Rect.fromLTRB(.624, .407, .769, .59)),
      Bar(barRectInPercent: const Rect.fromLTRB(.769, .407, .931, .59)),

      Bar(barRectInPercent: const Rect.fromLTRB(.183, .639, .323, .835)),
      Bar(barRectInPercent: const Rect.fromLTRB(.323, .639, .484, .835)),
      Bar(barRectInPercent: const Rect.fromLTRB(.484, .639, .637, .835)),
      Bar(barRectInPercent: const Rect.fromLTRB(.637, .639, .789, .835)),
      Bar(barRectInPercent: const Rect.fromLTRB(.789, .639, .929, .835)),
    ]),

    // 79
    MusicPage(8, [
      Bar(barRectInPercent: const Rect.fromLTRB(.179, .168, .334, .351)),
      Bar(barRectInPercent: const Rect.fromLTRB(.334, .168, .502, .351)),
      Bar(barRectInPercent: const Rect.fromLTRB(.502, .168, .645, .351)),
      Bar(barRectInPercent: const Rect.fromLTRB(.645, .168, .781, .351)),
      Bar(barRectInPercent: const Rect.fromLTRB(.781, .168, .932, .351)),

      Bar(barRectInPercent: const Rect.fromLTRB(.185, .402, .338, .593)),
      Bar(barRectInPercent: const Rect.fromLTRB(.338, .402, .495, .593)),
      Bar(barRectInPercent: const Rect.fromLTRB(.495, .402, .653, .593)),
      Bar(barRectInPercent: const Rect.fromLTRB(.653, .402, .789, .593)),
      Bar(barRectInPercent: const Rect.fromLTRB(.789, .402, .931, .593)),

      Bar(barRectInPercent: const Rect.fromLTRB(.181, .649, .325, .847)),
      Bar(barRectInPercent: const Rect.fromLTRB(.325, .649, .484, .847)),
      Bar(barRectInPercent: const Rect.fromLTRB(.484, .649, .628, .847)),
      Bar(barRectInPercent: const Rect.fromLTRB(.628, .649, .769, .847)),
      Bar(barRectInPercent: const Rect.fromLTRB(.769, .649, .932, .847)),
    ]),

    MusicPage(9, [
      Bar(barRectInPercent: const Rect.fromLTRB(.177, .171, .338, .338)),
      Bar(barRectInPercent: const Rect.fromLTRB(.338, .171, .507, .338)),
      Bar(barRectInPercent: const Rect.fromLTRB(.507, .171, .67, .338)),
      Bar(barRectInPercent: const Rect.fromLTRB(.67, .171, .803, .338)),
      Bar(barRectInPercent: const Rect.fromLTRB(.803, .171, .932, .338)),

      Bar(barRectInPercent: const Rect.fromLTRB(.177, .409, .369, .58)),
      Bar(barRectInPercent: const Rect.fromLTRB(.369, .409, .577, .58)),
      Bar(barRectInPercent: const Rect.fromLTRB(.577, .409, .754, .58)),
      Bar(barRectInPercent: const Rect.fromLTRB(.754, .409, .931, .58)),

      Bar(barRectInPercent: const Rect.fromLTRB(.173, .658, .389, .833)),
      Bar(barRectInPercent: const Rect.fromLTRB(.389, .658, .575, .833)),
      Bar(barRectInPercent: const Rect.fromLTRB(.575, .658, .744, .833)),
      Bar(barRectInPercent: const Rect.fromLTRB(.744, .658, .931, .833)),
    ]),

    MusicPage(10, [
      Bar(barRectInPercent: const Rect.fromLTRB(.177, .182, .302, .337)),
      Bar(barRectInPercent: const Rect.fromLTRB(.302, .182, .426, .337)),
      Bar(barRectInPercent: const Rect.fromLTRB(.426, .182, .544, .337)),
      Bar(barRectInPercent: const Rect.fromLTRB(.544, .182, .667, .337)),
      Bar(barRectInPercent: const Rect.fromLTRB(.667, .182, .794, .337)),
      Bar(barRectInPercent: const Rect.fromLTRB(.794, .182, .929, .337)),

      Bar(barRectInPercent: const Rect.fromLTRB(.175, .42, .313, .563)),
      Bar(barRectInPercent: const Rect.fromLTRB(.313, .42, .445, .563)),
      Bar(barRectInPercent: const Rect.fromLTRB(.445, .42, .571, .563)),
      Bar(barRectInPercent: const Rect.fromLTRB(.571, .42, .692, .563)),
      Bar(barRectInPercent: const Rect.fromLTRB(.692, .42, .808, .563)),
      Bar(barRectInPercent: const Rect.fromLTRB(.808, .42, .931, .563)),

      Bar(barRectInPercent: const Rect.fromLTRB(.177, .657, .306, .812)),
      Bar(barRectInPercent: const Rect.fromLTRB(.306, .657, .424, .812)),
      Bar(barRectInPercent: const Rect.fromLTRB(.424, .657, .566, .812)),
      Bar(barRectInPercent: const Rect.fromLTRB(.566, .657, .690, .812)),
      Bar(barRectInPercent: const Rect.fromLTRB(.690, .657, .812, .812)),
      Bar(barRectInPercent: const Rect.fromLTRB(.812, .657, .934, .812)),
    ]),

    // 82
    MusicPage(11, [
      Bar(barRectInPercent: const Rect.fromLTRB(.179, .183, .306, .328)),
      Bar(barRectInPercent: const Rect.fromLTRB(.306, .183, .442, .328)),
      Bar(barRectInPercent: const Rect.fromLTRB(.442, .183, .573, .328)),
      Bar(barRectInPercent: const Rect.fromLTRB(.573, .183, .702, .328)),
      Bar(barRectInPercent: const Rect.fromLTRB(.702, .183, .822, .328)),
      Bar(barRectInPercent: const Rect.fromLTRB(.822, .183, .932, .328)),

      Bar(barRectInPercent: const Rect.fromLTRB(.181, .415, .311, .579)),
      Bar(barRectInPercent: const Rect.fromLTRB(.311, .415, .439, .579)),
      Bar(barRectInPercent: const Rect.fromLTRB(.439, .415, .552, .579)),
      Bar(barRectInPercent: const Rect.fromLTRB(.552, .415, .686, .579)),
      Bar(barRectInPercent: const Rect.fromLTRB(.686, .415, .812, .579)),
      Bar(barRectInPercent: const Rect.fromLTRB(.812, .415, .931, .579)),

      Bar(barRectInPercent: const Rect.fromLTRB(.179, .671, .3, .826)),
      Bar(barRectInPercent: const Rect.fromLTRB(.3, .671, .433, .826)),
      Bar(barRectInPercent: const Rect.fromLTRB(.433, .671, .556, .826)),
      Bar(barRectInPercent: const Rect.fromLTRB(.556, .671, .667, .826)),
      Bar(barRectInPercent: const Rect.fromLTRB(.667, .671, .798, .826)),
      Bar(barRectInPercent: const Rect.fromLTRB(.798, .671, .929, .826)),
    ]),

    MusicPage(12, [
      Bar(barRectInPercent: const Rect.fromLTRB(.177, .192, .309, .347)),
      Bar(barRectInPercent: const Rect.fromLTRB(.309, .192, .437, .347)),
      Bar(barRectInPercent: const Rect.fromLTRB(.437, .192, .557, .347)),
      Bar(barRectInPercent: const Rect.fromLTRB(.557, .192, .674, .347)),
      Bar(barRectInPercent: const Rect.fromLTRB(.674, .192, .806, .347)),
      Bar(barRectInPercent: const Rect.fromLTRB(.806, .192, .925, .347)),

      Bar(barRectInPercent: const Rect.fromLTRB(.179, .435, .3, .578)),
      Bar(barRectInPercent: const Rect.fromLTRB(.3, .435, .412, .578)),
      Bar(barRectInPercent: const Rect.fromLTRB(.412, .435, .525, .578)),
      Bar(barRectInPercent: const Rect.fromLTRB(.525, .435, .644, .578)),
      Bar(barRectInPercent: const Rect.fromLTRB(.644, .435, .789, .578)),
      Bar(barRectInPercent: const Rect.fromLTRB(.789, .435, .927, .578)),

      Bar(barRectInPercent: const Rect.fromLTRB(.177, .664, .3, .833)),
      Bar(barRectInPercent: const Rect.fromLTRB(.3, .664, .418, .833)),
      Bar(barRectInPercent: const Rect.fromLTRB(.418, .664, .534, .833)),
      Bar(barRectInPercent: const Rect.fromLTRB(.534, .664, .658, .833)),
      Bar(barRectInPercent: const Rect.fromLTRB(.658, .664, .794, .833)),
      Bar(barRectInPercent: const Rect.fromLTRB(.794, .664, .929, .833)),
    ]),

    MusicPage(13, [
      Bar(barRectInPercent: const Rect.fromLTRB(.181, .177, .336, .343)),
      Bar(barRectInPercent: const Rect.fromLTRB(.336, .177, .529, .343)),
      Bar(barRectInPercent: const Rect.fromLTRB(.529, .177, .653, .343)),
      Bar(barRectInPercent: const Rect.fromLTRB(.653, .177, .791, .343)),
      Bar(barRectInPercent: const Rect.fromLTRB(.791, .177, .929, .343)),

      Bar(barRectInPercent: const Rect.fromLTRB(.181, .418, .341, .592)),
      Bar(barRectInPercent: const Rect.fromLTRB(.341, .418, .488, .592)),
      Bar(barRectInPercent: const Rect.fromLTRB(.488, .418, .63, .592)),
      Bar(barRectInPercent: const Rect.fromLTRB(.63, .418, .764, .592)),
      Bar(barRectInPercent: const Rect.fromLTRB(.764, .418, .932, .592)),

      Bar(barRectInPercent: const Rect.fromLTRB(.183, .668, .341, .835)),
      Bar(barRectInPercent: const Rect.fromLTRB(.341, .668, .478, .835)),
      Bar(barRectInPercent: const Rect.fromLTRB(.478, .668, .631, .835)),
      Bar(barRectInPercent: const Rect.fromLTRB(.631, .668, .798, .835)),
      Bar(barRectInPercent: const Rect.fromLTRB(.798, .668, .931, .835)),
    ]),

    MusicPage(14, [
      Bar(barRectInPercent: const Rect.fromLTRB(.191, .18, .295, .352)),
      Bar(barRectInPercent: const Rect.fromLTRB(.295, .18, .403, .352)),
      Bar(barRectInPercent: const Rect.fromLTRB(.403, .18, .534, .352)),
      Bar(barRectInPercent: const Rect.fromLTRB(.534, .18, .655, .352)),
      Bar(barRectInPercent: const Rect.fromLTRB(.655, .18, .798, .352)),
      Bar(barRectInPercent: const Rect.fromLTRB(.798, .18, .927, .352)),

      Bar(barRectInPercent: const Rect.fromLTRB(.185, .414, .331, .569)),
      Bar(barRectInPercent: const Rect.fromLTRB(.331, .414, .449, .569)),
      Bar(barRectInPercent: const Rect.fromLTRB(.449, .414, .573, .569)),
      Bar(barRectInPercent: const Rect.fromLTRB(.573, .414, .7, .569)),
      Bar(barRectInPercent: const Rect.fromLTRB(.7, .414, .881, .569)),

      Bar(barRectInPercent: const Rect.fromLTRB(.157, .626, .329, .825)),
      Bar(barRectInPercent: const Rect.fromLTRB(.329, .626, .484, .825)),
      Bar(barRectInPercent: const Rect.fromLTRB(.484, .626, .628, .825)),
      Bar(barRectInPercent: const Rect.fromLTRB(.628, .626, .777, .825)),
      Bar(barRectInPercent: const Rect.fromLTRB(.777, .626, .932, .825)),
    ]),

    // 86
    MusicPage(15, [
      Bar(barRectInPercent: const Rect.fromLTRB(.166, .167, .315, .353)),
      Bar(barRectInPercent: const Rect.fromLTRB(.315, .167, .474, .353)),
      Bar(barRectInPercent: const Rect.fromLTRB(.474, .167, .644, .353)),
      Bar(barRectInPercent: const Rect.fromLTRB(.644, .167, .787, .353)),
      Bar(barRectInPercent: const Rect.fromLTRB(.787, .167, .934, .353)),

      Bar(barRectInPercent: const Rect.fromLTRB(.162, .398, .309, .593)),
      Bar(barRectInPercent: const Rect.fromLTRB(.309, .398, .476, .593)),
      Bar(barRectInPercent: const Rect.fromLTRB(.476, .398, .622, .593)),
      Bar(barRectInPercent: const Rect.fromLTRB(.622, .398, .783, .593)),
      Bar(barRectInPercent: const Rect.fromLTRB(.783, .398, .932, .593)),

      Bar(barRectInPercent: const Rect.fromLTRB(.157, .638, .35, .832)),
      Bar(barRectInPercent: const Rect.fromLTRB(.35, .638, .49, .832)),
      Bar(barRectInPercent: const Rect.fromLTRB(.49, .638, .647, .832)),
      Bar(barRectInPercent: const Rect.fromLTRB(.647, .638, .773, .832)),
      Bar(barRectInPercent: const Rect.fromLTRB(.773, .638, .929, .832)),
    ]),

    MusicPage(16, [
      Bar(barRectInPercent: const Rect.fromLTRB(.164, .167, .302, .362)),
      Bar(barRectInPercent: const Rect.fromLTRB(.302, .167, .456, .362)),
      Bar(barRectInPercent: const Rect.fromLTRB(.456, .167, .605, .362)),
      Bar(barRectInPercent: const Rect.fromLTRB(.605, .167, .777, .362)),
      Bar(barRectInPercent: const Rect.fromLTRB(.777, .167, .936, .362)),

      Bar(barRectInPercent: const Rect.fromLTRB(.156, .409, .323, .598)),
      Bar(barRectInPercent: const Rect.fromLTRB(.323, .409, .469, .598)),
      Bar(barRectInPercent: const Rect.fromLTRB(.469, .409, .633, .598)),
      Bar(barRectInPercent: const Rect.fromLTRB(.633, .409, .773, .598)),
      Bar(barRectInPercent: const Rect.fromLTRB(.773, .409, .932, .598)),

      Bar(barRectInPercent: const Rect.fromLTRB(.154, .657, .304, .831)),
      Bar(barRectInPercent: const Rect.fromLTRB(.304, .657, .461, .831)),
      Bar(barRectInPercent: const Rect.fromLTRB(.461, .657, .628, .831)),
      Bar(barRectInPercent: const Rect.fromLTRB(.628, .657, .781, .831)),
      Bar(barRectInPercent: const Rect.fromLTRB(.781, .657, .936, .831)),
    ]),

    MusicPage(17, [
      Bar(barRectInPercent: const Rect.fromLTRB(.162, .166, .321, .342)),
      Bar(barRectInPercent: const Rect.fromLTRB(.321, .166, .486, .342)),
      Bar(barRectInPercent: const Rect.fromLTRB(.486, .166, .647, .342)),
      Bar(barRectInPercent: const Rect.fromLTRB(.647, .166, .796, .342)),
      Bar(barRectInPercent: const Rect.fromLTRB(.796, .166, .932, .342)),

      Bar(barRectInPercent: const Rect.fromLTRB(.156, .388, .332, .583)),
      Bar(barRectInPercent: const Rect.fromLTRB(.332, .388, .492, .583)),
      Bar(barRectInPercent: const Rect.fromLTRB(.492, .388, .637, .583)),
      Bar(barRectInPercent: const Rect.fromLTRB(.637, .388, .771, .583)),
      Bar(barRectInPercent: const Rect.fromLTRB(.771, .388, .931, .583)),

      Bar(barRectInPercent: const Rect.fromLTRB(.154, .643, .311, .83)),
      Bar(barRectInPercent: const Rect.fromLTRB(.311, .643, .455, .83)),
      Bar(barRectInPercent: const Rect.fromLTRB(.455, .643, .614, .83)),
      Bar(barRectInPercent: const Rect.fromLTRB(.614, .643, .781, .83)),
      Bar(barRectInPercent: const Rect.fromLTRB(.781, .643, .927, .83)),
    ]),

    // 89
    MusicPage(18, [
      Bar(barRectInPercent: const Rect.fromLTRB(.173, .057, .321, .278)),
      Bar(barRectInPercent: const Rect.fromLTRB(.321, .057, .468, .278)),
      Bar(barRectInPercent: const Rect.fromLTRB(.468, .057, .603, .278)),
      Bar(barRectInPercent: const Rect.fromLTRB(.603, .057, .765, .278)),
      Bar(barRectInPercent: const Rect.fromLTRB(.765, .057, .905, .278)),

      Bar(barRectInPercent: const Rect.fromLTRB(.174, .336, .315, .582)),
      Bar(barRectInPercent: const Rect.fromLTRB(.315, .336, .455, .582)),
      Bar(barRectInPercent: const Rect.fromLTRB(.455, .336, .618, .582)),
      Bar(barRectInPercent: const Rect.fromLTRB(.618, .336, .765, .582)),
      Bar(barRectInPercent: const Rect.fromLTRB(.765, .336, .908, .582)),

      Bar(barRectInPercent: const Rect.fromLTRB(.167, .657, .321, .921)),
      Bar(barRectInPercent: const Rect.fromLTRB(.321, .657, .467, .921)),
      Bar(barRectInPercent: const Rect.fromLTRB(.467, .657, .62, .921)),
      Bar(barRectInPercent: const Rect.fromLTRB(.62, .657, .767, .921)),
      Bar(barRectInPercent: const Rect.fromLTRB(.767, .657, .911, .921)),
    ]),

    MusicPage(19, [
      Bar(barRectInPercent: const Rect.fromLTRB(.177, .008, .329, .327)),
      Bar(barRectInPercent: const Rect.fromLTRB(.329, .008, .465, .327)),
      Bar(barRectInPercent: const Rect.fromLTRB(.465, .008, .624, .327)),
      Bar(barRectInPercent: const Rect.fromLTRB(.624, .008, .753, .327)),
      Bar(barRectInPercent: const Rect.fromLTRB(.753, .008, .906, .327)),

      Bar(barRectInPercent: const Rect.fromLTRB(.174, .334, .309, .64)),
      Bar(barRectInPercent: const Rect.fromLTRB(.309, .334, .446, .64)),
      Bar(barRectInPercent: const Rect.fromLTRB(.446, .334, .606, .64)),
      Bar(barRectInPercent: const Rect.fromLTRB(.606, .334, .759, .64)),
      Bar(barRectInPercent: const Rect.fromLTRB(.759, .334, .906, .64)),

      Bar(barRectInPercent: const Rect.fromLTRB(.174, .7, .324, .917)),
      Bar(barRectInPercent: const Rect.fromLTRB(.324, .7, .464, .917)),
      Bar(barRectInPercent: const Rect.fromLTRB(.464, .7, .644, .917)),
      Bar(barRectInPercent: const Rect.fromLTRB(.644, .7, .765, .917)),
      Bar(barRectInPercent: const Rect.fromLTRB(.765, .7, .915, .917)),
    ]),

    // 91
    MusicPage(20, [
      Bar(barRectInPercent: const Rect.fromLTRB(.182, .074, .341, .32)),
      Bar(barRectInPercent: const Rect.fromLTRB(.341, .074, .468, .32)),
      Bar(barRectInPercent: const Rect.fromLTRB(.468, .074, .597, .32)),
      Bar(barRectInPercent: const Rect.fromLTRB(.597, .074, .743, .32)),
      Bar(barRectInPercent: const Rect.fromLTRB(.743, .074, .908, .32)),

      Bar(barRectInPercent: const Rect.fromLTRB(.174, .401, .343, .616)),
      Bar(barRectInPercent: const Rect.fromLTRB(.343, .401, .465, .616)),
      Bar(barRectInPercent: const Rect.fromLTRB(.465, .401, .62, .616)),
      Bar(barRectInPercent: const Rect.fromLTRB(.62, .401, .774, .616)),
      Bar(barRectInPercent: const Rect.fromLTRB(.774, .401, .909, .616)),

      Bar(barRectInPercent: const Rect.fromLTRB(.174, .7, .318, .919)),
      Bar(barRectInPercent: const Rect.fromLTRB(.318, .7, .443, .919)),
      Bar(barRectInPercent: const Rect.fromLTRB(.443, .7, .761, .919)),
      Bar(barRectInPercent: const Rect.fromLTRB(.761, .7, .909, .919)),
    ]),

    MusicPage(21,[
      Bar(barRectInPercent: const Rect.fromLTRB(.182, .075, .338, .322)),
      Bar(barRectInPercent: const Rect.fromLTRB(.338, .075, .47, .322)),
      Bar(barRectInPercent: const Rect.fromLTRB(.47, .075, .6, .322)),
      Bar(barRectInPercent: const Rect.fromLTRB(.6, .075, .741, .322)),
      Bar(barRectInPercent: const Rect.fromLTRB(.741, .075, .908, .322)),

      Bar(barRectInPercent: const Rect.fromLTRB(.179, .403, .343, .616)),
      Bar(barRectInPercent: const Rect.fromLTRB(.343, .403, .468, .616)),
      Bar(barRectInPercent: const Rect.fromLTRB(.468, .403, .618, .616)),
      Bar(barRectInPercent: const Rect.fromLTRB(.618, .403, .771, .616)),
      Bar(barRectInPercent: const Rect.fromLTRB(.771, .403, .906, .616)),

      Bar(barRectInPercent: const Rect.fromLTRB(.174, .7, .315, .921)),
      Bar(barRectInPercent: const Rect.fromLTRB(.315, .7, .444, .921)),
      Bar(barRectInPercent: const Rect.fromLTRB(.444, .7, .612, .921)),
      Bar(barRectInPercent: const Rect.fromLTRB(.612, .7, .761, .921)),
      Bar(barRectInPercent: const Rect.fromLTRB(.761, .7, .906, .921)),
    ]),

    MusicPage(22, [
      Bar(barRectInPercent: const Rect.fromLTRB(.176, .082, .321, .302)),
      Bar(barRectInPercent: const Rect.fromLTRB(.321, .082, .473, .302)),
      Bar(barRectInPercent: const Rect.fromLTRB(.473, .082, .648, .302)),
      Bar(barRectInPercent: const Rect.fromLTRB(.648, .082, .77, .302)),
      Bar(barRectInPercent: const Rect.fromLTRB(.77, .082, .903, .302)),

      Bar(barRectInPercent: const Rect.fromLTRB(.167, .438, .306, .616)),
      Bar(barRectInPercent: const Rect.fromLTRB(.306, .438, .462, .616)),
      Bar(barRectInPercent: const Rect.fromLTRB(.462, .438, .6, .616)),
      Bar(barRectInPercent: const Rect.fromLTRB(.6, .438, .729, .616)),
      Bar(barRectInPercent: const Rect.fromLTRB(.729, .438, .906, .616)),

      Bar(barRectInPercent: const Rect.fromLTRB(.173, .696, .341, .923)),
      Bar(barRectInPercent: const Rect.fromLTRB(.341, .696, .458, .923)),
      Bar(barRectInPercent: const Rect.fromLTRB(.458, .696, .579, .923)),
      Bar(barRectInPercent: const Rect.fromLTRB(.579, .696, .724, .923)),
      Bar(barRectInPercent: const Rect.fromLTRB(.724, .696, .911, .923)),
    ]),

    // 94
    MusicPage(23, [
      Bar(barRectInPercent: const Rect.fromLTRB(.179, .065, .312, .292)),
      Bar(barRectInPercent: const Rect.fromLTRB(.312, .065, .444, .292)),
      Bar(barRectInPercent: const Rect.fromLTRB(.444, .065, .58, .292)),
      Bar(barRectInPercent: const Rect.fromLTRB(.58, .065, .774, .292)),
      Bar(barRectInPercent: const Rect.fromLTRB(.774, .065, .905, .292)),

      Bar(barRectInPercent: const Rect.fromLTRB(.171, .374, .336, .62)),
      Bar(barRectInPercent: const Rect.fromLTRB(.336, .374, .486, .62)),
      Bar(barRectInPercent: const Rect.fromLTRB(.486, .374, .644, .62)),
      Bar(barRectInPercent: const Rect.fromLTRB(.644, .374, .767, .62)),
      Bar(barRectInPercent: const Rect.fromLTRB(.767, .374, .906, .62)),

      Bar(barRectInPercent: const Rect.fromLTRB(.165, .704, .317, .909)),
      Bar(barRectInPercent: const Rect.fromLTRB(.317, .704, .477, .909)),
      Bar(barRectInPercent: const Rect.fromLTRB(.477, .704, .624, .909)),
      Bar(barRectInPercent: const Rect.fromLTRB(.624, .704, .759, .909)),
      Bar(barRectInPercent: const Rect.fromLTRB(.759, .704, .903, .909)),
    ]),

    MusicPage(24, [
      Bar(barRectInPercent: const Rect.fromLTRB(.184, .073, .329, .28)),
      Bar(barRectInPercent: const Rect.fromLTRB(.329, .073, .483, .28)),
      Bar(barRectInPercent: const Rect.fromLTRB(.483, .073, .638, .28)),
      Bar(barRectInPercent: const Rect.fromLTRB(.638, .073, .773, .28)),
      Bar(barRectInPercent: const Rect.fromLTRB(.773, .073, .906, .28)),

      Bar(barRectInPercent: const Rect.fromLTRB(.191, .344, .344, .58)),
      Bar(barRectInPercent: const Rect.fromLTRB(.344, .344, .477, .58)),
      Bar(barRectInPercent: const Rect.fromLTRB(.477, .344, .62, .58)),
      Bar(barRectInPercent: const Rect.fromLTRB(.62, .344, .748, .58)),
      Bar(barRectInPercent: const Rect.fromLTRB(.748, .344, .906, .58)),

      Bar(barRectInPercent: const Rect.fromLTRB(.177, .661, .336, .903)),
      Bar(barRectInPercent: const Rect.fromLTRB(.336, .661, .481, .903)),
      Bar(barRectInPercent: const Rect.fromLTRB(.481, .661, .615, .903)),
      Bar(barRectInPercent: const Rect.fromLTRB(.615, .661, .755, .903)),
      Bar(barRectInPercent: const Rect.fromLTRB(.755, .661, .906, .903)),
    ]),

    // 96
    MusicPage(25, [
      Bar(barRectInPercent: const Rect.fromLTRB(.179, .076, .309, .326)),
      Bar(barRectInPercent: const Rect.fromLTRB(.309, .076, .452, .326)),
      Bar(barRectInPercent: const Rect.fromLTRB(.452, .076, .6, .326)),
      Bar(barRectInPercent: const Rect.fromLTRB(.6, .076, .75, .326)),
      Bar(barRectInPercent: const Rect.fromLTRB(.75, .076, .906, .326)),

      Bar(barRectInPercent: const Rect.fromLTRB(.203, .414, .355, .624)),
      Bar(barRectInPercent: const Rect.fromLTRB(.355, .414, .5, .624)),
      Bar(barRectInPercent: const Rect.fromLTRB(.5, .414, .644, .624)),
      Bar(barRectInPercent: const Rect.fromLTRB(.644, .414, .774, .624)),
      Bar(barRectInPercent: const Rect.fromLTRB(.774, .414, .906, .624)),

      Bar(barRectInPercent: const Rect.fromLTRB(.179, .696, .309, .921)),
      Bar(barRectInPercent: const Rect.fromLTRB(.309, .696, .473, .921)),
      Bar(barRectInPercent: const Rect.fromLTRB(.473, .696, .605, .921)),
      Bar(barRectInPercent: const Rect.fromLTRB(.605, .696, .748, .921)),
      Bar(barRectInPercent: const Rect.fromLTRB(.748, .696, .906, .921)),
    ]),
    MusicPage(26, [
      Bar(barRectInPercent: const Rect.fromLTRB(.198, .074, .327, .311)),
      Bar(barRectInPercent: const Rect.fromLTRB(.327, .074, .465, .311)),
      Bar(barRectInPercent: const Rect.fromLTRB(.465, .074, .606, .311)),
      Bar(barRectInPercent: const Rect.fromLTRB(.606, .074, .77, .311)),
      Bar(barRectInPercent: const Rect.fromLTRB(.77, .074, .902, .311)),

      Bar(barRectInPercent: const Rect.fromLTRB(.193, .391, .331, .618)),
      Bar(barRectInPercent: const Rect.fromLTRB(.331, .391, .477, .618)),
      Bar(barRectInPercent: const Rect.fromLTRB(.477, .391, .62, .618)),
      Bar(barRectInPercent: const Rect.fromLTRB(.62, .391, .752, .618)),
      Bar(barRectInPercent: const Rect.fromLTRB(.752, .391, .905, .618)),

      Bar(barRectInPercent: const Rect.fromLTRB(.193, .698, .324, .911)),
      Bar(barRectInPercent: const Rect.fromLTRB(.324, .698, .465, .911)),
      Bar(barRectInPercent: const Rect.fromLTRB(.465, .698, .611, .911)),
      Bar(barRectInPercent: const Rect.fromLTRB(.611, .698, .753, .911)),
      Bar(barRectInPercent: const Rect.fromLTRB(.753, .698, .903, .911)),
    ]),
    MusicPage(27, [
      Bar(barRectInPercent: const Rect.fromLTRB(.186, .074, .32, .324)),
      Bar(barRectInPercent: const Rect.fromLTRB(.32, .074, .444, .324)),
      Bar(barRectInPercent: const Rect.fromLTRB(.444, .074, .605, .324)),
      Bar(barRectInPercent: const Rect.fromLTRB(.605, .074, .741, .324)),
      Bar(barRectInPercent: const Rect.fromLTRB(.741, .074, .909, .324)),

      Bar(barRectInPercent: const Rect.fromLTRB(.186, .413, .321, .653)),
      Bar(barRectInPercent: const Rect.fromLTRB(.321, .413, .468, .653)),
      Bar(barRectInPercent: const Rect.fromLTRB(.468, .413, .603, .653)),
      Bar(barRectInPercent: const Rect.fromLTRB(.603, .413, .753, .653)),
      Bar(barRectInPercent: const Rect.fromLTRB(.753, .413, .912, .653)),

      Bar(barRectInPercent: const Rect.fromLTRB(.182, .725, .334, .948)),
      Bar(barRectInPercent: const Rect.fromLTRB(.334, .725, .488, .948)),
      Bar(barRectInPercent: const Rect.fromLTRB(.488, .725, .615, .948)),
      Bar(barRectInPercent: const Rect.fromLTRB(.615, .725, .75, .948)),
      Bar(barRectInPercent: const Rect.fromLTRB(.75, .725, .911, .948)),
    ]),
    // 99
    MusicPage(28, [
      Bar(barRectInPercent: const Rect.fromLTRB(.174, .084, .327, .285)),
      Bar(barRectInPercent: const Rect.fromLTRB(.327, .084, .479, .285)),
      Bar(barRectInPercent: const Rect.fromLTRB(.479, .084, .621, .285)),
      Bar(barRectInPercent: const Rect.fromLTRB(.621, .084, .765, .285)),
      Bar(barRectInPercent: const Rect.fromLTRB(.765, .084, .906, .285)),

      Bar(barRectInPercent: const Rect.fromLTRB(.173, .387, .32, .585)),
      Bar(barRectInPercent: const Rect.fromLTRB(.32, .387, .47, .585)),
      Bar(barRectInPercent: const Rect.fromLTRB(.47, .387, .606, .585)),
      Bar(barRectInPercent: const Rect.fromLTRB(.606, .387, .744, .585)),
      Bar(barRectInPercent: const Rect.fromLTRB(.744, .387, .903, .585)),

      Bar(barRectInPercent: const Rect.fromLTRB(.171, .698, .324, .911)),
      Bar(barRectInPercent: const Rect.fromLTRB(.324, .698, .468, .911)),
      Bar(barRectInPercent: const Rect.fromLTRB(.468, .698, .615, .911)),
      Bar(barRectInPercent: const Rect.fromLTRB(.615, .698, .744, .911)),
      Bar(barRectInPercent: const Rect.fromLTRB(.744, .698, .906, .911)),
    ]),
    MusicPage(29, [
      Bar(barRectInPercent: const Rect.fromLTRB(.181, .082, .321, .274)),
      Bar(barRectInPercent: const Rect.fromLTRB(.321, .082, .459, .274)),
      Bar(barRectInPercent: const Rect.fromLTRB(.459, .082, .603, .274)),
      Bar(barRectInPercent: const Rect.fromLTRB(.603, .082, .755, .274)),
      Bar(barRectInPercent: const Rect.fromLTRB(.755, .082, .903, .274)),

      Bar(barRectInPercent: const Rect.fromLTRB(.179, .385, .324, .585)),
      Bar(barRectInPercent: const Rect.fromLTRB(.324, .385, .462, .585)),
      Bar(barRectInPercent: const Rect.fromLTRB(.462, .385, .612, .585)),
      Bar(barRectInPercent: const Rect.fromLTRB(.612, .385, .738, .585)),
      Bar(barRectInPercent: const Rect.fromLTRB(.738, .385, .903, .585)),

      Bar(barRectInPercent: const Rect.fromLTRB(.182, .704, .331, .905)),
      Bar(barRectInPercent: const Rect.fromLTRB(.331, .704, .483, .905)),
      Bar(barRectInPercent: const Rect.fromLTRB(.483, .704, .629, .905)),
      Bar(barRectInPercent: const Rect.fromLTRB(.629, .704, .759, .905)),
      Bar(barRectInPercent: const Rect.fromLTRB(.759, .704, .906, .905)),
    ]),

    MusicPage(30, [
      Bar(barRectInPercent: const Rect.fromLTRB(.181, .094, .318, .317)),
      Bar(barRectInPercent: const Rect.fromLTRB(.318, .094, .479, .317)),
      Bar(barRectInPercent: const Rect.fromLTRB(.479, .094, .622, .317)),
      Bar(barRectInPercent: const Rect.fromLTRB(.622, .094, .75, .317)),
      Bar(barRectInPercent: const Rect.fromLTRB(.75, .094, .898, .317)),

      Bar(barRectInPercent: const Rect.fromLTRB(.176, .414, .327, .612)),
      Bar(barRectInPercent: const Rect.fromLTRB(.327, .414, .473, .612)),
      Bar(barRectInPercent: const Rect.fromLTRB(.473, .414, .612, .612)),
      Bar(barRectInPercent: const Rect.fromLTRB(.612, .414, .748, .612)),
      Bar(barRectInPercent: const Rect.fromLTRB(.748, .414, .9, .612)),

      Bar(barRectInPercent: const Rect.fromLTRB(.177, .715, .332, .911)),
      Bar(barRectInPercent: const Rect.fromLTRB(.332, .715, .483, .911)),
      Bar(barRectInPercent: const Rect.fromLTRB(.483, .715, .636, .911)),
      Bar(barRectInPercent: const Rect.fromLTRB(.636, .715, .759, .911)),
      Bar(barRectInPercent: const Rect.fromLTRB(.759, .715, .906, .911)),

    ]),
    MusicPage(31, [
      Bar(barRectInPercent: const Rect.fromLTRB(.181, .076, .309, .303)),
      Bar(barRectInPercent: const Rect.fromLTRB(.309, .076, .458, .303)),
      Bar(barRectInPercent: const Rect.fromLTRB(.458, .076, .627, .303)),
      Bar(barRectInPercent: const Rect.fromLTRB(.627, .076, .77, .303)),
      Bar(barRectInPercent: const Rect.fromLTRB(.77, .076, .903, .303)),

      Bar(barRectInPercent: const Rect.fromLTRB(.186, .405, .321, .618)),
      Bar(barRectInPercent: const Rect.fromLTRB(.321, .405, .453, .618)),
      Bar(barRectInPercent: const Rect.fromLTRB(.453, .405, .591, .618)),
      Bar(barRectInPercent: const Rect.fromLTRB(.591, .405, .729, .618)),
      Bar(barRectInPercent: const Rect.fromLTRB(.729, .405, .905, .618)),

      Bar(barRectInPercent: const Rect.fromLTRB(.174, .721, .291, .919)),
      Bar(barRectInPercent: const Rect.fromLTRB(.291, .721, .415, .919)),
      Bar(barRectInPercent: const Rect.fromLTRB(.415, .721, .544, .919)),
      Bar(barRectInPercent: const Rect.fromLTRB(.544, .721, .683, .919)),
      Bar(barRectInPercent: const Rect.fromLTRB(.683, .721, .794, .919)),
      Bar(barRectInPercent: const Rect.fromLTRB(.794, .721, .908, .919)),
    ]),
    // 103
    MusicPage(32, [
      Bar(barRectInPercent: const Rect.fromLTRB(.179, .102, .326, .31)),
      Bar(barRectInPercent: const Rect.fromLTRB(.326, .102, .464, .31)),
      Bar(barRectInPercent: const Rect.fromLTRB(.464, .102, .6, .31)),
      Bar(barRectInPercent: const Rect.fromLTRB(.6, .102, .746, .31)),
      Bar(barRectInPercent: const Rect.fromLTRB(.746, .102, .906, .31)),

      Bar(barRectInPercent: const Rect.fromLTRB(.179, .406, .336, .609)),
      Bar(barRectInPercent: const Rect.fromLTRB(.336, .406, .506, .609)),
      Bar(barRectInPercent: const Rect.fromLTRB(.506, .406, .641, .609)),
      Bar(barRectInPercent: const Rect.fromLTRB(.641, .406, .777, .609)),
      Bar(barRectInPercent: const Rect.fromLTRB(.777, .406, .908, .609)),

      Bar(barRectInPercent: const Rect.fromLTRB(.177, .704, .329, .915)),
      Bar(barRectInPercent: const Rect.fromLTRB(.329, .704, .459, .915)),
      Bar(barRectInPercent: const Rect.fromLTRB(.459, .704, .618, .915)),
      Bar(barRectInPercent: const Rect.fromLTRB(.618, .704, .741, .915)),
      Bar(barRectInPercent: const Rect.fromLTRB(.741, .704, .906, .915)),
    ]),
    MusicPage(33, [
      Bar(barRectInPercent: const Rect.fromLTRB(.188, .067, .324, .309)),
      Bar(barRectInPercent: const Rect.fromLTRB(.324, .067, .456, .309)),
      Bar(barRectInPercent: const Rect.fromLTRB(.456, .067, .6, .309)),
      Bar(barRectInPercent: const Rect.fromLTRB(.6, .067, .756, .309)),
      Bar(barRectInPercent: const Rect.fromLTRB(.756, .067, .909, .309)),

      Bar(barRectInPercent: const Rect.fromLTRB(.179, .382, .324, .625)),
      Bar(barRectInPercent: const Rect.fromLTRB(.324, .382, .468, .625)),
      Bar(barRectInPercent: const Rect.fromLTRB(.468, .382, .638, .625)),
      Bar(barRectInPercent: const Rect.fromLTRB(.638, .382, .784, .625)),
      Bar(barRectInPercent: const Rect.fromLTRB(.784, .382, .908, .625)),

      Bar(barRectInPercent: const Rect.fromLTRB(.177, .702, .337, .921)),
      Bar(barRectInPercent: const Rect.fromLTRB(.337, .702, .484, .921)),
      Bar(barRectInPercent: const Rect.fromLTRB(.484, .702, .629, .921)),
      Bar(barRectInPercent: const Rect.fromLTRB(.629, .702, .774, .921)),
      Bar(barRectInPercent: const Rect.fromLTRB(.774, .702, .903, .921)),
    ]),
    MusicPage(34, [
      Bar(barRectInPercent: const Rect.fromLTRB(.182, .07, .337, .301)),
      Bar(barRectInPercent: const Rect.fromLTRB(.337, .07, .473, .301)),
      Bar(barRectInPercent: const Rect.fromLTRB(.473, .07, .621, .301)),
      Bar(barRectInPercent: const Rect.fromLTRB(.621, .07, .765, .301)),
      Bar(barRectInPercent: const Rect.fromLTRB(.765, .07, .903, .301)),

      Bar(barRectInPercent: const Rect.fromLTRB(.171, .365, .348, .61)),
      Bar(barRectInPercent: const Rect.fromLTRB(.348, .365, .503, .61)),
      Bar(barRectInPercent: const Rect.fromLTRB(.503, .365, .638, .61)),
      Bar(barRectInPercent: const Rect.fromLTRB(.638, .365, .771, .61)),
      Bar(barRectInPercent: const Rect.fromLTRB(.771, .365, .906, .61)),

      Bar(barRectInPercent: const Rect.fromLTRB(.174, .682, .321, .924)),
      Bar(barRectInPercent: const Rect.fromLTRB(.321, .682, .477, .924)),
      Bar(barRectInPercent: const Rect.fromLTRB(.477, .682, .624, .924)),
      Bar(barRectInPercent: const Rect.fromLTRB(.624, .682, .755, .924)),
      Bar(barRectInPercent: const Rect.fromLTRB(.755, .682, .908, .924)),
    ]),
    // 106
    MusicPage(35, [
      Bar(barRectInPercent: const Rect.fromLTRB(.173, .084, .308, .326)),
      Bar(barRectInPercent: const Rect.fromLTRB(.308, .084, .446, .326)),
      Bar(barRectInPercent: const Rect.fromLTRB(.446, .084, .588, .326)),
      Bar(barRectInPercent: const Rect.fromLTRB(.588, .084, .738, .326)),
      Bar(barRectInPercent: const Rect.fromLTRB(.738, .084, .902, .326)),

      Bar(barRectInPercent: const Rect.fromLTRB(.174, .397, .321, .626)),
      Bar(barRectInPercent: const Rect.fromLTRB(.174, .397, .488, .626)),
      Bar(barRectInPercent: const Rect.fromLTRB(.488, .397, .634, .626)),
      Bar(barRectInPercent: const Rect.fromLTRB(.634, .397, .765, .626)),
      Bar(barRectInPercent: const Rect.fromLTRB(.765, .397, .903, .626)),

      Bar(barRectInPercent: const Rect.fromLTRB(.174, .692, .329, .921)),
      Bar(barRectInPercent: const Rect.fromLTRB(.329, .692, .434, .921)),
      Bar(barRectInPercent: const Rect.fromLTRB(.434, .692, .556, .921)),
      Bar(barRectInPercent: const Rect.fromLTRB(.556, .692, .662, .921)),
      Bar(barRectInPercent: const Rect.fromLTRB(.662, .692, .796, .921)),
      Bar(barRectInPercent: const Rect.fromLTRB(.796, .692, .909, .921)),
    ]),

    MusicPage(36, [
      Bar(barRectInPercent: const Rect.fromLTRB(.181, .084, .294, .324)),
      Bar(barRectInPercent: const Rect.fromLTRB(.294, .084, .403, .324)),
      Bar(barRectInPercent: const Rect.fromLTRB(.403, .084, .518, .324)),
      Bar(barRectInPercent: const Rect.fromLTRB(.518, .084, .644, .324)),
      Bar(barRectInPercent: const Rect.fromLTRB(.644, .084, .774, .324)),
      Bar(barRectInPercent: const Rect.fromLTRB(.774, .084, .906, .324)),

      Bar(barRectInPercent: const Rect.fromLTRB(.179, .395, .315, .636)),
      Bar(barRectInPercent: const Rect.fromLTRB(.315, .395, .484, .636)),
      Bar(barRectInPercent: const Rect.fromLTRB(.484, .395, .674, .636)),
      Bar(barRectInPercent: const Rect.fromLTRB(.674, .395, .791, .636)),
      Bar(barRectInPercent: const Rect.fromLTRB(.791, .395, .909, .636)),

      Bar(barRectInPercent: const Rect.fromLTRB(.186, .696, .311, .917)),
      Bar(barRectInPercent: const Rect.fromLTRB(.311, .696, .421, .917)),
      Bar(barRectInPercent: const Rect.fromLTRB(.421, .696, .538, .917)),
      Bar(barRectInPercent: const Rect.fromLTRB(.538, .696, .653, .917)),
      Bar(barRectInPercent: const Rect.fromLTRB(.653, .696, .774, .917)),
      Bar(barRectInPercent: const Rect.fromLTRB(.774, .696, .906, .917)),
    ]),
    MusicPage(37, [
      Bar(barRectInPercent: const Rect.fromLTRB(.186, .059, .324, .258)),
      Bar(barRectInPercent: const Rect.fromLTRB(.324, .059, .464, .258)),
      Bar(barRectInPercent: const Rect.fromLTRB(.464, .059, .606, .258)),
      Bar(barRectInPercent: const Rect.fromLTRB(.606, .059, .748, .258)),
      Bar(barRectInPercent: const Rect.fromLTRB(.748, .059, .903, .258)),

      Bar(barRectInPercent: const Rect.fromLTRB(.182, .338, .327, .561)),
      Bar(barRectInPercent: const Rect.fromLTRB(.327, .338, .468, .561)),
      Bar(barRectInPercent: const Rect.fromLTRB(.468, .338, .606, .561)),
      Bar(barRectInPercent: const Rect.fromLTRB(.606, .338, .748, .561)),
      Bar(barRectInPercent: const Rect.fromLTRB(.748, .338, .905, .561)),

      Bar(barRectInPercent: const Rect.fromLTRB(.177, .625, .299, .885)),
      Bar(barRectInPercent: const Rect.fromLTRB(.299, .625, .429, .885)),
      Bar(barRectInPercent: const Rect.fromLTRB(.429, .625, .559, .885)),
      Bar(barRectInPercent: const Rect.fromLTRB(.559, .625, .688, .885)),
      Bar(barRectInPercent: const Rect.fromLTRB(.688, .625, .826, .885)),
      Bar(halfBar: true, barRectInPercent: const Rect.fromLTRB(.826, .625, .902, .885)),
    ]),
  ];
}

List<Bar> makeBars(int barCount) {
  var bars = <Bar>[];
  for (int i = 0; i < barCount; i++) {
    var lastBar = i == barCount - 1;
    bars.add(Bar(
      lastBarInPage: lastBar,
    ));
  }
  return bars;
}
