.class public Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;
.super Landroid/os/AsyncTask;
.source "LegoHTTPPostHandler.java"


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

.field private formdata:Lorg/apache/http/client/entity/UrlEncodedFormEntity;

.field private httpClient:Lorg/apache/http/client/HttpClient;

.field private httpParameters:Lorg/apache/http/params/HttpParams;

.field private httpPost:Lorg/apache/http/client/methods/HttpPost;

.field private inStream:Ljava/io/InputStream;

.field private outstream:Ljava/io/ByteArrayOutputStream;

.field private reader:Ljava/io/BufferedReader;

.field private req:Lcom/amuzo/tech/legoid/IAsyncCaller;

.field private requestUrl:Ljava/lang/String;

.field private response:Lorg/apache/http/HttpResponse;

.field private urlPostVars:Ljava/util/List;
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
    .local p4, "postVars":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    const/4 v0, 0x0

    .line 48
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 32
    iput-object v0, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->req:Lcom/amuzo/tech/legoid/IAsyncCaller;

    .line 33
    iput-object v0, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->requestUrl:Ljava/lang/String;

    .line 34
    iput-object v0, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->urlPostVars:Ljava/util/List;

    .line 50
    iput-object p1, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->req:Lcom/amuzo/tech/legoid/IAsyncCaller;

    .line 51
    iput-object p3, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->requestUrl:Ljava/lang/String;

    .line 52
    iput-object p4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->urlPostVars:Ljava/util/List;

    .line 53
    invoke-static {p2}, Landroid/webkit/CookieSyncManager;->createInstance(Landroid/content/Context;)Landroid/webkit/CookieSyncManager;

    .line 54
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "params"    # [Ljava/lang/String;

    .prologue
    .line 58
    const-string v3, ""

    .line 60
    .local v3, "retVal":Ljava/lang/String;
    new-instance v4, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v4}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    .line 62
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    sget v5, Lcom/amuzo/tech/legoid/WebViewPlugin;->TIME_OUT_CONNECTION:I

    invoke-static {v4, v5}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 63
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    sget v5, Lcom/amuzo/tech/legoid/WebViewPlugin;->TIME_OUT_SOCKET:I

    invoke-static {v4, v5}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 65
    new-instance v4, Lorg/apache/http/impl/client/DefaultHttpClient;

    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    invoke-direct {v4, v5}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 68
    :try_start_0
    new-instance v4, Lorg/apache/http/client/methods/HttpPost;

    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->requestUrl:Ljava/lang/String;

    invoke-direct {v4, v5}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    .line 69
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    const-string v5, "cookie"

    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v6

    sget-object v7, Lcom/amuzo/tech/legoid/WebViewPlugin;->LEGO_DOMAIN_URL:Ljava/lang/String;

    invoke-virtual {v6, v7}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    new-instance v4, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->urlPostVars:Ljava/util/List;

    invoke-direct {v4, v5}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;)V

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->formdata:Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    .line 72
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->formdata:Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v5, "UTF-8"

    invoke-virtual {v4, v5}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;->setContentEncoding(Ljava/lang/String;)V

    .line 74
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->formdata:Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    invoke-virtual {v4, v5}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 76
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    invoke-interface {v4, v5}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->response:Lorg/apache/http/HttpResponse;

    .line 78
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->response:Lorg/apache/http/HttpResponse;

    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v4

    const/16 v5, 0xc8

    if-ne v4, v5, :cond_0

    .line 80
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->response:Lorg/apache/http/HttpResponse;

    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v4

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    .line 81
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v4, :cond_0

    .line 82
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v4

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    .line 83
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->builder:Ljava/lang/StringBuilder;

    .line 84
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    iget-object v6, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    invoke-direct {v5, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v6, 0x2000

    invoke-direct {v4, v5, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    .line 86
    :goto_0
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .local v2, "result":Ljava/lang/String;
    if-nez v2, :cond_a

    .line 95
    :goto_1
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->builder:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_9
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    .line 268
    .end local v2    # "result":Ljava/lang/String;
    :cond_0
    :try_start_1
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    if-eqz v4, :cond_1

    .line 269
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 270
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    .line 272
    :cond_1
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    if-eqz v4, :cond_2

    .line 273
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 274
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    .line 276
    :cond_2
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    if-eqz v4, :cond_3

    .line 277
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 278
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    .line 280
    :cond_3
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->builder:Ljava/lang/StringBuilder;

    if-eqz v4, :cond_4

    .line 281
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->builder:Ljava/lang/StringBuilder;

    .line 282
    :cond_4
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v4, :cond_5

    .line 283
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 284
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    .line 286
    :cond_5
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->response:Lorg/apache/http/HttpResponse;

    if-eqz v4, :cond_6

    .line 288
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->response:Lorg/apache/http/HttpResponse;

    .line 290
    :cond_6
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v4, :cond_7

    .line 291
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 293
    :cond_7
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    if-eqz v4, :cond_8

    .line 294
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    .line 296
    :cond_8
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    if-eqz v4, :cond_9

    .line 297
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpParameters:Lorg/apache/http/params/HttpParams;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_d

    .line 303
    :cond_9
    :goto_2
    return-object v3

    .line 89
    .restart local v2    # "result":Ljava/lang/String;
    :cond_a
    :try_start_2
    invoke-virtual {p0}, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->isCancelled()Z

    move-result v4

    if-eqz v4, :cond_1c

    .line 90
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {v4}, Lorg/apache/http/client/methods/HttpPost;->abort()V
    :try_end_2
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_2 .. :try_end_2} :catch_6
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_9
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 99
    .end local v2    # "result":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 100
    .local v0, "e":Ljava/net/MalformedURLException;
    :try_start_3
    sget-object v4, Lcom/amuzo/tech/legoid/ConnectionErrors;->HttpConnectionTimeout:Lcom/amuzo/tech/legoid/ConnectionErrors;

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->error:Lcom/amuzo/tech/legoid/ConnectionErrors;

    .line 101
    const-string v4, "requested url malformed!"

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->errorMessage:Ljava/lang/String;

    .line 103
    invoke-virtual {v0}, Ljava/net/MalformedURLException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 106
    :try_start_4
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    if-eqz v4, :cond_b

    .line 107
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 108
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    .line 110
    :cond_b
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    if-eqz v4, :cond_c

    .line 111
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 112
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    .line 114
    :cond_c
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    if-eqz v4, :cond_d

    .line 115
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 116
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    .line 118
    :cond_d
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->builder:Ljava/lang/StringBuilder;

    if-eqz v4, :cond_e

    .line 119
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->builder:Ljava/lang/StringBuilder;

    .line 120
    :cond_e
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v4, :cond_f

    .line 121
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 122
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    .line 124
    :cond_f
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->response:Lorg/apache/http/HttpResponse;

    if-eqz v4, :cond_10

    .line 126
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->response:Lorg/apache/http/HttpResponse;

    .line 128
    :cond_10
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v4, :cond_11

    .line 129
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 131
    :cond_11
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    if-eqz v4, :cond_12

    .line 132
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    .line 134
    :cond_12
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    if-eqz v4, :cond_13

    .line 135
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpParameters:Lorg/apache/http/params/HttpParams;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 268
    :cond_13
    :goto_3
    :try_start_5
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    if-eqz v4, :cond_14

    .line 269
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 270
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    .line 272
    :cond_14
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    if-eqz v4, :cond_15

    .line 273
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 274
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    .line 276
    :cond_15
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    if-eqz v4, :cond_16

    .line 277
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 278
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    .line 280
    :cond_16
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->builder:Ljava/lang/StringBuilder;

    if-eqz v4, :cond_17

    .line 281
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->builder:Ljava/lang/StringBuilder;

    .line 282
    :cond_17
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v4, :cond_18

    .line 283
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 284
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    .line 286
    :cond_18
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->response:Lorg/apache/http/HttpResponse;

    if-eqz v4, :cond_19

    .line 288
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->response:Lorg/apache/http/HttpResponse;

    .line 290
    :cond_19
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v4, :cond_1a

    .line 291
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 293
    :cond_1a
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    if-eqz v4, :cond_1b

    .line 294
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    .line 296
    :cond_1b
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    if-eqz v4, :cond_9

    .line 297
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpParameters:Lorg/apache/http/params/HttpParams;
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto/16 :goto_2

    .line 299
    :catch_1
    move-exception v1

    .line 300
    .local v1, "eio":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    .line 93
    .end local v0    # "e":Ljava/net/MalformedURLException;
    .end local v1    # "eio":Ljava/io/IOException;
    .restart local v2    # "result":Ljava/lang/String;
    :cond_1c
    :try_start_6
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->builder:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_6
    .catch Ljava/net/MalformedURLException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_6 .. :try_end_6} :catch_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_9
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto/16 :goto_0

    .line 141
    .end local v2    # "result":Ljava/lang/String;
    :catch_2
    move-exception v0

    .line 143
    .local v0, "e":Ljava/net/SocketTimeoutException;
    :try_start_7
    sget-object v4, Lcom/amuzo/tech/legoid/ConnectionErrors;->SocketTimeout:Lcom/amuzo/tech/legoid/ConnectionErrors;

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->error:Lcom/amuzo/tech/legoid/ConnectionErrors;

    .line 144
    invoke-virtual {v0}, Ljava/net/SocketTimeoutException;->getMessage()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->errorMessage:Ljava/lang/String;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 147
    :try_start_8
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    if-eqz v4, :cond_1d

    .line 148
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 149
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    .line 151
    :cond_1d
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    if-eqz v4, :cond_1e

    .line 152
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 153
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    .line 155
    :cond_1e
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    if-eqz v4, :cond_1f

    .line 156
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 157
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    .line 159
    :cond_1f
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->builder:Ljava/lang/StringBuilder;

    if-eqz v4, :cond_20

    .line 160
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->builder:Ljava/lang/StringBuilder;

    .line 161
    :cond_20
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v4, :cond_21

    .line 162
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 163
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    .line 165
    :cond_21
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->response:Lorg/apache/http/HttpResponse;

    if-eqz v4, :cond_22

    .line 167
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->response:Lorg/apache/http/HttpResponse;

    .line 169
    :cond_22
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v4, :cond_23

    .line 170
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 172
    :cond_23
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    if-eqz v4, :cond_24

    .line 173
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    .line 175
    :cond_24
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    if-eqz v4, :cond_25

    .line 176
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpParameters:Lorg/apache/http/params/HttpParams;
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 268
    :cond_25
    :goto_4
    :try_start_9
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    if-eqz v4, :cond_26

    .line 269
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 270
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    .line 272
    :cond_26
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    if-eqz v4, :cond_27

    .line 273
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 274
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    .line 276
    :cond_27
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    if-eqz v4, :cond_28

    .line 277
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 278
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    .line 280
    :cond_28
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->builder:Ljava/lang/StringBuilder;

    if-eqz v4, :cond_29

    .line 281
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->builder:Ljava/lang/StringBuilder;

    .line 282
    :cond_29
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v4, :cond_2a

    .line 283
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 284
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    .line 286
    :cond_2a
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->response:Lorg/apache/http/HttpResponse;

    if-eqz v4, :cond_2b

    .line 288
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->response:Lorg/apache/http/HttpResponse;

    .line 290
    :cond_2b
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v4, :cond_2c

    .line 291
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 293
    :cond_2c
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    if-eqz v4, :cond_2d

    .line 294
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    .line 296
    :cond_2d
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    if-eqz v4, :cond_9

    .line 297
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpParameters:Lorg/apache/http/params/HttpParams;
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3

    goto/16 :goto_2

    .line 299
    :catch_3
    move-exception v1

    .line 300
    .restart local v1    # "eio":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    .line 137
    .end local v1    # "eio":Ljava/io/IOException;
    .local v0, "e":Ljava/net/MalformedURLException;
    :catch_4
    move-exception v1

    .line 138
    .restart local v1    # "eio":Ljava/io/IOException;
    :try_start_a
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_3

    .line 265
    .end local v0    # "e":Ljava/net/MalformedURLException;
    .end local v1    # "eio":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    .line 268
    :try_start_b
    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    if-eqz v5, :cond_2e

    .line 269
    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 270
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    .line 272
    :cond_2e
    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    if-eqz v5, :cond_2f

    .line 273
    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V

    .line 274
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    .line 276
    :cond_2f
    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    if-eqz v5, :cond_30

    .line 277
    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 278
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    .line 280
    :cond_30
    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->builder:Ljava/lang/StringBuilder;

    if-eqz v5, :cond_31

    .line 281
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->builder:Ljava/lang/StringBuilder;

    .line 282
    :cond_31
    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v5, :cond_32

    .line 283
    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v5}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 284
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    .line 286
    :cond_32
    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->response:Lorg/apache/http/HttpResponse;

    if-eqz v5, :cond_33

    .line 288
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->response:Lorg/apache/http/HttpResponse;

    .line 290
    :cond_33
    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v5, :cond_34

    .line 291
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 293
    :cond_34
    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    if-eqz v5, :cond_35

    .line 294
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    .line 296
    :cond_35
    iget-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    if-eqz v5, :cond_36

    .line 297
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpParameters:Lorg/apache/http/params/HttpParams;
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_c

    .line 302
    :cond_36
    :goto_5
    throw v4

    .line 178
    .local v0, "e":Ljava/net/SocketTimeoutException;
    :catch_5
    move-exception v1

    .line 179
    .restart local v1    # "eio":Ljava/io/IOException;
    :try_start_c
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_4

    .line 182
    .end local v0    # "e":Ljava/net/SocketTimeoutException;
    .end local v1    # "eio":Ljava/io/IOException;
    :catch_6
    move-exception v0

    .line 184
    .local v0, "e":Lorg/apache/http/conn/ConnectTimeoutException;
    sget-object v4, Lcom/amuzo/tech/legoid/ConnectionErrors;->HttpConnectionTimeout:Lcom/amuzo/tech/legoid/ConnectionErrors;

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->error:Lcom/amuzo/tech/legoid/ConnectionErrors;

    .line 185
    invoke-virtual {v0}, Lorg/apache/http/conn/ConnectTimeoutException;->getMessage()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->errorMessage:Ljava/lang/String;
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 188
    :try_start_d
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    if-eqz v4, :cond_37

    .line 189
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 190
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    .line 192
    :cond_37
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    if-eqz v4, :cond_38

    .line 193
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 194
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    .line 196
    :cond_38
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    if-eqz v4, :cond_39

    .line 197
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 198
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    .line 200
    :cond_39
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->builder:Ljava/lang/StringBuilder;

    if-eqz v4, :cond_3a

    .line 201
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->builder:Ljava/lang/StringBuilder;

    .line 202
    :cond_3a
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v4, :cond_3b

    .line 203
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 204
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    .line 206
    :cond_3b
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->response:Lorg/apache/http/HttpResponse;

    if-eqz v4, :cond_3c

    .line 208
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->response:Lorg/apache/http/HttpResponse;

    .line 210
    :cond_3c
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v4, :cond_3d

    .line 211
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 213
    :cond_3d
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    if-eqz v4, :cond_3e

    .line 214
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    .line 216
    :cond_3e
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    if-eqz v4, :cond_3f

    .line 217
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpParameters:Lorg/apache/http/params/HttpParams;
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_8
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    .line 268
    :cond_3f
    :goto_6
    :try_start_e
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    if-eqz v4, :cond_40

    .line 269
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 270
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    .line 272
    :cond_40
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    if-eqz v4, :cond_41

    .line 273
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 274
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    .line 276
    :cond_41
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    if-eqz v4, :cond_42

    .line 277
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 278
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    .line 280
    :cond_42
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->builder:Ljava/lang/StringBuilder;

    if-eqz v4, :cond_43

    .line 281
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->builder:Ljava/lang/StringBuilder;

    .line 282
    :cond_43
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v4, :cond_44

    .line 283
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 284
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    .line 286
    :cond_44
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->response:Lorg/apache/http/HttpResponse;

    if-eqz v4, :cond_45

    .line 288
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->response:Lorg/apache/http/HttpResponse;

    .line 290
    :cond_45
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v4, :cond_46

    .line 291
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 293
    :cond_46
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    if-eqz v4, :cond_47

    .line 294
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    .line 296
    :cond_47
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    if-eqz v4, :cond_9

    .line 297
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpParameters:Lorg/apache/http/params/HttpParams;
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_7

    goto/16 :goto_2

    .line 299
    :catch_7
    move-exception v1

    .line 300
    .restart local v1    # "eio":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    .line 219
    .end local v1    # "eio":Ljava/io/IOException;
    :catch_8
    move-exception v1

    .line 220
    .restart local v1    # "eio":Ljava/io/IOException;
    :try_start_f
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_6

    .line 223
    .end local v0    # "e":Lorg/apache/http/conn/ConnectTimeoutException;
    .end local v1    # "eio":Ljava/io/IOException;
    :catch_9
    move-exception v0

    .line 225
    .local v0, "e":Ljava/io/IOException;
    sget-object v4, Lcom/amuzo/tech/legoid/ConnectionErrors;->ResponseError:Lcom/amuzo/tech/legoid/ConnectionErrors;

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->error:Lcom/amuzo/tech/legoid/ConnectionErrors;

    .line 226
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->errorMessage:Ljava/lang/String;
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_0

    .line 229
    :try_start_10
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    if-eqz v4, :cond_48

    .line 230
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 231
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    .line 233
    :cond_48
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    if-eqz v4, :cond_49

    .line 234
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 235
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    .line 237
    :cond_49
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    if-eqz v4, :cond_4a

    .line 238
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 239
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    .line 241
    :cond_4a
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->builder:Ljava/lang/StringBuilder;

    if-eqz v4, :cond_4b

    .line 242
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->builder:Ljava/lang/StringBuilder;

    .line 243
    :cond_4b
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v4, :cond_4c

    .line 244
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 245
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    .line 247
    :cond_4c
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->response:Lorg/apache/http/HttpResponse;

    if-eqz v4, :cond_4d

    .line 249
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->response:Lorg/apache/http/HttpResponse;

    .line 251
    :cond_4d
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v4, :cond_4e

    .line 252
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 254
    :cond_4e
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    if-eqz v4, :cond_4f

    .line 255
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    .line 257
    :cond_4f
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    if-eqz v4, :cond_50

    .line 258
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpParameters:Lorg/apache/http/params/HttpParams;
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_b
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    .line 268
    :cond_50
    :goto_7
    :try_start_11
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    if-eqz v4, :cond_51

    .line 269
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 270
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->outstream:Ljava/io/ByteArrayOutputStream;

    .line 272
    :cond_51
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    if-eqz v4, :cond_52

    .line 273
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 274
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->reader:Ljava/io/BufferedReader;

    .line 276
    :cond_52
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    if-eqz v4, :cond_53

    .line 277
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 278
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->inStream:Ljava/io/InputStream;

    .line 280
    :cond_53
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->builder:Ljava/lang/StringBuilder;

    if-eqz v4, :cond_54

    .line 281
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->builder:Ljava/lang/StringBuilder;

    .line 282
    :cond_54
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v4, :cond_55

    .line 283
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 284
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->entity:Lorg/apache/http/HttpEntity;

    .line 286
    :cond_55
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->response:Lorg/apache/http/HttpResponse;

    if-eqz v4, :cond_56

    .line 288
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->response:Lorg/apache/http/HttpResponse;

    .line 290
    :cond_56
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v4, :cond_57

    .line 291
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 293
    :cond_57
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    if-eqz v4, :cond_58

    .line 294
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpPost:Lorg/apache/http/client/methods/HttpPost;

    .line 296
    :cond_58
    iget-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpParameters:Lorg/apache/http/params/HttpParams;

    if-eqz v4, :cond_9

    .line 297
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->httpParameters:Lorg/apache/http/params/HttpParams;
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_a

    goto/16 :goto_2

    .line 299
    :catch_a
    move-exception v1

    .line 300
    .restart local v1    # "eio":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    .line 260
    .end local v1    # "eio":Ljava/io/IOException;
    :catch_b
    move-exception v1

    .line 261
    .restart local v1    # "eio":Ljava/io/IOException;
    :try_start_12
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_0

    goto :goto_7

    .line 299
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "eio":Ljava/io/IOException;
    :catch_c
    move-exception v1

    .line 300
    .restart local v1    # "eio":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_5

    .line 299
    .end local v1    # "eio":Ljava/io/IOException;
    :catch_d
    move-exception v1

    .line 300
    .restart local v1    # "eio":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2
.end method

.method protected onCancelled()V
    .locals 1

    .prologue
    .line 308
    invoke-super {p0}, Landroid/os/AsyncTask;->onCancelled()V

    .line 309
    iget-object v0, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->req:Lcom/amuzo/tech/legoid/IAsyncCaller;

    if-eqz v0, :cond_0

    .line 310
    iget-object v0, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->req:Lcom/amuzo/tech/legoid/IAsyncCaller;

    invoke-interface {v0}, Lcom/amuzo/tech/legoid/IAsyncCaller;->notifyCallerOnRequestCancelled()V

    .line 311
    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 315
    iget-object v0, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->req:Lcom/amuzo/tech/legoid/IAsyncCaller;

    if-eqz v0, :cond_0

    .line 317
    iget-object v0, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->error:Lcom/amuzo/tech/legoid/ConnectionErrors;

    if-eqz v0, :cond_1

    .line 318
    iget-object v0, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->req:Lcom/amuzo/tech/legoid/IAsyncCaller;

    iget-object v1, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->error:Lcom/amuzo/tech/legoid/ConnectionErrors;

    iget-object v2, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->errorMessage:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/amuzo/tech/legoid/IAsyncCaller;->notifyCallerOnConnectionFailure(Lcom/amuzo/tech/legoid/ConnectionErrors;Ljava/lang/String;)V

    .line 323
    :cond_0
    :goto_0
    return-void

    .line 321
    :cond_1
    iget-object v0, p0, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->req:Lcom/amuzo/tech/legoid/IAsyncCaller;

    invoke-interface {v0, p1}, Lcom/amuzo/tech/legoid/IAsyncCaller;->notifyCallerOnPostExecute(Ljava/lang/String;)V

    goto :goto_0
.end method
