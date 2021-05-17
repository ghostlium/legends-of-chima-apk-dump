.class public Lcom/amazon/insights/delivery/ERSRequestBuilder;
.super Ljava/lang/Object;
.source "ERSRequestBuilder.java"


# static fields
.field static final CONTENT_ENCODING_KEY:Ljava/lang/String; = "Content-Encoding"

.field static final DEFAULT_ENDPOINT:Ljava/lang/String; = "https://applab-sdk.amazon.com/1.0"

.field static final ENDPOINT_PATH:Ljava/lang/String; = "%s/applications/%s/events"

.field static final KEY_ENDPOINT:Ljava/lang/String; = "eventRecorderEndpoint"

.field static final UNIQUE_ID_HEADER_KEY:Ljava/lang/String; = "x-amzn-UniqueId"

.field private static final logger:Lcom/amazon/insights/core/log/Logger;


# instance fields
.field private final context:Lcom/amazon/insights/core/InsightsContext;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const-class v0, Lcom/amazon/insights/delivery/ERSRequestBuilder;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/delivery/ERSRequestBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/amazon/insights/core/InsightsContext;)V
    .locals 0
    .param p1, "context"    # Lcom/amazon/insights/core/InsightsContext;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/amazon/insights/delivery/ERSRequestBuilder;->context:Lcom/amazon/insights/core/InsightsContext;

    .line 32
    return-void
.end method

.method private getEndpointUrl()Ljava/lang/String;
    .locals 3

    .prologue
    .line 93
    iget-object v0, p0, Lcom/amazon/insights/delivery/ERSRequestBuilder;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v0}, Lcom/amazon/insights/core/InsightsContext;->getConfiguration()Lcom/amazon/insights/core/configuration/Configuration;

    move-result-object v0

    const-string v1, "eventRecorderEndpoint"

    const-string v2, "https://applab-sdk.amazon.com/1.0"

    invoke-interface {v0, v1, v2}, Lcom/amazon/insights/core/configuration/Configuration;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method createHttpRequest(Lorg/json/JSONArray;)Lcom/amazon/insights/core/http/HttpClient$Request;
    .locals 14
    .param p1, "events"    # Lorg/json/JSONArray;

    .prologue
    .line 35
    iget-object v9, p0, Lcom/amazon/insights/delivery/ERSRequestBuilder;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v9}, Lcom/amazon/insights/core/InsightsContext;->getCredentials()Lcom/amazon/insights/InsightsCredentials;

    move-result-object v9

    invoke-interface {v9}, Lcom/amazon/insights/InsightsCredentials;->getApplicationKey()Ljava/lang/String;

    move-result-object v0

    .line 37
    .local v0, "appKey":Ljava/lang/String;
    iget-object v9, p0, Lcom/amazon/insights/delivery/ERSRequestBuilder;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v9}, Lcom/amazon/insights/core/InsightsContext;->getHttpClient()Lcom/amazon/insights/core/http/HttpClient;

    move-result-object v9

    invoke-interface {v9}, Lcom/amazon/insights/core/http/HttpClient;->newRequest()Lcom/amazon/insights/core/http/HttpClient$Request;

    move-result-object v9

    const-string v10, "%s/applications/%s/events"

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-direct {p0}, Lcom/amazon/insights/delivery/ERSRequestBuilder;->getEndpointUrl()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x1

    aput-object v0, v11, v12

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Lcom/amazon/insights/core/http/HttpClient$Request;->setUrl(Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Request;

    move-result-object v9

    const-string v10, "x-amzn-UniqueId"

    iget-object v11, p0, Lcom/amazon/insights/delivery/ERSRequestBuilder;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v11}, Lcom/amazon/insights/core/InsightsContext;->getUniqueId()Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v11

    invoke-virtual {v11}, Lcom/amazon/insights/core/idresolver/Id;->getValue()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v9, v10, v11}, Lcom/amazon/insights/core/http/HttpClient$Request;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Request;

    move-result-object v9

    sget-object v10, Lcom/amazon/insights/core/http/HttpClient$HttpMethod;->POST:Lcom/amazon/insights/core/http/HttpClient$HttpMethod;

    invoke-interface {v9, v10}, Lcom/amazon/insights/core/http/HttpClient$Request;->setMethod(Lcom/amazon/insights/core/http/HttpClient$HttpMethod;)Lcom/amazon/insights/core/http/HttpClient$Request;

    move-result-object v8

    .line 42
    .local v8, "httpRequest":Lcom/amazon/insights/core/http/HttpClient$Request;
    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v1

    .line 43
    .local v1, "body":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 44
    const/4 v8, 0x0

    .line 88
    .end local v8    # "httpRequest":Lcom/amazon/insights/core/http/HttpClient$Request;
    :goto_0
    return-object v8

    .line 47
    .restart local v8    # "httpRequest":Lcom/amazon/insights/core/http/HttpClient$Request;
    :cond_0
    const/4 v4, 0x0

    .line 50
    .local v4, "compressedBytes":[B
    const/4 v2, 0x0

    .line 51
    .local v2, "byteStream":Ljava/io/ByteArrayOutputStream;
    const/4 v6, 0x0

    .line 54
    .local v6, "gzipStream":Ljava/util/zip/GZIPOutputStream;
    :try_start_0
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    .end local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .local v3, "byteStream":Ljava/io/ByteArrayOutputStream;
    :try_start_1
    new-instance v7, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v7, v3}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_6
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 56
    .end local v6    # "gzipStream":Ljava/util/zip/GZIPOutputStream;
    .local v7, "gzipStream":Ljava/util/zip/GZIPOutputStream;
    :try_start_2
    const-string v9, "UTF-8"

    invoke-virtual {v1, v9}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/util/zip/GZIPOutputStream;->write([B)V

    .line 57
    invoke-virtual {v7}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 60
    :try_start_3
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    move-result-object v4

    .line 68
    :goto_1
    if-eqz v3, :cond_1

    .line 69
    :try_start_4
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 71
    :cond_1
    if-eqz v7, :cond_2

    .line 72
    invoke-virtual {v7}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 77
    :cond_2
    :goto_2
    const/4 v2, 0x0

    .line 78
    .end local v3    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    const/4 v6, 0x0

    .line 81
    .end local v7    # "gzipStream":Ljava/util/zip/GZIPOutputStream;
    .restart local v6    # "gzipStream":Ljava/util/zip/GZIPOutputStream;
    :goto_3
    if-nez v4, :cond_7

    .line 82
    const/4 v8, 0x0

    goto :goto_0

    .line 61
    .end local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "gzipStream":Ljava/util/zip/GZIPOutputStream;
    .restart local v3    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v7    # "gzipStream":Ljava/util/zip/GZIPOutputStream;
    :catch_0
    move-exception v5

    .line 62
    .local v5, "e":Ljava/lang/Exception;
    :try_start_5
    sget-object v9, Lcom/amazon/insights/delivery/ERSRequestBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v10, "Error creating compressed String for ERS Request"

    invoke-virtual {v9, v10, v5}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    goto :goto_1

    .line 64
    .end local v5    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v5

    move-object v6, v7

    .end local v7    # "gzipStream":Ljava/util/zip/GZIPOutputStream;
    .restart local v6    # "gzipStream":Ljava/util/zip/GZIPOutputStream;
    move-object v2, v3

    .line 65
    .end local v3    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .local v5, "e":Ljava/io/IOException;
    :goto_4
    :try_start_6
    sget-object v9, Lcom/amazon/insights/delivery/ERSRequestBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v10, "Error attempting to compress request contents"

    invoke-virtual {v9, v10, v5}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 68
    if-eqz v2, :cond_3

    .line 69
    :try_start_7
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 71
    :cond_3
    if-eqz v6, :cond_4

    .line 72
    invoke-virtual {v6}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3

    .line 77
    :cond_4
    :goto_5
    const/4 v2, 0x0

    .line 78
    const/4 v6, 0x0

    .line 79
    goto :goto_3

    .line 74
    .end local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .end local v5    # "e":Ljava/io/IOException;
    .end local v6    # "gzipStream":Ljava/util/zip/GZIPOutputStream;
    .restart local v3    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v7    # "gzipStream":Ljava/util/zip/GZIPOutputStream;
    :catch_2
    move-exception v5

    .line 75
    .restart local v5    # "e":Ljava/io/IOException;
    sget-object v9, Lcom/amazon/insights/delivery/ERSRequestBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v10, "Errror closing compression streams"

    invoke-virtual {v9, v10, v5}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 74
    .end local v3    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "gzipStream":Ljava/util/zip/GZIPOutputStream;
    .restart local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v6    # "gzipStream":Ljava/util/zip/GZIPOutputStream;
    :catch_3
    move-exception v5

    .line 75
    sget-object v9, Lcom/amazon/insights/delivery/ERSRequestBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v10, "Errror closing compression streams"

    invoke-virtual {v9, v10, v5}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_5

    .line 67
    .end local v5    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v9

    .line 68
    :goto_6
    if-eqz v2, :cond_5

    .line 69
    :try_start_8
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 71
    :cond_5
    if-eqz v6, :cond_6

    .line 72
    invoke-virtual {v6}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4

    .line 77
    :cond_6
    :goto_7
    const/4 v2, 0x0

    .line 78
    const/4 v6, 0x0

    throw v9

    .line 74
    :catch_4
    move-exception v5

    .line 75
    .restart local v5    # "e":Ljava/io/IOException;
    sget-object v10, Lcom/amazon/insights/delivery/ERSRequestBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v11, "Errror closing compression streams"

    invoke-virtual {v10, v11, v5}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_7

    .line 85
    .end local v5    # "e":Ljava/io/IOException;
    :cond_7
    invoke-interface {v8, v4}, Lcom/amazon/insights/core/http/HttpClient$Request;->setPostBody([B)Lcom/amazon/insights/core/http/HttpClient$Request;

    .line 86
    const-string v9, "Content-Encoding"

    const-string v10, "gzip"

    invoke-interface {v8, v9, v10}, Lcom/amazon/insights/core/http/HttpClient$Request;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Request;

    goto/16 :goto_0

    .line 67
    .end local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "byteStream":Ljava/io/ByteArrayOutputStream;
    :catchall_1
    move-exception v9

    move-object v2, v3

    .end local v3    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    goto :goto_6

    .end local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "gzipStream":Ljava/util/zip/GZIPOutputStream;
    .restart local v3    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v7    # "gzipStream":Ljava/util/zip/GZIPOutputStream;
    :catchall_2
    move-exception v9

    move-object v6, v7

    .end local v7    # "gzipStream":Ljava/util/zip/GZIPOutputStream;
    .restart local v6    # "gzipStream":Ljava/util/zip/GZIPOutputStream;
    move-object v2, v3

    .end local v3    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    goto :goto_6

    .line 64
    :catch_5
    move-exception v5

    goto :goto_4

    .end local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "byteStream":Ljava/io/ByteArrayOutputStream;
    :catch_6
    move-exception v5

    move-object v2, v3

    .end local v3    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    goto :goto_4
.end method
