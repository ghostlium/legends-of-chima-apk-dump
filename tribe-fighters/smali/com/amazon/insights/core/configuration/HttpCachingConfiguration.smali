.class public Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;
.super Ljava/lang/Object;
.source "HttpCachingConfiguration.java"

# interfaces
.implements Lcom/amazon/insights/core/configuration/Configuration;


# static fields
.field private static final CONFIG_KEY:Ljava/lang/String; = "configuration"

.field private static final CONFIG_KEY_LAST_SYNC:Ljava/lang/String; = "configuration.lastSyncDate"

.field private static final DEFAULT_SYNC_INTERVAL:J = 0x36ee80L

.field private static final ENDPOINT:Ljava/lang/String; = "https://applab-sdk.amazon.com/1.0"

.field private static final ENDPOINT_PATH:Ljava/lang/String; = "%s/applications/%s/configuration"

.field private static final UNIQUE_ID_HEADER_NAME:Ljava/lang/String; = "x-amzn-UniqueId"

.field private static final logger:Lcom/amazon/insights/core/log/Logger;


# instance fields
.field private final backgroundExecutor:Ljava/util/concurrent/ExecutorService;

.field private final context:Lcom/amazon/insights/core/InsightsContext;

.field private isUpdateInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private lastSync:Ljava/util/concurrent/atomic/AtomicLong;

.field private final overrideProperties:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private properties:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const-class v0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->logger:Lcom/amazon/insights/core/log/Logger;

    return-void
.end method

.method constructor <init>(Lcom/amazon/insights/core/InsightsContext;Ljava/util/concurrent/ExecutorService;Ljava/util/Map;)V
    .locals 11
    .param p1, "context"    # Lcom/amazon/insights/core/InsightsContext;
    .param p2, "executor"    # Ljava/util/concurrent/ExecutorService;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/insights/core/InsightsContext;",
            "Ljava/util/concurrent/ExecutorService;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, "overrideProperties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-wide/16 v9, 0x0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v5, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v5, v9, v10}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v5, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->lastSync:Ljava/util/concurrent/atomic/AtomicLong;

    .line 49
    new-instance v5, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v6, 0x0

    invoke-direct {v5, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v5, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->isUpdateInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 50
    new-instance v5, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v5}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v5, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->properties:Ljava/util/Map;

    .line 57
    invoke-static {p1}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    invoke-static {p2}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    invoke-static {p3}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    iput-object p1, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->context:Lcom/amazon/insights/core/InsightsContext;

    .line 62
    iput-object p3, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->overrideProperties:Ljava/util/Map;

    .line 63
    iput-object p2, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->backgroundExecutor:Ljava/util/concurrent/ExecutorService;

    .line 66
    const/4 v0, 0x0

    .line 68
    .local v0, "configJson":Lorg/json/JSONObject;
    invoke-direct {p0}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->getContext()Lcom/amazon/insights/core/InsightsContext;

    move-result-object v5

    invoke-interface {v5}, Lcom/amazon/insights/core/InsightsContext;->getSystem()Lcom/amazon/insights/core/system/System;

    move-result-object v5

    invoke-interface {v5}, Lcom/amazon/insights/core/system/System;->getPreferences()Lcom/amazon/insights/core/system/Preferences;

    move-result-object v4

    .line 69
    .local v4, "preferences":Lcom/amazon/insights/core/system/Preferences;
    if-eqz v4, :cond_0

    .line 71
    :try_start_0
    iget-object v5, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->lastSync:Ljava/util/concurrent/atomic/AtomicLong;

    const-string v6, "configuration.lastSyncDate"

    const-wide/16 v7, 0x0

    invoke-interface {v4, v6, v7, v8}, Lcom/amazon/insights/core/system/Preferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    :goto_0
    const-string v5, "configuration"

    const/4 v6, 0x0

    invoke-interface {v4, v5, v6}, Lcom/amazon/insights/core/system/Preferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 78
    .local v2, "configurationJsonString":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 80
    :try_start_1
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .end local v0    # "configJson":Lorg/json/JSONObject;
    .local v1, "configJson":Lorg/json/JSONObject;
    move-object v0, v1

    .line 89
    .end local v1    # "configJson":Lorg/json/JSONObject;
    .end local v2    # "configurationJsonString":Ljava/lang/String;
    .restart local v0    # "configJson":Lorg/json/JSONObject;
    :cond_0
    :goto_1
    invoke-direct {p0, v0}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->updateMappings(Lorg/json/JSONObject;)V

    .line 90
    return-void

    .line 72
    :catch_0
    move-exception v3

    .line 73
    .local v3, "e":Ljava/lang/ClassCastException;
    iget-object v5, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->lastSync:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v5, v9, v10}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    goto :goto_0

    .line 81
    .end local v3    # "e":Ljava/lang/ClassCastException;
    .restart local v2    # "configurationJsonString":Ljava/lang/String;
    :catch_1
    move-exception v3

    .line 82
    .local v3, "e":Lorg/json/JSONException;
    sget-object v5, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v6, "could not create Json object of Config"

    invoke-virtual {v5, v6, v3}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 83
    iget-object v5, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->lastSync:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v5, v9, v10}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    goto :goto_1
.end method

.method static synthetic access$000(Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;)Lcom/amazon/insights/core/InsightsContext;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->context:Lcom/amazon/insights/core/InsightsContext;

    return-object v0
.end method

.method static synthetic access$100(Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->properties:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$200()Lcom/amazon/insights/core/log/Logger;
    .locals 1

    .prologue
    .line 31
    sget-object v0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->logger:Lcom/amazon/insights/core/log/Logger;

    return-object v0
.end method

.method static synthetic access$300(Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;)Lcom/amazon/insights/core/InsightsContext;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->getContext()Lcom/amazon/insights/core/InsightsContext;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;Lorg/json/JSONObject;)V
    .locals 0
    .param p0, "x0"    # Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;
    .param p1, "x1"    # Lorg/json/JSONObject;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->updateMappings(Lorg/json/JSONObject;)V

    return-void
.end method

.method static synthetic access$500(Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->getIsUpdateInProgress()Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    return-object v0
.end method

.method private evaluateLastSync()V
    .locals 13

    .prologue
    .line 389
    const-wide/32 v5, 0x36ee80

    .line 390
    .local v5, "syncInterval":J
    iget-object v8, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->properties:Ljava/util/Map;

    const-string v9, "syncInterval"

    invoke-interface {v8, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 392
    .local v7, "syncIntervalString":Ljava/lang/String;
    if-eqz v7, :cond_0

    .line 393
    :try_start_0
    invoke-static {v7}, Ljava/lang/Long;->decode(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v5

    .line 400
    :cond_0
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 401
    .local v1, "now":J
    invoke-direct {p0}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->getLastSync()J

    move-result-wide v8

    sub-long v3, v1, v8

    .line 403
    .local v3, "syncDelta":J
    cmp-long v8, v3, v5

    if-lez v8, :cond_1

    .line 405
    invoke-virtual {p0}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->syncConfiguration()V

    .line 407
    :cond_1
    return-void

    .line 395
    .end local v1    # "now":J
    .end local v3    # "syncDelta":J
    :catch_0
    move-exception v0

    .line 396
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v8, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v9, "Could not get Long for propertyName: %s"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const-string v12, "syncInterval"

    aput-object v12, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9, v0}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private getBackgroundExecutor()Ljava/util/concurrent/ExecutorService;
    .locals 1

    .prologue
    .line 424
    iget-object v0, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->backgroundExecutor:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method private getContext()Lcom/amazon/insights/core/InsightsContext;
    .locals 1

    .prologue
    .line 420
    iget-object v0, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->context:Lcom/amazon/insights/core/InsightsContext;

    return-object v0
.end method

.method private getIsUpdateInProgress()Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1

    .prologue
    .line 428
    iget-object v0, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->isUpdateInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method private getLastSync()J
    .locals 2

    .prologue
    .line 410
    iget-object v0, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->lastSync:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method public static newInstance(Lcom/amazon/insights/core/InsightsContext;Ljava/util/Map;)Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;
    .locals 2
    .param p0, "context"    # Lcom/amazon/insights/core/InsightsContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/insights/core/InsightsContext;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;"
        }
    .end annotation

    .prologue
    .line 53
    .local p1, "overrideProperties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    invoke-direct {v0, p0, v1, p1}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;-><init>(Lcom/amazon/insights/core/InsightsContext;Ljava/util/concurrent/ExecutorService;Ljava/util/Map;)V

    return-object v0
.end method

.method private optStringInternal(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "optValue"    # Ljava/lang/String;

    .prologue
    .line 246
    iget-object v1, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->properties:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 247
    .local v0, "value":Ljava/lang/String;
    if-eqz v0, :cond_0

    .end local v0    # "value":Ljava/lang/String;
    :goto_0
    return-object v0

    .restart local v0    # "value":Ljava/lang/String;
    :cond_0
    move-object v0, p2

    goto :goto_0
.end method

.method private updateMappings(Lorg/json/JSONObject;)V
    .locals 9
    .param p1, "configJson"    # Lorg/json/JSONObject;

    .prologue
    .line 255
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 257
    .local v5, "newProperties":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p1, :cond_0

    .line 258
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v4

    .line 260
    .local v4, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 261
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 263
    .local v3, "key":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 264
    .local v6, "value":Ljava/lang/String;
    invoke-virtual {v5, v3, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 265
    .end local v6    # "value":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 266
    .local v0, "e":Lorg/json/JSONException;
    sget-object v7, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v8, "could not update property mappings"

    invoke-virtual {v7, v8, v0}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 272
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_0
    iget-object v7, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->overrideProperties:Ljava/util/Map;

    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 273
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 277
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    iget-object v7, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->properties:Ljava/util/Map;

    invoke-interface {v7, v5}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 279
    return-void
.end method


# virtual methods
.method createHttpRequest()Lcom/amazon/insights/core/http/HttpClient$Request;
    .locals 9

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 367
    invoke-direct {p0}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->getContext()Lcom/amazon/insights/core/InsightsContext;

    move-result-object v3

    invoke-interface {v3}, Lcom/amazon/insights/core/InsightsContext;->getHttpClient()Lcom/amazon/insights/core/http/HttpClient;

    move-result-object v3

    if-eqz v3, :cond_0

    move v3, v4

    :goto_0
    const-string v6, "An httpClient must be created in order to resolve configuration via http"

    invoke-static {v3, v6}, Lcom/amazon/insights/core/util/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 369
    const-string v3, "%s/applications/%s/configuration"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const-string v7, "configEndpoint"

    const-string v8, "https://applab-sdk.amazon.com/1.0"

    invoke-direct {p0, v7, v8}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->optStringInternal(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v5

    invoke-direct {p0}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->getContext()Lcom/amazon/insights/core/InsightsContext;

    move-result-object v5

    invoke-interface {v5}, Lcom/amazon/insights/core/InsightsContext;->getCredentials()Lcom/amazon/insights/InsightsCredentials;

    move-result-object v5

    invoke-interface {v5}, Lcom/amazon/insights/InsightsCredentials;->getApplicationKey()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v6, v4

    invoke-static {v3, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 371
    .local v1, "operationUrl":Ljava/lang/String;
    invoke-direct {p0}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->getContext()Lcom/amazon/insights/core/InsightsContext;

    move-result-object v3

    invoke-interface {v3}, Lcom/amazon/insights/core/InsightsContext;->getUniqueId()Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v2

    .line 373
    .local v2, "uniqueId":Lcom/amazon/insights/core/idresolver/Id;
    invoke-virtual {p0}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->createHttpRequestInstance()Lcom/amazon/insights/core/http/HttpClient$Request;

    move-result-object v0

    .line 374
    .local v0, "httpRequest":Lcom/amazon/insights/core/http/HttpClient$Request;
    invoke-interface {v0, v1}, Lcom/amazon/insights/core/http/HttpClient$Request;->setUrl(Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Request;

    .line 375
    sget-object v3, Lcom/amazon/insights/core/http/HttpClient$HttpMethod;->GET:Lcom/amazon/insights/core/http/HttpClient$HttpMethod;

    invoke-interface {v0, v3}, Lcom/amazon/insights/core/http/HttpClient$Request;->setMethod(Lcom/amazon/insights/core/http/HttpClient$HttpMethod;)Lcom/amazon/insights/core/http/HttpClient$Request;

    .line 376
    const-string v4, "x-amzn-UniqueId"

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/amazon/insights/core/idresolver/Id;->getValue()Ljava/lang/String;

    move-result-object v3

    :goto_1
    invoke-interface {v0, v4, v3}, Lcom/amazon/insights/core/http/HttpClient$Request;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Request;

    .line 377
    return-object v0

    .end local v0    # "httpRequest":Lcom/amazon/insights/core/http/HttpClient$Request;
    .end local v1    # "operationUrl":Ljava/lang/String;
    .end local v2    # "uniqueId":Lcom/amazon/insights/core/idresolver/Id;
    :cond_0
    move v3, v5

    .line 367
    goto :goto_0

    .line 376
    .restart local v0    # "httpRequest":Lcom/amazon/insights/core/http/HttpClient$Request;
    .restart local v1    # "operationUrl":Ljava/lang/String;
    .restart local v2    # "uniqueId":Lcom/amazon/insights/core/idresolver/Id;
    :cond_1
    const-string v3, ""

    goto :goto_1
.end method

.method createHttpRequestInstance()Lcom/amazon/insights/core/http/HttpClient$Request;
    .locals 1

    .prologue
    .line 381
    iget-object v0, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v0}, Lcom/amazon/insights/core/InsightsContext;->getHttpClient()Lcom/amazon/insights/core/http/HttpClient;

    move-result-object v0

    invoke-interface {v0}, Lcom/amazon/insights/core/http/HttpClient;->newRequest()Lcom/amazon/insights/core/http/HttpClient$Request;

    move-result-object v0

    return-object v0
.end method

.method public getBoolean(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 7
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 165
    const/4 v1, 0x0

    .line 166
    .local v1, "value":Ljava/lang/Boolean;
    iget-object v3, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->properties:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 168
    .local v2, "valueString":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 170
    :try_start_0
    invoke-static {v2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 177
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->evaluateLastSync()V

    .line 179
    return-object v1

    .line 171
    :catch_0
    move-exception v0

    .line 172
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v3, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v4, "Could not get Boolean for propertyName: %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v0}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getDouble(Ljava/lang/String;)Ljava/lang/Double;
    .locals 7
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 146
    const/4 v1, 0x0

    .line 147
    .local v1, "value":Ljava/lang/Double;
    iget-object v3, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->properties:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 149
    .local v2, "valueString":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 151
    :try_start_0
    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 158
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->evaluateLastSync()V

    .line 160
    return-object v1

    .line 152
    :catch_0
    move-exception v0

    .line 153
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v3, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v4, "Could not get Double for propertyName: %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v0}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getInt(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 7
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 126
    const/4 v1, 0x0

    .line 127
    .local v1, "value":Ljava/lang/Integer;
    iget-object v3, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->properties:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 129
    .local v2, "valueString":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 131
    :try_start_0
    invoke-static {v2}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 139
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->evaluateLastSync()V

    .line 141
    return-object v1

    .line 132
    :catch_0
    move-exception v0

    .line 133
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v3, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v4, "Could not get Integer for propertyName: %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v0}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getLong(Ljava/lang/String;)Ljava/lang/Long;
    .locals 7
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 94
    const/4 v1, 0x0

    .line 95
    .local v1, "value":Ljava/lang/Long;
    iget-object v3, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->properties:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 97
    .local v2, "valueString":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 99
    :try_start_0
    invoke-static {v2}, Ljava/lang/Long;->decode(Ljava/lang/String;)Ljava/lang/Long;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 107
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->evaluateLastSync()V

    .line 109
    return-object v1

    .line 100
    :catch_0
    move-exception v0

    .line 101
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v3, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v4, "Could not get Long for propertyName: %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v0}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getShort(Ljava/lang/String;)Ljava/lang/Short;
    .locals 7
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 184
    const/4 v1, 0x0

    .line 185
    .local v1, "value":Ljava/lang/Short;
    iget-object v3, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->properties:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 187
    .local v2, "valueString":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 189
    :try_start_0
    iget-object v3, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->properties:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 190
    invoke-static {v2}, Ljava/lang/Short;->decode(Ljava/lang/String;)Ljava/lang/Short;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 198
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->evaluateLastSync()V

    .line 200
    return-object v1

    .line 192
    :catch_0
    move-exception v0

    .line 193
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v3, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v4, "Could not get Short for propertyName: %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v0}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 115
    iget-object v1, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->properties:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 118
    .local v0, "value":Ljava/lang/String;
    invoke-direct {p0}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->evaluateLastSync()V

    .line 120
    return-object v0
.end method

.method public optBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 1
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "optValue"    # Ljava/lang/Boolean;

    .prologue
    .line 235
    invoke-virtual {p0, p1}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->getBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    .line 236
    .local v0, "value":Ljava/lang/Boolean;
    if-eqz v0, :cond_0

    .end local v0    # "value":Ljava/lang/Boolean;
    :goto_0
    return-object v0

    .restart local v0    # "value":Ljava/lang/Boolean;
    :cond_0
    move-object v0, p2

    goto :goto_0
.end method

.method public optDouble(Ljava/lang/String;Ljava/lang/Double;)Ljava/lang/Double;
    .locals 1
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "optValue"    # Ljava/lang/Double;

    .prologue
    .line 229
    invoke-virtual {p0, p1}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->getDouble(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    .line 230
    .local v0, "value":Ljava/lang/Double;
    if-eqz v0, :cond_0

    .end local v0    # "value":Ljava/lang/Double;
    :goto_0
    return-object v0

    .restart local v0    # "value":Ljava/lang/Double;
    :cond_0
    move-object v0, p2

    goto :goto_0
.end method

.method public optInt(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 1
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "optValue"    # Ljava/lang/Integer;

    .prologue
    .line 217
    invoke-virtual {p0, p1}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->getInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    .line 218
    .local v0, "value":Ljava/lang/Integer;
    if-eqz v0, :cond_0

    .end local v0    # "value":Ljava/lang/Integer;
    :goto_0
    return-object v0

    .restart local v0    # "value":Ljava/lang/Integer;
    :cond_0
    move-object v0, p2

    goto :goto_0
.end method

.method public optLong(Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Long;
    .locals 1
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "optValue"    # Ljava/lang/Long;

    .prologue
    .line 205
    invoke-virtual {p0, p1}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->getLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    .line 206
    .local v0, "value":Ljava/lang/Long;
    if-eqz v0, :cond_0

    .end local v0    # "value":Ljava/lang/Long;
    :goto_0
    return-object v0

    .restart local v0    # "value":Ljava/lang/Long;
    :cond_0
    move-object v0, p2

    goto :goto_0
.end method

.method public optShort(Ljava/lang/String;Ljava/lang/Short;)Ljava/lang/Short;
    .locals 1
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "optValue"    # Ljava/lang/Short;

    .prologue
    .line 223
    invoke-virtual {p0, p1}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->getShort(Ljava/lang/String;)Ljava/lang/Short;

    move-result-object v0

    .line 224
    .local v0, "value":Ljava/lang/Short;
    if-eqz v0, :cond_0

    .end local v0    # "value":Ljava/lang/Short;
    :goto_0
    return-object v0

    .restart local v0    # "value":Ljava/lang/Short;
    :cond_0
    move-object v0, p2

    goto :goto_0
.end method

.method public optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "optValue"    # Ljava/lang/String;

    .prologue
    .line 211
    invoke-virtual {p0, p1}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 212
    .local v0, "value":Ljava/lang/String;
    if-eqz v0, :cond_0

    .end local v0    # "value":Ljava/lang/String;
    :goto_0
    return-object v0

    .restart local v0    # "value":Ljava/lang/String;
    :cond_0
    move-object v0, p2

    goto :goto_0
.end method

.method public refresh()V
    .locals 0

    .prologue
    .line 241
    invoke-direct {p0}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->evaluateLastSync()V

    .line 242
    return-void
.end method

.method setLastSync(J)V
    .locals 4
    .param p1, "lastSync"    # J

    .prologue
    .line 414
    iget-object v1, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->lastSync:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 415
    invoke-direct {p0}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->getContext()Lcom/amazon/insights/core/InsightsContext;

    move-result-object v1

    invoke-interface {v1}, Lcom/amazon/insights/core/InsightsContext;->getSystem()Lcom/amazon/insights/core/system/System;

    move-result-object v1

    invoke-interface {v1}, Lcom/amazon/insights/core/system/System;->getPreferences()Lcom/amazon/insights/core/system/Preferences;

    move-result-object v0

    .line 416
    .local v0, "preferences":Lcom/amazon/insights/core/system/Preferences;
    const-string v1, "configuration.lastSyncDate"

    iget-object v2, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->lastSync:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Lcom/amazon/insights/core/system/Preferences;->putLong(Ljava/lang/String;J)V

    .line 417
    return-void
.end method

.method syncConfiguration()V
    .locals 3

    .prologue
    .line 287
    invoke-direct {p0}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->getIsUpdateInProgress()Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 288
    invoke-direct {p0}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->getBackgroundExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration$1;

    invoke-direct {v1, p0}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration$1;-><init>(Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 360
    :cond_0
    return-void
.end method
