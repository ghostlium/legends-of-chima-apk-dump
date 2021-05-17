.class public interface abstract Lcom/amazon/ags/api/achievements/GetAchievementsResponse;
.super Ljava/lang/Object;
.source "GetAchievementsResponse.java"

# interfaces
.implements Lcom/amazon/ags/api/RequestResponse;


# virtual methods
.method public abstract getAchievementsList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/api/achievements/Achievement;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getAchievementsMap()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/amazon/ags/api/achievements/Achievement;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getNumVisibleAchievements()I
.end method
