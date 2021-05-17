.class Lcom/google/android/gms/games/GamesClient$35;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/a$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/games/GamesClient;->loadCurrentPlayerLeaderboardScore(Lcom/google/android/gms/games/leaderboard/OnPlayerLeaderboardScoreLoadedListener;Ljava/lang/String;II)V
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
        "Lcom/google/android/gms/games/leaderboard/h$b;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic qE:Lcom/google/android/gms/games/leaderboard/OnPlayerLeaderboardScoreLoadedListener;

.field final synthetic qo:Lcom/google/android/gms/games/GamesClient;


# direct methods
.method constructor <init>(Lcom/google/android/gms/games/GamesClient;Lcom/google/android/gms/games/leaderboard/OnPlayerLeaderboardScoreLoadedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/games/GamesClient$35;->qo:Lcom/google/android/gms/games/GamesClient;

    iput-object p2, p0, Lcom/google/android/gms/games/GamesClient$35;->qE:Lcom/google/android/gms/games/leaderboard/OnPlayerLeaderboardScoreLoadedListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/games/leaderboard/h$b;)V
    .locals 3

    invoke-interface {p1}, Lcom/google/android/gms/games/leaderboard/h$b;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/Status;->getStatusCode()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/games/GamesClient$35;->qE:Lcom/google/android/gms/games/leaderboard/OnPlayerLeaderboardScoreLoadedListener;

    invoke-interface {p1}, Lcom/google/android/gms/games/leaderboard/h$b;->cR()Lcom/google/android/gms/games/leaderboard/LeaderboardScore;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Lcom/google/android/gms/games/leaderboard/OnPlayerLeaderboardScoreLoadedListener;->onPlayerLeaderboardScoreLoaded(ILcom/google/android/gms/games/leaderboard/LeaderboardScore;)V

    return-void
.end method

.method public bridge synthetic a(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/games/leaderboard/h$b;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/games/GamesClient$35;->a(Lcom/google/android/gms/games/leaderboard/h$b;)V

    return-void
.end method
