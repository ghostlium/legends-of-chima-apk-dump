.class public interface abstract Lcom/amazon/ags/api/achievements/AchievementsClient;
.super Ljava/lang/Object;
.source "AchievementsClient.java"


# virtual methods
.method public varargs abstract getAchievement(Ljava/lang/String;[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<",
            "Lcom/amazon/ags/api/achievements/GetAchievementResponse;",
            ">;"
        }
    .end annotation
.end method

.method public varargs abstract getAchievements([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<",
            "Lcom/amazon/ags/api/achievements/GetAchievementsResponse;",
            ">;"
        }
    .end annotation
.end method

.method public varargs abstract showAchievementsOverlay([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
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

.method public varargs abstract updateProgress(Ljava/lang/String;F[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "F[",
            "Ljava/lang/Object;",
            ")",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<",
            "Lcom/amazon/ags/api/achievements/UpdateProgressResponse;",
            ">;"
        }
    .end annotation
.end method
