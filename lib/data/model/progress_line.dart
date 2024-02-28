import 'package:equatable/equatable.dart';

class ProgressLine extends Equatable {
  final int left;
  final int top;
  final int height;

  const ProgressLine({required this.left, required this.top, required this.height});

  @override
  List<Object?> get props => [left, top, height];

  static ProgressLine initial() {
    return const ProgressLine(left: 0, top: 0, height: 0);
  }
}
