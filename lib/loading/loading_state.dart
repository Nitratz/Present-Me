import 'package:meta/meta.dart';

@immutable
class LoadingState {
  final bool isLoading;

  LoadingState({this.isLoading});

  LoadingState copyWith({
    bool isLoading,
  }) {
    return new LoadingState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  factory LoadingState.initial() {
    return new LoadingState(isLoading: false);
  }
}
