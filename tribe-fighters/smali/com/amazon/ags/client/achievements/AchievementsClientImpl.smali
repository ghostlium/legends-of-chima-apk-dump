.class public Lcom/amazon/ags/client/achievements/AchievementsClientImpl;
.super Lcom/amazon/ags/client/ClientBase;
.source "AchievementsClientImpl.java"

# interfaces
.implements Lcom/amazon/ags/api/achievements/AchievementsClient;


# instance fields
.field private overlayClient:Lcom/amazon/ags/client/OverlayClient;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/amazon/ags/client/ClientBase;-><init>()V

    .line 41
    return-void
.end method

.method public constructor <init>(Lcom/amazon/ags/html5/service/ServiceHelper;Lcom/amazon/ags/client/OverlayClient;)V
    .locals 0
    .param p1, "serviceHelper"    # Lcom/amazon/ags/html5/service/ServiceHelper;
    .param p2, "overlayClient"    # Lcom/amazon/ags/client/OverlayClient;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/amazon/ags/client/ClientBase;-><init>(Lcom/amazon/ags/html5/service/ServiceHelper;)V

    .line 45
    iput-object p2, p0, Lcom/amazon/ags/client/achievements/AchievementsClientImpl;->overlayClient:Lcom/amazon/ags/client/OverlayClient;

    .line 46
    return-void
.end method

.method public static convertToAchievement(Lorg/json/JSONObject;)Lcom/amazon/ags/api/achievements/Achievement;
    .locals 15
    .param p0, "data"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 128
    const-string v0, "ACHIEVEMENT_ID"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 129
    .local v1, "id":Ljava/lang/String;
    const-string v0, "ACHIEVEMENT_TITLE"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 130
    .local v2, "title":Ljava/lang/String;
    const-string v0, "ACHIEVEMENT_DESCRIPTION"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 131
    .local v3, "description":Ljava/lang/String;
    const-string v0, "ACHIEVEMENT_POINTS"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    .line 132
    .local v4, "pointValue":I
    const-string v0, "ACHIEVEMENT_HIDDEN"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    .line 133
    .local v5, "hidden":Z
    const-string v0, "ACHIEVEMENT_UNLOCKED"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v6

    .line 134
    .local v6, "unlocked":Z
    const-string v0, "ACHIEVEMENT_UPDATE_PERCENT"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v13

    double-to-float v7, v13

    .line 135
    .local v7, "progress":F
    const-string v0, "ACHIEVEMENT_POSITION"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    .line 136
    .local v8, "position":I
    const-string v0, "ACHIEVEMENT_DATE_UNLOCKED"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v11

    .line 137
    .local v11, "dateUnlockedLong":J
    const-string v0, "ACHIEVEMENT_ICON_URL_LARGE"

    const/4 v13, 0x0

    invoke-virtual {p0, v0, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 139
    .local v10, "imageURL":Ljava/lang/String;
    if-eqz v6, :cond_0

    const-wide/16 v13, 0x0

    cmp-long v0, v11, v13

    if-nez v0, :cond_1

    .line 140
    :cond_0
    const/4 v9, 0x0

    .line 145
    .local v9, "dateUnlocked":Ljava/util/Date;
    :goto_0
    new-instance v0, Lcom/amazon/ags/client/achievements/AchievementImpl;

    invoke-direct/range {v0 .. v10}, Lcom/amazon/ags/client/achievements/AchievementImpl;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZZFILjava/util/Date;Ljava/lang/String;)V

    return-object v0

    .line 142
    .end local v9    # "dateUnlocked":Ljava/util/Date;
    :cond_1
    new-instance v9, Ljava/util/Date;

    invoke-direct {v9, v11, v12}, Ljava/util/Date;-><init>(J)V

    .restart local v9    # "dateUnlocked":Ljava/util/Date;
    goto :goto_0
.end method


# virtual methods
.method public varargs getAchievement(Ljava/lang/String;[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
    .locals 4
    .param p1, "achievementId"    # Ljava/lang/String;
    .param p2, "userData"    # [Ljava/lang/Object;
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

    .prologue
    .line 97
    invoke-virtual {p0}, Lcom/amazon/ags/client/achievements/AchievementsClientImpl;->isClientReady()Z

    move-result v1

    if-nez v1, :cond_0

    .line 98
    new-instance v0, Lcom/amazon/ags/client/AGResponseHandleImpl;

    invoke-direct {v0, p2}, Lcom/amazon/ags/client/AGResponseHandleImpl;-><init>([Ljava/lang/Object;)V

    .line 99
    .local v0, "emptyHandle":Lcom/amazon/ags/client/AGResponseHandleImpl;, "Lcom/amazon/ags/client/AGResponseHandleImpl<Lcom/amazon/ags/api/achievements/GetAchievementResponse;>;"
    new-instance v1, Lcom/amazon/ags/client/achievements/GetAchievementResponseImpl;

    const/16 v2, 0x1d

    sget-object v3, Lcom/amazon/ags/api/ErrorCode;->UNRECOVERABLE:Lcom/amazon/ags/api/ErrorCode;

    invoke-direct {v1, v2, v3}, Lcom/amazon/ags/client/achievements/GetAchievementResponseImpl;-><init>(ILcom/amazon/ags/api/ErrorCode;)V

    invoke-virtual {v0, v1}, Lcom/amazon/ags/client/AGResponseHandleImpl;->setResponse(Lcom/amazon/ags/api/RequestResponse;)V

    .line 100
    iget-object v1, p0, Lcom/amazon/ags/client/achievements/AchievementsClientImpl;->TAG:Ljava/lang/String;

    const-string v2, "getAchievement called before AmazonGamesClient initialized; returning empty response"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    .end local v0    # "emptyHandle":Lcom/amazon/ags/client/AGResponseHandleImpl;, "Lcom/amazon/ags/client/AGResponseHandleImpl<Lcom/amazon/ags/api/achievements/GetAchievementResponse;>;"
    :goto_0
    return-object v0

    :cond_0
    new-instance v1, Lcom/amazon/ags/client/achievements/AchievementsClientImpl$2;

    const-string v2, "Get Achievement"

    invoke-direct {v1, p0, v2, p1}, Lcom/amazon/ags/client/achievements/AchievementsClientImpl$2;-><init>(Lcom/amazon/ags/client/achievements/AchievementsClientImpl;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Lcom/amazon/ags/client/achievements/AchievementsClientImpl$2;->execute([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v0

    goto :goto_0
.end method

.method public varargs getAchievements([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
    .locals 4
    .param p1, "userData"    # [Ljava/lang/Object;
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

    .prologue
    .line 58
    invoke-virtual {p0}, Lcom/amazon/ags/client/achievements/AchievementsClientImpl;->isClientReady()Z

    move-result v1

    if-nez v1, :cond_0

    .line 59
    new-instance v0, Lcom/amazon/ags/client/AGResponseHandleImpl;

    invoke-direct {v0, p1}, Lcom/amazon/ags/client/AGResponseHandleImpl;-><init>([Ljava/lang/Object;)V

    .line 60
    .local v0, "emptyHandle":Lcom/amazon/ags/client/AGResponseHandleImpl;, "Lcom/amazon/ags/client/AGResponseHandleImpl<Lcom/amazon/ags/api/achievements/GetAchievementsResponse;>;"
    new-instance v1, Lcom/amazon/ags/client/achievements/GetAchievementsResponseImpl;

    const/16 v2, 0x1d

    sget-object v3, Lcom/amazon/ags/api/ErrorCode;->UNRECOVERABLE:Lcom/amazon/ags/api/ErrorCode;

    invoke-direct {v1, v2, v3}, Lcom/amazon/ags/client/achievements/GetAchievementsResponseImpl;-><init>(ILcom/amazon/ags/api/ErrorCode;)V

    invoke-virtual {v0, v1}, Lcom/amazon/ags/client/AGResponseHandleImpl;->setResponse(Lcom/amazon/ags/api/RequestResponse;)V

    .line 61
    iget-object v1, p0, Lcom/amazon/ags/client/achievements/AchievementsClientImpl;->TAG:Ljava/lang/String;

    const-string v2, "getAchievements called before AmazonGamesClient initialized; returning empty response"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .end local v0    # "emptyHandle":Lcom/amazon/ags/client/AGResponseHandleImpl;, "Lcom/amazon/ags/client/AGResponseHandleImpl<Lcom/amazon/ags/api/achievements/GetAchievementsResponse;>;"
    :goto_0
    return-object v0

    :cond_0
    new-instance v1, Lcom/amazon/ags/client/achievements/AchievementsClientImpl$1;

    const-string v2, "Get Achievements"

    invoke-direct {v1, p0, v2}, Lcom/amazon/ags/client/achievements/AchievementsClientImpl$1;-><init>(Lcom/amazon/ags/client/achievements/AchievementsClientImpl;Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Lcom/amazon/ags/client/achievements/AchievementsClientImpl$1;->execute([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v0

    goto :goto_0
.end method

.method public setOverlayClient(Lcom/amazon/ags/client/OverlayClient;)V
    .locals 0
    .param p1, "overlayClient"    # Lcom/amazon/ags/client/OverlayClient;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/amazon/ags/client/achievements/AchievementsClientImpl;->overlayClient:Lcom/amazon/ags/client/OverlayClient;

    .line 55
    return-void
.end method

.method public varargs showAchievementsOverlay([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
    .locals 4
    .param p1, "userData"    # [Ljava/lang/Object;
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

    .prologue
    .line 185
    iget-object v1, p0, Lcom/amazon/ags/client/achievements/AchievementsClientImpl;->overlayClient:Lcom/amazon/ags/client/OverlayClient;

    if-nez v1, :cond_0

    .line 186
    new-instance v0, Lcom/amazon/ags/client/AGResponseHandleImpl;

    invoke-direct {v0, p1}, Lcom/amazon/ags/client/AGResponseHandleImpl;-><init>([Ljava/lang/Object;)V

    .line 187
    .local v0, "emptyHandle":Lcom/amazon/ags/client/AGResponseHandleImpl;, "Lcom/amazon/ags/client/AGResponseHandleImpl<Lcom/amazon/ags/api/RequestResponse;>;"
    new-instance v1, Lcom/amazon/ags/client/RequestResponseImpl;

    const/16 v2, 0x1d

    sget-object v3, Lcom/amazon/ags/api/ErrorCode;->UNRECOVERABLE:Lcom/amazon/ags/api/ErrorCode;

    invoke-direct {v1, v2, v3}, Lcom/amazon/ags/client/RequestResponseImpl;-><init>(ILcom/amazon/ags/api/ErrorCode;)V

    invoke-virtual {v0, v1}, Lcom/amazon/ags/client/AGResponseHandleImpl;->setResponse(Lcom/amazon/ags/api/RequestResponse;)V

    .line 188
    iget-object v1, p0, Lcom/amazon/ags/client/achievements/AchievementsClientImpl;->TAG:Ljava/lang/String;

    const-string v2, "showAchievementsOverlay called before AmazonGamesClient initialized; returning empty response"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    .end local v0    # "emptyHandle":Lcom/amazon/ags/client/AGResponseHandleImpl;, "Lcom/amazon/ags/client/AGResponseHandleImpl<Lcom/amazon/ags/api/RequestResponse;>;"
    :goto_0
    return-object v0

    :cond_0
    iget-object v1, p0, Lcom/amazon/ags/client/achievements/AchievementsClientImpl;->overlayClient:Lcom/amazon/ags/client/OverlayClient;

    invoke-virtual {v1, p1}, Lcom/amazon/ags/client/OverlayClient;->showAchievementsOverlay([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v0

    goto :goto_0
.end method

.method public shutdown()V
    .locals 1

    .prologue
    .line 49
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/amazon/ags/client/achievements/AchievementsClientImpl;->isReady:Z

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/ags/client/achievements/AchievementsClientImpl;->overlayClient:Lcom/amazon/ags/client/OverlayClient;

    .line 51
    return-void
.end method

.method public varargs updateProgress(Ljava/lang/String;F[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
    .locals 4
    .param p1, "achievementId"    # Ljava/lang/String;
    .param p2, "percentComplete"    # F
    .param p3, "userData"    # [Ljava/lang/Object;
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

    .prologue
    .line 151
    invoke-virtual {p0}, Lcom/amazon/ags/client/achievements/AchievementsClientImpl;->isClientReady()Z

    move-result v1

    if-nez v1, :cond_0

    .line 152
    new-instance v0, Lcom/amazon/ags/client/AGResponseHandleImpl;

    invoke-direct {v0, p3}, Lcom/amazon/ags/client/AGResponseHandleImpl;-><init>([Ljava/lang/Object;)V

    .line 153
    .local v0, "emptyHandle":Lcom/amazon/ags/client/AGResponseHandleImpl;, "Lcom/amazon/ags/client/AGResponseHandleImpl<Lcom/amazon/ags/api/achievements/UpdateProgressResponse;>;"
    new-instance v1, Lcom/amazon/ags/client/achievements/UpdateProgressResponseImpl;

    const/16 v2, 0x1d

    sget-object v3, Lcom/amazon/ags/api/ErrorCode;->UNRECOVERABLE:Lcom/amazon/ags/api/ErrorCode;

    invoke-direct {v1, v2, v3}, Lcom/amazon/ags/client/achievements/UpdateProgressResponseImpl;-><init>(ILcom/amazon/ags/api/ErrorCode;)V

    invoke-virtual {v0, v1}, Lcom/amazon/ags/client/AGResponseHandleImpl;->setResponse(Lcom/amazon/ags/api/RequestResponse;)V

    .line 154
    iget-object v1, p0, Lcom/amazon/ags/client/achievements/AchievementsClientImpl;->TAG:Ljava/lang/String;

    const-string v2, "updateProgress called before AmazonGamesClient initialized; returning empty response"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    .end local v0    # "emptyHandle":Lcom/amazon/ags/client/AGResponseHandleImpl;, "Lcom/amazon/ags/client/AGResponseHandleImpl<Lcom/amazon/ags/api/achievements/UpdateProgressResponse;>;"
    :goto_0
    return-object v0

    :cond_0
    new-instance v1, Lcom/amazon/ags/client/achievements/AchievementsClientImpl$3;

    const-string v2, "Update Achievement Progress"

    invoke-direct {v1, p0, v2, p1, p2}, Lcom/amazon/ags/client/achievements/AchievementsClientImpl$3;-><init>(Lcom/amazon/ags/client/achievements/AchievementsClientImpl;Ljava/lang/String;Ljava/lang/String;F)V

    invoke-virtual {v1, p3}, Lcom/amazon/ags/client/achievements/AchievementsClientImpl$3;->execute([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v0

    goto :goto_0
.end method
