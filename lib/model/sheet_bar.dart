class Bar {
  (int, int) timeSignature;

  /// Ritardando 같이 특수한 temp parameter.
  /// 0은 그대로, 양수 일때 점점 빠르게, 음수일때 점점 느리게
  int tempoParam;

  /// 페이지의 첫 마디인지 여부
  bool firstBarInPage;

  Bar(this.timeSignature, {
    this.tempoParam = 0,
    this.firstBarInPage = false
  });
}