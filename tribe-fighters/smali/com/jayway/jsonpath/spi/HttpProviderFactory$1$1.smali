.class Lcom/jayway/jsonpath/spi/HttpProviderFactory$1$1;
.super Ljava/lang/Object;
.source "HttpProviderFactory.java"

# interfaces
.implements Lcom/jayway/jsonpath/spi/HttpProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jayway/jsonpath/spi/HttpProviderFactory$1;->create()Lcom/jayway/jsonpath/spi/HttpProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jayway/jsonpath/spi/HttpProviderFactory$1;


# direct methods
.method constructor <init>(Lcom/jayway/jsonpath/spi/HttpProviderFactory$1;)V
    .locals 0

    .prologue
    .line 19
    iput-object p1, p0, Lcom/jayway/jsonpath/spi/HttpProviderFactory$1$1;->this$0:Lcom/jayway/jsonpath/spi/HttpProviderFactory$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public get(Ljava/net/URL;)Ljava/io/InputStream;
    .locals 3
    .param p1, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 22
    invoke-virtual {p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    .line 23
    .local v0, "connection":Ljava/net/URLConnection;
    const-string v1, "Accept"

    const-string v2, "application/json"

    invoke-virtual {v0, v1, v2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    return-object v1
.end method
