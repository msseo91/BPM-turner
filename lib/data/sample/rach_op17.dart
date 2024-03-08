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
      Bar(barRectInPercent: const Rect.fromLTRB(0.159, 0.154, 0.335, 0.325)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.335, 0.154, 0.544, 0.325)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.544, 0.154, 0.683, 0.325)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.683, 0.154, 0.822, 0.325)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.822, 0.154, 0.931, 0.325)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.822, 0.154, 0.931, 0.325)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.156, 0.385, 0.31, 0.578)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.31, 0.385, 0.452, 0.578)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.452, 0.385, 0.586, 0.578)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.586, 0.385, 0.753, 0.578)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.753, 0.385, 0.931, 0.578)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.31, 0.82, 0.485, 0.823)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.485, 0.82, 0.65, 0.823)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.65, 0.82, 0.781, 0.823)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.781, 0.82, 0.926, 0.823)),
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

    MusicPage(18, makeBars(15)),
    MusicPage(19, makeBars(15)),
    MusicPage(20, makeBars(15)),
    MusicPage(21, makeBars(15)),
    MusicPage(22, makeBars(15)),
    MusicPage(23, makeBars(15)),
    MusicPage(24, makeBars(15)),
    MusicPage(25, makeBars(15)),
    MusicPage(26, makeBars(15)),
    MusicPage(27, makeBars(15)),
    MusicPage(28, makeBars(15)),
    MusicPage(29, makeBars(15)),
    MusicPage(30, makeBars(15)),
    MusicPage(31, makeBars(16)),
    MusicPage(32, makeBars(15)),
    MusicPage(33, makeBars(15)),
    MusicPage(34, makeBars(15)),
    MusicPage(35, makeBars(16)),
    MusicPage(36, makeBars(17)),
    MusicPage(37, makeBars(16)),
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
