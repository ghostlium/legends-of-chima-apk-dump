.class public interface abstract Lcom/amazon/ags/api/AmazonGames;
.super Ljava/lang/Object;
.source "AmazonGames.java"


# virtual methods
.method public abstract getAchievementsClient()Lcom/amazon/ags/api/achievements/AchievementsClient;
.end method

.method public abstract getLeaderboardsClient()Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;
.end method

.method public abstract getPlayerClient()Lcom/amazon/ags/api/player/PlayerClient;
.end method

.method public abstract initializeJni()V
.end method

.method public abstract setPopUpLocation(Lcom/amazon/ags/api/overlay/PopUpLocation;)V
.end method

.method public varargs abstract showGameCircle([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<",
            "Lcom/amazon/ags/api/RequestResponse;",
            ">;"
        }
    .end annotation
.end method

.method public varargs abstract showSignInPage([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<",
            "Lcom/amazon/ags/api/RequestResponse;",
            ">;"
        }
    .end annotation
.end method
