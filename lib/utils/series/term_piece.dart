class TermPiece {
  String _string;
  Function(int) _func;

  TermPiece(this._string, this._func);

  dynamic compute(int n, bool noCompute) {
    if (noCompute) {
      return _string;
    } else {
      return _func(n);
    }
  }

  @override
  String toString() {
    return _string;
  }
}
