.class Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$2;
.super Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;
.source "LeaderboardsClientImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;->submitScore(Ljava/lang/String;J[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper",
        "<",
        "Lcom/amazon/ags/api/leaderboards/SubmitScoreResponse;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;

.field final synthetic val$leaderboardId:Ljava/lang/String;

.field final synthetic val$score:J


# direct methods
.method constructor <init>(Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0
    .param p2, "x0"    # Ljava/lang/String;

    .prologue
    .line 141
    iput-object p1, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$2;->this$0:Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;

    iput-object p3, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$2;->val$leaderboardId:Ljava/lang/String;

    iput-wide p4, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$2;->val$score:J

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
    .line 144
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 145
    .local v0, "request":Lorg/json/JSONObject;
    const-string v1, "ACTION_CODE"

    const/16 v2, 0x8

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 146
    const-string v1, "LEADERBOARD_ID"

    iget-object v2, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$2;->val$leaderboardId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 147
    const-string v1, "LEADERBOARD_SUBMIT_SCORE"

    iget-wide v2, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$2;->val$score:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 148
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
    .line 141
    invoke-virtual {p0, p1}, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$2;->convertResponse(Lorg/json/JSONObject;)Lcom/amazon/ags/api/leaderboards/SubmitScoreResponse;

    move-result-object v0

    return-object v0
.end method

.method public convertResponse(Lorg/json/JSONObject;)Lcom/amazon/ags/api/leaderboards/SubmitScoreResponse;
    .locals 14
    .param p1, "response"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 153
    const-string v11, "RESPONSE_CODE"

    invoke-virtual {p1, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    .line 154
    .local v7, "responseCode":I
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 155
    .local v5, "improved":Ljava/util/Map;, "Ljava/util/Map<Lcom/amazon/ags/constants/LeaderboardFilter;Ljava/lang/Boolean;>;"
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 157
    .local v6, "ranks":Ljava/util/Map;, "Ljava/util/Map<Lcom/amazon/ags/constants/LeaderboardFilter;Ljava/lang/Integer;>;"
    :try_start_0
    const-string v11, "LEADERBOARD_SUBMIT_RESULT"

    invoke-virtual {p1, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 158
    const-string v11, "LEADERBOARD_SUBMIT_RESULT"

    invoke-virtual {p1, v11}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v10

    .line 160
    .local v10, "submitResult":Lorg/json/JSONArray;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v4, v11, :cond_1

    .line 161
    invoke-virtual {v10, v4}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    .line 162
    .local v9, "resultObj":Ljava/lang/Object;
    instance-of v11, v9, Lorg/json/JSONObject;

    if-eqz v11, :cond_2

    .line 163
    move-object v0, v9

    check-cast v0, Lorg/json/JSONObject;

    move-object v8, v0

    .line 164
    .local v8, "result":Lorg/json/JSONObject;
    const-string v11, "Scope"

    invoke-virtual {v8, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 165
    .local v3, "filterString":Ljava/lang/String;
    invoke-static {v3}, Lcom/amazon/ags/constants/LeaderboardFilter;->valueOf(Ljava/lang/String;)Lcom/amazon/ags/constants/LeaderboardFilter;

    move-result-object v2

    .line 166
    .local v2, "filter":Lcom/amazon/ags/constants/LeaderboardFilter;
    if-nez v2, :cond_0

    .line 167
    iget-object v11, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$2;->this$0:Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;

    invoke-static {v11}, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;->access$100(Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Invalid filter returned from service: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    .end local v2    # "filter":Lcom/amazon/ags/constants/LeaderboardFilter;
    .end local v3    # "filterString":Ljava/lang/String;
    .end local v8    # "result":Lorg/json/JSONObject;
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 170
    .restart local v2    # "filter":Lcom/amazon/ags/constants/LeaderboardFilter;
    .restart local v3    # "filterString":Ljava/lang/String;
    .restart local v8    # "result":Lorg/json/JSONObject;
    :cond_0
    const-string v11, "IsImproved"

    invoke-virtual {v8, v11}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v11

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    invoke-interface {v5, v2, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    const-string v11, "PlayerRank"

    invoke-virtual {v8, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v6, v2, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 178
    .end local v2    # "filter":Lcom/amazon/ags/constants/LeaderboardFilter;
    .end local v3    # "filterString":Ljava/lang/String;
    .end local v4    # "i":I
    .end local v8    # "result":Lorg/json/JSONObject;
    .end local v9    # "resultObj":Ljava/lang/Object;
    .end local v10    # "submitResult":Lorg/json/JSONArray;
    :catch_0
    move-exception v1

    .line 180
    .local v1, "e":Lorg/json/JSONException;
    iget-object v11, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$2;->this$0:Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;

    invoke-static {v11}, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;->access$300(Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "Caught JSON Exception, skipping Submit Score Result Element(s)"

    invoke-static {v11, v12, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 182
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_1
    new-instance v11, Lcom/amazon/ags/client/leaderboards/SubmitScoreResponseImpl;

    invoke-direct {v11, v5, v6, v7}, Lcom/amazon/ags/client/leaderboards/SubmitScoreResponseImpl;-><init>(Ljava/util/Map;Ljava/util/Map;I)V

    return-object v11

    .line 173
    .restart local v4    # "i":I
    .restart local v9    # "resultObj":Ljava/lang/Object;
    .restart local v10    # "submitResult":Lorg/json/JSONArray;
    :cond_2
    :try_start_1
    iget-object v11, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$2;->this$0:Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;

    invoke-static {v11}, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;->access$200(Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Unexpected type "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", skipping this Submit Score Result Element"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public bridge synthetic getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/RequestResponse;
    .locals 1
    .param p1, "x0"    # I
    .param p2, "x1"    # Lorg/json/JSONObject;

    .prologue
    .line 141
    invoke-virtual {p0, p1, p2}, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$2;->getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/leaderboards/SubmitScoreResponse;

    move-result-object v0

    return-object v0
.end method

.method public getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/leaderboards/SubmitScoreResponse;
    .locals 3
    .param p1, "responseCode"    # I
    .param p2, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 187
    new-instance v0, Lcom/amazon/ags/client/leaderboards/SubmitScoreResponseImpl;

    const/16 v1, 0x18

    sget-object v2, Lcom/amazon/ags/api/ErrorCode;->UNRECOVERABLE:Lcom/amazon/ags/api/ErrorCode;

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/client/leaderboards/SubmitScoreResponseImpl;-><init>(ILcom/amazon/ags/api/ErrorCode;)V

    return-object v0
.end method
