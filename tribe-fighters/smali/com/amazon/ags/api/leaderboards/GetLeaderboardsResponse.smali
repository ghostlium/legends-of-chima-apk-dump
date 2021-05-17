.class public interface abstract Lcom/amazon/ags/api/leaderboards/GetLeaderboardsResponse;
.super Ljava/lang/Object;
.source "GetLeaderboardsResponse.java"

# interfaces
.implements Lcom/amazon/ags/api/RequestResponse;


# virtual methods
.method public abstract getLeaderboards()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/api/leaderboards/Leaderboard;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getNumLeaderboards()I
.end method
