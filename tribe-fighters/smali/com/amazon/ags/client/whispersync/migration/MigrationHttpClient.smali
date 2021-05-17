.class public Lcom/amazon/ags/client/whispersync/migration/MigrationHttpClient;
.super Ljava/lang/Object;
.source "MigrationHttpClient.java"


# static fields
.field private static final DOWNLOAD_URL:Ljava/lang/String; = "https://cortana-gateway.amazon.com/cortana/gateway/getSignedDownloadUrl"

.field private static final DOWNLOAD_URL_RESPONSE_KEY:Ljava/lang/String; = "downloadUrl"

.field private static final GAME_ID_PARAMETER_NAME:Ljava/lang/String; = "GameId"

.field private static final GAME_PACKAGE_PARAM_NAME:Ljava/lang/String; = "PackageName"

.field private static final TAG:Ljava/lang/String; = "GC_Whispersync"


# instance fields
.field private final gameId:Ljava/lang/String;

.field private final httpClient:Lorg/apache/http/client/HttpClient;

.field private final networkClient:Lcom/amazon/ags/html5/comm/NetworkClient;

.field private final packageName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/amazon/ags/html5/comm/NetworkClient;Lorg/apache/http/client/HttpClient;)V
    .locals 0
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "gameId"    # Ljava/lang/String;
    .param p3, "networkClient"    # Lcom/amazon/ags/html5/comm/NetworkClient;
    .param p4, "httpClient"    # Lorg/apache/http/client/HttpClient;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p2, p0, Lcom/amazon/ags/client/whispersync/migration/MigrationHttpClient;->gameId:Ljava/lang/String;

    .line 43
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/migration/MigrationHttpClient;->packageName:Ljava/lang/String;

    .line 44
    iput-object p3, p0, Lcom/amazon/ags/client/whispersync/migration/MigrationHttpClient;->networkClient:Lcom/amazon/ags/html5/comm/NetworkClient;

    .line 45
    iput-object p4, p0, Lcom/amazon/ags/client/whispersync/migration/MigrationHttpClient;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 46
    return-void
.end method

.method private isResponseNoSuchKey(Lorg/apache/http/HttpResponse;)Z
    .locals 2
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 141
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    const/16 v1, 0x194

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private parseUrlFromResponse(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 63
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 64
    .local v1, "json":Lorg/json/JSONObject;
    const-string v2, "downloadUrl"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 67
    .end local v1    # "json":Lorg/json/JSONObject;
    :goto_0
    return-object v2

    .line 65
    :catch_0
    move-exception v0

    .line 66
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "GC_Whispersync"

    const-string v3, "Conversion - Error retrieving download URL"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 67
    const/4 v2, 0x0

    goto :goto_0
.end method


# virtual methods
.method public final download(Ljava/lang/String;)Lcom/amazon/ags/client/whispersync/migration/DownloadResult;
    .locals 13
    .param p1, "signedUrl"    # Ljava/lang/String;

    .prologue
    const/4 v12, 0x0

    .line 76
    :try_start_0
    new-instance v6, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v6, p1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    .local v6, "request":Lorg/apache/http/client/methods/HttpGet;
    :try_start_1
    iget-object v9, p0, Lcom/amazon/ags/client/whispersync/migration/MigrationHttpClient;->httpClient:Lorg/apache/http/client/HttpClient;

    invoke-interface {v9, v6}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v7

    .line 90
    .local v7, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v7}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v9

    const/16 v10, 0xc8

    if-eq v9, v10, :cond_1

    .line 91
    invoke-direct {p0, v7}, Lcom/amazon/ags/client/whispersync/migration/MigrationHttpClient;->isResponseNoSuchKey(Lorg/apache/http/HttpResponse;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 92
    const-string v9, "GC_Whispersync"

    const-string v10, "Conversion - No V1 game data exists"

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    new-instance v9, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;

    sget-object v10, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->NO_DATA:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-direct {v9, v12, v10}, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;-><init>([BLcom/amazon/ags/api/whispersync/migration/MigrationResultCode;)V

    .line 137
    .end local v6    # "request":Lorg/apache/http/client/methods/HttpGet;
    .end local v7    # "response":Lorg/apache/http/HttpResponse;
    :goto_0
    return-object v9

    .line 77
    :catch_0
    move-exception v2

    .line 78
    .local v2, "e":Ljava/lang/Exception;
    const-string v9, "GC_Whispersync"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Conversion - invalid URI:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    new-instance v9, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;

    sget-object v10, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->FAILURE:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-direct {v9, v12, v10}, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;-><init>([BLcom/amazon/ags/api/whispersync/migration/MigrationResultCode;)V

    goto :goto_0

    .line 85
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v6    # "request":Lorg/apache/http/client/methods/HttpGet;
    :catch_1
    move-exception v2

    .line 86
    .restart local v2    # "e":Ljava/lang/Exception;
    const-string v9, "GC_Whispersync"

    const-string v10, "Conversion - Unable to download V1 game data"

    invoke-static {v9, v10, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 87
    new-instance v9, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;

    sget-object v10, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->NETWORK_FAILURE:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-direct {v9, v12, v10}, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;-><init>([BLcom/amazon/ags/api/whispersync/migration/MigrationResultCode;)V

    goto :goto_0

    .line 95
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v7    # "response":Lorg/apache/http/HttpResponse;
    :cond_0
    const-string v9, "GC_Whispersync"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Conversion - Unexpected response code: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-interface {v7}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    new-instance v9, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;

    sget-object v10, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->FAILURE:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-direct {v9, v12, v10}, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;-><init>([BLcom/amazon/ags/api/whispersync/migration/MigrationResultCode;)V

    goto :goto_0

    .line 101
    :cond_1
    :try_start_2
    invoke-interface {v7}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;
    :try_end_2
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_5

    move-result-object v3

    .line 110
    .local v3, "is":Ljava/io/InputStream;
    new-instance v5, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v5}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 113
    .local v5, "os":Ljava/io/ByteArrayOutputStream;
    const/16 v9, 0x400

    :try_start_3
    new-array v0, v9, [B

    .line 116
    .local v0, "buffer":[B
    :goto_1
    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v4

    .local v4, "len":I
    if-lez v4, :cond_2

    .line 117
    const/4 v9, 0x0

    invoke-virtual {v5, v0, v9, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_3
    .catch Ljavax/net/ssl/SSLException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_7
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 122
    .end local v0    # "buffer":[B
    .end local v4    # "len":I
    :catch_2
    move-exception v8

    .line 124
    .local v8, "sslException":Ljavax/net/ssl/SSLException;
    :try_start_4
    const-string v9, "GC_Whispersync"

    const-string v10, "Conversion - Network timeout"

    invoke-static {v9, v10, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 125
    new-instance v9, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;

    const/4 v10, 0x0

    sget-object v11, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->FAILURE:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-direct {v9, v10, v11}, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;-><init>([BLcom/amazon/ags/api/whispersync/migration/MigrationResultCode;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 131
    :try_start_5
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    goto/16 :goto_0

    .line 132
    :catch_3
    move-exception v2

    .line 133
    .local v2, "e":Ljava/io/IOException;
    const-string v10, "GC_Whispersync"

    const-string v11, "Conversion - Error while closing download stream"

    invoke-static {v10, v11, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .line 102
    .end local v2    # "e":Ljava/io/IOException;
    .end local v3    # "is":Ljava/io/InputStream;
    .end local v5    # "os":Ljava/io/ByteArrayOutputStream;
    .end local v8    # "sslException":Ljavax/net/ssl/SSLException;
    :catch_4
    move-exception v2

    .line 103
    .local v2, "e":Ljava/lang/IllegalStateException;
    const-string v9, "GC_Whispersync"

    const-string v10, "Conversion - Unexpected exception: "

    invoke-static {v9, v10, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 104
    new-instance v9, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;

    sget-object v10, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->FAILURE:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-direct {v9, v12, v10}, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;-><init>([BLcom/amazon/ags/api/whispersync/migration/MigrationResultCode;)V

    goto/16 :goto_0

    .line 105
    .end local v2    # "e":Ljava/lang/IllegalStateException;
    :catch_5
    move-exception v2

    .line 106
    .local v2, "e":Ljava/io/IOException;
    const-string v9, "GC_Whispersync"

    const-string v10, "Conversion - Unexpected exception: "

    invoke-static {v9, v10, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 107
    new-instance v9, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;

    sget-object v10, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->FAILURE:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-direct {v9, v12, v10}, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;-><init>([BLcom/amazon/ags/api/whispersync/migration/MigrationResultCode;)V

    goto/16 :goto_0

    .line 120
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v0    # "buffer":[B
    .restart local v3    # "is":Ljava/io/InputStream;
    .restart local v4    # "len":I
    .restart local v5    # "os":Ljava/io/ByteArrayOutputStream;
    :cond_2
    :try_start_6
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_6
    .catch Ljavax/net/ssl/SSLException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_7
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-result-object v1

    .line 131
    .local v1, "data":[B
    :try_start_7
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_6

    .line 137
    :goto_2
    new-instance v9, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;

    sget-object v10, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->SUCCESS:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-direct {v9, v1, v10}, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;-><init>([BLcom/amazon/ags/api/whispersync/migration/MigrationResultCode;)V

    goto/16 :goto_0

    .line 132
    :catch_6
    move-exception v2

    .line 133
    .restart local v2    # "e":Ljava/io/IOException;
    const-string v9, "GC_Whispersync"

    const-string v10, "Conversion - Error while closing download stream"

    invoke-static {v9, v10, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    .line 126
    .end local v0    # "buffer":[B
    .end local v1    # "data":[B
    .end local v2    # "e":Ljava/io/IOException;
    .end local v4    # "len":I
    :catch_7
    move-exception v2

    .line 127
    .restart local v2    # "e":Ljava/io/IOException;
    :try_start_8
    const-string v9, "GC_Whispersync"

    const-string v10, "Conversion - Unexpected exception: "

    invoke-static {v9, v10, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 128
    new-instance v9, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;

    const/4 v10, 0x0

    sget-object v11, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->FAILURE:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-direct {v9, v10, v11}, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;-><init>([BLcom/amazon/ags/api/whispersync/migration/MigrationResultCode;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 131
    :try_start_9
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_8

    goto/16 :goto_0

    .line 132
    :catch_8
    move-exception v2

    .line 133
    const-string v10, "GC_Whispersync"

    const-string v11, "Conversion - Error while closing download stream"

    invoke-static {v10, v11, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .line 130
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v9

    .line 131
    :try_start_a
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_9

    .line 134
    :goto_3
    throw v9

    .line 132
    :catch_9
    move-exception v2

    .line 133
    .restart local v2    # "e":Ljava/io/IOException;
    const-string v10, "GC_Whispersync"

    const-string v11, "Conversion - Error while closing download stream"

    invoke-static {v10, v11, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3
.end method

.method public getV1GameDataDownloadUrl()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/html5/comm/ConnectionException;,
            Lcom/amazon/ags/AGSServiceException;,
            Lcom/amazon/ags/AGSClientException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 49
    new-instance v1, Lcom/amazon/ags/html5/comm/AGSHttpGet;

    const-string v3, "https://cortana-gateway.amazon.com/cortana/gateway/getSignedDownloadUrl"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/amazon/ags/html5/comm/AGSHttpGet;-><init>(Ljava/lang/String;Z)V

    .line 50
    .local v1, "request":Lcom/amazon/ags/html5/comm/AGSHttpGet;
    const-string v3, "PackageName"

    iget-object v4, p0, Lcom/amazon/ags/client/whispersync/migration/MigrationHttpClient;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Lcom/amazon/ags/html5/comm/AGSHttpGet;->putUrlParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    const-string v3, "GameId"

    iget-object v4, p0, Lcom/amazon/ags/client/whispersync/migration/MigrationHttpClient;->gameId:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Lcom/amazon/ags/html5/comm/AGSHttpGet;->putHeaderParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/migration/MigrationHttpClient;->networkClient:Lcom/amazon/ags/html5/comm/NetworkClient;

    invoke-interface {v3, v1}, Lcom/amazon/ags/html5/comm/NetworkClient;->execute(Lcom/amazon/ags/html5/comm/ServiceRequestBase;)Lcom/amazon/ags/html5/comm/ServiceResponse;

    move-result-object v2

    .line 53
    .local v2, "response":Lcom/amazon/ags/html5/comm/ServiceResponse;
    invoke-virtual {v2}, Lcom/amazon/ags/html5/comm/ServiceResponse;->getContent()Ljava/lang/String;

    move-result-object v0

    .line 54
    .local v0, "body":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 55
    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/migration/MigrationHttpClient;->parseUrlFromResponse(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 57
    :goto_0
    return-object v3

    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method
