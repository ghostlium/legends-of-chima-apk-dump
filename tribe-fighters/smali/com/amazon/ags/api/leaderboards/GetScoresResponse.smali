.class public interface abstract Lcom/amazon/ags/api/leaderboards/GetScoresResponse;
.super Ljava/lang/Object;
.source "GetScoresResponse.java"

# interfaces
.implements Lcom/amazon/ags/api/RequestResponse;


# virtual methods
.method public abstract getDisplayText()Ljava/lang/String;
.end method

.method public abstract getLeaderboardId()Ljava/lang/String;
.end method

.method public abstract getLeaderboardName()Ljava/lang/String;
.end method

.method public abstract getNumScores()I
.end method

.method public abstract getScoreFormat()Lcom/amazon/ags/constants/ScoreFormat;
.end method

.method public abstract getScores()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/api/leaderboards/Score;",
            ">;"
        }
    .end annotation
.end method
