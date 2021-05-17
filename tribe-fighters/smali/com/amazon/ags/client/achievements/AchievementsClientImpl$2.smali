.class Lcom/amazon/ags/client/achievements/AchievementsClientImpl$2;
.super Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;
.source "AchievementsClientImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/client/achievements/AchievementsClientImpl;->getAchievement(Ljava/lang/String;[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper",
        "<",
        "Lcom/amazon/ags/api/achievements/GetAchievementResponse;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/client/achievements/AchievementsClientImpl;

.field final synthetic val$achievementId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/amazon/ags/client/achievements/AchievementsClientImpl;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p2, "x0"    # Ljava/lang/String;

    .prologue
    .line 104
    iput-object p1, p0, Lcom/amazon/ags/client/achievements/AchievementsClientImpl$2;->this$0:Lcom/amazon/ags/client/achievements/AchievementsClientImpl;

    iput-object p3, p0, Lcom/amazon/ags/client/achievements/AchievementsClientImpl$2;->val$achievementId:Ljava/lang/String;

    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;-><init>(Lcom/amazon/ags/client/ClientBase;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public buildRequest()Lorg/json/JSONObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 107
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 108
    .local v0, "request":Lorg/json/JSONObject;
    const-string v1, "ACTION_CODE"

    const/16 v2, 0xc

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 109
    const-string v1, "ACHIEVEMENT_ID"

    iget-object v2, p0, Lcom/amazon/ags/client/achievements/AchievementsClientImpl$2;->val$achievementId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 110
    return-object v0
.end method

.method public bridge synthetic convertResponse(Lorg/json/JSONObject;)Lcom/amazon/ags/api/RequestResponse;
    .locals 1
    .param p1, "x0"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 104
    invoke-virtual {p0, p1}, Lcom/amazon/ags/client/achievements/AchievementsClientImpl$2;->convertResponse(Lorg/json/JSONObject;)Lcom/amazon/ags/api/achievements/GetAchievementResponse;

    move-result-object v0

    return-object v0
.end method

.method public convertResponse(Lorg/json/JSONObject;)Lcom/amazon/ags/api/achievements/GetAchievementResponse;
    .locals 3
    .param p1, "response"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 115
    const-string v1, "RESPONSE_CODE"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 116
    .local v0, "responseCode":I
    new-instance v1, Lcom/amazon/ags/client/achievements/GetAchievementResponseImpl;

    invoke-static {p1}, Lcom/amazon/ags/client/achievements/AchievementsClientImpl;->convertToAchievement(Lorg/json/JSONObject;)Lcom/amazon/ags/api/achievements/Achievement;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/amazon/ags/client/achievements/GetAchievementResponseImpl;-><init>(Lcom/amazon/ags/api/achievements/Achievement;I)V

    return-object v1
.end method

.method public bridge synthetic getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/RequestResponse;
    .locals 1
    .param p1, "x0"    # I
    .param p2, "x1"    # Lorg/json/JSONObject;

    .prologue
    .line 104
    invoke-virtual {p0, p1, p2}, Lcom/amazon/ags/client/achievements/AchievementsClientImpl$2;->getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/achievements/GetAchievementResponse;

    move-result-object v0

    return-object v0
.end method

.method public getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/achievements/GetAchievementResponse;
    .locals 3
    .param p1, "responseCode"    # I
    .param p2, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 121
    new-instance v0, Lcom/amazon/ags/client/achievements/GetAchievementResponseImpl;

    const/16 v1, 0x18

    sget-object v2, Lcom/amazon/ags/api/ErrorCode;->UNRECOVERABLE:Lcom/amazon/ags/api/ErrorCode;

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/client/achievements/GetAchievementResponseImpl;-><init>(ILcom/amazon/ags/api/ErrorCode;)V

    return-object v0
.end method
