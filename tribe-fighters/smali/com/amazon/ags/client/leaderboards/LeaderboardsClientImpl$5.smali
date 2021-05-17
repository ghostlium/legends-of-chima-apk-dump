.class Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$5;
.super Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;
.source "LeaderboardsClientImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;->getPercentileRanks(Ljava/lang/String;Lcom/amazon/ags/constants/LeaderboardFilter;[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper",
        "<",
        "Lcom/amazon/ags/api/leaderboards/GetLeaderboardPercentilesResponse;",
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
    .line 305
    iput-object p1, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$5;->this$0:Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;

    iput-object p3, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$5;->val$leaderboardId:Ljava/lang/String;

    iput-object p4, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$5;->val$filter:Lcom/amazon/ags/constants/LeaderboardFilter;

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
    .line 308
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 309
    .local v0, "request":Lorg/json/JSONObject;
    const-string v1, "ACTION_CODE"

    const/16 v2, 0x1f

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 310
    const-string v1, "LEADERBOARD_ID"

    iget-object v2, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$5;->val$leaderboardId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 311
    const-string v1, "LEADERBOARD_FILTER"

    iget-object v2, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$5;->val$filter:Lcom/amazon/ags/constants/LeaderboardFilter;

    invoke-virtual {v2}, Lcom/amazon/ags/constants/LeaderboardFilter;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 313
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
    .line 305
    invoke-virtual {p0, p1}, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$5;->convertResponse(Lorg/json/JSONObject;)Lcom/amazon/ags/api/leaderboards/GetLeaderboardPercentilesResponse;

    move-result-object v0

    return-object v0
.end method

.method public convertResponse(Lorg/json/JSONObject;)Lcom/amazon/ags/api/leaderboards/GetLeaderboardPercentilesResponse;
    .locals 26
    .param p1, "response"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 318
    const-string v24, "RESPONSE_CODE"

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v19

    .line 319
    .local v19, "responseCode":I
    const-string v24, "LEADERBOARD_ID"

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 320
    .local v4, "leaderboardId":Ljava/lang/String;
    const-string v24, "LEADERBOARD_NAME"

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 321
    .local v5, "leaderboardName":Ljava/lang/String;
    const-string v24, "LEADERBOARD_DISPLAY_TEXT"

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 322
    .local v6, "leaderboardDisplayText":Ljava/lang/String;
    const-string v24, "LEADERBOARD_DATA_FORMAT"

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 323
    .local v11, "format":Ljava/lang/String;
    const-string v24, "LEADERBOARD_USER_INDEX"

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v22

    .line 324
    .local v22, "userIndex":I
    const-string v24, "LEADERBOARD_ICON_URL"

    const/16 v25, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 327
    .local v8, "imageURL":Ljava/lang/String;
    if-nez v11, :cond_0

    .line 328
    sget-object v24, Lcom/amazon/ags/constants/ScoreFormat;->UNKNOWN:Lcom/amazon/ags/constants/ScoreFormat;

    invoke-virtual/range {v24 .. v24}, Lcom/amazon/ags/constants/ScoreFormat;->toString()Ljava/lang/String;

    move-result-object v11

    .line 330
    :cond_0
    invoke-static {v11}, Lcom/amazon/ags/constants/ScoreFormat;->valueOf(Ljava/lang/String;)Lcom/amazon/ags/constants/ScoreFormat;

    move-result-object v7

    .line 331
    .local v7, "scoreFormat":Lcom/amazon/ags/constants/ScoreFormat;
    const-string v24, "LEADERBOARD_PERCENTILES_ARRAY"

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v16

    .line 333
    .local v16, "percentileListJson":Lorg/json/JSONArray;
    new-instance v15, Ljava/util/ArrayList;

    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONArray;->length()I

    move-result v24

    move/from16 v0, v24

    invoke-direct {v15, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 335
    .local v15, "percentileList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/api/leaderboards/LeaderboardPercentileItem;>;"
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_0
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONArray;->length()I

    move-result v24

    move/from16 v0, v24

    if-ge v12, v0, :cond_2

    .line 336
    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v23

    .line 337
    .local v23, "value":Ljava/lang/Object;
    move-object/from16 v0, v23

    instance-of v0, v0, Lorg/json/JSONObject;

    move/from16 v24, v0

    if-eqz v24, :cond_1

    move-object/from16 v24, v23

    .line 338
    check-cast v24, Lorg/json/JSONObject;

    const-string v25, "PlayerId"

    invoke-virtual/range {v24 .. v25}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .local v18, "playerID":Ljava/lang/String;
    move-object/from16 v24, v23

    .line 339
    check-cast v24, Lorg/json/JSONObject;

    const-string v25, "PlayerName"

    invoke-virtual/range {v24 .. v25}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .local v9, "alias":Ljava/lang/String;
    move-object/from16 v24, v23

    .line 340
    check-cast v24, Lorg/json/JSONObject;

    const-string v25, "AvatarUrl"

    invoke-virtual/range {v24 .. v25}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 341
    .local v10, "avatarUrl":Ljava/lang/String;
    new-instance v17, Lcom/amazon/ags/client/player/PlayerImpl;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v9, v10}, Lcom/amazon/ags/client/player/PlayerImpl;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .local v17, "player":Lcom/amazon/ags/api/player/Player;
    move-object/from16 v24, v23

    .line 342
    check-cast v24, Lorg/json/JSONObject;

    const-string v25, "PlayerScore"

    invoke-virtual/range {v24 .. v25}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v20

    .line 343
    .local v20, "score":J
    check-cast v23, Lorg/json/JSONObject;

    .end local v23    # "value":Ljava/lang/Object;
    const-string v24, "Percentile"

    invoke-virtual/range {v23 .. v24}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v13

    .line 344
    .local v13, "percentile":I
    new-instance v14, Lcom/amazon/ags/client/leaderboards/LeaderboardPercentileItemImpl;

    move-object/from16 v0, v17

    move-wide/from16 v1, v20

    invoke-direct {v14, v0, v1, v2, v13}, Lcom/amazon/ags/client/leaderboards/LeaderboardPercentileItemImpl;-><init>(Lcom/amazon/ags/api/player/Player;JI)V

    .line 345
    .local v14, "percentileItem":Lcom/amazon/ags/api/leaderboards/LeaderboardPercentileItem;
    invoke-interface {v15, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 335
    .end local v9    # "alias":Ljava/lang/String;
    .end local v10    # "avatarUrl":Ljava/lang/String;
    .end local v13    # "percentile":I
    .end local v14    # "percentileItem":Lcom/amazon/ags/api/leaderboards/LeaderboardPercentileItem;
    .end local v17    # "player":Lcom/amazon/ags/api/player/Player;
    .end local v18    # "playerID":Ljava/lang/String;
    .end local v20    # "score":J
    :cond_1
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    .line 349
    :cond_2
    new-instance v3, Lcom/amazon/ags/client/leaderboards/LeaderboardImpl;

    invoke-direct/range {v3 .. v8}, Lcom/amazon/ags/client/leaderboards/LeaderboardImpl;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/amazon/ags/constants/ScoreFormat;Ljava/lang/String;)V

    .line 350
    .local v3, "leaderboard":Lcom/amazon/ags/api/leaderboards/Leaderboard;
    new-instance v24, Lcom/amazon/ags/client/leaderboards/GetLeaderboardPercentilesResponseImpl;

    move-object/from16 v0, v24

    move/from16 v1, v22

    move/from16 v2, v19

    invoke-direct {v0, v3, v15, v1, v2}, Lcom/amazon/ags/client/leaderboards/GetLeaderboardPercentilesResponseImpl;-><init>(Lcom/amazon/ags/api/leaderboards/Leaderboard;Ljava/util/List;II)V

    return-object v24
.end method

.method public bridge synthetic getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/RequestResponse;
    .locals 1
    .param p1, "x0"    # I
    .param p2, "x1"    # Lorg/json/JSONObject;

    .prologue
    .line 305
    invoke-virtual {p0, p1, p2}, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl$5;->getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/leaderboards/GetLeaderboardPercentilesResponse;

    move-result-object v0

    return-object v0
.end method

.method public getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/leaderboards/GetLeaderboardPercentilesResponse;
    .locals 3
    .param p1, "responseCode"    # I
    .param p2, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 355
    new-instance v0, Lcom/amazon/ags/client/leaderboards/GetLeaderboardPercentilesResponseImpl;

    const/16 v1, 0x18

    sget-object v2, Lcom/amazon/ags/api/ErrorCode;->UNRECOVERABLE:Lcom/amazon/ags/api/ErrorCode;

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/client/leaderboards/GetLeaderboardPercentilesResponseImpl;-><init>(ILcom/amazon/ags/api/ErrorCode;)V

    return-object v0
.end method
