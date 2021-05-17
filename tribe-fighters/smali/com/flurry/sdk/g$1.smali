.class Lcom/flurry/sdk/g$1;
.super Lcom/flurry/sdk/fi;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flurry/sdk/g;->a(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lcom/flurry/sdk/g;


# direct methods
.method constructor <init>(Lcom/flurry/sdk/g;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 961
    iput-object p1, p0, Lcom/flurry/sdk/g$1;->b:Lcom/flurry/sdk/g;

    iput-object p2, p0, Lcom/flurry/sdk/g$1;->a:Ljava/lang/String;

    invoke-direct {p0}, Lcom/flurry/sdk/fi;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 10

    .prologue
    .line 964
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->I()Z

    move-result v0

    if-nez v0, :cond_2

    .line 967
    iget-object v0, p0, Lcom/flurry/sdk/g$1;->b:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->m(Lcom/flurry/sdk/g;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/g$1;->b:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->m(Lcom/flurry/sdk/g;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 969
    iget-object v0, p0, Lcom/flurry/sdk/g$1;->b:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->m(Lcom/flurry/sdk/g;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 972
    :cond_0
    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v0

    new-instance v1, Lcom/flurry/sdk/g$1$1;

    invoke-direct {v1, p0}, Lcom/flurry/sdk/g$1$1;-><init>(Lcom/flurry/sdk/g$1;)V

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/eg;->a(Ljava/lang/Runnable;)V

    .line 1042
    :cond_1
    :goto_0
    return-void

    .line 984
    :cond_2
    const/4 v0, 0x0

    .line 986
    :try_start_0
    new-instance v1, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v1}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    invoke-static {v1}, Lcom/flurry/sdk/ew;->a(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/client/HttpClient;
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v7

    .line 987
    :try_start_1
    new-instance v0, Lorg/apache/http/client/methods/HttpGet;

    iget-object v1, p0, Lcom/flurry/sdk/g$1;->a:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 988
    invoke-interface {v7, v0}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    .line 989
    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    .line 991
    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 992
    const-string v2, "UTF-8"

    invoke-static {v0, v2}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 994
    const/16 v0, 0xc8

    if-ne v1, v0, :cond_3

    .line 996
    iget-object v0, p0, Lcom/flurry/sdk/g$1;->a:Ljava/lang/String;

    invoke-static {v0}, Lcom/flurry/sdk/bv;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 998
    iget-object v0, p0, Lcom/flurry/sdk/g$1;->b:Lcom/flurry/sdk/g;

    const-string v1, "rendered"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    iget-object v3, p0, Lcom/flurry/sdk/g$1;->b:Lcom/flurry/sdk/g;

    invoke-virtual {v3}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v3

    iget-object v4, p0, Lcom/flurry/sdk/g$1;->b:Lcom/flurry/sdk/g;

    invoke-virtual {v4}, Lcom/flurry/sdk/g;->getAdLog()Lcom/flurry/sdk/e;

    move-result-object v4

    iget-object v5, p0, Lcom/flurry/sdk/g$1;->b:Lcom/flurry/sdk/g;

    invoke-virtual {v5}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v5

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V

    .line 999
    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v0

    new-instance v1, Lcom/flurry/sdk/g$1$2;

    invoke-direct {v1, p0, v9, v8}, Lcom/flurry/sdk/g$1$2;-><init>(Lcom/flurry/sdk/g$1;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/eg;->a(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1022
    if-eqz v7, :cond_1

    .line 1023
    invoke-interface {v7}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    goto :goto_0

    .line 1013
    :cond_3
    const/4 v0, 0x4

    :try_start_2
    iget-object v2, p0, Lcom/flurry/sdk/g$1;->b:Lcom/flurry/sdk/g;

    invoke-static {v2}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "http status code is:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v2, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1022
    if-eqz v7, :cond_4

    .line 1023
    invoke-interface {v7}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 1028
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/flurry/sdk/g$1;->b:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->m(Lcom/flurry/sdk/g;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/flurry/sdk/g$1;->b:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->m(Lcom/flurry/sdk/g;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1030
    iget-object v0, p0, Lcom/flurry/sdk/g$1;->b:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->m(Lcom/flurry/sdk/g;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 1033
    :cond_5
    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v0

    new-instance v1, Lcom/flurry/sdk/g$1$3;

    invoke-direct {v1, p0}, Lcom/flurry/sdk/g$1$3;-><init>(Lcom/flurry/sdk/g$1;)V

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/eg;->a(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 1016
    :catch_0
    move-exception v1

    .line 1017
    :goto_2
    const/4 v1, 0x4

    :try_start_3
    iget-object v2, p0, Lcom/flurry/sdk/g$1;->b:Lcom/flurry/sdk/g;

    invoke-static {v2}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "client protocol exception..."

    invoke-static {v1, v2, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 1022
    if-eqz v0, :cond_4

    .line 1023
    invoke-interface {v0}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    goto :goto_1

    .line 1018
    :catch_1
    move-exception v1

    move-object v7, v0

    .line 1019
    :goto_3
    const/4 v0, 0x4

    :try_start_4
    iget-object v1, p0, Lcom/flurry/sdk/g$1;->b:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "ioexception...."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 1022
    if-eqz v7, :cond_4

    .line 1023
    invoke-interface {v7}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    goto :goto_1

    .line 1022
    :catchall_0
    move-exception v1

    move-object v7, v0

    move-object v0, v1

    :goto_4
    if-eqz v7, :cond_6

    .line 1023
    invoke-interface {v7}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    :cond_6
    throw v0

    .line 1022
    :catchall_1
    move-exception v0

    goto :goto_4

    :catchall_2
    move-exception v1

    move-object v7, v0

    move-object v0, v1

    goto :goto_4

    .line 1018
    :catch_2
    move-exception v0

    goto :goto_3

    .line 1016
    :catch_3
    move-exception v0

    move-object v0, v7

    goto :goto_2
.end method
