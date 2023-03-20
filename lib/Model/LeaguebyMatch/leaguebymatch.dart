

import '../FutureMatch/futurematch.dart';
import '../LiveMatch/livematch2.dart';
import '../Recentmatch/recentmatch.dart';

class Leaguematch {
  Leaguematch({
    this.leagueid,
    this.allmatch,
  });

  int? leagueid;
  List<LiveMatch2>? allmatch;
}


class RecentLeaguematch {
  RecentLeaguematch({
    this.leagueid,
    this.allmatch,
  });

  int? leagueid;
  List<RecentMatch>? allmatch;
}

class FutureLeaguematch {
  FutureLeaguematch({
    this.leagueid,
    this.allmatch,
  });

  int? leagueid;
  List<FutureMatch>? allmatch;
}