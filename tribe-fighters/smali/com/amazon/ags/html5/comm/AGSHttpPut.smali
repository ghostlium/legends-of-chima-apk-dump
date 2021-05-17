.class public Lcom/amazon/ags/html5/comm/AGSHttpPut;
.super Lcom/amazon/ags/html5/comm/ServiceRequestBase;
.source "AGSHttpPut.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0
    .param p1, "endpoint"    # Ljava/lang/String;
    .param p2, "authenticationRequired"    # Z

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/html5/comm/ServiceRequestBase;-><init>(Ljava/lang/String;Z)V

    .line 23
    return-void
.end method


# virtual methods
.method final prepareHttpRequestBase()Lorg/apache/http/client/methods/HttpRequestBase;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 27
    new-instance v0, Lorg/apache/http/client/methods/HttpPut;

    invoke-virtual {p0}, Lcom/amazon/ags/html5/comm/AGSHttpPut;->constructUri()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpPut;-><init>(Ljava/lang/String;)V

    .line 28
    .local v0, "httpPut":Lorg/apache/http/client/methods/HttpPut;
    iget-object v1, p0, Lcom/amazon/ags/html5/comm/AGSHttpPut;->requestBody:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 29
    new-instance v1, Lorg/apache/http/entity/StringEntity;

    iget-object v2, p0, Lcom/amazon/ags/html5/comm/AGSHttpPut;->requestBody:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v1, v2, v3}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/apache/http/client/methods/HttpPut;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 31
    :cond_0
    return-object v0
.end method
