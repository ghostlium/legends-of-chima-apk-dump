.class public Lcom/amazon/ags/html5/util/ClientConfig;
.super Ljava/lang/Object;
.source "ClientConfig.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final config:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/html5/util/ClientConfig;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/html5/util/ClientConfig;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 9

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/amazon/ags/html5/util/ClientConfig;->config:Ljava/util/Map;

    .line 38
    iget-object v7, p0, Lcom/amazon/ags/html5/util/ClientConfig;->config:Ljava/util/Map;

    const-string v8, "AUTH_GET_TOKEN_TIMEOUT_MILLIS"

    new-instance v0, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;

    const-wide/16 v1, 0x3e8

    const-wide/16 v3, 0x2710

    const-wide/32 v5, 0xea60

    invoke-direct/range {v0 .. v6}, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;-><init>(JJJ)V

    invoke-interface {v7, v8, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    iget-object v7, p0, Lcom/amazon/ags/html5/util/ClientConfig;->config:Ljava/util/Map;

    const-string v8, "THREAD_POOL_SIZE"

    new-instance v0, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;

    const-wide/16 v1, 0x5

    const-wide/16 v3, 0x64

    const-wide/16 v5, 0x64

    invoke-direct/range {v0 .. v6}, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;-><init>(JJJ)V

    invoke-interface {v7, v8, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    iget-object v7, p0, Lcom/amazon/ags/html5/util/ClientConfig;->config:Ljava/util/Map;

    const-string v8, "THREAD_TIMEOUT"

    new-instance v0, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;

    const-wide/16 v1, 0xa

    const-wide/16 v3, 0x3e8

    const-wide/32 v5, 0xea60

    invoke-direct/range {v0 .. v6}, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;-><init>(JJJ)V

    invoke-interface {v7, v8, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    iget-object v7, p0, Lcom/amazon/ags/html5/util/ClientConfig;->config:Ljava/util/Map;

    const-string v8, "HTTP_CONNECTION_POOL_TIMEOUT_MILLIS"

    new-instance v0, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;

    const-wide/16 v1, 0x1f4

    const-wide/16 v3, 0x2710

    const-wide/32 v5, 0xea60

    invoke-direct/range {v0 .. v6}, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;-><init>(JJJ)V

    invoke-interface {v7, v8, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    iget-object v7, p0, Lcom/amazon/ags/html5/util/ClientConfig;->config:Ljava/util/Map;

    const-string v8, "HTTP_CONNECTION_TIMEOUT_MILLIS"

    new-instance v0, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;

    const-wide/16 v1, 0x1f4

    const-wide/16 v3, 0x2710

    const-wide/32 v5, 0xea60

    invoke-direct/range {v0 .. v6}, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;-><init>(JJJ)V

    invoke-interface {v7, v8, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    iget-object v7, p0, Lcom/amazon/ags/html5/util/ClientConfig;->config:Ljava/util/Map;

    const-string v8, "HTTP_SOCKET_TIMEOUT_MILLIS"

    new-instance v0, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;

    const-wide/16 v1, 0x1f4

    const-wide/16 v3, 0x2710

    const-wide/32 v5, 0xea60

    invoke-direct/range {v0 .. v6}, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;-><init>(JJJ)V

    invoke-interface {v7, v8, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    iget-object v7, p0, Lcom/amazon/ags/html5/util/ClientConfig;->config:Ljava/util/Map;

    const-string v8, "HTTP_MAX_TOTAL_CONNECTIONS"

    new-instance v0, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;

    const-wide/16 v1, 0x2

    const-wide/16 v3, 0x14

    const-wide/16 v5, 0x32

    invoke-direct/range {v0 .. v6}, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;-><init>(JJJ)V

    invoke-interface {v7, v8, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    iget-object v7, p0, Lcom/amazon/ags/html5/util/ClientConfig;->config:Ljava/util/Map;

    const-string v8, "HTTP_MAX_CONNECTIONS_PER_ROUTE"

    new-instance v0, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;

    const-wide/16 v1, 0x2

    const-wide/16 v3, 0x14

    const-wide/16 v5, 0x32

    invoke-direct/range {v0 .. v6}, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;-><init>(JJJ)V

    invoke-interface {v7, v8, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    sget-object v0, Lcom/amazon/ags/html5/util/ClientConfig;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public get(Ljava/lang/String;)J
    .locals 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 74
    iget-object v1, p0, Lcom/amazon/ags/html5/util/ClientConfig;->config:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;

    .line 75
    .local v0, "entry":Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;
    if-nez v0, :cond_0

    .line 76
    sget-object v1, Lcom/amazon/ags/html5/util/ClientConfig;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No config value for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    const-wide/16 v1, 0x0

    .line 80
    :goto_0
    return-wide v1

    :cond_0
    invoke-virtual {v0}, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;->getValue()J

    move-result-wide v1

    goto :goto_0
.end method

.method public load(Lorg/json/JSONObject;)V
    .locals 8
    .param p1, "data"    # Lorg/json/JSONObject;

    .prologue
    .line 89
    invoke-static {}, Lcom/amazon/ags/html5/factory/ServiceFactory;->isDebugLoggingEnabled()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 90
    sget-object v4, Lcom/amazon/ags/html5/util/ClientConfig;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Will load config data: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    :cond_0
    if-nez p1, :cond_2

    .line 114
    :cond_1
    return-void

    .line 98
    :cond_2
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v3

    .line 100
    .local v3, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_3
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 101
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 102
    .local v2, "key":Ljava/lang/String;
    iget-object v4, p0, Lcom/amazon/ags/html5/util/ClientConfig;->config:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;

    .line 103
    .local v1, "entry":Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;
    if-eqz v1, :cond_3

    .line 105
    :try_start_0
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;->setValue(J)V

    .line 106
    invoke-static {}, Lcom/amazon/ags/html5/factory/ServiceFactory;->isDebugLoggingEnabled()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 107
    sget-object v4, Lcom/amazon/ags/html5/util/ClientConfig;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Loaded config "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;->getValue()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 109
    :catch_0
    move-exception v0

    .line 110
    .local v0, "e":Lorg/json/JSONException;
    sget-object v4, Lcom/amazon/ags/html5/util/ClientConfig;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unable to parse local config value for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
