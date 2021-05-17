.class public Lcom/amazon/ags/html5/comm/ServiceResponse;
.super Ljava/lang/Object;
.source "ServiceResponse.java"


# static fields
.field private static final DEFAULT_CHARSET:Ljava/lang/String; = "UTF-8"

.field private static final HTTP_HEADER_CHARSET_KEY:Ljava/lang/String; = "charset"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private content:Ljava/lang/String;

.field private final response:Lorg/apache/http/HttpResponse;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/html5/comm/ServiceResponse;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/html5/comm/ServiceResponse;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorg/apache/http/HttpResponse;)V
    .locals 1
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/ags/html5/comm/ServiceResponse;->content:Ljava/lang/String;

    .line 31
    iput-object p1, p0, Lcom/amazon/ags/html5/comm/ServiceResponse;->response:Lorg/apache/http/HttpResponse;

    .line 32
    return-void
.end method

.method private getCharSetFromEntity(Lorg/apache/http/HttpEntity;)Ljava/lang/String;
    .locals 5
    .param p1, "entity"    # Lorg/apache/http/HttpEntity;

    .prologue
    .line 94
    if-nez p1, :cond_0

    .line 95
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "HttpEntity must not be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 98
    :cond_0
    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->getContentType()Lorg/apache/http/Header;

    move-result-object v1

    .line 99
    .local v1, "header":Lorg/apache/http/Header;
    if-nez v1, :cond_1

    .line 100
    const-string v3, "UTF-8"

    .line 112
    :goto_0
    return-object v3

    .line 103
    :cond_1
    invoke-interface {v1}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v2

    .line 104
    .local v2, "values":[Lorg/apache/http/HeaderElement;
    if-eqz v2, :cond_2

    array-length v3, v2

    if-nez v3, :cond_3

    .line 105
    :cond_2
    const-string v3, "UTF-8"

    goto :goto_0

    .line 108
    :cond_3
    const/4 v3, 0x0

    aget-object v3, v2, v3

    const-string v4, "charset"

    invoke-interface {v3, v4}, Lorg/apache/http/HeaderElement;->getParameterByName(Ljava/lang/String;)Lorg/apache/http/NameValuePair;

    move-result-object v0

    .line 109
    .local v0, "charsetParam":Lorg/apache/http/NameValuePair;
    if-nez v0, :cond_4

    .line 110
    const-string v3, "UTF-8"

    goto :goto_0

    .line 112
    :cond_4
    invoke-interface {v0}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method


# virtual methods
.method public getContent()Ljava/lang/String;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 46
    iget-object v8, p0, Lcom/amazon/ags/html5/comm/ServiceResponse;->content:Ljava/lang/String;

    if-eqz v8, :cond_0

    .line 47
    iget-object v8, p0, Lcom/amazon/ags/html5/comm/ServiceResponse;->content:Ljava/lang/String;

    .line 81
    :goto_0
    return-object v8

    .line 49
    :cond_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .local v7, "sb":Ljava/lang/StringBuilder;
    const/4 v5, 0x0

    .line 51
    .local v5, "reader":Ljava/io/BufferedReader;
    const/4 v1, 0x0

    .line 52
    .local v1, "inStrReader":Ljava/io/InputStreamReader;
    iget-object v8, p0, Lcom/amazon/ags/html5/comm/ServiceResponse;->response:Lorg/apache/http/HttpResponse;

    invoke-interface {v8}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 53
    .local v0, "entity":Lorg/apache/http/HttpEntity;
    if-nez v0, :cond_1

    .line 54
    sget-object v8, Lcom/amazon/ags/html5/comm/ServiceResponse;->TAG:Ljava/lang/String;

    const-string v9, "Http entity is null"

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    const/4 v8, 0x0

    goto :goto_0

    .line 57
    :cond_1
    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v3

    .line 61
    .local v3, "inStream":Ljava/io/InputStream;
    :try_start_0
    new-instance v2, Ljava/io/InputStreamReader;

    invoke-direct {p0, v0}, Lcom/amazon/ags/html5/comm/ServiceResponse;->getCharSetFromEntity(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v2, v3, v8}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 62
    .end local v1    # "inStrReader":Ljava/io/InputStreamReader;
    .local v2, "inStrReader":Ljava/io/InputStreamReader;
    :try_start_1
    new-instance v6, Ljava/io/BufferedReader;

    invoke-direct {v6, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 66
    .end local v5    # "reader":Ljava/io/BufferedReader;
    .local v6, "reader":Ljava/io/BufferedReader;
    :goto_1
    :try_start_2
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .local v4, "line":Ljava/lang/String;
    if-eqz v4, :cond_4

    .line 67
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 70
    .end local v4    # "line":Ljava/lang/String;
    :catchall_0
    move-exception v8

    move-object v1, v2

    .end local v2    # "inStrReader":Ljava/io/InputStreamReader;
    .restart local v1    # "inStrReader":Ljava/io/InputStreamReader;
    move-object v5, v6

    .end local v6    # "reader":Ljava/io/BufferedReader;
    .restart local v5    # "reader":Ljava/io/BufferedReader;
    :goto_2
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 72
    if-eqz v1, :cond_2

    .line 73
    invoke-virtual {v1}, Ljava/io/InputStreamReader;->close()V

    .line 76
    :cond_2
    if-eqz v5, :cond_3

    .line 77
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V

    :cond_3
    throw v8

    .line 70
    .end local v1    # "inStrReader":Ljava/io/InputStreamReader;
    .end local v5    # "reader":Ljava/io/BufferedReader;
    .restart local v2    # "inStrReader":Ljava/io/InputStreamReader;
    .restart local v4    # "line":Ljava/lang/String;
    .restart local v6    # "reader":Ljava/io/BufferedReader;
    :cond_4
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 72
    if-eqz v2, :cond_5

    .line 73
    invoke-virtual {v2}, Ljava/io/InputStreamReader;->close()V

    .line 76
    :cond_5
    if-eqz v6, :cond_6

    .line 77
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V

    .line 80
    :cond_6
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/amazon/ags/html5/comm/ServiceResponse;->content:Ljava/lang/String;

    .line 81
    iget-object v8, p0, Lcom/amazon/ags/html5/comm/ServiceResponse;->content:Ljava/lang/String;

    goto :goto_0

    .line 70
    .end local v2    # "inStrReader":Ljava/io/InputStreamReader;
    .end local v4    # "line":Ljava/lang/String;
    .end local v6    # "reader":Ljava/io/BufferedReader;
    .restart local v1    # "inStrReader":Ljava/io/InputStreamReader;
    .restart local v5    # "reader":Ljava/io/BufferedReader;
    :catchall_1
    move-exception v8

    goto :goto_2

    .end local v1    # "inStrReader":Ljava/io/InputStreamReader;
    .restart local v2    # "inStrReader":Ljava/io/InputStreamReader;
    :catchall_2
    move-exception v8

    move-object v1, v2

    .end local v2    # "inStrReader":Ljava/io/InputStreamReader;
    .restart local v1    # "inStrReader":Ljava/io/InputStreamReader;
    goto :goto_2
.end method

.method public getHeader(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 85
    iget-object v1, p0, Lcom/amazon/ags/html5/comm/ServiceResponse;->response:Lorg/apache/http/HttpResponse;

    invoke-interface {v1, p1}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    .line 86
    .local v0, "header":Lorg/apache/http/Header;
    if-eqz v0, :cond_0

    .line 87
    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 89
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getResponse()Lorg/apache/http/HttpResponse;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/amazon/ags/html5/comm/ServiceResponse;->response:Lorg/apache/http/HttpResponse;

    return-object v0
.end method

.method public getStatusCode()I
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/amazon/ags/html5/comm/ServiceResponse;->response:Lorg/apache/http/HttpResponse;

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    return v0
.end method
