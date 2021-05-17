.class public abstract Lcom/amazon/insights/AmazonInsights;
.super Ljava/lang/Object;
.source "AmazonInsights.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/insights/AmazonInsights$DefaultAmazonInsights;
    }
.end annotation


# static fields
.field private static final SDK_NAME:Ljava/lang/String; = "AmazonInsightsSDK"

.field private static final SDK_VERSION:Ljava/lang/String; = "2.1.16.0"

.field private static final instances:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/amazon/insights/InsightsCredentials;",
            "Lcom/amazon/insights/AmazonInsights;",
            ">;"
        }
    .end annotation
.end field

.field private static final logger:Lcom/amazon/insights/core/log/Logger;

.field private static final sdkInfo:Lcom/amazon/insights/core/util/SDKInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 120
    new-instance v0, Lcom/amazon/insights/core/util/SDKInfo;

    const-string v1, "AmazonInsightsSDK"

    const-string v2, "2.1.16.0"

    invoke-direct {v0, v1, v2}, Lcom/amazon/insights/core/util/SDKInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/amazon/insights/AmazonInsights;->sdkInfo:Lcom/amazon/insights/core/util/SDKInfo;

    .line 121
    const-class v0, Lcom/amazon/insights/AmazonInsights;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/AmazonInsights;->logger:Lcom/amazon/insights/core/log/Logger;

    .line 122
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/amazon/insights/AmazonInsights;->instances:Ljava/util/Map;

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 125
    return-void
.end method

.method static synthetic access$000()Lcom/amazon/insights/core/log/Logger;
    .locals 1

    .prologue
    .line 117
    sget-object v0, Lcom/amazon/insights/AmazonInsights;->logger:Lcom/amazon/insights/core/log/Logger;

    return-object v0
.end method

.method public static declared-synchronized getInstance(Lcom/amazon/insights/InsightsCredentials;)Lcom/amazon/insights/AmazonInsights;
    .locals 3
    .param p0, "credentials"    # Lcom/amazon/insights/InsightsCredentials;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 169
    const-class v1, Lcom/amazon/insights/AmazonInsights;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/amazon/insights/AmazonInsights;->instances:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 170
    sget-object v0, Lcom/amazon/insights/AmazonInsights;->instances:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/AmazonInsights;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 172
    :cond_0
    :try_start_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "There was not an AmazonInsights instance registered for the credentials provided. Make sure you call newInstance before trying to retrieve the instance via getInstance"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 169
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static getSDKInfo()Lcom/amazon/insights/core/util/SDKInfo;
    .locals 1

    .prologue
    .line 305
    sget-object v0, Lcom/amazon/insights/AmazonInsights;->sdkInfo:Lcom/amazon/insights/core/util/SDKInfo;

    return-object v0
.end method

.method public static newCredentials(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/InsightsCredentials;
    .locals 1
    .param p0, "applicationKey"    # Ljava/lang/String;
    .param p1, "privateKey"    # Ljava/lang/String;

    .prologue
    .line 135
    const-string v0, "The application key provided must not be null"

    invoke-static {p0, v0}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    const-string v0, "The private key provided must not be null"

    invoke-static {p1, v0}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    new-instance v0, Lcom/amazon/insights/impl/DefaultInsightsCredentials;

    invoke-direct {v0, p0, p1}, Lcom/amazon/insights/impl/DefaultInsightsCredentials;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static newDefaultOptions()Lcom/amazon/insights/InsightsOptions;
    .locals 3

    .prologue
    .line 146
    new-instance v0, Lcom/amazon/insights/impl/DefaultInsightsOptions;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/amazon/insights/impl/DefaultInsightsOptions;-><init>(ZZ)V

    return-object v0
.end method

.method static newInsightsContext(Lcom/amazon/insights/InsightsCredentials;Landroid/content/Context;)Lcom/amazon/insights/core/InsightsContext;
    .locals 1
    .param p0, "credentials"    # Lcom/amazon/insights/InsightsCredentials;
    .param p1, "appContext"    # Landroid/content/Context;

    .prologue
    .line 273
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {p0, p1, v0}, Lcom/amazon/insights/AmazonInsights;->newInsightsContext(Lcom/amazon/insights/InsightsCredentials;Landroid/content/Context;Ljava/util/Map;)Lcom/amazon/insights/core/InsightsContext;

    move-result-object v0

    return-object v0
.end method

.method static newInsightsContext(Lcom/amazon/insights/InsightsCredentials;Landroid/content/Context;Ljava/util/Map;)Lcom/amazon/insights/core/InsightsContext;
    .locals 2
    .param p0, "credentials"    # Lcom/amazon/insights/InsightsCredentials;
    .param p1, "appContext"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/insights/InsightsCredentials;",
            "Landroid/content/Context;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/amazon/insights/core/InsightsContext;"
        }
    .end annotation

    .prologue
    .line 277
    .local p2, "settings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    sget-object v0, Lcom/amazon/insights/AmazonInsights;->sdkInfo:Lcom/amazon/insights/core/util/SDKInfo;

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v1, p2}, Lcom/amazon/insights/core/DefaultInsightsContext;->newInstance(Lcom/amazon/insights/InsightsCredentials;Landroid/content/Context;Lcom/amazon/insights/core/util/SDKInfo;ZLjava/util/Map;)Lcom/amazon/insights/core/InsightsContext;

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized newInstance(Lcom/amazon/insights/InsightsCredentials;Landroid/content/Context;)Lcom/amazon/insights/AmazonInsights;
    .locals 3
    .param p0, "credentials"    # Lcom/amazon/insights/InsightsCredentials;
    .param p1, "appContext"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;
        }
    .end annotation

    .prologue
    .line 186
    const-class v1, Lcom/amazon/insights/AmazonInsights;

    monitor-enter v1

    :try_start_0
    invoke-static {}, Lcom/amazon/insights/AmazonInsights;->newDefaultOptions()Lcom/amazon/insights/InsightsOptions;

    move-result-object v0

    const/4 v2, 0x0

    invoke-static {p0, p1, v0, v2}, Lcom/amazon/insights/AmazonInsights;->newInstance(Lcom/amazon/insights/InsightsCredentials;Landroid/content/Context;Lcom/amazon/insights/InsightsOptions;Lcom/amazon/insights/InsightsCallback;)Lcom/amazon/insights/AmazonInsights;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized newInstance(Lcom/amazon/insights/InsightsCredentials;Landroid/content/Context;Lcom/amazon/insights/InsightsCallback;)Lcom/amazon/insights/AmazonInsights;
    .locals 2
    .param p0, "credentials"    # Lcom/amazon/insights/InsightsCredentials;
    .param p1, "appContext"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/insights/InsightsCredentials;",
            "Landroid/content/Context;",
            "Lcom/amazon/insights/InsightsCallback",
            "<",
            "Lcom/amazon/insights/AmazonInsights;",
            ">;)",
            "Lcom/amazon/insights/AmazonInsights;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;
        }
    .end annotation

    .prologue
    .line 199
    .local p2, "initCompletionCallback":Lcom/amazon/insights/InsightsCallback;, "Lcom/amazon/insights/InsightsCallback<Lcom/amazon/insights/AmazonInsights;>;"
    const-class v1, Lcom/amazon/insights/AmazonInsights;

    monitor-enter v1

    :try_start_0
    invoke-static {}, Lcom/amazon/insights/AmazonInsights;->newDefaultOptions()Lcom/amazon/insights/InsightsOptions;

    move-result-object v0

    invoke-static {p0, p1, v0, p2}, Lcom/amazon/insights/AmazonInsights;->newInstance(Lcom/amazon/insights/InsightsCredentials;Landroid/content/Context;Lcom/amazon/insights/InsightsOptions;Lcom/amazon/insights/InsightsCallback;)Lcom/amazon/insights/AmazonInsights;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized newInstance(Lcom/amazon/insights/InsightsCredentials;Landroid/content/Context;Lcom/amazon/insights/InsightsOptions;)Lcom/amazon/insights/AmazonInsights;
    .locals 3
    .param p0, "credentials"    # Lcom/amazon/insights/InsightsCredentials;
    .param p1, "appContext"    # Landroid/content/Context;
    .param p2, "options"    # Lcom/amazon/insights/InsightsOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;
        }
    .end annotation

    .prologue
    .line 212
    const-class v1, Lcom/amazon/insights/AmazonInsights;

    monitor-enter v1

    :try_start_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const/4 v2, 0x0

    invoke-static {p0, p1, p2, v0, v2}, Lcom/amazon/insights/AmazonInsights;->newInstance(Lcom/amazon/insights/InsightsCredentials;Landroid/content/Context;Lcom/amazon/insights/InsightsOptions;Ljava/util/Map;Lcom/amazon/insights/InsightsCallback;)Lcom/amazon/insights/AmazonInsights;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized newInstance(Lcom/amazon/insights/InsightsCredentials;Landroid/content/Context;Lcom/amazon/insights/InsightsOptions;Lcom/amazon/insights/InsightsCallback;)Lcom/amazon/insights/AmazonInsights;
    .locals 2
    .param p0, "credentials"    # Lcom/amazon/insights/InsightsCredentials;
    .param p1, "appContext"    # Landroid/content/Context;
    .param p2, "options"    # Lcom/amazon/insights/InsightsOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/insights/InsightsCredentials;",
            "Landroid/content/Context;",
            "Lcom/amazon/insights/InsightsOptions;",
            "Lcom/amazon/insights/InsightsCallback",
            "<",
            "Lcom/amazon/insights/AmazonInsights;",
            ">;)",
            "Lcom/amazon/insights/AmazonInsights;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;
        }
    .end annotation

    .prologue
    .line 226
    .local p3, "initCompletionCallback":Lcom/amazon/insights/InsightsCallback;, "Lcom/amazon/insights/InsightsCallback<Lcom/amazon/insights/AmazonInsights;>;"
    const-class v1, Lcom/amazon/insights/AmazonInsights;

    monitor-enter v1

    :try_start_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {p0, p1, p2, v0, p3}, Lcom/amazon/insights/AmazonInsights;->newInstance(Lcom/amazon/insights/InsightsCredentials;Landroid/content/Context;Lcom/amazon/insights/InsightsOptions;Ljava/util/Map;Lcom/amazon/insights/InsightsCallback;)Lcom/amazon/insights/AmazonInsights;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static declared-synchronized newInstance(Lcom/amazon/insights/InsightsCredentials;Landroid/content/Context;Lcom/amazon/insights/InsightsOptions;Ljava/util/Map;Lcom/amazon/insights/InsightsCallback;)Lcom/amazon/insights/AmazonInsights;
    .locals 3
    .param p0, "credentials"    # Lcom/amazon/insights/InsightsCredentials;
    .param p1, "appContext"    # Landroid/content/Context;
    .param p2, "options"    # Lcom/amazon/insights/InsightsOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/insights/InsightsCredentials;",
            "Landroid/content/Context;",
            "Lcom/amazon/insights/InsightsOptions;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/amazon/insights/InsightsCallback",
            "<",
            "Lcom/amazon/insights/AmazonInsights;",
            ">;)",
            "Lcom/amazon/insights/AmazonInsights;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;
        }
    .end annotation

    .prologue
    .line 231
    .local p3, "settings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p4, "initCompletionCallback":Lcom/amazon/insights/InsightsCallback;, "Lcom/amazon/insights/InsightsCallback<Lcom/amazon/insights/AmazonInsights;>;"
    const-class v1, Lcom/amazon/insights/AmazonInsights;

    monitor-enter v1

    :try_start_0
    const-string v0, "The credentials provided must not be null"

    invoke-static {p0, v0}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    const-string v0, "The application context provided must not be null"

    invoke-static {p1, v0}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    const-string v0, "The options provided must not be null"

    invoke-static {p2, v0}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    sget-object v0, Lcom/amazon/insights/AmazonInsights;->instances:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 236
    sget-object v0, Lcom/amazon/insights/AmazonInsights;->instances:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/AmazonInsights;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 238
    :goto_0
    monitor-exit v1

    return-object v0

    :cond_0
    :try_start_1
    sget-object v0, Lcom/amazon/insights/AmazonInsights;->sdkInfo:Lcom/amazon/insights/core/util/SDKInfo;

    invoke-interface {p2}, Lcom/amazon/insights/InsightsOptions;->getAllowWANDelivery()Z

    move-result v2

    invoke-static {p0, p1, v0, v2, p3}, Lcom/amazon/insights/core/DefaultInsightsContext;->newInstance(Lcom/amazon/insights/InsightsCredentials;Landroid/content/Context;Lcom/amazon/insights/core/util/SDKInfo;ZLjava/util/Map;)Lcom/amazon/insights/core/InsightsContext;

    move-result-object v0

    invoke-static {v0, p2, p4}, Lcom/amazon/insights/AmazonInsights;->newInstance(Lcom/amazon/insights/core/InsightsContext;Lcom/amazon/insights/InsightsOptions;Lcom/amazon/insights/InsightsCallback;)Lcom/amazon/insights/AmazonInsights;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 231
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static declared-synchronized newInstance(Lcom/amazon/insights/core/InsightsContext;)Lcom/amazon/insights/AmazonInsights;
    .locals 2
    .param p0, "context"    # Lcom/amazon/insights/core/InsightsContext;

    .prologue
    .line 243
    const-class v1, Lcom/amazon/insights/AmazonInsights;

    monitor-enter v1

    :try_start_0
    invoke-static {}, Lcom/amazon/insights/AmazonInsights;->newDefaultOptions()Lcom/amazon/insights/InsightsOptions;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/amazon/insights/AmazonInsights;->newInstance(Lcom/amazon/insights/core/InsightsContext;Lcom/amazon/insights/InsightsOptions;)Lcom/amazon/insights/AmazonInsights;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static declared-synchronized newInstance(Lcom/amazon/insights/core/InsightsContext;Lcom/amazon/insights/InsightsOptions;)Lcom/amazon/insights/AmazonInsights;
    .locals 4
    .param p0, "context"    # Lcom/amazon/insights/core/InsightsContext;
    .param p1, "options"    # Lcom/amazon/insights/InsightsOptions;

    .prologue
    .line 247
    const-class v2, Lcom/amazon/insights/AmazonInsights;

    monitor-enter v2

    :try_start_0
    const-string v1, "The context provided must not be null"

    invoke-static {p0, v1}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    sget-object v1, Lcom/amazon/insights/AmazonInsights;->instances:Ljava/util/Map;

    invoke-interface {p0}, Lcom/amazon/insights/core/InsightsContext;->getCredentials()Lcom/amazon/insights/InsightsCredentials;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 251
    sget-object v1, Lcom/amazon/insights/AmazonInsights;->instances:Ljava/util/Map;

    invoke-interface {p0}, Lcom/amazon/insights/core/InsightsContext;->getCredentials()Lcom/amazon/insights/InsightsCredentials;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/insights/AmazonInsights;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 256
    :goto_0
    monitor-exit v2

    return-object v1

    .line 254
    :cond_0
    :try_start_1
    new-instance v0, Lcom/amazon/insights/AmazonInsights$DefaultAmazonInsights;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/amazon/insights/AmazonInsights$DefaultAmazonInsights;-><init>(Lcom/amazon/insights/core/InsightsContext;Lcom/amazon/insights/InsightsOptions;Lcom/amazon/insights/InsightsCallback;)V

    .line 255
    .local v0, "instance":Lcom/amazon/insights/AmazonInsights;
    sget-object v1, Lcom/amazon/insights/AmazonInsights;->instances:Ljava/util/Map;

    invoke-interface {p0}, Lcom/amazon/insights/core/InsightsContext;->getCredentials()Lcom/amazon/insights/InsightsCredentials;

    move-result-object v3

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v1, v0

    .line 256
    goto :goto_0

    .line 247
    .end local v0    # "instance":Lcom/amazon/insights/AmazonInsights;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method static declared-synchronized newInstance(Lcom/amazon/insights/core/InsightsContext;Lcom/amazon/insights/InsightsOptions;Lcom/amazon/insights/InsightsCallback;)Lcom/amazon/insights/AmazonInsights;
    .locals 4
    .param p0, "context"    # Lcom/amazon/insights/core/InsightsContext;
    .param p1, "options"    # Lcom/amazon/insights/InsightsOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/insights/core/InsightsContext;",
            "Lcom/amazon/insights/InsightsOptions;",
            "Lcom/amazon/insights/InsightsCallback",
            "<",
            "Lcom/amazon/insights/AmazonInsights;",
            ">;)",
            "Lcom/amazon/insights/AmazonInsights;"
        }
    .end annotation

    .prologue
    .line 260
    .local p2, "initCompletionCallback":Lcom/amazon/insights/InsightsCallback;, "Lcom/amazon/insights/InsightsCallback<Lcom/amazon/insights/AmazonInsights;>;"
    const-class v2, Lcom/amazon/insights/AmazonInsights;

    monitor-enter v2

    :try_start_0
    const-string v1, "The context provided must not be null"

    invoke-static {p0, v1}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    sget-object v1, Lcom/amazon/insights/AmazonInsights;->instances:Ljava/util/Map;

    invoke-interface {p0}, Lcom/amazon/insights/core/InsightsContext;->getCredentials()Lcom/amazon/insights/InsightsCredentials;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 264
    sget-object v1, Lcom/amazon/insights/AmazonInsights;->instances:Ljava/util/Map;

    invoke-interface {p0}, Lcom/amazon/insights/core/InsightsContext;->getCredentials()Lcom/amazon/insights/InsightsCredentials;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/insights/AmazonInsights;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 269
    :goto_0
    monitor-exit v2

    return-object v1

    .line 267
    :cond_0
    :try_start_1
    new-instance v0, Lcom/amazon/insights/AmazonInsights$DefaultAmazonInsights;

    invoke-direct {v0, p0, p1, p2}, Lcom/amazon/insights/AmazonInsights$DefaultAmazonInsights;-><init>(Lcom/amazon/insights/core/InsightsContext;Lcom/amazon/insights/InsightsOptions;Lcom/amazon/insights/InsightsCallback;)V

    .line 268
    .local v0, "instance":Lcom/amazon/insights/AmazonInsights;
    sget-object v1, Lcom/amazon/insights/AmazonInsights;->instances:Ljava/util/Map;

    invoke-interface {p0}, Lcom/amazon/insights/core/InsightsContext;->getCredentials()Lcom/amazon/insights/InsightsCredentials;

    move-result-object v3

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v1, v0

    .line 269
    goto :goto_0

    .line 260
    .end local v0    # "instance":Lcom/amazon/insights/AmazonInsights;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static newOptions(ZZ)Lcom/amazon/insights/InsightsOptions;
    .locals 1
    .param p0, "allowEventCollection"    # Z
    .param p1, "allowWANDelivery"    # Z

    .prologue
    .line 159
    new-instance v0, Lcom/amazon/insights/impl/DefaultInsightsOptions;

    invoke-direct {v0, p0, p1}, Lcom/amazon/insights/impl/DefaultInsightsOptions;-><init>(ZZ)V

    return-object v0
.end method


# virtual methods
.method public abstract getABTestClient()Lcom/amazon/insights/ABTestClient;
.end method

.method public abstract getEventClient()Lcom/amazon/insights/EventClient;
.end method

.method public abstract getSessionClient()Lcom/amazon/insights/SessionClient;
.end method

.method public abstract getUserProfile()Lcom/amazon/insights/UserProfile;
.end method
