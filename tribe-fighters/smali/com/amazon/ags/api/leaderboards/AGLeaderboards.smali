.class public Lcom/amazon/ags/api/leaderboards/AGLeaderboards;
.super Ljava/lang/Object;
.source "AGLeaderboards.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    return-void
.end method

.method public static varargs getLeaderboards([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
    .locals 3
    .param p0, "userData"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<",
            "Lcom/amazon/ags/api/leaderboards/GetLeaderboardsResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 47
    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->getInstance()Lcom/amazon/ags/api/AmazonGames;

    move-result-object v0

    .line 48
    .local v0, "client":Lcom/amazon/ags/api/AmazonGames;
    invoke-interface {v0}, Lcom/amazon/ags/api/AmazonGames;->getLeaderboardsClient()Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;

    move-result-object v1

    .line 50
    .local v1, "leaderboardsClient":Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;
    invoke-interface {v1, p0}, Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;->getLeaderboards([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v2

    return-object v2
.end method

.method public static varargs getLeaderboards(Lcom/amazon/ags/api/AGResponseCallback;[Ljava/lang/Object;)V
    .locals 3
    .param p1, "userData"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/api/AGResponseCallback",
            "<",
            "Lcom/amazon/ags/api/leaderboards/GetLeaderboardsResponse;",
            ">;[",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 32
    .local p0, "callback":Lcom/amazon/ags/api/AGResponseCallback;, "Lcom/amazon/ags/api/AGResponseCallback<Lcom/amazon/ags/api/leaderboards/GetLeaderboardsResponse;>;"
    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->getInstance()Lcom/amazon/ags/api/AmazonGames;

    move-result-object v0

    .line 33
    .local v0, "client":Lcom/amazon/ags/api/AmazonGames;
    invoke-interface {v0}, Lcom/amazon/ags/api/AmazonGames;->getLeaderboardsClient()Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;

    move-result-object v1

    .line 35
    .local v1, "leaderboardsClient":Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;
    invoke-interface {v1, p1}, Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;->getLeaderboards([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v2

    invoke-interface {v2, p0}, Lcom/amazon/ags/api/AGResponseHandle;->setCallback(Lcom/amazon/ags/api/AGResponseCallback;)V

    .line 36
    return-void
.end method

.method public static varargs getLocalPlayerScore(Ljava/lang/String;Lcom/amazon/ags/constants/LeaderboardFilter;[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
    .locals 3
    .param p0, "leaderboardId"    # Ljava/lang/String;
    .param p1, "filter"    # Lcom/amazon/ags/constants/LeaderboardFilter;
    .param p2, "userData"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/amazon/ags/constants/LeaderboardFilter;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<",
            "Lcom/amazon/ags/api/leaderboards/GetPlayerScoreResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 160
    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->getInstance()Lcom/amazon/ags/api/AmazonGames;

    move-result-object v0

    .line 161
    .local v0, "client":Lcom/amazon/ags/api/AmazonGames;
    invoke-interface {v0}, Lcom/amazon/ags/api/AmazonGames;->getLeaderboardsClient()Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;

    move-result-object v1

    .line 163
    .local v1, "leaderboardsClient":Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;
    invoke-interface {v1, p0, p1, p2}, Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;->getLocalPlayerScore(Ljava/lang/String;Lcom/amazon/ags/constants/LeaderboardFilter;[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v2

    return-object v2
.end method

.method public static varargs getLocalPlayerScore(Ljava/lang/String;Lcom/amazon/ags/constants/LeaderboardFilter;Lcom/amazon/ags/api/AGResponseCallback;[Ljava/lang/Object;)V
    .locals 3
    .param p0, "leaderboardId"    # Ljava/lang/String;
    .param p1, "filter"    # Lcom/amazon/ags/constants/LeaderboardFilter;
    .param p3, "userData"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/amazon/ags/constants/LeaderboardFilter;",
            "Lcom/amazon/ags/api/AGResponseCallback",
            "<",
            "Lcom/amazon/ags/api/leaderboards/GetPlayerScoreResponse;",
            ">;[",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 142
    .local p2, "callback":Lcom/amazon/ags/api/AGResponseCallback;, "Lcom/amazon/ags/api/AGResponseCallback<Lcom/amazon/ags/api/leaderboards/GetPlayerScoreResponse;>;"
    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->getInstance()Lcom/amazon/ags/api/AmazonGames;

    move-result-object v0

    .line 143
    .local v0, "client":Lcom/amazon/ags/api/AmazonGames;
    invoke-interface {v0}, Lcom/amazon/ags/api/AmazonGames;->getLeaderboardsClient()Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;

    move-result-object v1

    .line 145
    .local v1, "leaderboardsClient":Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;
    invoke-interface {v1, p0, p1, p3}, Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;->getLocalPlayerScore(Ljava/lang/String;Lcom/amazon/ags/constants/LeaderboardFilter;[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v2

    invoke-interface {v2, p2}, Lcom/amazon/ags/api/AGResponseHandle;->setCallback(Lcom/amazon/ags/api/AGResponseCallback;)V

    .line 146
    return-void
.end method

.method public static varargs getPercentileRanks(Ljava/lang/String;Lcom/amazon/ags/constants/LeaderboardFilter;[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
    .locals 3
    .param p0, "leaderboardId"    # Ljava/lang/String;
    .param p1, "filter"    # Lcom/amazon/ags/constants/LeaderboardFilter;
    .param p2, "userData"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/amazon/ags/constants/LeaderboardFilter;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<",
            "Lcom/amazon/ags/api/leaderboards/GetLeaderboardPercentilesResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 220
    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->getInstance()Lcom/amazon/ags/api/AmazonGames;

    move-result-object v0

    .line 221
    .local v0, "client":Lcom/amazon/ags/api/AmazonGames;
    invoke-interface {v0}, Lcom/amazon/ags/api/AmazonGames;->getLeaderboardsClient()Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;

    move-result-object v1

    .line 223
    .local v1, "leaderboardsClient":Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;
    invoke-interface {v1, p0, p1, p2}, Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;->getPercentileRanks(Ljava/lang/String;Lcom/amazon/ags/constants/LeaderboardFilter;[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v2

    return-object v2
.end method

.method public static varargs getPercentileRanks(Ljava/lang/String;Lcom/amazon/ags/constants/LeaderboardFilter;Lcom/amazon/ags/api/AGResponseCallback;[Ljava/lang/Object;)V
    .locals 3
    .param p0, "leaderboardId"    # Ljava/lang/String;
    .param p1, "filter"    # Lcom/amazon/ags/constants/LeaderboardFilter;
    .param p3, "userData"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/amazon/ags/constants/LeaderboardFilter;",
            "Lcom/amazon/ags/api/AGResponseCallback",
            "<",
            "Lcom/amazon/ags/api/leaderboards/GetLeaderboardPercentilesResponse;",
            ">;[",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 202
    .local p2, "callback":Lcom/amazon/ags/api/AGResponseCallback;, "Lcom/amazon/ags/api/AGResponseCallback<Lcom/amazon/ags/api/leaderboards/GetLeaderboardPercentilesResponse;>;"
    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->getInstance()Lcom/amazon/ags/api/AmazonGames;

    move-result-object v0

    .line 203
    .local v0, "client":Lcom/amazon/ags/api/AmazonGames;
    invoke-interface {v0}, Lcom/amazon/ags/api/AmazonGames;->getLeaderboardsClient()Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;

    move-result-object v1

    .line 205
    .local v1, "leaderboardsClient":Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;
    invoke-interface {v1, p0, p1, p3}, Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;->getPercentileRanks(Ljava/lang/String;Lcom/amazon/ags/constants/LeaderboardFilter;[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v2

    invoke-interface {v2, p2}, Lcom/amazon/ags/api/AGResponseHandle;->setCallback(Lcom/amazon/ags/api/AGResponseCallback;)V

    .line 206
    return-void
.end method

.method public static varargs getScores(Ljava/lang/String;Lcom/amazon/ags/constants/LeaderboardFilter;[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
    .locals 3
    .param p0, "leaderboardId"    # Ljava/lang/String;
    .param p1, "filter"    # Lcom/amazon/ags/constants/LeaderboardFilter;
    .param p2, "userData"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/amazon/ags/constants/LeaderboardFilter;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<",
            "Lcom/amazon/ags/api/leaderboards/GetScoresResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 122
    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->getInstance()Lcom/amazon/ags/api/AmazonGames;

    move-result-object v0

    .line 123
    .local v0, "client":Lcom/amazon/ags/api/AmazonGames;
    invoke-interface {v0}, Lcom/amazon/ags/api/AmazonGames;->getLeaderboardsClient()Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;

    move-result-object v1

    .line 125
    .local v1, "leaderboardsClient":Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;
    invoke-interface {v1, p0, p1, p2}, Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;->getScores(Ljava/lang/String;Lcom/amazon/ags/constants/LeaderboardFilter;[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v2

    return-object v2
.end method

.method public static varargs getScores(Ljava/lang/String;Lcom/amazon/ags/constants/LeaderboardFilter;Lcom/amazon/ags/api/AGResponseCallback;[Ljava/lang/Object;)V
    .locals 3
    .param p0, "leaderboardId"    # Ljava/lang/String;
    .param p1, "filter"    # Lcom/amazon/ags/constants/LeaderboardFilter;
    .param p3, "userData"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/amazon/ags/constants/LeaderboardFilter;",
            "Lcom/amazon/ags/api/AGResponseCallback",
            "<",
            "Lcom/amazon/ags/api/leaderboards/GetScoresResponse;",
            ">;[",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 103
    .local p2, "callback":Lcom/amazon/ags/api/AGResponseCallback;, "Lcom/amazon/ags/api/AGResponseCallback<Lcom/amazon/ags/api/leaderboards/GetScoresResponse;>;"
    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->getInstance()Lcom/amazon/ags/api/AmazonGames;

    move-result-object v0

    .line 104
    .local v0, "client":Lcom/amazon/ags/api/AmazonGames;
    invoke-interface {v0}, Lcom/amazon/ags/api/AmazonGames;->getLeaderboardsClient()Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;

    move-result-object v1

    .line 106
    .local v1, "leaderboardsClient":Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;
    invoke-interface {v1, p0, p1, p3}, Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;->getScores(Ljava/lang/String;Lcom/amazon/ags/constants/LeaderboardFilter;[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v2

    invoke-interface {v2, p2}, Lcom/amazon/ags/api/AGResponseHandle;->setCallback(Lcom/amazon/ags/api/AGResponseCallback;)V

    .line 107
    return-void
.end method

.method public static showLeaderboardOverlay(Ljava/lang/String;)Lcom/amazon/ags/api/AGResponseHandle;
    .locals 3
    .param p0, "leaderboardId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<",
            "Lcom/amazon/ags/api/RequestResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 184
    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->getInstance()Lcom/amazon/ags/api/AmazonGames;

    move-result-object v0

    .line 185
    .local v0, "client":Lcom/amazon/ags/api/AmazonGames;
    invoke-interface {v0}, Lcom/amazon/ags/api/AmazonGames;->getLeaderboardsClient()Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;

    move-result-object v1

    .line 187
    .local v1, "leaderboardsClient":Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v1, p0, v2}, Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;->showLeaderboardOverlay(Ljava/lang/String;[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v2

    return-object v2
.end method

.method public static showLeaderboardsOverlay()Lcom/amazon/ags/api/AGResponseHandle;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<",
            "Lcom/amazon/ags/api/RequestResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 172
    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->getInstance()Lcom/amazon/ags/api/AmazonGames;

    move-result-object v0

    .line 173
    .local v0, "client":Lcom/amazon/ags/api/AmazonGames;
    invoke-interface {v0}, Lcom/amazon/ags/api/AmazonGames;->getLeaderboardsClient()Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;

    move-result-object v1

    .line 175
    .local v1, "leaderboardsClient":Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v1, v2}, Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;->showLeaderboardsOverlay([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v2

    return-object v2
.end method

.method public static varargs submitScore(Ljava/lang/String;J[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
    .locals 3
    .param p0, "leaderboardId"    # Ljava/lang/String;
    .param p1, "score"    # J
    .param p3, "userData"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J[",
            "Ljava/lang/Object;",
            ")",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<",
            "Lcom/amazon/ags/api/leaderboards/SubmitScoreResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 83
    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->getInstance()Lcom/amazon/ags/api/AmazonGames;

    move-result-object v0

    .line 84
    .local v0, "client":Lcom/amazon/ags/api/AmazonGames;
    invoke-interface {v0}, Lcom/amazon/ags/api/AmazonGames;->getLeaderboardsClient()Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;

    move-result-object v1

    .line 86
    .local v1, "leaderboardsClient":Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;
    invoke-interface {v1, p0, p1, p2, p3}, Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;->submitScore(Ljava/lang/String;J[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v2

    return-object v2
.end method

.method public static varargs submitScore(Ljava/lang/String;JLcom/amazon/ags/api/AGResponseCallback;[Ljava/lang/Object;)V
    .locals 3
    .param p0, "leaderboardId"    # Ljava/lang/String;
    .param p1, "score"    # J
    .param p4, "userData"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J",
            "Lcom/amazon/ags/api/AGResponseCallback",
            "<",
            "Lcom/amazon/ags/api/leaderboards/SubmitScoreResponse;",
            ">;[",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 65
    .local p3, "callback":Lcom/amazon/ags/api/AGResponseCallback;, "Lcom/amazon/ags/api/AGResponseCallback<Lcom/amazon/ags/api/leaderboards/SubmitScoreResponse;>;"
    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->getInstance()Lcom/amazon/ags/api/AmazonGames;

    move-result-object v0

    .line 66
    .local v0, "client":Lcom/amazon/ags/api/AmazonGames;
    invoke-interface {v0}, Lcom/amazon/ags/api/AmazonGames;->getLeaderboardsClient()Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;

    move-result-object v1

    .line 68
    .local v1, "leaderboardsClient":Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;
    invoke-interface {v1, p0, p1, p2, p4}, Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;->submitScore(Ljava/lang/String;J[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v2

    invoke-interface {v2, p3}, Lcom/amazon/ags/api/AGResponseHandle;->setCallback(Lcom/amazon/ags/api/AGResponseCallback;)V

    .line 69
    return-void
.end method
