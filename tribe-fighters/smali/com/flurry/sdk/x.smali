.class public Lcom/flurry/sdk/x;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const-class v0, Lcom/flurry/sdk/x;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/x;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private a(Ljava/io/InputStream;)[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 112
    const/16 v1, 0x80

    new-array v1, v1, [B

    .line 114
    :goto_0
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    .line 115
    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 117
    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    return-object v0
.end method

.method private a([BLjava/lang/String;)[B
    .locals 9

    .prologue
    const/4 v0, 0x0

    const/4 v5, 0x4

    .line 59
    invoke-static {}, Lcom/flurry/sdk/fe;->a()Lcom/flurry/sdk/fe;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/sdk/fe;->c()Z

    move-result v1

    if-nez v1, :cond_1

    .line 60
    const/4 v1, 0x5

    sget-object v2, Lcom/flurry/sdk/x;->a:Ljava/lang/String;

    const-string v3, "There is no network connectivity (request will fail)"

    invoke-static {v1, v2, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 107
    :cond_0
    :goto_0
    return-object v0

    .line 64
    :cond_1
    new-instance v2, Lorg/apache/http/entity/ByteArrayEntity;

    invoke-direct {v2, p1}, Lorg/apache/http/entity/ByteArrayEntity;-><init>([B)V

    .line 65
    const-string v1, "avro/binary"

    invoke-virtual {v2, v1}, Lorg/apache/http/entity/ByteArrayEntity;->setContentType(Ljava/lang/String;)V

    .line 66
    sget-object v1, Lcom/flurry/sdk/x;->a:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "httpPOSTAvroBytesToUrl: reportUrl = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v1, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 67
    new-instance v1, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v1, p2}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 68
    invoke-virtual {v1, v2}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 69
    const-string v3, "accept"

    const-string v4, "avro/binary"

    invoke-virtual {v1, v3, v4}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    const-string v3, "FM-Checksum"

    invoke-virtual {p0, p1}, Lcom/flurry/sdk/x;->a([B)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    new-instance v3, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v3}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 73
    const/16 v4, 0x2710

    invoke-static {v3, v4}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 74
    const/16 v4, 0x3a98

    invoke-static {v3, v4}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 75
    invoke-virtual {v1}, Lorg/apache/http/client/methods/HttpPost;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v4

    const-string v5, "http.protocol.expect-continue"

    const/4 v6, 0x0

    invoke-interface {v4, v5, v6}, Lorg/apache/http/params/HttpParams;->setBooleanParameter(Ljava/lang/String;Z)Lorg/apache/http/params/HttpParams;

    .line 77
    invoke-static {v3}, Lcom/flurry/sdk/ew;->a(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/client/HttpClient;

    move-result-object v3

    .line 79
    :try_start_0
    invoke-interface {v3, v1}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    .line 80
    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    .line 81
    const/16 v5, 0xc8

    if-ne v1, v5, :cond_5

    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v5

    if-eqz v5, :cond_5

    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    if-eqz v5, :cond_5

    .line 83
    const/4 v1, 0x4

    sget-object v5, Lcom/flurry/sdk/x;->a:Ljava/lang/String;

    const-string v6, "Request successful"

    invoke-static {v1, v5, v6}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 84
    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/flurry/sdk/x;->a(Ljava/io/InputStream;)[B

    move-result-object v1

    .line 86
    invoke-virtual {v2}, Lorg/apache/http/entity/ByteArrayEntity;->consumeContent()V

    .line 87
    invoke-virtual {p0, v1}, Lcom/flurry/sdk/x;->a([B)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    .line 88
    const-string v5, "FM-Checksum"

    invoke-interface {v4, v5}, Lorg/apache/http/HttpResponse;->containsHeader(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    const-string v5, "FM-Checksum"

    invoke-interface {v4, v5}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-eqz v2, :cond_4

    .line 103
    :cond_2
    if-eqz v3, :cond_3

    .line 104
    invoke-interface {v3}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    :cond_3
    move-object v0, v1

    goto/16 :goto_0

    .line 92
    :cond_4
    const/4 v1, 0x6

    :try_start_1
    sget-object v2, Lcom/flurry/sdk/x;->a:Ljava/lang/String;

    const-string v4, "Response was received, but checksum failed."

    invoke-static {v1, v2, v4}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 103
    :goto_1
    if-eqz v3, :cond_0

    .line 104
    invoke-interface {v3}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    goto/16 :goto_0

    .line 95
    :cond_5
    const/4 v2, 0x6

    :try_start_2
    sget-object v4, Lcom/flurry/sdk/x;->a:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Request to url = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " failed with HTTP = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v4, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 98
    :catch_0
    move-exception v1

    .line 99
    const/4 v2, 0x6

    :try_start_3
    sget-object v4, Lcom/flurry/sdk/x;->a:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Request to url = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " failed with IOException = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v4, v5, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 103
    if-eqz v3, :cond_0

    .line 104
    invoke-interface {v3}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    goto/16 :goto_0

    .line 103
    :catchall_0
    move-exception v0

    if-eqz v3, :cond_6

    .line 104
    invoke-interface {v3}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    :cond_6
    throw v0
.end method


# virtual methods
.method a([B)I
    .locals 1

    .prologue
    .line 121
    new-instance v0, Lcom/flurry/sdk/er;

    invoke-direct {v0}, Lcom/flurry/sdk/er;-><init>()V

    .line 122
    invoke-virtual {v0, p1}, Lcom/flurry/sdk/er;->update([B)V

    .line 123
    invoke-virtual {v0}, Lcom/flurry/sdk/er;->b()I

    move-result v0

    return v0
.end method

.method public a(Lcom/flurry/sdk/gv;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;)Lcom/flurry/sdk/gv;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A:",
            "Lcom/flurry/sdk/gv;",
            "B:",
            "Lcom/flurry/sdk/gv;",
            ">(TA;",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TA;>;",
            "Ljava/lang/Class",
            "<TB;>;)TB;"
        }
    .end annotation

    .prologue
    .line 39
    invoke-static {p1, p3}, Lcom/flurry/sdk/w;->a(Lcom/flurry/sdk/gv;Ljava/lang/Class;)[B

    move-result-object v0

    invoke-virtual {p0, v0, p2, p4}, Lcom/flurry/sdk/x;->a([BLjava/lang/String;Ljava/lang/Class;)Lcom/flurry/sdk/gv;

    move-result-object v0

    return-object v0
.end method

.method public a([BLjava/lang/String;Ljava/lang/Class;)Lcom/flurry/sdk/gv;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<B:",
            "Lcom/flurry/sdk/gv;",
            ">([B",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TB;>;)TB;"
        }
    .end annotation

    .prologue
    .line 43
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 44
    :cond_0
    const/4 v0, 0x6

    sget-object v1, Lcom/flurry/sdk/x;->a:Ljava/lang/String;

    const-string v2, "Response in bytes is null"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 45
    const/4 v0, 0x0

    .line 49
    :goto_0
    return-object v0

    .line 48
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/flurry/sdk/x;->a([BLjava/lang/String;)[B

    move-result-object v0

    .line 49
    invoke-static {v0, p3}, Lcom/flurry/sdk/w;->a([BLjava/lang/Class;)Lcom/flurry/sdk/gv;

    move-result-object v0

    goto :goto_0
.end method
