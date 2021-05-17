.class public Lcom/amazon/insights/core/http/SignatureInterceptor;
.super Ljava/lang/Object;
.source "SignatureInterceptor.java"

# interfaces
.implements Lcom/amazon/insights/core/http/HttpClient$Interceptor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;
    }
.end annotation


# static fields
.field protected static final AUTH_HEADER_SIGNATURE:Ljava/lang/String; = "x-amzn-Request-Signature"

.field protected static final AUTH_HEADER_SIGNATURE_TIMESTAMP:Ljava/lang/String; = "x-amzn-Request-Signature-Timestamp"

.field private static final TIME_FORMAT:Ljava/lang/String; = "yyyy-MM-dd\'T\'HH:mm:ss"

.field private static logger:Lcom/amazon/insights/core/log/Logger;


# instance fields
.field protected df:Ljava/text/DateFormat;

.field private privateKey:Ljava/lang/String;

.field protected timeZone:Ljava/util/TimeZone;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const-class v0, Lcom/amazon/insights/core/http/SignatureInterceptor;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/core/http/SignatureInterceptor;->logger:Lcom/amazon/insights/core/log/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "privateKey"    # Ljava/lang/String;

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    const-string v0, "A valid privateKey must be provided"

    invoke-static {p1, v0}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    iput-object p1, p0, Lcom/amazon/insights/core/http/SignatureInterceptor;->privateKey:Ljava/lang/String;

    .line 48
    const-string v0, "GMT"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/core/http/SignatureInterceptor;->timeZone:Ljava/util/TimeZone;

    .line 49
    const-string v0, "yyyy-MM-dd\'T\'HH:mm:ss"

    invoke-static {v0}, Lcom/amazon/insights/core/util/DateUtil;->createLocaleIndependentDateFormatter(Ljava/lang/String;)Ljava/text/DateFormat;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/core/http/SignatureInterceptor;->df:Ljava/text/DateFormat;

    .line 50
    iget-object v0, p0, Lcom/amazon/insights/core/http/SignatureInterceptor;->df:Ljava/text/DateFormat;

    iget-object v1, p0, Lcom/amazon/insights/core/http/SignatureInterceptor;->timeZone:Ljava/util/TimeZone;

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 51
    return-void
.end method

.method private getPrivateKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/amazon/insights/core/http/SignatureInterceptor;->privateKey:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public after(Lcom/amazon/insights/core/http/HttpClient$Response;)V
    .locals 0
    .param p1, "response"    # Lcom/amazon/insights/core/http/HttpClient$Response;

    .prologue
    .line 86
    return-void
.end method

.method public before(Lcom/amazon/insights/core/http/HttpClient$Request;)V
    .locals 10
    .param p1, "request"    # Lcom/amazon/insights/core/http/HttpClient$Request;

    .prologue
    .line 64
    :try_start_0
    invoke-virtual {p0}, Lcom/amazon/insights/core/http/SignatureInterceptor;->getTimeStamp()Ljava/lang/String;

    move-result-object v5

    .line 65
    .local v5, "timeStamp":Ljava/lang/String;
    invoke-interface {p1}, Lcom/amazon/insights/core/http/HttpClient$Request;->getHeaders()Ljava/util/Map;

    move-result-object v6

    const-string v7, "Content-Encoding"

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 66
    .local v2, "encoding":Ljava/lang/String;
    const-string v6, "gzip"

    invoke-virtual {v6, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    .line 67
    .local v3, "isBinary":Z
    new-instance v6, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;

    invoke-direct {v6}, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;-><init>()V

    invoke-direct {p0}, Lcom/amazon/insights/core/http/SignatureInterceptor;->getPrivateKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;->withPrivateKey(Ljava/lang/String;)Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;

    move-result-object v6

    invoke-interface {p1}, Lcom/amazon/insights/core/http/HttpClient$Request;->getMethod()Lcom/amazon/insights/core/http/HttpClient$HttpMethod;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;->withHttpMethod(Lcom/amazon/insights/core/http/HttpClient$HttpMethod;)Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;

    move-result-object v6

    invoke-interface {p1}, Lcom/amazon/insights/core/http/HttpClient$Request;->getUrl()Ljava/lang/String;

    move-result-object v7

    invoke-interface {p1}, Lcom/amazon/insights/core/http/HttpClient$Request;->getUrl()Ljava/lang/String;

    move-result-object v8

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;->withFullPath(Ljava/lang/String;)Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;

    move-result-object v7

    invoke-interface {p1}, Lcom/amazon/insights/core/http/HttpClient$Request;->getPostBodyBytes()[B

    move-result-object v6

    if-eqz v6, :cond_0

    invoke-interface {p1}, Lcom/amazon/insights/core/http/HttpClient$Request;->getPostBodyBytes()[B

    move-result-object v6

    :goto_0
    invoke-virtual {v7, v6}, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;->withBody([B)Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;->withTimestamp(Ljava/lang/String;)Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;->isBinaryRequest(Z)Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;

    move-result-object v0

    .line 75
    .local v0, "builder":Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;
    invoke-virtual {v0}, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;->createSignature()Ljava/lang/String;

    move-result-object v4

    .line 76
    .local v4, "signature":Ljava/lang/String;
    const-string v6, "x-amzn-Request-Signature"

    invoke-interface {p1, v6, v4}, Lcom/amazon/insights/core/http/HttpClient$Request;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Request;

    .line 77
    const-string v6, "x-amzn-Request-Signature-Timestamp"

    invoke-interface {p1, v6, v5}, Lcom/amazon/insights/core/http/HttpClient$Request;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Request;

    .line 81
    .end local v0    # "builder":Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;
    .end local v2    # "encoding":Ljava/lang/String;
    .end local v3    # "isBinary":Z
    .end local v4    # "signature":Ljava/lang/String;
    .end local v5    # "timeStamp":Ljava/lang/String;
    :goto_1
    return-void

    .line 67
    .restart local v2    # "encoding":Ljava/lang/String;
    .restart local v3    # "isBinary":Z
    .restart local v5    # "timeStamp":Ljava/lang/String;
    :cond_0
    const/4 v6, 0x0

    new-array v6, v6, [B
    :try_end_0
    .catch Lcom/amazon/insights/core/http/SignatureBuilderException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 78
    .end local v2    # "encoding":Ljava/lang/String;
    .end local v3    # "isBinary":Z
    .end local v5    # "timeStamp":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 79
    .local v1, "e":Lcom/amazon/insights/core/http/SignatureBuilderException;
    sget-object v6, Lcom/amazon/insights/core/http/SignatureInterceptor;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "error signing request: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v1}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method protected declared-synchronized getTimeStamp()Ljava/lang/String;
    .locals 2

    .prologue
    .line 54
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/amazon/insights/core/http/SignatureInterceptor;->df:Ljava/text/DateFormat;

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
