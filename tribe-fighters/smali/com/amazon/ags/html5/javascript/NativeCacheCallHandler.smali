.class public Lcom/amazon/ags/html5/javascript/NativeCacheCallHandler;
.super Lcom/amazon/ags/html5/javascript/CallHandlerBase;
.source "NativeCacheCallHandler.java"


# static fields
.field private static final supportedCacheCalls:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final cacheNameMapping:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/amazon/ags/storage/OfflineDataCache;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 31
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "setCacheItem"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "setCacheItems"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "getCacheItem"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "queryCacheItems"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "clearCache"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "removeCachedItems"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/amazon/ags/html5/javascript/NativeCacheCallHandler;->supportedCacheCalls:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Landroid/os/Handler;Lcom/amazon/ags/storage/OfflineDataCache;Lcom/amazon/ags/storage/OfflineDataCache;Lcom/amazon/ags/storage/OfflineDataCache;)V
    .locals 2
    .param p1, "uiThreadHandler"    # Landroid/os/Handler;
    .param p2, "achievementsCache"    # Lcom/amazon/ags/storage/OfflineDataCache;
    .param p3, "leaderboardsCache"    # Lcom/amazon/ags/storage/OfflineDataCache;
    .param p4, "playerProfileCache"    # Lcom/amazon/ags/storage/OfflineDataCache;

    .prologue
    .line 43
    sget-object v0, Lcom/amazon/ags/html5/javascript/NativeCacheCallHandler;->supportedCacheCalls:Ljava/util/Set;

    invoke-direct {p0, p1, v0}, Lcom/amazon/ags/html5/javascript/CallHandlerBase;-><init>(Landroid/os/Handler;Ljava/util/Set;)V

    .line 45
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/amazon/ags/html5/javascript/NativeCacheCallHandler;->cacheNameMapping:Ljava/util/Map;

    .line 46
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/NativeCacheCallHandler;->cacheNameMapping:Ljava/util/Map;

    const-string v1, "AchievementsCache"

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/NativeCacheCallHandler;->cacheNameMapping:Ljava/util/Map;

    const-string v1, "LeaderboardsCache"

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/NativeCacheCallHandler;->cacheNameMapping:Ljava/util/Map;

    const-string v1, "PlayerProfileCache"

    invoke-interface {v0, v1, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    return-void
.end method

.method private createCacheRequestFromJSON(Lorg/json/JSONObject;)Lcom/amazon/ags/storage/OfflineCacheRequest;
    .locals 4
    .param p1, "jsonCacheRequest"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 158
    const-string v3, "primaryKey"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 159
    .local v1, "primaryKey":Ljava/lang/String;
    const-string v3, "secondaryKey"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 160
    .local v2, "secondaryKey":Ljava/lang/String;
    const-string v3, "jsonData"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 161
    .local v0, "jsonData":Lorg/json/JSONObject;
    new-instance v3, Lcom/amazon/ags/storage/OfflineCacheRequest;

    invoke-direct {v3, v1, v2, v0}, Lcom/amazon/ags/storage/OfflineCacheRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    return-object v3
.end method

.method private handleCacheRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 19
    .param p1, "requestRID"    # Ljava/lang/String;
    .param p2, "target"    # Ljava/lang/String;
    .param p3, "nativeCallType"    # Ljava/lang/String;
    .param p4, "parameters"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 92
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/javascript/NativeCacheCallHandler;->cacheNameMapping:Ljava/util/Map;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    move-object/from16 v1, p2

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/amazon/ags/storage/OfflineDataCache;

    .line 94
    .local v9, "offlineCache":Lcom/amazon/ags/storage/OfflineDataCache;
    const-string v16, "setCacheItem"

    move-object/from16 v0, v16

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_0

    .line 95
    const-string v16, "cacheRequest"

    move-object/from16 v0, p4

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    .line 96
    .local v7, "jsonCacheRequest":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/amazon/ags/html5/javascript/NativeCacheCallHandler;->createCacheRequestFromJSON(Lorg/json/JSONObject;)Lcom/amazon/ags/storage/OfflineCacheRequest;

    move-result-object v3

    .line 97
    .local v3, "cacheRequest":Lcom/amazon/ags/storage/OfflineCacheRequest;
    invoke-interface {v9, v3}, Lcom/amazon/ags/storage/OfflineDataCache;->setCacheItem(Lcom/amazon/ags/storage/OfflineCacheRequest;)V

    .line 98
    const-string v12, "{}"

    .line 99
    .local v12, "responseJSON":Ljava/lang/String;
    const-string v11, "SUCCESS"

    .line 154
    .end local v3    # "cacheRequest":Lcom/amazon/ags/storage/OfflineCacheRequest;
    .end local v7    # "jsonCacheRequest":Lorg/json/JSONObject;
    .local v11, "responseCode":Ljava/lang/String;
    :goto_0
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v12, v11}, Lcom/amazon/ags/html5/javascript/NativeCacheCallHandler;->sendReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    return-void

    .line 100
    .end local v11    # "responseCode":Ljava/lang/String;
    .end local v12    # "responseJSON":Ljava/lang/String;
    :cond_0
    const-string v16, "setCacheItems"

    move-object/from16 v0, v16

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_2

    .line 101
    const-string v16, "cacheRequests"

    move-object/from16 v0, p4

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 102
    .local v4, "cacheRequests":Lorg/json/JSONArray;
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v16

    move/from16 v0, v16

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 103
    .local v2, "batchRequest":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineCacheRequest;>;"
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v16

    move/from16 v0, v16

    if-ge v5, v0, :cond_1

    .line 104
    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    .line 105
    .restart local v7    # "jsonCacheRequest":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/amazon/ags/html5/javascript/NativeCacheCallHandler;->createCacheRequestFromJSON(Lorg/json/JSONObject;)Lcom/amazon/ags/storage/OfflineCacheRequest;

    move-result-object v3

    .line 106
    .restart local v3    # "cacheRequest":Lcom/amazon/ags/storage/OfflineCacheRequest;
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 109
    .end local v3    # "cacheRequest":Lcom/amazon/ags/storage/OfflineCacheRequest;
    .end local v7    # "jsonCacheRequest":Lorg/json/JSONObject;
    :cond_1
    invoke-interface {v9, v2}, Lcom/amazon/ags/storage/OfflineDataCache;->setCacheItems(Ljava/util/List;)V

    .line 110
    const-string v12, "{}"

    .line 111
    .restart local v12    # "responseJSON":Ljava/lang/String;
    const-string v11, "SUCCESS"

    .line 112
    .restart local v11    # "responseCode":Ljava/lang/String;
    goto :goto_0

    .end local v2    # "batchRequest":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineCacheRequest;>;"
    .end local v4    # "cacheRequests":Lorg/json/JSONArray;
    .end local v5    # "i":I
    .end local v11    # "responseCode":Ljava/lang/String;
    .end local v12    # "responseJSON":Ljava/lang/String;
    :cond_2
    const-string v16, "getCacheItem"

    move-object/from16 v0, v16

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_4

    .line 113
    const-string v16, "primaryKey"

    move-object/from16 v0, p4

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 114
    .local v10, "primaryKey":Ljava/lang/String;
    invoke-interface {v9, v10}, Lcom/amazon/ags/storage/OfflineDataCache;->getCacheItem(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v13

    .line 115
    .local v13, "result":Lorg/json/JSONObject;
    if-eqz v13, :cond_3

    .line 116
    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v12

    .line 117
    .restart local v12    # "responseJSON":Ljava/lang/String;
    const-string v11, "SUCCESS"

    .restart local v11    # "responseCode":Ljava/lang/String;
    goto :goto_0

    .line 119
    .end local v11    # "responseCode":Ljava/lang/String;
    .end local v12    # "responseJSON":Ljava/lang/String;
    :cond_3
    const-string v12, "{}"

    .line 120
    .restart local v12    # "responseJSON":Ljava/lang/String;
    const-string v11, "ERROR"

    .restart local v11    # "responseCode":Ljava/lang/String;
    goto :goto_0

    .line 122
    .end local v10    # "primaryKey":Ljava/lang/String;
    .end local v11    # "responseCode":Ljava/lang/String;
    .end local v12    # "responseJSON":Ljava/lang/String;
    .end local v13    # "result":Lorg/json/JSONObject;
    :cond_4
    const-string v16, "queryCacheItems"

    move-object/from16 v0, v16

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_7

    .line 123
    const-string v16, "secondaryKey"

    move-object/from16 v0, p4

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 124
    .local v15, "secondaryKey":Ljava/lang/String;
    invoke-interface {v9, v15}, Lcom/amazon/ags/storage/OfflineDataCache;->queryCacheItems(Ljava/lang/String;)Ljava/util/List;

    move-result-object v14

    .line 126
    .local v14, "results":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    if-eqz v14, :cond_5

    .line 128
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6, v14}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    .line 132
    .local v6, "jsonArray":Lorg/json/JSONArray;
    :goto_2
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 133
    .local v8, "jsonResult":Lorg/json/JSONObject;
    const-string v16, "queryResult"

    move-object/from16 v0, v16

    invoke-virtual {v8, v0, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 134
    if-eqz v14, :cond_6

    .line 135
    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v12

    .line 136
    .restart local v12    # "responseJSON":Ljava/lang/String;
    const-string v11, "SUCCESS"

    .restart local v11    # "responseCode":Ljava/lang/String;
    goto/16 :goto_0

    .line 130
    .end local v6    # "jsonArray":Lorg/json/JSONArray;
    .end local v8    # "jsonResult":Lorg/json/JSONObject;
    .end local v11    # "responseCode":Ljava/lang/String;
    .end local v12    # "responseJSON":Ljava/lang/String;
    :cond_5
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    .restart local v6    # "jsonArray":Lorg/json/JSONArray;
    goto :goto_2

    .line 138
    .restart local v8    # "jsonResult":Lorg/json/JSONObject;
    :cond_6
    const-string v12, "{}"

    .line 139
    .restart local v12    # "responseJSON":Ljava/lang/String;
    const-string v11, "ERROR"

    .restart local v11    # "responseCode":Ljava/lang/String;
    goto/16 :goto_0

    .line 141
    .end local v6    # "jsonArray":Lorg/json/JSONArray;
    .end local v8    # "jsonResult":Lorg/json/JSONObject;
    .end local v11    # "responseCode":Ljava/lang/String;
    .end local v12    # "responseJSON":Ljava/lang/String;
    .end local v14    # "results":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    .end local v15    # "secondaryKey":Ljava/lang/String;
    :cond_7
    const-string v16, "clearCache"

    move-object/from16 v0, v16

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_8

    .line 142
    invoke-interface {v9}, Lcom/amazon/ags/storage/OfflineDataCache;->clear()V

    .line 143
    const-string v12, "{}"

    .line 144
    .restart local v12    # "responseJSON":Ljava/lang/String;
    const-string v11, "SUCCESS"

    .restart local v11    # "responseCode":Ljava/lang/String;
    goto/16 :goto_0

    .line 145
    .end local v11    # "responseCode":Ljava/lang/String;
    .end local v12    # "responseJSON":Ljava/lang/String;
    :cond_8
    const-string v16, "removeCachedItems"

    move-object/from16 v0, v16

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_9

    .line 146
    const-string v16, "secondaryKey"

    move-object/from16 v0, p4

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 147
    .restart local v15    # "secondaryKey":Ljava/lang/String;
    invoke-interface {v9, v15}, Lcom/amazon/ags/storage/OfflineDataCache;->removeCachedItems(Ljava/lang/String;)V

    .line 148
    const-string v12, "{}"

    .line 149
    .restart local v12    # "responseJSON":Ljava/lang/String;
    const-string v11, "SUCCESS"

    .line 150
    .restart local v11    # "responseCode":Ljava/lang/String;
    goto/16 :goto_0

    .line 151
    .end local v11    # "responseCode":Ljava/lang/String;
    .end local v12    # "responseJSON":Ljava/lang/String;
    .end local v15    # "secondaryKey":Ljava/lang/String;
    :cond_9
    new-instance v16, Ljava/lang/IllegalArgumentException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Cache request method not supported: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v16
.end method


# virtual methods
.method protected handleMessage(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 7
    .param p1, "rid"    # Ljava/lang/String;
    .param p2, "nativeCallType"    # Ljava/lang/String;
    .param p3, "request"    # Lorg/json/JSONObject;

    .prologue
    const/4 v3, 0x1

    .line 53
    sget-object v4, Lcom/amazon/ags/html5/javascript/NativeCacheCallHandler;->supportedCacheCalls:Ljava/util/Set;

    invoke-interface {v4, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 54
    const/4 v3, 0x0

    .line 84
    :goto_0
    return v3

    .line 57
    :cond_0
    invoke-static {}, Lcom/amazon/ags/html5/factory/ServiceFactory;->isDebugLoggingEnabled()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 58
    iget-object v4, p0, Lcom/amazon/ags/html5/javascript/NativeCacheCallHandler;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Cache call: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    :cond_1
    :try_start_0
    const-string v4, "target"

    invoke-virtual {p3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 66
    .local v2, "requestTarget":Ljava/lang/String;
    const-string v4, "parameters"

    invoke-virtual {p3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 68
    .local v1, "requestParameters":Lorg/json/JSONObject;
    if-eqz v2, :cond_2

    if-eqz v1, :cond_2

    if-nez p1, :cond_3

    .line 69
    :cond_2
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Insufficient arguments for cache request"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    .end local v1    # "requestParameters":Lorg/json/JSONObject;
    .end local v2    # "requestTarget":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 72
    .local v0, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/amazon/ags/html5/javascript/NativeCacheCallHandler;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Cache request "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " failed"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 73
    const-string v4, "{}"

    const-string v5, "REQUEST_ERROR"

    invoke-virtual {p0, p1, v4, v5}, Lcom/amazon/ags/html5/javascript/NativeCacheCallHandler;->sendReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 78
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "requestParameters":Lorg/json/JSONObject;
    .restart local v2    # "requestTarget":Ljava/lang/String;
    :cond_3
    :try_start_1
    invoke-direct {p0, p1, v2, p2, v1}, Lcom/amazon/ags/html5/javascript/NativeCacheCallHandler;->handleCacheRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 79
    :catch_1
    move-exception v0

    .line 80
    .restart local v0    # "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/amazon/ags/html5/javascript/NativeCacheCallHandler;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Cache request "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " failed"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 81
    const-string v4, "{}"

    const-string v5, "ERROR"

    invoke-virtual {p0, p1, v4, v5}, Lcom/amazon/ags/html5/javascript/NativeCacheCallHandler;->sendReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method
