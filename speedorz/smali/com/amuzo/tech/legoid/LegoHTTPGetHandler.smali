.class public Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;
.super Landroid/os/AsyncTask;
.source "LegoHTTPGetHandler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Boolean;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private builder:Ljava/lang/StringBuilder;

.field private entity:Lorg/apache/http/HttpEntity;

.field private error:Lcom/amuzo/tech/legoid/ConnectionErrors;

.field private errorMessage:Ljava/lang/String;

.field private httpClient:Lorg/apache/http/client/HttpClient;

.field private httpGet:Lorg/apache/http/client/methods/HttpGet;

.field private httpParameters:Lorg/apache/http/params/HttpParams;

.field private httpResponse:Lorg/apache/http/HttpResponse;

.field private inStream:Ljava/io/InputStream;

.field private reader:Ljava/io/BufferedReader;

.field private req:Lcom/amuzo/tech/legoid/IAsyncCaller;

.field private requestUrl:Ljava/lang/String;

.field private urlGetVars:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/amuzo/tech/legoid/IAsyncCaller;Landroid/content/Context;Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .param p1, "request"    # Lcom/amuzo/tech/legoid/IAsyncCaller;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amuzo/tech/legoid/IAsyncCaller;",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p4, "getVars":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    const/4 v0, 0x0

    .line 46
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 32
    iput-object v0, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->req:Lcom/amuzo/tech/legoid/IAsyncCaller;

    .line 33
    iput-object v0, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->requestUrl:Ljava/lang/String;

    .line 34
    iput-object v0, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->urlGetVars:Ljava/util/List;

    .line 35
    iput-object v0, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->error:Lcom/amuzo/tech/legoid/ConnectionErrors;

    .line 48
    iput-object p1, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->req:Lcom/amuzo/tech/legoid/IAsyncCaller;

    .line 49
    iput-object p3, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->requestUrl:Ljava/lang/String;

    .line 50
    iput-object p4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->urlGetVars:Ljava/util/List;

    .line 51
    invoke-static {p2}, Landroid/webkit/CookieSyncManager;->createInstance(Landroid/content/Context;)Landroid/webkit/CookieSyncManager;

    .line 52
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "params"    # [Ljava/lang/String;

    .prologue
    .line 56
    const-string v3, ""

    .line 58
    .local v3, "retVal":Ljava/lang/String;
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->requestUrl:Ljava/lang/String;

    const-string v5, "?"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 59
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->requestUrl:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "?"

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->requestUrl:Ljava/lang/String;

    .line 61
    :cond_0
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->requestUrl:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->urlGetVars:Ljava/util/List;

    const-string v6, "UTF-8"

    invoke-static {v4, v6}, Lorg/apache/http/client/utils/URLEncodedUtils;->format(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->requestUrl:Ljava/lang/String;

    .line 64
    :try_start_0
    new-instance v4, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v4}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    .line 66
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    sget v5, Lcom/amuzo/tech/legoid/WebViewPlugin;->TIME_OUT_CONNECTION:I

    invoke-static {v4, v5}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 67
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    sget v5, Lcom/amuzo/tech/legoid/WebViewPlugin;->TIME_OUT_SOCKET:I

    invoke-static {v4, v5}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 69
    new-instance v4, Lorg/apache/http/impl/client/DefaultHttpClient;

    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    invoke-direct {v4, v5}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 71
    new-instance v4, Lorg/apache/http/client/methods/HttpGet;

    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->requestUrl:Ljava/lang/String;

    invoke-direct {v4, v5}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    .line 72
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    const-string v5, "cookie"

    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v6

    sget-object v7, Lcom/amuzo/tech/legoid/WebViewPlugin;->LEGO_DOMAIN_URL:Ljava/lang/String;

    invoke-virtual {v6, v7}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    invoke-interface {v4, v5}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    .line 76
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v4

    const/16 v5, 0xc8

    if-ne v4, v5, :cond_1

    .line 78
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v4

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    .line 79
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v4, :cond_1

    .line 80
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v4

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    .line 81
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    .line 82
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    iget-object v6, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    invoke-direct {v5, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v6, 0x2000

    invoke-direct {v4, v5, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    .line 84
    :goto_0
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .local v2, "result":Ljava/lang/String;
    if-nez v2, :cond_a

    .line 94
    :goto_1
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_0 .. :try_end_0} :catch_9
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_c
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    .line 298
    .end local v2    # "result":Ljava/lang/String;
    :cond_1
    :try_start_1
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    if-eqz v4, :cond_2

    .line 299
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 300
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    .line 302
    :cond_2
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    if-eqz v4, :cond_3

    .line 303
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 304
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    .line 306
    :cond_3
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    if-eqz v4, :cond_4

    .line 307
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    .line 308
    :cond_4
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v4, :cond_5

    .line 309
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 310
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    .line 312
    :cond_5
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    if-eqz v4, :cond_6

    .line 314
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    .line 316
    :cond_6
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v4, :cond_7

    .line 317
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 319
    :cond_7
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    if-eqz v4, :cond_8

    .line 320
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    .line 322
    :cond_8
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    if-eqz v4, :cond_9

    .line 323
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_10

    .line 332
    :cond_9
    :goto_2
    return-object v3

    .line 87
    .restart local v2    # "result":Ljava/lang/String;
    :cond_a
    :try_start_2
    invoke-virtual {p0}, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->isCancelled()Z

    move-result v4

    if-eqz v4, :cond_1a

    .line 88
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    invoke-virtual {v4}, Lorg/apache/http/client/methods/HttpGet;->abort()V

    .line 89
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;
    :try_end_2
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_6
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_2 .. :try_end_2} :catch_9
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_c
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 98
    .end local v2    # "result":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 99
    .local v0, "e":Ljava/net/MalformedURLException;
    :try_start_3
    sget-object v4, Lcom/amuzo/tech/legoid/ConnectionErrors;->HttpConnectionTimeout:Lcom/amuzo/tech/legoid/ConnectionErrors;

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->error:Lcom/amuzo/tech/legoid/ConnectionErrors;

    .line 100
    const-string v4, "requested url malformed!"

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->errorMessage:Ljava/lang/String;

    .line 102
    invoke-virtual {v0}, Ljava/net/MalformedURLException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 105
    :try_start_4
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    if-eqz v4, :cond_b

    .line 106
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 107
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    .line 109
    :cond_b
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    if-eqz v4, :cond_c

    .line 110
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 111
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    .line 113
    :cond_c
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    if-eqz v4, :cond_d

    .line 114
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    .line 115
    :cond_d
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v4, :cond_e

    .line 116
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 117
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    .line 119
    :cond_e
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    if-eqz v4, :cond_f

    .line 121
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    .line 123
    :cond_f
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v4, :cond_10

    .line 124
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 126
    :cond_10
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    if-eqz v4, :cond_11

    .line 127
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    .line 129
    :cond_11
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    if-eqz v4, :cond_12

    .line 130
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 298
    :cond_12
    :goto_3
    :try_start_5
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    if-eqz v4, :cond_13

    .line 299
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 300
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    .line 302
    :cond_13
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    if-eqz v4, :cond_14

    .line 303
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 304
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    .line 306
    :cond_14
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    if-eqz v4, :cond_15

    .line 307
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    .line 308
    :cond_15
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v4, :cond_16

    .line 309
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 310
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    .line 312
    :cond_16
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    if-eqz v4, :cond_17

    .line 314
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    .line 316
    :cond_17
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v4, :cond_18

    .line 317
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 319
    :cond_18
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    if-eqz v4, :cond_19

    .line 320
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    .line 322
    :cond_19
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    if-eqz v4, :cond_9

    .line 323
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto/16 :goto_2

    .line 326
    :catch_1
    move-exception v1

    .line 328
    .local v1, "eio":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    .line 92
    .end local v0    # "e":Ljava/net/MalformedURLException;
    .end local v1    # "eio":Ljava/io/IOException;
    .restart local v2    # "result":Ljava/lang/String;
    :cond_1a
    :try_start_6
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_6
    .catch Ljava/net/MalformedURLException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_6 .. :try_end_6} :catch_6
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_6 .. :try_end_6} :catch_9
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_c
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto/16 :goto_0

    .line 138
    .end local v2    # "result":Ljava/lang/String;
    :catch_2
    move-exception v0

    .line 140
    .local v0, "e":Lorg/apache/http/client/ClientProtocolException;
    :try_start_7
    sget-object v4, Lcom/amuzo/tech/legoid/ConnectionErrors;->ResponseError:Lcom/amuzo/tech/legoid/ConnectionErrors;

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->error:Lcom/amuzo/tech/legoid/ConnectionErrors;

    .line 141
    invoke-virtual {v0}, Lorg/apache/http/client/ClientProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->errorMessage:Ljava/lang/String;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 144
    :try_start_8
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    if-eqz v4, :cond_1b

    .line 145
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 146
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    .line 148
    :cond_1b
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    if-eqz v4, :cond_1c

    .line 149
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 150
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    .line 152
    :cond_1c
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    if-eqz v4, :cond_1d

    .line 153
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    .line 154
    :cond_1d
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v4, :cond_1e

    .line 155
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 156
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    .line 158
    :cond_1e
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    if-eqz v4, :cond_1f

    .line 160
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    .line 162
    :cond_1f
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v4, :cond_20

    .line 163
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 165
    :cond_20
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    if-eqz v4, :cond_21

    .line 166
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    .line 168
    :cond_21
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    if-eqz v4, :cond_22

    .line 169
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 298
    :cond_22
    :goto_4
    :try_start_9
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    if-eqz v4, :cond_23

    .line 299
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 300
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    .line 302
    :cond_23
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    if-eqz v4, :cond_24

    .line 303
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 304
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    .line 306
    :cond_24
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    if-eqz v4, :cond_25

    .line 307
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    .line 308
    :cond_25
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v4, :cond_26

    .line 309
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 310
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    .line 312
    :cond_26
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    if-eqz v4, :cond_27

    .line 314
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    .line 316
    :cond_27
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v4, :cond_28

    .line 317
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 319
    :cond_28
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    if-eqz v4, :cond_29

    .line 320
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    .line 322
    :cond_29
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    if-eqz v4, :cond_9

    .line 323
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3

    goto/16 :goto_2

    .line 326
    :catch_3
    move-exception v1

    .line 328
    .restart local v1    # "eio":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    .line 133
    .end local v1    # "eio":Ljava/io/IOException;
    .local v0, "e":Ljava/net/MalformedURLException;
    :catch_4
    move-exception v1

    .line 135
    .restart local v1    # "eio":Ljava/io/IOException;
    :try_start_a
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_3

    .line 295
    .end local v0    # "e":Ljava/net/MalformedURLException;
    .end local v1    # "eio":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    .line 298
    :try_start_b
    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    if-eqz v5, :cond_2a

    .line 299
    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V

    .line 300
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    .line 302
    :cond_2a
    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    if-eqz v5, :cond_2b

    .line 303
    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 304
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    .line 306
    :cond_2b
    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    if-eqz v5, :cond_2c

    .line 307
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    .line 308
    :cond_2c
    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v5, :cond_2d

    .line 309
    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v5}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 310
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    .line 312
    :cond_2d
    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    if-eqz v5, :cond_2e

    .line 314
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    .line 316
    :cond_2e
    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v5, :cond_2f

    .line 317
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 319
    :cond_2f
    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    if-eqz v5, :cond_30

    .line 320
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    .line 322
    :cond_30
    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    if-eqz v5, :cond_31

    .line 323
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_f

    .line 330
    :cond_31
    :goto_5
    throw v4

    .line 172
    .local v0, "e":Lorg/apache/http/client/ClientProtocolException;
    :catch_5
    move-exception v1

    .line 174
    .restart local v1    # "eio":Ljava/io/IOException;
    :try_start_c
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_4

    .line 177
    .end local v0    # "e":Lorg/apache/http/client/ClientProtocolException;
    .end local v1    # "eio":Ljava/io/IOException;
    :catch_6
    move-exception v0

    .line 179
    .local v0, "e":Ljava/net/SocketTimeoutException;
    sget-object v4, Lcom/amuzo/tech/legoid/ConnectionErrors;->SocketTimeout:Lcom/amuzo/tech/legoid/ConnectionErrors;

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->error:Lcom/amuzo/tech/legoid/ConnectionErrors;

    .line 180
    invoke-virtual {v0}, Ljava/net/SocketTimeoutException;->getMessage()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->errorMessage:Ljava/lang/String;
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 183
    :try_start_d
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    if-eqz v4, :cond_32

    .line 184
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 185
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    .line 187
    :cond_32
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    if-eqz v4, :cond_33

    .line 188
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 189
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    .line 191
    :cond_33
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    if-eqz v4, :cond_34

    .line 192
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    .line 193
    :cond_34
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v4, :cond_35

    .line 194
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 195
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    .line 197
    :cond_35
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    if-eqz v4, :cond_36

    .line 199
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    .line 201
    :cond_36
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v4, :cond_37

    .line 202
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 204
    :cond_37
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    if-eqz v4, :cond_38

    .line 205
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    .line 207
    :cond_38
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    if-eqz v4, :cond_39

    .line 208
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_8
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    .line 298
    :cond_39
    :goto_6
    :try_start_e
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    if-eqz v4, :cond_3a

    .line 299
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 300
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    .line 302
    :cond_3a
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    if-eqz v4, :cond_3b

    .line 303
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 304
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    .line 306
    :cond_3b
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    if-eqz v4, :cond_3c

    .line 307
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    .line 308
    :cond_3c
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v4, :cond_3d

    .line 309
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 310
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    .line 312
    :cond_3d
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    if-eqz v4, :cond_3e

    .line 314
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    .line 316
    :cond_3e
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v4, :cond_3f

    .line 317
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 319
    :cond_3f
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    if-eqz v4, :cond_40

    .line 320
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    .line 322
    :cond_40
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    if-eqz v4, :cond_9

    .line 323
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_7

    goto/16 :goto_2

    .line 326
    :catch_7
    move-exception v1

    .line 328
    .restart local v1    # "eio":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    .line 211
    .end local v1    # "eio":Ljava/io/IOException;
    :catch_8
    move-exception v1

    .line 213
    .restart local v1    # "eio":Ljava/io/IOException;
    :try_start_f
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_6

    .line 216
    .end local v0    # "e":Ljava/net/SocketTimeoutException;
    .end local v1    # "eio":Ljava/io/IOException;
    :catch_9
    move-exception v0

    .line 218
    .local v0, "e":Lorg/apache/http/conn/ConnectTimeoutException;
    sget-object v4, Lcom/amuzo/tech/legoid/ConnectionErrors;->HttpConnectionTimeout:Lcom/amuzo/tech/legoid/ConnectionErrors;

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->error:Lcom/amuzo/tech/legoid/ConnectionErrors;

    .line 219
    invoke-virtual {v0}, Lorg/apache/http/conn/ConnectTimeoutException;->getMessage()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->errorMessage:Ljava/lang/String;
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_0

    .line 222
    :try_start_10
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    if-eqz v4, :cond_41

    .line 223
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 224
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    .line 226
    :cond_41
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    if-eqz v4, :cond_42

    .line 227
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 228
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    .line 230
    :cond_42
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    if-eqz v4, :cond_43

    .line 231
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    .line 232
    :cond_43
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v4, :cond_44

    .line 233
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 234
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    .line 236
    :cond_44
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    if-eqz v4, :cond_45

    .line 238
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    .line 240
    :cond_45
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v4, :cond_46

    .line 241
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 243
    :cond_46
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    if-eqz v4, :cond_47

    .line 244
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    .line 246
    :cond_47
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    if-eqz v4, :cond_48

    .line 247
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_b
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    .line 298
    :cond_48
    :goto_7
    :try_start_11
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    if-eqz v4, :cond_49

    .line 299
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 300
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    .line 302
    :cond_49
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    if-eqz v4, :cond_4a

    .line 303
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 304
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    .line 306
    :cond_4a
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    if-eqz v4, :cond_4b

    .line 307
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    .line 308
    :cond_4b
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v4, :cond_4c

    .line 309
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 310
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    .line 312
    :cond_4c
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    if-eqz v4, :cond_4d

    .line 314
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    .line 316
    :cond_4d
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v4, :cond_4e

    .line 317
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 319
    :cond_4e
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    if-eqz v4, :cond_4f

    .line 320
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    .line 322
    :cond_4f
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    if-eqz v4, :cond_9

    .line 323
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_a

    goto/16 :goto_2

    .line 326
    :catch_a
    move-exception v1

    .line 328
    .restart local v1    # "eio":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    .line 250
    .end local v1    # "eio":Ljava/io/IOException;
    :catch_b
    move-exception v1

    .line 252
    .restart local v1    # "eio":Ljava/io/IOException;
    :try_start_12
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_7

    .line 255
    .end local v0    # "e":Lorg/apache/http/conn/ConnectTimeoutException;
    .end local v1    # "eio":Ljava/io/IOException;
    :catch_c
    move-exception v0

    .line 257
    .local v0, "e":Ljava/io/IOException;
    sget-object v4, Lcom/amuzo/tech/legoid/ConnectionErrors;->ResponseError:Lcom/amuzo/tech/legoid/ConnectionErrors;

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->error:Lcom/amuzo/tech/legoid/ConnectionErrors;

    .line 258
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->errorMessage:Ljava/lang/String;
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_0

    .line 261
    :try_start_13
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    if-eqz v4, :cond_50

    .line 262
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 263
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    .line 265
    :cond_50
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    if-eqz v4, :cond_51

    .line 266
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 267
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    .line 269
    :cond_51
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    if-eqz v4, :cond_52

    .line 270
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    .line 271
    :cond_52
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v4, :cond_53

    .line 272
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 273
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    .line 275
    :cond_53
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    if-eqz v4, :cond_54

    .line 277
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    .line 279
    :cond_54
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v4, :cond_55

    .line 280
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 282
    :cond_55
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    if-eqz v4, :cond_56

    .line 283
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    .line 285
    :cond_56
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    if-eqz v4, :cond_57

    .line 286
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_13} :catch_e
    .catchall {:try_start_13 .. :try_end_13} :catchall_0

    .line 298
    :cond_57
    :goto_8
    :try_start_14
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    if-eqz v4, :cond_58

    .line 299
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 300
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->reader:Ljava/io/BufferedReader;

    .line 302
    :cond_58
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    if-eqz v4, :cond_59

    .line 303
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 304
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->inStream:Ljava/io/InputStream;

    .line 306
    :cond_59
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    if-eqz v4, :cond_5a

    .line 307
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->builder:Ljava/lang/StringBuilder;

    .line 308
    :cond_5a
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v4, :cond_5b

    .line 309
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 310
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->entity:Lorg/apache/http/HttpEntity;

    .line 312
    :cond_5b
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    if-eqz v4, :cond_5c

    .line 314
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpResponse:Lorg/apache/http/HttpResponse;

    .line 316
    :cond_5c
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v4, :cond_5d

    .line 317
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 319
    :cond_5d
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    if-eqz v4, :cond_5e

    .line 320
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    .line 322
    :cond_5e
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    if-eqz v4, :cond_9

    .line 323
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->httpParameters:Lorg/apache/http/params/HttpParams;
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_14} :catch_d

    goto/16 :goto_2

    .line 326
    :catch_d
    move-exception v1

    .line 328
    .restart local v1    # "eio":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    .line 289
    .end local v1    # "eio":Ljava/io/IOException;
    :catch_e
    move-exception v1

    .line 291
    .restart local v1    # "eio":Ljava/io/IOException;
    :try_start_15
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_0

    goto :goto_8

    .line 326
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "eio":Ljava/io/IOException;
    :catch_f
    move-exception v1

    .line 328
    .restart local v1    # "eio":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_5

    .line 326
    .end local v1    # "eio":Ljava/io/IOException;
    :catch_10
    move-exception v1

    .line 328
    .restart local v1    # "eio":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2
.end method

.method protected onCancelled()V
    .locals 1

    .prologue
    .line 337
    invoke-super {p0}, Landroid/os/AsyncTask;->onCancelled()V

    .line 338
    iget-object v0, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->req:Lcom/amuzo/tech/legoid/IAsyncCaller;

    invoke-interface {v0}, Lcom/amuzo/tech/legoid/IAsyncCaller;->notifyCallerOnRequestCancelled()V

    .line 339
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 343
    iget-object v0, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->req:Lcom/amuzo/tech/legoid/IAsyncCaller;

    if-eqz v0, :cond_0

    .line 345
    iget-object v0, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->error:Lcom/amuzo/tech/legoid/ConnectionErrors;

    if-eqz v0, :cond_1

    .line 346
    iget-object v0, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->req:Lcom/amuzo/tech/legoid/IAsyncCaller;

    iget-object v1, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->error:Lcom/amuzo/tech/legoid/ConnectionErrors;

    iget-object v2, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->errorMessage:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/amuzo/tech/legoid/IAsyncCaller;->notifyCallerOnConnectionFailure(Lcom/amuzo/tech/legoid/ConnectionErrors;Ljava/lang/String;)V

    .line 351
    :cond_0
    :goto_0
    return-void

    .line 349
    :cond_1
    iget-object v0, p0, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->req:Lcom/amuzo/tech/legoid/IAsyncCaller;

    invoke-interface {v0, p1}, Lcom/amuzo/tech/legoid/IAsyncCaller;->notifyCallerOnPostExecute(Ljava/lang/String;)V

    goto :goto_0
.end method
