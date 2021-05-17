.class Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$4;
.super Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;
.source "LeaderboardsClientImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;->getLocalPlayerScore(Ljava/lang/String;Lcom/amazon/ags/constants/LeaderboardFilter;[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper",
        "<",
        "Lcom/amazon/ags/api/leaderboards/GetPlayerScoreResponse;",
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
    .line 268
    iput-object p1, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$4;->this$0:Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;

    iput-object p3, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$4;->val$leaderboardId:Ljava/lang/String;

    iput-object p4, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$4;->val$filter:Lcom/amazon/ags/constants/LeaderboardFilter;

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
    .line 271
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 272
    .local v0, "request":Lorg/json/JSONObject;
    const-string v1, "ACTION_CODE"

    const/16 v2, 0xa

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 273
    const-string v1, "LEADERBOARD_ID"

    iget-object v2, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$4;->val$leaderboardId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 274
    const-string v1, "LEADERBOARD_FILTER"

    iget-object v2, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$4;->val$filter:Lcom/amazon/ags/constants/LeaderboardFilter;

    invoke-virtual {v2}, Lcom/amazon/ags/constants/LeaderboardFilter;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 275
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
    .line 268
    invoke-virtual {p0, p1}, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$4;->convertResponse(Lorg/json/JSONObject;)Lcom/amazon/ags/api/leaderboards/GetPlayerScoreResponse;

    move-result-object v0

    return-object v0
.end method

.method public convertResponse(Lorg/json/JSONObject;)Lcom/amazon/ags/api/leaderboards/GetPlayerScoreResponse;
    .locals 8
    .param p1, "response"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 280
    const-string v4, "RESPONSE_CODE"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 281
    .local v1, "responseCode":I
    iget-object v4, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$4;->this$0:Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;

    const-string v5, "LEADERBOARD_SUBMIT_SCORE"

    const-wide/16 v6, 0x0

    invoke-static {v4, p1, v5, v6, v7}, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;->access$500(Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;Lorg/json/JSONObject;Ljava/lang/String;J)J

    move-result-wide v2

    .line 283
    .local v2, "score":J
    iget-object v4, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$4;->this$0:Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;

    const-string v5, "LEADERBOARD_USER_RANK"

    const/4 v6, -0x1

    invoke-static {v4, p1, v5, v6}, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;->access$600(Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;Lorg/json/JSONObject;Ljava/lang/String;I)I

    move-result v0

    .line 284
    .local v0, "rank":I
    new-instance v4, Lcom/amazon/ags/client/leaderboards/GetPlayerScoreResponseImpl;

    invoke-direct {v4, v2, v3, v0, v1}, Lcom/amazon/ags/client/leaderboards/GetPlayerScoreResponseImpl;-><init>(JII)V

    return-object v4
.end method

.method public bridge synthetic getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/RequestResponse;
    .locals 1
    .param p1, "x0"    # I
    .param p2, "x1"    # Lorg/json/JSONObject;

    .prologue
    .line 268
    invoke-virtual {p0, p1, p2}, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$4;->getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/leaderboards/GetPlayerScoreResponse;

    move-result-object v0

    return-object v0
.end method

.method public getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/leaderboards/GetPlayerScoreResponse;
    .locals 3
    .param p1, "responseCode"    # I
    .param p2, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 289
    new-instance v0, Lcom/amazon/ags/client/leaderboards/GetPlayerScoreResponseImpl;

    const/16 v1, 0x18

    sget-object v2, Lcom/amazon/ags/api/ErrorCode;->UNRECOVERABLE:Lcom/amazon/ags/api/ErrorCode;

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/client/leaderboards/GetPlayerScoreResponseImpl;-><init>(ILcom/amazon/ags/api/ErrorCode;)V

    return-object v0
.end method
