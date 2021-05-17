.class public interface abstract Lcom/amazon/ags/api/leaderboards/SubmitScoreResponse;
.super Ljava/lang/Object;
.source "SubmitScoreResponse.java"

# interfaces
.implements Lcom/amazon/ags/api/RequestResponse;


# virtual methods
.method public abstract getNewRank()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Lcom/amazon/ags/constants/LeaderboardFilter;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getRankImproved()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Lcom/amazon/ags/constants/LeaderboardFilter;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end method
