.class Lcom/flurry/sdk/u$c;
.super Lcom/flurry/sdk/fj;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/u;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "c"
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/u;

.field private final b:Ljava/lang/String;

.field private final c:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

.field private final d:Ljava/lang/String;

.field private e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/u;Ljava/lang/String;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 782
    iput-object p1, p0, Lcom/flurry/sdk/u$c;->a:Lcom/flurry/sdk/u;

    invoke-direct {p0}, Lcom/flurry/sdk/fj;-><init>()V

    .line 783
    iput-object p2, p0, Lcom/flurry/sdk/u$c;->b:Ljava/lang/String;

    .line 784
    iput-object p3, p0, Lcom/flurry/sdk/u$c;->c:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    .line 785
    iput-object p4, p0, Lcom/flurry/sdk/u$c;->d:Ljava/lang/String;

    .line 786
    return-void
.end method

.method private e()V
    .locals 2

    .prologue
    .line 839
    iget-object v0, p0, Lcom/flurry/sdk/u$c;->a:Lcom/flurry/sdk/u;

    iget-object v1, p0, Lcom/flurry/sdk/u$c;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flurry/sdk/u;->c(Lcom/flurry/sdk/u;Ljava/lang/String;)V

    .line 840
    iget-object v0, p0, Lcom/flurry/sdk/u$c;->a:Lcom/flurry/sdk/u;

    iget-object v1, p0, Lcom/flurry/sdk/u$c;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flurry/sdk/u;->d(Lcom/flurry/sdk/u;Ljava/lang/String;)V

    .line 841
    return-void
.end method

.method private f()V
    .locals 3

    .prologue
    .line 844
    iget-object v0, p0, Lcom/flurry/sdk/u$c;->a:Lcom/flurry/sdk/u;

    iget-object v1, p0, Lcom/flurry/sdk/u$c;->b:Ljava/lang/String;

    iget-object v2, p0, Lcom/flurry/sdk/u$c;->c:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/u;->a(Lcom/flurry/sdk/u;Ljava/lang/String;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    .line 845
    iget-object v0, p0, Lcom/flurry/sdk/u$c;->a:Lcom/flurry/sdk/u;

    iget-object v1, p0, Lcom/flurry/sdk/u$c;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flurry/sdk/u;->e(Lcom/flurry/sdk/u;Ljava/lang/String;)V

    .line 846
    return-void
.end method


# virtual methods
.method public a()V
    .locals 8

    .prologue
    .line 790
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->I()Z

    move-result v0

    if-nez v0, :cond_0

    .line 820
    :goto_0
    return-void

    .line 794
    :cond_0
    const/4 v0, 0x0

    .line 796
    :try_start_0
    new-instance v1, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v1}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    invoke-static {v1}, Lcom/flurry/sdk/ew;->a(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/client/HttpClient;
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 797
    :try_start_1
    new-instance v1, Lorg/apache/http/client/methods/HttpGet;

    iget-object v2, p0, Lcom/flurry/sdk/u$c;->d:Ljava/lang/String;

    invoke-direct {v1, v2}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 798
    invoke-interface {v0, v1}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    .line 800
    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v2

    .line 802
    const/4 v3, 0x4

    invoke-static {}, Lcom/flurry/sdk/u;->c()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Pre-render: http status code is:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 803
    const/16 v3, 0xc8

    if-ne v2, v3, :cond_1

    .line 804
    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    const-string v2, "UTF-8"

    invoke-static {v1, v2}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/flurry/sdk/u$c;->e:Ljava/lang/String;
    :try_end_1
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 812
    :cond_1
    if-eqz v0, :cond_2

    .line 813
    invoke-interface {v0}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 818
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/flurry/sdk/u$c;->a:Lcom/flurry/sdk/u;

    iget-object v1, p0, Lcom/flurry/sdk/u$c;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flurry/sdk/u;->a(Lcom/flurry/sdk/u;Ljava/lang/String;)Lcom/flurry/sdk/u$a;

    move-result-object v0

    .line 819
    iget-object v1, p0, Lcom/flurry/sdk/u$c;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/u$a;->a(Ljava/lang/String;)V

    goto :goto_0

    .line 806
    :catch_0
    move-exception v1

    .line 807
    const/4 v1, 0x4

    :try_start_2
    invoke-static {}, Lcom/flurry/sdk/u;->c()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Error pre-rendering ad: client protocol exception"

    invoke-static {v1, v2, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 812
    if-eqz v0, :cond_2

    .line 813
    invoke-interface {v0}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    goto :goto_1

    .line 808
    :catch_1
    move-exception v1

    .line 809
    const/4 v1, 0x4

    :try_start_3
    invoke-static {}, Lcom/flurry/sdk/u;->c()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Error pre-rendering ad: ioexception"

    invoke-static {v1, v2, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 812
    if-eqz v0, :cond_2

    .line 813
    invoke-interface {v0}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    goto :goto_1

    .line 812
    :catchall_0
    move-exception v1

    move-object v7, v1

    move-object v1, v0

    move-object v0, v7

    :goto_2
    if-eqz v1, :cond_3

    .line 813
    invoke-interface {v1}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    :cond_3
    throw v0

    .line 812
    :catchall_1
    move-exception v1

    move-object v7, v1

    move-object v1, v0

    move-object v0, v7

    goto :goto_2
.end method

.method public b()V
    .locals 1

    .prologue
    .line 823
    iget-object v0, p0, Lcom/flurry/sdk/u$c;->e:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 824
    invoke-direct {p0}, Lcom/flurry/sdk/u$c;->f()V

    .line 828
    :goto_0
    return-void

    .line 826
    :cond_0
    invoke-direct {p0}, Lcom/flurry/sdk/u$c;->e()V

    goto :goto_0
.end method

.method public c()V
    .locals 0

    .prologue
    .line 835
    invoke-direct {p0}, Lcom/flurry/sdk/u$c;->f()V

    .line 836
    return-void
.end method
