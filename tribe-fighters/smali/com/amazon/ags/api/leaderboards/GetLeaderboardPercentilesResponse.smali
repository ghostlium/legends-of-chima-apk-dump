.class public interface abstract Lcom/amazon/ags/api/leaderboards/GetLeaderboardPercentilesResponse;
.super Ljava/lang/Object;
.source "GetLeaderboardPercentilesResponse.java"

# interfaces
.implements Lcom/amazon/ags/api/RequestResponse;


# virtual methods
.method public abstract getLeaderboard()Lcom/amazon/ags/api/leaderboards/Leaderboard;
.end method

.method public abstract getPercentileList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/api/leaderboards/LeaderboardPercentileItem;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getUserIndex()I
.end method
