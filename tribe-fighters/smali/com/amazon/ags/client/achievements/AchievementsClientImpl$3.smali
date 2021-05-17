.class Lcom/amazon/ags/client/achievements/AchievementsClientImpl$3;
.super Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;
.source "AchievementsClientImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/client/achievements/AchievementsClientImpl;->updateProgress(Ljava/lang/String;F[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper",
        "<",
        "Lcom/amazon/ags/api/achievements/UpdateProgressResponse;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/client/achievements/AchievementsClientImpl;

.field final synthetic val$achievementId:Ljava/lang/String;

.field final synthetic val$percentComplete:F


# direct methods
.method constructor <init>(Lcom/amazon/ags/client/achievements/AchievementsClientImpl;Ljava/lang/String;Ljava/lang/String;F)V
    .locals 0
    .param p2, "x0"    # Ljava/lang/String;

    .prologue
    .line 158
    iput-object p1, p0, Lcom/amazon/ags/client/achievements/AchievementsClientImpl$3;->this$0:Lcom/amazon/ags/client/achievements/AchievementsClientImpl;

    iput-object p3, p0, Lcom/amazon/ags/client/achievements/AchievementsClientImpl$3;->val$achievementId:Ljava/lang/String;

    iput p4, p0, Lcom/amazon/ags/client/achievements/AchievementsClientImpl$3;->val$percentComplete:F

    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;-><init>(Lcom/amazon/ags/client/ClientBase;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public buildRequest()Lorg/json/JSONObject;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 161
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 162
    .local v0, "request":Lorg/json/JSONObject;
    const-string v1, "ACTION_CODE"

    const/16 v2, 0xd

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 163
    const-string v1, "ACHIEVEMENT_ID"

    iget-object v2, p0, Lcom/amazon/ags/client/achievements/AchievementsClientImpl$3;->val$achievementId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 164
    const-string v1, "ACHIEVEMENT_UPDATE_PERCENT"

    iget v2, p0, Lcom/amazon/ags/client/achievements/AchievementsClientImpl$3;->val$percentComplete:F

    float-to-double v2, v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 165
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
    .line 158
    invoke-virtual {p0, p1}, Lcom/amazon/ags/client/achievements/AchievementsClientImpl$3;->convertResponse(Lorg/json/JSONObject;)Lcom/amazon/ags/api/achievements/UpdateProgressResponse;

    move-result-object v0

    return-object v0
.end method

.method public convertResponse(Lorg/json/JSONObject;)Lcom/amazon/ags/api/achievements/UpdateProgressResponse;
    .locals 3
    .param p1, "response"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 170
    const-string v2, "RESPONSE_CODE"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 171
    .local v1, "responseCode":I
    const-string v2, "ACHIEVEMENT_NEWLY_UNLOCKED"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    .line 173
    .local v0, "isNewlyUnlocked":Z
    new-instance v2, Lcom/amazon/ags/client/achievements/UpdateProgressResponseImpl;

    invoke-direct {v2, v0, v1}, Lcom/amazon/ags/client/achievements/UpdateProgressResponseImpl;-><init>(ZI)V

    return-object v2
.end method

.method public bridge synthetic getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/RequestResponse;
    .locals 1
    .param p1, "x0"    # I
    .param p2, "x1"    # Lorg/json/JSONObject;

    .prologue
    .line 158
    invoke-virtual {p0, p1, p2}, Lcom/amazon/ags/client/achievements/AchievementsClientImpl$3;->getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/achievements/UpdateProgressResponse;

    move-result-object v0

    return-object v0
.end method

.method public getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/achievements/UpdateProgressResponse;
    .locals 3
    .param p1, "responseCode"    # I
    .param p2, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 178
    new-instance v0, Lcom/amazon/ags/client/achievements/UpdateProgressResponseImpl;

    const/16 v1, 0x18

    sget-object v2, Lcom/amazon/ags/api/ErrorCode;->UNRECOVERABLE:Lcom/amazon/ags/api/ErrorCode;

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/client/achievements/UpdateProgressResponseImpl;-><init>(ILcom/amazon/ags/api/ErrorCode;)V

    return-object v0
.end method
