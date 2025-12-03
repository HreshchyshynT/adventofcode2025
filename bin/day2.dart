void day2() {
  final input = _input
      .split(",")
      .map((s) => s.split("-"))
      .map((split) => (int.parse(split.first), int.parse(split.last)))
      .toList();
  int result1 = 0;
  int result2 = 0;
  for (final pair in input) {
    for (int i = pair.$1; i <= pair.$2; i++) {
      result1 += _hasRepeats(2, i) ? i : 0;
      final str = i.toString();
      for (int j = 2; j <= str.length; j++) {
        if (_hasRepeats(j, i)) {
          result2 += i;
          break;
        }
      }
    }
  }
  print("day 2 result1: $result1 result2: $result2");
}

bool _hasRepeats(int times, int num) {
  final str = num.toString();
  if (str.length % times != 0) return false;
  int l = 0;
  int r = str.length ~/ times;
  while (r < str.length) {
    if (str[l] != str[r]) return false;
    l++;
    r++;
  }
  return true;
}

final _testInput =
    "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124";
final _input =
    "12077-25471,4343258-4520548,53-81,43661-93348,6077-11830,2121124544-2121279534,631383-666113,5204516-5270916,411268-591930,783-1147,7575717634-7575795422,8613757494-8613800013,4-19,573518173-573624458,134794-312366,18345305-18402485,109442-132958,59361146-59451093,1171-2793,736409-927243,27424-41933,93-216,22119318-22282041,2854-4778,318142-398442,9477235089-9477417488,679497-734823,28-49,968753-1053291,267179606-267355722,326-780,1533294120-1533349219";
