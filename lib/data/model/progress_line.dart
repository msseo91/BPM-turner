import 'package:equatable/equatable.dart';

class ProgressLine extends Equatable {
  final double left;
  final double top;
  final double height;

  const ProgressLine({required this.left, required this.top, required this.height});

  @override
  List<Object?> get props => [left, top, height];

  static ProgressLine initial() {
    return const ProgressLine(left: 0, top: 0, height: 0);
  }
}
