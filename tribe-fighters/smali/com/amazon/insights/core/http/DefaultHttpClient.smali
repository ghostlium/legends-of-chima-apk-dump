.class public Lcom/amazon/insights/core/http/DefaultHttpClient;
.super Ljava/lang/Object;
.source "DefaultHttpClient.java"

# interfaces
.implements Lcom/amazon/insights/core/http/HttpClient;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/insights/core/http/DefaultHttpClient$1;,
        Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;,
        Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultRequest;
    }
.end annotation


# static fields
.field public static final DATE_HEADER:Ljava/lang/String; = "Date"

.field public static final IO_EXCEPTION_RESPONSE_CODE:I = -0x3e8

.field public static final REQUESTATTEMPTS_HEADER:Ljava/lang/String; = "x-amzn-RequestAttempts"

.field public static final REQUESTTIME_HEADER:Ljava/lang/String; = "x-amzn-RequestTime"

.field public static final SERVERINFO_HEADER:Ljava/lang/String; = "x-amzn-ServerInfo"

.field private static final TAG:Ljava/lang/String; = "DefaultHttpClient"

.field private static final TIME_FORMAT:Ljava/lang/String; = "yyyy-MM-dd\'T\'HH:mm:ssZ"

.field private static final logger:Lcom/amazon/insights/core/log/Logger;


# instance fields
.field private df:Ljava/text/DateFormat;

.field private interceptors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/amazon/insights/core/http/HttpClient$Interceptor;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-class v0, Lcom/amazon/insights/core/http/HttpClient;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/core/http/DefaultHttpClient;->logger:Lcom/amazon/insights/core/log/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 290
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 291
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/amazon/insights/core/http/DefaultHttpClient;->interceptors:Ljava/util/List;

    .line 292
    const-string v0, "yyyy-MM-dd\'T\'HH:mm:ssZ"

    invoke-static {v0}, Lcom/amazon/insights/core/util/DateUtil;->createLocaleIndependentDateFormatter(Ljava/lang/String;)Ljava/text/DateFormat;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/core/http/DefaultHttpClient;->df:Ljava/text/DateFormat;

    .line 293
    return-void
.end method

.method private executeHttpRequest(Lorg/apache/http/client/methods/HttpUriRequest;I)Lcom/amazon/insights/core/http/HttpClient$Response;
    .locals 24
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;
    .param p2, "retries"    # I

    .prologue
    .line 433
    invoke-static {}, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;->createResponse()Lcom/amazon/insights/core/http/HttpClient$Response;

    move-result-object v15

    .line 434
    .local v15, "response":Lcom/amazon/insights/core/http/HttpClient$Response;
    invoke-static {}, Lcom/amazon/insights/core/http/HttpUtil;->getHttpClient()Lorg/apache/http/client/HttpClient;

    move-result-object v10

    .line 435
    .local v10, "httpClient":Lorg/apache/http/client/HttpClient;
    const/4 v11, 0x0

    .line 436
    .local v11, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    .line 439
    .local v16, "startTime":J
    if-ltz p2, :cond_2

    add-int/lit8 v18, p2, 0x1

    .line 440
    .local v18, "totalAttempts":I
    :goto_0
    const/4 v2, 0x1

    .line 441
    .local v2, "attempts":I
    :goto_1
    move/from16 v0, v18

    if-gt v2, v0, :cond_0

    .line 443
    :try_start_0
    move-object/from16 v0, p1

    invoke-interface {v10, v0}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v11

    .line 454
    :cond_0
    :goto_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 455
    .local v6, "endTime":J
    const-string v19, "x-amzn-RequestTime"

    sub-long v20, v6, v16

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-interface {v15, v0, v1}, Lcom/amazon/insights/core/http/HttpClient$Response;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Response;

    .line 456
    const-string v19, "x-amzn-RequestAttempts"

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-interface {v15, v0, v1}, Lcom/amazon/insights/core/http/HttpClient$Response;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Response;

    .line 458
    if-eqz v11, :cond_5

    .line 459
    invoke-interface {v11}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v19

    move/from16 v0, v19

    invoke-interface {v15, v0}, Lcom/amazon/insights/core/http/HttpClient$Response;->setCode(I)Lcom/amazon/insights/core/http/HttpClient$Response;

    move-result-object v19

    invoke-interface {v11}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v20

    invoke-interface/range {v19 .. v20}, Lcom/amazon/insights/core/http/HttpClient$Response;->setMessage(Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Response;

    move-result-object v19

    invoke-virtual/range {p0 .. p1}, Lcom/amazon/insights/core/http/DefaultHttpClient;->calculateRequestSize(Lorg/apache/http/client/methods/HttpUriRequest;)J

    move-result-wide v20

    invoke-interface/range {v19 .. v21}, Lcom/amazon/insights/core/http/HttpClient$Response;->setRequestSize(J)Lcom/amazon/insights/core/http/HttpClient$Response;

    .line 462
    invoke-interface {v11}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v8

    .line 463
    .local v8, "entity":Lorg/apache/http/HttpEntity;
    const/4 v3, 0x0

    .line 464
    .local v3, "body":Ljava/lang/String;
    if-eqz v8, :cond_1

    .line 465
    const/4 v13, 0x0

    .line 467
    .local v13, "instream":Ljava/io/InputStream;
    :try_start_1
    const-string v19, "Content-Encoding"

    move-object/from16 v0, v19

    invoke-interface {v11, v0}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v4

    .line 468
    .local v4, "contentEncoding":Lorg/apache/http/Header;
    if-eqz v4, :cond_3

    invoke-interface {v4}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v19

    const-string v20, "gzip"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_3

    .line 469
    new-instance v14, Ljava/util/zip/GZIPInputStream;

    invoke-interface {v8}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v14, v0}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    .end local v13    # "instream":Ljava/io/InputStream;
    .local v14, "instream":Ljava/io/InputStream;
    move-object v13, v14

    .line 473
    .end local v14    # "instream":Ljava/io/InputStream;
    .restart local v13    # "instream":Ljava/io/InputStream;
    :goto_3
    invoke-static {v13}, Lcom/amazon/insights/core/util/StringUtil;->convertStreamToUTF8String(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v3

    .line 476
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/amazon/insights/core/http/DefaultHttpClient;->calculateResponseSize(Lorg/apache/http/HttpResponse;)J

    move-result-wide v19

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v21

    move/from16 v0, v21

    int-to-long v0, v0

    move-wide/from16 v21, v0

    add-long v19, v19, v21

    move-wide/from16 v0, v19

    invoke-interface {v15, v0, v1}, Lcom/amazon/insights/core/http/HttpClient$Response;->setResponseSize(J)Lcom/amazon/insights/core/http/HttpClient$Response;
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_6
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 487
    if-eqz v13, :cond_1

    .line 489
    :try_start_2
    invoke-virtual {v13}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_8

    .line 496
    .end local v4    # "contentEncoding":Lorg/apache/http/Header;
    .end local v13    # "instream":Ljava/io/InputStream;
    :cond_1
    :goto_4
    if-eqz v3, :cond_5

    .line 497
    invoke-interface {v15, v3}, Lcom/amazon/insights/core/http/HttpClient$Response;->setResponse(Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Response;

    .line 498
    invoke-interface {v11}, Lorg/apache/http/HttpResponse;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v9

    .line 499
    .local v9, "headers":[Lorg/apache/http/Header;
    if-eqz v9, :cond_5

    array-length v0, v9

    move/from16 v19, v0

    if-lez v19, :cond_5

    .line 500
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_5
    array-length v0, v9

    move/from16 v19, v0

    move/from16 v0, v19

    if-ge v12, v0, :cond_5

    .line 501
    aget-object v19, v9, v12

    invoke-interface/range {v19 .. v19}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v19

    aget-object v20, v9, v12

    invoke-interface/range {v20 .. v20}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-interface {v15, v0, v1}, Lcom/amazon/insights/core/http/HttpClient$Response;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Response;

    .line 500
    add-int/lit8 v12, v12, 0x1

    goto :goto_5

    .line 439
    .end local v2    # "attempts":I
    .end local v3    # "body":Ljava/lang/String;
    .end local v6    # "endTime":J
    .end local v8    # "entity":Lorg/apache/http/HttpEntity;
    .end local v9    # "headers":[Lorg/apache/http/Header;
    .end local v12    # "i":I
    .end local v18    # "totalAttempts":I
    :cond_2
    const/16 v18, 0x1

    goto/16 :goto_0

    .line 445
    .restart local v2    # "attempts":I
    .restart local v18    # "totalAttempts":I
    :catch_0
    move-exception v5

    .line 446
    .local v5, "e":Lorg/apache/http/client/ClientProtocolException;
    const/16 v19, 0x190

    move/from16 v0, v19

    invoke-interface {v15, v0}, Lcom/amazon/insights/core/http/HttpClient$Response;->setCode(I)Lcom/amazon/insights/core/http/HttpClient$Response;

    move-result-object v19

    const-string v20, "Issue making request to service, %s"

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual {v5}, Lorg/apache/http/client/ClientProtocolException;->toString()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v20 .. v21}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-interface/range {v19 .. v20}, Lcom/amazon/insights/core/http/HttpClient$Response;->setMessage(Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Response;

    goto/16 :goto_2

    .line 448
    .end local v5    # "e":Lorg/apache/http/client/ClientProtocolException;
    :catch_1
    move-exception v5

    .line 449
    .local v5, "e":Ljava/io/IOException;
    add-int/lit8 v2, v2, 0x1

    .line 450
    const/16 v19, -0x3e8

    move/from16 v0, v19

    invoke-interface {v15, v0}, Lcom/amazon/insights/core/http/HttpClient$Response;->setCode(I)Lcom/amazon/insights/core/http/HttpClient$Response;

    move-result-object v19

    const-string v20, "Unable to communicate with service, %s"

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual {v5}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v20 .. v21}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-interface/range {v19 .. v20}, Lcom/amazon/insights/core/http/HttpClient$Response;->setMessage(Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Response;

    goto/16 :goto_1

    .line 471
    .end local v5    # "e":Ljava/io/IOException;
    .restart local v3    # "body":Ljava/lang/String;
    .restart local v4    # "contentEncoding":Lorg/apache/http/Header;
    .restart local v6    # "endTime":J
    .restart local v8    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v13    # "instream":Ljava/io/InputStream;
    :cond_3
    :try_start_3
    invoke-interface {v8}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;
    :try_end_3
    .catch Ljava/lang/IllegalStateException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_6
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v13

    goto/16 :goto_3

    .line 477
    .end local v4    # "contentEncoding":Lorg/apache/http/Header;
    :catch_2
    move-exception v5

    .line 478
    .local v5, "e":Ljava/lang/IllegalStateException;
    const/4 v3, 0x0

    .line 479
    const/16 v19, 0x1f4

    :try_start_4
    move/from16 v0, v19

    invoke-interface {v15, v0}, Lcom/amazon/insights/core/http/HttpClient$Response;->setCode(I)Lcom/amazon/insights/core/http/HttpClient$Response;

    move-result-object v19

    const-string v20, "Issue recieving response from service, %s"

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual {v5}, Ljava/lang/IllegalStateException;->toString()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v20 .. v21}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-interface/range {v19 .. v20}, Lcom/amazon/insights/core/http/HttpClient$Response;->setMessage(Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Response;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 487
    if-eqz v13, :cond_1

    .line 489
    :try_start_5
    invoke-virtual {v13}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    goto/16 :goto_4

    .line 490
    :catch_3
    move-exception v19

    goto/16 :goto_4

    .line 480
    .end local v5    # "e":Ljava/lang/IllegalStateException;
    :catch_4
    move-exception v5

    .line 481
    .local v5, "e":Ljava/io/IOException;
    const/16 v19, 0x1f4

    :try_start_6
    move/from16 v0, v19

    invoke-interface {v15, v0}, Lcom/amazon/insights/core/http/HttpClient$Response;->setCode(I)Lcom/amazon/insights/core/http/HttpClient$Response;

    move-result-object v19

    const-string v20, "Issue with response from service, %s"

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual {v5}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v20 .. v21}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-interface/range {v19 .. v20}, Lcom/amazon/insights/core/http/HttpClient$Response;->setMessage(Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Response;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 487
    if-eqz v13, :cond_1

    .line 489
    :try_start_7
    invoke-virtual {v13}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    goto/16 :goto_4

    .line 490
    :catch_5
    move-exception v19

    goto/16 :goto_4

    .line 482
    .end local v5    # "e":Ljava/io/IOException;
    :catch_6
    move-exception v5

    .line 483
    .local v5, "e":Ljava/lang/Exception;
    const/4 v3, 0x0

    .line 484
    :try_start_8
    invoke-interface/range {p1 .. p1}, Lorg/apache/http/client/methods/HttpUriRequest;->abort()V

    .line 485
    const/16 v19, 0x1f4

    move/from16 v0, v19

    invoke-interface {v15, v0}, Lcom/amazon/insights/core/http/HttpClient$Response;->setCode(I)Lcom/amazon/insights/core/http/HttpClient$Response;

    move-result-object v19

    const-string v20, "Issue with response from service, %s"

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual {v5}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v20 .. v21}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-interface/range {v19 .. v20}, Lcom/amazon/insights/core/http/HttpClient$Response;->setMessage(Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Response;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 487
    if-eqz v13, :cond_1

    .line 489
    :try_start_9
    invoke-virtual {v13}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_7

    goto/16 :goto_4

    .line 490
    :catch_7
    move-exception v19

    goto/16 :goto_4

    .line 487
    .end local v5    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v19

    if-eqz v13, :cond_4

    .line 489
    :try_start_a
    invoke-virtual {v13}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_9

    .line 492
    :cond_4
    :goto_6
    throw v19

    .line 490
    .restart local v4    # "contentEncoding":Lorg/apache/http/Header;
    :catch_8
    move-exception v19

    goto/16 :goto_4

    .end local v4    # "contentEncoding":Lorg/apache/http/Header;
    :catch_9
    move-exception v20

    goto :goto_6

    .line 506
    .end local v3    # "body":Ljava/lang/String;
    .end local v8    # "entity":Lorg/apache/http/HttpEntity;
    .end local v13    # "instream":Ljava/io/InputStream;
    :cond_5
    return-object v15
.end method

.method private getCurrentDateTime()Ljava/lang/String;
    .locals 2

    .prologue
    .line 389
    iget-object v0, p0, Lcom/amazon/insights/core/http/DefaultHttpClient;->df:Ljava/text/DateFormat;

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public addInterceptor(Lcom/amazon/insights/core/http/HttpClient$Interceptor;)V
    .locals 1
    .param p1, "interceptor"    # Lcom/amazon/insights/core/http/HttpClient$Interceptor;

    .prologue
    .line 307
    if-eqz p1, :cond_0

    .line 308
    iget-object v0, p0, Lcom/amazon/insights/core/http/DefaultHttpClient;->interceptors:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 310
    :cond_0
    return-void
.end method

.method buildHttpRequest(Lcom/amazon/insights/core/http/HttpClient$Request;)Lorg/apache/http/client/methods/HttpUriRequest;
    .locals 9
    .param p1, "request"    # Lcom/amazon/insights/core/http/HttpClient$Request;

    .prologue
    .line 348
    const-string v4, "buildRequest"

    .line 349
    .local v4, "methodName":Ljava/lang/String;
    const/4 v2, 0x0

    .line 350
    .local v2, "httpRequest":Lorg/apache/http/client/methods/HttpUriRequest;
    sget-object v7, Lcom/amazon/insights/core/http/DefaultHttpClient$1;->$SwitchMap$com$amazon$insights$core$http$HttpClient$HttpMethod:[I

    invoke-interface {p1}, Lcom/amazon/insights/core/http/HttpClient$Request;->getMethod()Lcom/amazon/insights/core/http/HttpClient$HttpMethod;

    move-result-object v8

    invoke-virtual {v8}, Lcom/amazon/insights/core/http/HttpClient$HttpMethod;->ordinal()I

    move-result v8

    aget v7, v7, v8

    packed-switch v7, :pswitch_data_0

    .line 380
    :cond_0
    :goto_0
    if-eqz v2, :cond_3

    .line 381
    invoke-interface {p1}, Lcom/amazon/insights/core/http/HttpClient$Request;->getHeaders()Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 382
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-interface {v2, v7, v8}, Lorg/apache/http/client/methods/HttpUriRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 353
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    :pswitch_0
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    .line 354
    .local v6, "query":Ljava/lang/StringBuffer;
    invoke-interface {p1}, Lcom/amazon/insights/core/http/HttpClient$Request;->getParams()Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Map;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_2

    .line 355
    const-string v7, "?"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 356
    invoke-interface {p1}, Lcom/amazon/insights/core/http/HttpClient$Request;->getParams()Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .restart local v3    # "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 357
    .restart local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 358
    .local v5, "paramString":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->length()I

    move-result v7

    const/4 v8, 0x1

    if-le v7, v8, :cond_1

    .line 359
    const-string v7, "&"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 360
    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 362
    :cond_1
    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 366
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v5    # "paramString":Ljava/lang/String;
    :cond_2
    new-instance v2, Lorg/apache/http/client/methods/HttpGet;

    .end local v2    # "httpRequest":Lorg/apache/http/client/methods/HttpUriRequest;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p1}, Lcom/amazon/insights/core/http/HttpClient$Request;->getUrl()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v2, v7}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 368
    .restart local v2    # "httpRequest":Lorg/apache/http/client/methods/HttpUriRequest;
    goto/16 :goto_0

    .line 370
    .end local v6    # "query":Ljava/lang/StringBuffer;
    :pswitch_1
    new-instance v2, Lorg/apache/http/client/methods/HttpPost;

    .end local v2    # "httpRequest":Lorg/apache/http/client/methods/HttpUriRequest;
    invoke-interface {p1}, Lcom/amazon/insights/core/http/HttpClient$Request;->getUrl()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v2, v7}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 372
    .restart local v2    # "httpRequest":Lorg/apache/http/client/methods/HttpUriRequest;
    invoke-interface {p1}, Lcom/amazon/insights/core/http/HttpClient$Request;->getPostBodyBytes()[B

    move-result-object v7

    if-eqz v7, :cond_0

    invoke-interface {p1}, Lcom/amazon/insights/core/http/HttpClient$Request;->getPostBodyBytes()[B

    move-result-object v7

    array-length v7, v7

    if-lez v7, :cond_0

    .line 373
    new-instance v0, Lorg/apache/http/entity/ByteArrayEntity;

    invoke-interface {p1}, Lcom/amazon/insights/core/http/HttpClient$Request;->getPostBodyBytes()[B

    move-result-object v7

    invoke-direct {v0, v7}, Lorg/apache/http/entity/ByteArrayEntity;-><init>([B)V

    .local v0, "baEntity":Lorg/apache/http/entity/ByteArrayEntity;
    move-object v7, v2

    .line 374
    check-cast v7, Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {v7, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    goto/16 :goto_0

    .line 385
    .end local v0    # "baEntity":Lorg/apache/http/entity/ByteArrayEntity;
    :cond_3
    return-object v2

    .line 350
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method calculateRequestSize(Lorg/apache/http/client/methods/HttpUriRequest;)J
    .locals 9
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;

    .prologue
    .line 393
    const-wide/16 v5, 0x0

    .line 395
    .local v5, "size":J
    if-eqz p1, :cond_1

    .line 396
    :try_start_0
    invoke-interface {p1}, Lorg/apache/http/client/methods/HttpUriRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    int-to-long v7, v7

    add-long/2addr v5, v7

    .line 398
    invoke-interface {p1}, Lorg/apache/http/client/methods/HttpUriRequest;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v0

    .local v0, "arr$":[Lorg/apache/http/Header;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v2, v0, v3

    .line 399
    .local v2, "header":Lorg/apache/http/Header;
    invoke-interface {v2}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    int-to-long v7, v7

    add-long/2addr v5, v7

    .line 400
    invoke-interface {v2}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    int-to-long v7, v7

    add-long/2addr v5, v7

    .line 401
    const-wide/16 v7, 0x2

    add-long/2addr v5, v7

    .line 398
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 404
    .end local v2    # "header":Lorg/apache/http/Header;
    :cond_0
    invoke-interface {p1}, Lorg/apache/http/client/methods/HttpUriRequest;->getMethod()Ljava/lang/String;

    move-result-object v7

    const-string v8, "post"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 405
    check-cast p1, Lorg/apache/http/client/methods/HttpPost;

    .end local p1    # "request":Lorg/apache/http/client/methods/HttpUriRequest;
    invoke-virtual {p1}, Lorg/apache/http/client/methods/HttpPost;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/HttpEntity;->getContentLength()J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v7

    add-long/2addr v5, v7

    .line 411
    .end local v0    # "arr$":[Lorg/apache/http/Header;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :cond_1
    :goto_1
    return-wide v5

    .line 408
    :catch_0
    move-exception v1

    .line 409
    .local v1, "e":Ljava/lang/Exception;
    const-wide/16 v5, 0x0

    goto :goto_1
.end method

.method calculateResponseSize(Lorg/apache/http/HttpResponse;)J
    .locals 9
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 415
    const-wide/16 v5, 0x0

    .line 417
    .local v5, "size":J
    if-eqz p1, :cond_0

    .line 418
    :try_start_0
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    int-to-long v7, v7

    add-long/2addr v5, v7

    .line 420
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v0

    .local v0, "arr$":[Lorg/apache/http/Header;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v2, v0, v3

    .line 421
    .local v2, "header":Lorg/apache/http/Header;
    invoke-interface {v2}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    int-to-long v7, v7

    add-long/2addr v5, v7

    .line 422
    invoke-interface {v2}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v7

    int-to-long v7, v7

    add-long/2addr v5, v7

    .line 423
    const-wide/16 v7, 0x2

    add-long/2addr v5, v7

    .line 420
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 426
    .end local v0    # "arr$":[Lorg/apache/http/Header;
    .end local v2    # "header":Lorg/apache/http/Header;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :catch_0
    move-exception v1

    .line 427
    .local v1, "e":Ljava/lang/Exception;
    const-wide/16 v5, 0x0

    .line 429
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    return-wide v5
.end method

.method public execute(Lcom/amazon/insights/core/http/HttpClient$Request;Ljava/lang/Integer;)Lcom/amazon/insights/core/http/HttpClient$Response;
    .locals 6
    .param p1, "request"    # Lcom/amazon/insights/core/http/HttpClient$Request;
    .param p2, "retries"    # Ljava/lang/Integer;

    .prologue
    .line 322
    if-nez p2, :cond_0

    .line 324
    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    .line 327
    :cond_0
    const/4 v3, 0x0

    .line 329
    .local v3, "response":Lcom/amazon/insights/core/http/HttpClient$Response;
    const-string v4, "Date"

    invoke-direct {p0}, Lcom/amazon/insights/core/http/DefaultHttpClient;->getCurrentDateTime()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p1, v4, v5}, Lcom/amazon/insights/core/http/HttpClient$Request;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Request;

    .line 331
    iget-object v4, p0, Lcom/amazon/insights/core/http/DefaultHttpClient;->interceptors:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/insights/core/http/HttpClient$Interceptor;

    .line 332
    .local v1, "i":Lcom/amazon/insights/core/http/HttpClient$Interceptor;
    invoke-interface {v1, p1}, Lcom/amazon/insights/core/http/HttpClient$Interceptor;->before(Lcom/amazon/insights/core/http/HttpClient$Request;)V

    goto :goto_0

    .line 334
    .end local v1    # "i":Lcom/amazon/insights/core/http/HttpClient$Interceptor;
    :cond_1
    invoke-virtual {p0, p1}, Lcom/amazon/insights/core/http/DefaultHttpClient;->buildHttpRequest(Lcom/amazon/insights/core/http/HttpClient$Request;)Lorg/apache/http/client/methods/HttpUriRequest;

    move-result-object v0

    .line 335
    .local v0, "httpRequest":Lorg/apache/http/client/methods/HttpUriRequest;
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-direct {p0, v0, v4}, Lcom/amazon/insights/core/http/DefaultHttpClient;->executeHttpRequest(Lorg/apache/http/client/methods/HttpUriRequest;I)Lcom/amazon/insights/core/http/HttpClient$Response;

    move-result-object v3

    .line 336
    if-eqz v3, :cond_2

    .line 337
    invoke-interface {v3, p1}, Lcom/amazon/insights/core/http/HttpClient$Response;->setOriginatingRequest(Lcom/amazon/insights/core/http/HttpClient$Request;)Lcom/amazon/insights/core/http/HttpClient$Response;

    .line 339
    :cond_2
    iget-object v4, p0, Lcom/amazon/insights/core/http/DefaultHttpClient;->interceptors:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/insights/core/http/HttpClient$Interceptor;

    .line 340
    .restart local v1    # "i":Lcom/amazon/insights/core/http/HttpClient$Interceptor;
    invoke-interface {v1, v3}, Lcom/amazon/insights/core/http/HttpClient$Interceptor;->after(Lcom/amazon/insights/core/http/HttpClient$Response;)V

    goto :goto_1

    .line 342
    .end local v1    # "i":Lcom/amazon/insights/core/http/HttpClient$Interceptor;
    :cond_3
    return-object v3
.end method

.method public newRequest()Lcom/amazon/insights/core/http/HttpClient$Request;
    .locals 1

    .prologue
    .line 297
    new-instance v0, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultRequest;

    invoke-direct {v0}, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultRequest;-><init>()V

    return-object v0
.end method
