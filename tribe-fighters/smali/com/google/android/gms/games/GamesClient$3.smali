.class Lcom/google/android/gms/games/GamesClient$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/a$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/games/GamesClient;->loadPlayerCenteredScores(Lcom/google/android/gms/games/leaderboard/OnLeaderboardScoresLoadedListener;Ljava/lang/String;IIIZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/common/api/a$c",
        "<",
        "Lcom/google/android/gms/games/leaderboard/h$c;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic qo:Lcom/google/android/gms/games/GamesClient;

.field final synthetic qp:Lcom/google/android/gms/games/leaderboard/OnLeaderboardScoresLoadedListener;


# direct methods
.method constructor <init>(Lcom/google/android/gms/games/GamesClient;Lcom/google/android/gms/games/leaderboard/OnLeaderboardScoresLoadedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/games/GamesClient$3;->qo:Lcom/google/android/gms/games/GamesClient;

    iput-object p2, p0, Lcom/google/android/gms/games/GamesClient$3;->qp:Lcom/google/android/gms/games/leaderboard/OnLeaderboardScoresLoadedListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/games/leaderboard/h$c;)V
    .locals 4

    invoke-interface {p1}, Lcom/google/android/gms/games/leaderboard/h$c;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/Status;->getStatusCode()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/games/GamesClient$3;->qp:Lcom/google/android/gms/games/leaderboard/OnLeaderboardScoresLoadedListener;

    invoke-interface {p1}, Lcom/google/android/gms/games/leaderboard/h$c;->cO()Lcom/google/android/gms/games/leaderboard/Leaderboard;

    move-result-object v2

    invoke-interface {p1}, Lcom/google/android/gms/games/leaderboard/h$c;->cP()Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;

    move-result-object v3

    invoke-interface {v1, v0, v2, v3}, Lcom/google/android/gms/games/leaderboard/OnLeaderboardScoresLoadedListener;->onLeaderboardScoresLoaded(ILcom/google/android/gms/games/leaderboard/Leaderboard;Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;)V

    return-void
.end method

.method public bridge synthetic a(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/games/leaderboard/h$c;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/games/GamesClient$3;->a(Lcom/google/android/gms/games/leaderboard/h$c;)V

    return-void
.end method
