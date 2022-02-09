import 'package:flutter/cupertino.dart';
import 'package:flutter_game_sample/src/game_internals/board_setting.dart';

@immutable
class Score {
  final int score;

  final Duration duration;

  factory Score(BoardSetting setting, int aiDifficulty, Duration duration) {
    var score = setting.m * setting.n * setting.k;
    score *= aiDifficulty;
    score *= 10000 ~/ (duration.inSeconds.abs() + 1);
    return Score._(score, duration);
  }

  String get formattedTime {
    final buf = StringBuffer();
    if (duration.inHours > 0) {
      buf.write('${duration.inHours}');
      buf.write(':');
    }
    final minutes = duration.inMinutes % Duration.minutesPerHour;
    if (minutes > 9) {
      buf.write('$minutes');
    } else {
      buf.write('0');
      buf.write('$minutes');
    }
    buf.write(':');
    buf.write((duration.inSeconds % Duration.secondsPerMinute)
        .toString()
        .padLeft(2, '0'));
    return buf.toString();
  }

  const Score._(this.score, this.duration);
}