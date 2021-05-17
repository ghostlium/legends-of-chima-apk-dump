.class public Lcom/amazon/insights/core/http/HttpUtil;
.super Ljava/lang/Object;
.source "HttpUtil.java"


# static fields
.field private static final STALE_CHECK_PARAM_NAME:Ljava/lang/String; = "http.connection.stalecheck"

.field private static volatile client:Lorg/apache/http/client/HttpClient;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    return-void
.end method

.method private static createHttpClient()Lorg/apache/http/client/HttpClient;
    .locals 7

    .prologue
    const/16 v5, 0x1e

    .line 40
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 41
    .local v2, "templateClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    invoke-virtual {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v0

    .line 42
    .local v0, "params":Lorg/apache/http/params/HttpParams;
    const/16 v3, 0x1388

    invoke-static {v0, v3}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 43
    const/16 v3, 0x2710

    invoke-static {v0, v3}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 44
    const-string v3, "http.conn-manager.max-total"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 45
    const-string v3, "http.conn-manager.max-per-route"

    new-instance v4, Lorg/apache/http/conn/params/ConnPerRouteBean;

    invoke-direct {v4, v5}, Lorg/apache/http/conn/params/ConnPerRouteBean;-><init>(I)V

    invoke-interface {v0, v3, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 46
    const-string v3, "http.protocol.expect-continue"

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 47
    sget-object v3, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    invoke-static {v0, v3}, Lorg/apache/http/params/HttpProtocolParams;->setVersion(Lorg/apache/http/params/HttpParams;Lorg/apache/http/ProtocolVersion;)V

    .line 48
    const-string v3, "http.connection.stalecheck"

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 50
    new-instance v1, Lorg/apache/http/conn/scheme/SchemeRegistry;

    invoke-direct {v1}, Lorg/apache/http/conn/scheme/SchemeRegistry;-><init>()V

    .line 51
    .local v1, "schemeRegistry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    new-instance v3, Lorg/apache/http/conn/scheme/Scheme;

    const-string v4, "http"

    invoke-static {}, Lorg/apache/http/conn/scheme/PlainSocketFactory;->getSocketFactory()Lorg/apache/http/conn/scheme/PlainSocketFactory;

    move-result-object v5

    const/16 v6, 0x50

    invoke-direct {v3, v4, v5, v6}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v1, v3}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 52
    new-instance v3, Lorg/apache/http/conn/scheme/Scheme;

    const-string v4, "https"

    invoke-static {}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->getSocketFactory()Lorg/apache/http/conn/ssl/SSLSocketFactory;

    move-result-object v5

    const/16 v6, 0x1bb

    invoke-direct {v3, v4, v5, v6}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v1, v3}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 54
    new-instance v3, Lorg/apache/http/impl/client/DefaultHttpClient;

    new-instance v4, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;

    invoke-direct {v4, v0, v1}, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    invoke-direct {v3, v4, v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V

    return-object v3
.end method

.method static getHttpClient()Lorg/apache/http/client/HttpClient;
    .locals 2

    .prologue
    .line 29
    sget-object v0, Lcom/amazon/insights/core/http/HttpUtil;->client:Lorg/apache/http/client/HttpClient;

    if-nez v0, :cond_1

    .line 30
    const-class v1, Lcom/amazon/insights/core/http/HttpUtil;

    monitor-enter v1

    .line 31
    :try_start_0
    sget-object v0, Lcom/amazon/insights/core/http/HttpUtil;->client:Lorg/apache/http/client/HttpClient;

    if-nez v0, :cond_0

    .line 32
    invoke-static {}, Lcom/amazon/insights/core/http/HttpUtil;->createHttpClient()Lorg/apache/http/client/HttpClient;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/core/http/HttpUtil;->client:Lorg/apache/http/client/HttpClient;

    .line 34
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    :cond_1
    sget-object v0, Lcom/amazon/insights/core/http/HttpUtil;->client:Lorg/apache/http/client/HttpClient;

    return-object v0

    .line 34
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public static getMessageForResponse(Lcom/amazon/insights/core/http/HttpClient$Response;)Ljava/lang/String;
    .locals 2
    .param p0, "response"    # Lcom/amazon/insights/core/http/HttpClient$Response;

    .prologue
    .line 58
    const-string v0, ""

    .line 59
    .local v0, "msg":Ljava/lang/String;
    invoke-interface {p0}, Lcom/amazon/insights/core/http/HttpClient$Response;->getCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 73
    invoke-interface {p0}, Lcom/amazon/insights/core/http/HttpClient$Response;->getCode()I

    move-result v1

    if-gez v1, :cond_0

    .line 74
    invoke-interface {p0}, Lcom/amazon/insights/core/http/HttpClient$Response;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 80
    :goto_0
    return-object v0

    .line 61
    :sswitch_0
    const-string v0, "Access denied. Verify your application key and private key are correct."

    .line 62
    goto :goto_0

    .line 64
    :sswitch_1
    const-string v0, "An unexpected server error occurred."

    .line 65
    goto :goto_0

    .line 67
    :sswitch_2
    const-string v0, "Bad server request."

    .line 68
    goto :goto_0

    .line 70
    :sswitch_3
    const-string v0, "Application not found."

    .line 71
    goto :goto_0

    .line 76
    :cond_0
    const-string v0, ""

    goto :goto_0

    .line 59
    nop

    :sswitch_data_0
    .sparse-switch
        0x190 -> :sswitch_2
        0x193 -> :sswitch_0
        0x194 -> :sswitch_3
        0x1f4 -> :sswitch_1
    .end sparse-switch
.end method
