.class Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$1;
.super Ljava/lang/Object;
.source "AbstractTokenRequest.java"

# interfaces
.implements Lorg/apache/http/HttpResponseInterceptor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->getDefaultHttpResponseInterceptor()Lorg/apache/http/HttpResponseInterceptor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;


# direct methods
.method constructor <init>(Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;)V
    .locals 0

    .prologue
    .line 630
    iput-object p1, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$1;->this$0:Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public process(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)V
    .locals 6
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 635
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v2

    .line 636
    .local v2, "entity":Lorg/apache/http/HttpEntity;
    invoke-interface {v2}, Lorg/apache/http/HttpEntity;->getContentEncoding()Lorg/apache/http/Header;

    move-result-object v0

    .line 637
    .local v0, "ceheader":Lorg/apache/http/Header;
    if-eqz v0, :cond_0

    .line 638
    invoke-interface {v0}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v1

    .line 639
    .local v1, "codecs":[Lorg/apache/http/HeaderElement;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v1

    if-ge v3, v4, :cond_0

    .line 640
    aget-object v4, v1, v3

    invoke-interface {v4}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "gzip"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 641
    new-instance v4, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$GzipDecompressingEntity;

    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$GzipDecompressingEntity;-><init>(Lorg/apache/http/HttpEntity;)V

    invoke-interface {p1, v4}, Lorg/apache/http/HttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 647
    .end local v1    # "codecs":[Lorg/apache/http/HeaderElement;
    .end local v3    # "i":I
    :cond_0
    return-void

    .line 639
    .restart local v1    # "codecs":[Lorg/apache/http/HeaderElement;
    .restart local v3    # "i":I
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method
