.class Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$3;
.super Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;
.source "LeaderboardsClientImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;->getScores(Ljava/lang/String;Lcom/amazon/ags/constants/LeaderboardFilter;[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper",
        "<",
        "Lcom/amazon/ags/api/leaderboards/GetScoresResponse;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;

.field final synthetic val$filter:Lcom/amazon/ags/constants/LeaderboardFilter;

.field final synthetic val$leaderboardId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;Ljava/lang/String;Ljava/lang/String;Lcom/amazon/ags/constants/LeaderboardFilter;)V
    .locals 0
    .param p2, "x0"    # Ljava/lang/String;

    .prologue
    .line 203
    iput-object p1, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$3;->this$0:Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;

    iput-object p3, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$3;->val$leaderboardId:Ljava/lang/String;

    iput-object p4, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$3;->val$filter:Lcom/amazon/ags/constants/LeaderboardFilter;

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
    .line 206
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 207
    .local v0, "request":Lorg/json/JSONObject;
    const-string v1, "ACTION_CODE"

    const/4 v2, 0x7

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 208
    const-string v1, "LEADERBOARD_ID"

    iget-object v2, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$3;->val$leaderboardId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 209
    const-string v1, "LEADERBOARD_FILTER"

    iget-object v2, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$3;->val$filter:Lcom/amazon/ags/constants/LeaderboardFilter;

    invoke-virtual {v2}, Lcom/amazon/ags/constants/LeaderboardFilter;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 211
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
    .line 203
    invoke-virtual {p0, p1}, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$3;->convertResponse(Lorg/json/JSONObject;)Lcom/amazon/ags/api/leaderboards/GetScoresResponse;

    move-result-object v0

    return-object v0
.end method

.method public convertResponse(Lorg/json/JSONObject;)Lcom/amazon/ags/api/leaderboards/GetScoresResponse;
    .locals 11
    .param p1, "response"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 216
    const-string v0, "RESPONSE_CODE"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    .line 217
    .local v6, "responseCode":I
    const-string v0, "LEADERBOARD_DISPLAY_TEXT"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 218
    .local v2, "displayText":Ljava/lang/String;
    const-string v0, "LEADERBOARD_NAME"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 219
    .local v4, "name":Ljava/lang/String;
    const-string v0, "LEADERBOARD_ID"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 220
    .local v5, "uniqueId":Ljava/lang/String;
    const-string v0, "LEADERBOARD_DATA_FORMAT"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 222
    .local v7, "format":Ljava/lang/String;
    invoke-static {v7}, Lcom/amazon/ags/constants/ScoreFormat;->valueOf(Ljava/lang/String;)Lcom/amazon/ags/constants/ScoreFormat;

    move-result-object v3

    .line 223
    .local v3, "scoreFormat":Lcom/amazon/ags/constants/ScoreFormat;
    const-string v0, "LEADERBOARD_SCORES_ARRAY"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    .line 225
    .local v9, "scoreListJson":Lorg/json/JSONArray;
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v0

    new-array v1, v0, [Lcom/amazon/ags/api/leaderboards/Score;

    .line 226
    .local v1, "scores":[Lcom/amazon/ags/api/leaderboards/Score;
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge v8, v0, :cond_1

    .line 227
    invoke-virtual {v9, v8}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v10

    .line 228
    .local v10, "value":Ljava/lang/Object;
    instance-of v0, v10, Lorg/json/JSONObject;

    if-eqz v0, :cond_0

    .line 229
    iget-object v0, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$3;->this$0:Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;

    check-cast v10, Lorg/json/JSONObject;

    .end local v10    # "value":Ljava/lang/Object;
    invoke-static {v0, v10}, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;->access$400(Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;Lorg/json/JSONObject;)Lcom/amazon/ags/api/leaderboards/Score;

    move-result-object v0

    aput-object v0, v1, v8

    .line 226
    :cond_0
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 233
    :cond_1
    new-instance v0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;

    invoke-direct/range {v0 .. v6}, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;-><init>([Lcom/amazon/ags/api/leaderboards/Score;Ljava/lang/String;Lcom/amazon/ags/constants/ScoreFormat;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0
.end method

.method public bridge synthetic getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/RequestResponse;
    .locals 1
    .param p1, "x0"    # I
    .param p2, "x1"    # Lorg/json/JSONObject;

    .prologue
    .line 203
    invoke-virtual {p0, p1, p2}, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$3;->getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/leaderboards/GetScoresResponse;

    move-result-object v0

    return-object v0
.end method

.method public getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/leaderboards/GetScoresResponse;
    .locals 3
    .param p1, "responseCode"    # I
    .param p2, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 238
    new-instance v0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;

    const/16 v1, 0x18

    sget-object v2, Lcom/amazon/ags/api/ErrorCode;->UNRECOVERABLE:Lcom/amazon/ags/api/ErrorCode;

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;-><init>(ILcom/amazon/ags/api/ErrorCode;)V

    return-object v0
.end method
