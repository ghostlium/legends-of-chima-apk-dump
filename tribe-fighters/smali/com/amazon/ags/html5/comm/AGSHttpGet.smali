.class public Lcom/amazon/ags/html5/comm/AGSHttpGet;
.super Lcom/amazon/ags/html5/comm/ServiceRequestBase;
.source "AGSHttpGet.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0
    .param p1, "endpoint"    # Ljava/lang/String;
    .param p2, "authenticationRequired"    # Z

    .prologue
    .line 20
    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/html5/comm/ServiceRequestBase;-><init>(Ljava/lang/String;Z)V

    .line 21
    return-void
.end method


# virtual methods
.method final prepareHttpRequestBase()Lorg/apache/http/client/methods/HttpRequestBase;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 25
    new-instance v0, Lorg/apache/http/client/methods/HttpGet;

    invoke-virtual {p0}, Lcom/amazon/ags/html5/comm/AGSHttpGet;->constructUri()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
