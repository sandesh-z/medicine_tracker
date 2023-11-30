bool canCheck({required DateTime oldTime, required DateTime currentTime}) {
  int difference = ((oldTime.minute - currentTime.minute).abs());
  bool sameHour() => (oldTime.hour == currentTime.hour);

  if (difference <= 5 && sameHour()) {
    return true;
  }
  return false;
}
