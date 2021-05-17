.class public Lcom/flurry/sdk/q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/ad;


# static fields
.field private static final d:Ljava/lang/String;

.field private static e:I


# instance fields
.field a:Lcom/flurry/android/impl/ads/FlurryAdModule;

.field b:Lcom/flurry/sdk/z;

.field c:Lcom/flurry/sdk/af;

.field private f:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 43
    const-class v0, Lcom/flurry/sdk/q;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    .line 53
    const/4 v0, 0x0

    sput v0, Lcom/flurry/sdk/q;->e:I

    return-void
.end method

.method public constructor <init>(Lcom/flurry/android/impl/ads/FlurryAdModule;)V
    .locals 1

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/sdk/q;->f:Z

    .line 62
    iput-object p1, p0, Lcom/flurry/sdk/q;->a:Lcom/flurry/android/impl/ads/FlurryAdModule;

    .line 63
    new-instance v0, Lcom/flurry/sdk/af;

    invoke-direct {v0, p1}, Lcom/flurry/sdk/af;-><init>(Lcom/flurry/android/impl/ads/FlurryAdModule;)V

    iput-object v0, p0, Lcom/flurry/sdk/q;->c:Lcom/flurry/sdk/af;

    .line 64
    invoke-static {}, Lcom/flurry/sdk/z;->a()Lcom/flurry/sdk/z;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/q;->b:Lcom/flurry/sdk/z;

    .line 65
    return-void
.end method

.method public static a(Ljava/lang/String;IIZ)Lorg/apache/http/HttpResponse;
    .locals 6

    .prologue
    const/4 v0, 0x0

    .line 678
    .line 680
    :try_start_0
    new-instance v1, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v1, p0}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 681
    new-instance v2, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v2}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 682
    invoke-static {v2, p1}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 683
    invoke-static {v2, p2}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 684
    const-string v3, "http.protocol.handle-redirects"

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 686
    invoke-static {v2}, Lcom/flurry/sdk/ew;->b(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/client/HttpClient;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 687
    :try_start_1
    invoke-interface {v2, v1}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_1
    .catch Ljava/net/UnknownHostException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v0

    .line 696
    if-eqz v2, :cond_0

    .line 697
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    :cond_0
    :goto_0
    return-object v0

    .line 688
    :catch_0
    move-exception v1

    move-object v2, v0

    .line 689
    :goto_1
    :try_start_2
    sget-object v3, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unknown host: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/net/UnknownHostException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/flurry/sdk/ex;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 696
    if-eqz v2, :cond_0

    .line 697
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    goto :goto_0

    .line 691
    :catch_1
    move-exception v1

    move-object v2, v0

    .line 692
    :goto_2
    :try_start_3
    sget-object v3, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to hit URL: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v1}, Lcom/flurry/sdk/ex;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 696
    if-eqz v2, :cond_0

    .line 697
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    goto :goto_0

    .line 696
    :catchall_0
    move-exception v1

    move-object v2, v0

    move-object v0, v1

    :goto_3
    if-eqz v2, :cond_1

    .line 697
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    :cond_1
    throw v0

    .line 696
    :catchall_1
    move-exception v0

    goto :goto_3

    .line 691
    :catch_2
    move-exception v1

    goto :goto_2

    .line 688
    :catch_3
    move-exception v1

    goto :goto_1
.end method

.method static synthetic d()Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    sget-object v0, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/a;)I
    .locals 2

    .prologue
    .line 79
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v0, v0, Lcom/flurry/sdk/p;->c:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    .line 80
    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->b()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 81
    iget-object v1, p0, Lcom/flurry/sdk/q;->a:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b()Lcom/flurry/sdk/u;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/sdk/u;->b()Lcom/flurry/sdk/ak;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/flurry/sdk/ak;->c(Ljava/lang/String;)I

    move-result v0

    .line 83
    return v0
.end method

.method a(Landroid/content/Intent;Ljava/lang/String;)Landroid/content/Intent;
    .locals 3

    .prologue
    .line 463
    .line 464
    invoke-static {p1}, Lcom/flurry/sdk/fh;->b(Landroid/content/Intent;)Z

    move-result v0

    .line 465
    if-eqz v0, :cond_1

    .line 466
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 473
    :goto_0
    if-eqz v0, :cond_0

    .line 474
    const-string v1, "adSpaceName"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 477
    :cond_0
    return-object v0

    .line 468
    :cond_1
    new-instance v0, Landroid/content/Intent;

    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/sdk/eg;->b()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 470
    const-string v1, "targetIntent"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    goto :goto_0
.end method

.method public a(Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/a;Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    .prologue
    .line 532
    const-string v0, ".*?(%\\{\\w+\\}).*?"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v6

    .line 533
    invoke-virtual {v6, p4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    move-object v1, v0

    move-object v4, p4

    .line 535
    :goto_0
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 536
    iget-object v0, p0, Lcom/flurry/sdk/q;->c:Lcom/flurry/sdk/af;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/flurry/sdk/af;->a(Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/a;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 538
    invoke-virtual {v6, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    move-object v1, v0

    goto :goto_0

    .line 541
    :cond_0
    return-object v4
.end method

.method public a()V
    .locals 1

    .prologue
    .line 74
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/q;->e(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/flurry/sdk/q;->f:Z

    .line 75
    return-void
.end method

.method a(Landroid/content/Context;Ljava/lang/String;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V
    .locals 2

    .prologue
    .line 429
    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/eg;->c()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 431
    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/flurry/sdk/fh;->a(Landroid/content/Intent;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 432
    invoke-virtual {p3}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->b()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/flurry/sdk/q;->a(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Z

    .line 437
    :goto_0
    return-void

    .line 434
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "https://play.google.com/store/apps/details?id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1, p3}, Lcom/flurry/sdk/q;->a(Landroid/content/Context;Ljava/lang/String;ZLcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    goto :goto_0
.end method

.method public a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 397
    const-string v0, "market://details?id="

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 398
    iget-boolean v0, p0, Lcom/flurry/sdk/q;->f:Z

    if-eqz v0, :cond_1

    .line 399
    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/q;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 400
    const/4 v0, 0x6

    sget-object v1, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot launch Google Play url "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 410
    :cond_0
    :goto_0
    return-void

    .line 403
    :cond_1
    const-string v0, "market://details?id="

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 404
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "https://market.android.com/details?id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 405
    invoke-virtual {p0, p1, v0, p3}, Lcom/flurry/sdk/q;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_0

    .line 408
    :cond_2
    const/4 v0, 0x5

    sget-object v1, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected Google Play url scheme: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method a(Landroid/content/Context;Ljava/lang/String;ZLcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V
    .locals 7

    .prologue
    .line 483
    if-nez p1, :cond_0

    .line 484
    const/4 v0, 0x5

    sget-object v1, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    const-string v2, "Unable to launch url, null context"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 527
    :goto_0
    return-void

    .line 488
    :cond_0
    iget-object v6, p0, Lcom/flurry/sdk/q;->a:Lcom/flurry/android/impl/ads/FlurryAdModule;

    new-instance v0, Lcom/flurry/sdk/q$1;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p4

    move-object v4, p1

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/q$1;-><init>(Lcom/flurry/sdk/q;Ljava/lang/String;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Landroid/content/Context;Z)V

    invoke-virtual {v6, v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/sdk/fi;)V

    goto :goto_0
.end method

.method a(Lcom/flurry/sdk/a;I)V
    .locals 11

    .prologue
    .line 285
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/q;->a(Lcom/flurry/sdk/a;)I

    move-result v0

    sput v0, Lcom/flurry/sdk/q;->e:I

    .line 287
    sget v0, Lcom/flurry/sdk/q;->e:I

    if-le p2, v0, :cond_0

    .line 288
    const/4 v0, 0x5

    sget-object v1, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    const-string v2, "Maximum depth for event/action loop exceeded when performing next AdUnit:"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 321
    :goto_0
    return-void

    .line 293
    :cond_0
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    invoke-virtual {v0}, Lcom/flurry/sdk/p;->a()Landroid/content/Context;

    move-result-object v1

    .line 294
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v0, v0, Lcom/flurry/sdk/p;->c:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    .line 295
    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->b()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 297
    iget-object v3, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v4, "delay"

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    .line 298
    iget-object v3, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget v3, v3, Lcom/flurry/sdk/p;->e:I

    invoke-virtual {p0, v0, v3}, Lcom/flurry/sdk/q;->a(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;I)Z

    move-result v6

    .line 300
    const-wide/16 v3, 0x1e

    .line 301
    if-eqz v5, :cond_1

    .line 303
    :try_start_0
    iget-object v0, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v7, "delay"

    invoke-interface {v0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v3

    .line 311
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/flurry/sdk/q;->a:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b()Lcom/flurry/sdk/u;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/flurry/sdk/u;->c(Ljava/lang/String;)Lcom/flurry/sdk/k;

    move-result-object v7

    .line 312
    if-eqz v7, :cond_2

    if-eqz v5, :cond_2

    if-eqz v6, :cond_2

    .line 313
    const-wide/16 v0, 0x3e8

    mul-long/2addr v0, v3

    invoke-virtual {v7, v0, v1}, Lcom/flurry/sdk/k;->a(J)V

    goto :goto_0

    .line 304
    :catch_0
    move-exception v0

    .line 305
    const/4 v7, 0x6

    sget-object v8, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "caught NumberFormatException with delay parameter in nextAdUnit:"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v0, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v10, "delay"

    invoke-interface {v0, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v8, v0}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 314
    :cond_2
    if-eqz v7, :cond_4

    .line 315
    iget-object v0, p0, Lcom/flurry/sdk/q;->a:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b()Lcom/flurry/sdk/u;

    move-result-object v0

    invoke-virtual {v7}, Lcom/flurry/sdk/k;->getViewGroup()Landroid/view/ViewGroup;

    move-result-object v3

    if-eqz v6, :cond_3

    sget-object v4, Lcom/flurry/android/FlurryAdSize;->BANNER_BOTTOM:Lcom/flurry/android/FlurryAdSize;

    :goto_2
    const/4 v5, 0x1

    invoke-virtual/range {v0 .. v5}, Lcom/flurry/sdk/u;->a(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/flurry/android/FlurryAdSize;Z)V

    goto/16 :goto_0

    :cond_3
    sget-object v4, Lcom/flurry/android/FlurryAdSize;->FULLSCREEN:Lcom/flurry/android/FlurryAdSize;

    goto :goto_2

    .line 318
    :cond_4
    iget-object v0, p0, Lcom/flurry/sdk/q;->a:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b()Lcom/flurry/sdk/u;

    move-result-object v0

    const/4 v3, 0x0

    if-eqz v6, :cond_5

    sget-object v4, Lcom/flurry/android/FlurryAdSize;->BANNER_BOTTOM:Lcom/flurry/android/FlurryAdSize;

    :goto_3
    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/flurry/sdk/u;->a(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/flurry/android/FlurryAdSize;Z)V

    goto/16 :goto_0

    :cond_5
    sget-object v4, Lcom/flurry/android/FlurryAdSize;->FULLSCREEN:Lcom/flurry/android/FlurryAdSize;

    goto :goto_3
.end method

.method public a(Lcom/flurry/sdk/a;Lcom/flurry/sdk/ae;I)V
    .locals 6

    .prologue
    const/4 v5, 0x5

    .line 88
    const/4 v0, 0x0

    .line 89
    iget-object v1, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    if-eqz v1, :cond_0

    .line 90
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v0, v0, Lcom/flurry/sdk/p;->a:Ljava/lang/String;

    .line 93
    :cond_0
    const/4 v1, 0x3

    sget-object v2, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "performAction:action="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p1, Lcom/flurry/sdk/a;->a:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ",params="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ",triggering event="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 96
    iget-object v1, p1, Lcom/flurry/sdk/a;->a:Ljava/lang/String;

    .line 98
    const/16 v2, 0xa

    if-le p3, v2, :cond_1

    .line 99
    sget-object v2, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Maximum depth for event/action loop exceeded when performing action:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ","

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ",triggered by:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v2, v0}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 137
    :goto_0
    return-void

    .line 106
    :cond_1
    const-string v2, "directOpen"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 108
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/q;->b(Lcom/flurry/sdk/a;)V

    goto :goto_0

    .line 109
    :cond_2
    const-string v2, "delete"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 110
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/q;->c(Lcom/flurry/sdk/a;)V

    goto :goto_0

    .line 111
    :cond_3
    const-string v2, "processRedirect"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 112
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/q;->d(Lcom/flurry/sdk/a;)V

    goto :goto_0

    .line 113
    :cond_4
    const-string v2, "verifyUrl"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 114
    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/q;->b(Lcom/flurry/sdk/a;Lcom/flurry/sdk/ae;I)V

    goto :goto_0

    .line 115
    :cond_5
    const-string v2, "launchPackage"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 116
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/q;->e(Lcom/flurry/sdk/a;)V

    goto :goto_0

    .line 117
    :cond_6
    const-string v2, "sendUrlAsync"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 118
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/q;->f(Lcom/flurry/sdk/a;)V

    goto :goto_0

    .line 119
    :cond_7
    const-string v2, "sendAdLogs"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 120
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/q;->g(Lcom/flurry/sdk/a;)V

    goto :goto_0

    .line 121
    :cond_8
    const-string v2, "logEvent"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 122
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/q;->h(Lcom/flurry/sdk/a;)V

    goto :goto_0

    .line 123
    :cond_9
    const-string v2, "nextFrame"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 124
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/q;->i(Lcom/flurry/sdk/a;)V

    goto :goto_0

    .line 125
    :cond_a
    const-string v2, "nextAdUnit"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 126
    invoke-virtual {p0, p1, p3}, Lcom/flurry/sdk/q;->a(Lcom/flurry/sdk/a;I)V

    goto :goto_0

    .line 127
    :cond_b
    const-string v2, "checkCap"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 128
    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/q;->c(Lcom/flurry/sdk/a;Lcom/flurry/sdk/ae;I)V

    goto/16 :goto_0

    .line 129
    :cond_c
    const-string v2, "updateViewCount"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 130
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/q;->j(Lcom/flurry/sdk/a;)V

    goto/16 :goto_0

    .line 134
    :cond_d
    sget-object v2, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown action:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ",triggered by:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v2, v0}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public a(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Z
    .locals 5

    .prologue
    const/4 v0, 0x0

    .line 440
    if-nez p1, :cond_1

    .line 441
    const/4 v1, 0x5

    sget-object v2, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    const-string v3, "Cannot launch activity, null context"

    invoke-static {v1, v2, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 459
    :cond_0
    :goto_0
    return v0

    .line 447
    :cond_1
    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    invoke-static {p2}, Lcom/flurry/sdk/fh;->a(Landroid/content/Intent;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 450
    invoke-virtual {p0, p2, p3}, Lcom/flurry/sdk/q;->a(Landroid/content/Intent;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 452
    :try_start_0
    invoke-virtual {p1, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 453
    const/4 v0, 0x1

    goto :goto_0

    .line 454
    :catch_0
    move-exception v1

    .line 455
    const/4 v2, 0x6

    sget-object v3, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    const-string v4, "Cannot launch Activity"

    invoke-static {v2, v3, v4, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method a(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;I)Z
    .locals 2

    .prologue
    .line 707
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->d()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 708
    invoke-virtual {p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->d()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->e()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;->e()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "banner"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 711
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method a(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 423
    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/eg;->c()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 425
    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/flurry/sdk/fh;->a(Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method a(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    .prologue
    .line 726
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 727
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 728
    invoke-static {v0}, Lcom/flurry/sdk/fh;->a(Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method b(Ljava/lang/String;)Ljava/lang/String;
    .locals 10

    .prologue
    const/4 v3, 0x0

    const/4 v9, 0x3

    .line 567
    const/4 v1, 0x0

    move v2, v3

    move-object v0, p1

    .line 569
    :goto_0
    const/4 v4, 0x5

    if-ge v2, v4, :cond_7

    .line 570
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    const-string v5, "http"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 571
    invoke-virtual {p0}, Lcom/flurry/sdk/q;->c()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-virtual {p0}, Lcom/flurry/sdk/q;->b()Z

    move-result v4

    if-nez v4, :cond_5

    .line 572
    const/16 v4, 0x2710

    const/16 v5, 0x3a98

    invoke-static {v0, v4, v5, v3}, Lcom/flurry/sdk/q;->a(Ljava/lang/String;IIZ)Lorg/apache/http/HttpResponse;

    move-result-object v4

    .line 574
    if-eqz v4, :cond_3

    .line 575
    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v5

    .line 578
    invoke-static {}, Lcom/flurry/sdk/ex;->c()I

    move-result v6

    if-gt v6, v9, :cond_0

    invoke-static {}, Lcom/flurry/sdk/ex;->d()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 579
    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v6

    invoke-virtual {v6}, Lcom/flurry/sdk/eg;->b()Landroid/content/Context;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "fFU HTTP Response Code: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    .line 584
    :cond_0
    const/16 v6, 0xc8

    if-ne v5, v6, :cond_2

    .line 585
    sget-object v1, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Redirect URL found for: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v9, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 620
    :cond_1
    :goto_1
    return-object v0

    .line 588
    :cond_2
    const/16 v6, 0x12c

    if-lt v5, v6, :cond_4

    const/16 v6, 0x190

    if-ge v5, v6, :cond_4

    .line 589
    sget-object v5, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "NumRedirects: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    add-int/lit8 v7, v2, 0x1

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v9, v5, v6}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 590
    const-string v5, "Location"

    invoke-interface {v4, v5}, Lorg/apache/http/HttpResponse;->containsHeader(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 591
    const-string v0, "Location"

    invoke-interface {v4, v0}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 618
    :cond_3
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 594
    :cond_4
    sget-object v0, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Bad Response status code: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v9, v0, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    move-object v0, v1

    .line 595
    goto :goto_1

    .line 601
    :cond_5
    const-wide/16 v4, 0x64

    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 602
    :catch_0
    move-exception v4

    .line 603
    sget-object v5, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v9, v5, v4}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 607
    :cond_6
    const-string v2, "android.intent.action.VIEW"

    invoke-virtual {p0, v0, v2}, Lcom/flurry/sdk/q;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 610
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_7

    const-string v2, "market://"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    :cond_7
    move-object v0, v1

    goto :goto_1
.end method

.method b(Landroid/content/Context;Ljava/lang/String;ZLcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V
    .locals 7

    .prologue
    .line 547
    if-nez p1, :cond_0

    .line 548
    const/4 v0, 0x5

    sget-object v1, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    const-string v2, "Cannot process redirect, null context"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 563
    :goto_0
    return-void

    .line 552
    :cond_0
    iget-object v6, p0, Lcom/flurry/sdk/q;->a:Lcom/flurry/android/impl/ads/FlurryAdModule;

    new-instance v0, Lcom/flurry/sdk/q$2;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p1

    move v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/q$2;-><init>(Lcom/flurry/sdk/q;Ljava/lang/String;Landroid/content/Context;ZLcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    invoke-virtual {v6, v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/sdk/fi;)V

    goto :goto_0
.end method

.method b(Lcom/flurry/sdk/a;)V
    .locals 9

    .prologue
    const/4 v8, 0x6

    .line 141
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    invoke-virtual {v0}, Lcom/flurry/sdk/p;->a()Landroid/content/Context;

    move-result-object v1

    .line 142
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v2, v0, Lcom/flurry/sdk/p;->d:Lcom/flurry/sdk/e;

    .line 143
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v3, v0, Lcom/flurry/sdk/p;->c:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    .line 144
    invoke-virtual {v3}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->b()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 146
    iget-object v0, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v5, "url"

    invoke-interface {v0, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 147
    iget-object v0, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v5, "url"

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 148
    const-string v5, "market://"

    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 149
    invoke-virtual {p0, v1, v0, v4}, Lcom/flurry/sdk/q;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    :goto_0
    return-void

    .line 151
    :cond_0
    const-string v5, "true"

    iget-object v6, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v7, "native"

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 152
    if-eqz v5, :cond_1

    .line 153
    const/4 v5, 0x2

    sget-object v6, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    const-string v7, "Explictly instructed to use native browser"

    invoke-static {v5, v6, v7}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 154
    invoke-virtual {p0, v2, v3, p1, v0}, Lcom/flurry/sdk/q;->a(Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/a;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 156
    invoke-virtual {p0, v1, v0, v4}, Lcom/flurry/sdk/q;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_0

    .line 158
    :cond_1
    new-instance v2, Landroid/content/Intent;

    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v3

    invoke-virtual {v3}, Lcom/flurry/sdk/eg;->b()Landroid/content/Context;

    move-result-object v3

    const-class v5, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-direct {v2, v3, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 160
    const-string v3, "url"

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 161
    invoke-static {v2}, Lcom/flurry/sdk/fh;->a(Landroid/content/Intent;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 162
    invoke-virtual {p0, v1, v2, v4}, Lcom/flurry/sdk/q;->a(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Z

    goto :goto_0

    .line 164
    :cond_2
    sget-object v2, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    const-string v3, "Can\'t start FlurryFullscreenTakeoverActivity, was it declared in the manifest? Falling back to default browser"

    invoke-static {v8, v2, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 167
    invoke-virtual {p0, v1, v0, v4}, Lcom/flurry/sdk/q;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_0

    .line 172
    :cond_3
    sget-object v0, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "failed to perform directOpen action: no url in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v2, v2, Lcom/flurry/sdk/p;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v8, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method b(Lcom/flurry/sdk/a;Lcom/flurry/sdk/ae;I)V
    .locals 7

    .prologue
    .line 232
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    invoke-virtual {v0}, Lcom/flurry/sdk/p;->a()Landroid/content/Context;

    move-result-object v3

    .line 233
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v5, v0, Lcom/flurry/sdk/p;->d:Lcom/flurry/sdk/e;

    .line 234
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v4, v0, Lcom/flurry/sdk/p;->c:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    .line 236
    iget-object v0, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v1, "url"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 237
    iget-object v0, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v1, "url"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 239
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/q;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v1, "urlVerified"

    .line 240
    :goto_0
    iget-object v0, p0, Lcom/flurry/sdk/q;->a:Lcom/flurry/android/impl/ads/FlurryAdModule;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Ljava/lang/String;I)V

    .line 241
    new-instance v0, Lcom/flurry/sdk/p;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    iget-object v6, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget v6, v6, Lcom/flurry/sdk/p;->e:I

    invoke-direct/range {v0 .. v6}, Lcom/flurry/sdk/p;-><init>(Ljava/lang/String;Ljava/util/Map;Landroid/content/Context;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;I)V

    add-int/lit8 v1, p3, 0x1

    invoke-interface {p2, v0, p0, v1}, Lcom/flurry/sdk/ae;->a(Lcom/flurry/sdk/p;Lcom/flurry/sdk/ad;I)V

    .line 244
    :cond_0
    return-void

    .line 239
    :cond_1
    const-string v1, "urlNotVerified"

    goto :goto_0
.end method

.method b()Z
    .locals 1

    .prologue
    .line 703
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->e()Z

    move-result v0

    return v0
.end method

.method public b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3

    .prologue
    .line 413
    if-nez p1, :cond_0

    .line 414
    const/4 v0, 0x5

    sget-object v1, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    const-string v2, "Cannot launch url, null context"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 415
    const/4 v0, 0x0

    .line 419
    :goto_0
    return v0

    .line 418
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v0

    .line 419
    invoke-virtual {p0, p1, v0, p3}, Lcom/flurry/sdk/q;->a(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method

.method c(Lcom/flurry/sdk/a;)V
    .locals 7

    .prologue
    .line 178
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v0, v0, Lcom/flurry/sdk/p;->c:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    .line 179
    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->b()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 181
    iget-object v0, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v1, "count"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 182
    iget-object v0, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v1, "count"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 183
    const/4 v1, -0x1

    .line 185
    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 190
    :goto_0
    iget-object v1, p0, Lcom/flurry/sdk/q;->a:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b()Lcom/flurry/sdk/u;

    move-result-object v1

    invoke-virtual {v1, v2, v0}, Lcom/flurry/sdk/u;->a(Ljava/lang/String;I)V

    .line 197
    :cond_0
    :goto_1
    return-void

    .line 186
    :catch_0
    move-exception v3

    .line 187
    const/4 v3, 0x6

    sget-object v4, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "caught NumberFormatException with count parameter in deleteAds:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v4, v0}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    move v0, v1

    goto :goto_0

    .line 192
    :cond_1
    iget-object v0, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v1, "groupId"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 193
    iget-object v0, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v1, "groupId"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 194
    iget-object v1, p0, Lcom/flurry/sdk/q;->a:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b()Lcom/flurry/sdk/u;

    move-result-object v1

    invoke-virtual {v1, v2, v0}, Lcom/flurry/sdk/u;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method c(Lcom/flurry/sdk/a;Lcom/flurry/sdk/ae;I)V
    .locals 10

    .prologue
    const/4 v9, 0x4

    .line 324
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    invoke-virtual {v0}, Lcom/flurry/sdk/p;->a()Landroid/content/Context;

    move-result-object v3

    .line 325
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v5, v0, Lcom/flurry/sdk/p;->d:Lcom/flurry/sdk/e;

    .line 326
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v4, v0, Lcom/flurry/sdk/p;->c:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    .line 328
    iget-object v0, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v1, "idHash"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 330
    iget-object v0, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v1, "idHash"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 333
    iget-object v1, p0, Lcom/flurry/sdk/q;->b:Lcom/flurry/sdk/z;

    invoke-virtual {v1, v0}, Lcom/flurry/sdk/z;->a(Ljava/lang/String;)Lcom/flurry/sdk/y;

    move-result-object v2

    .line 334
    const-string v1, "capNotExhausted"

    .line 337
    if-eqz v2, :cond_0

    iget-object v6, p0, Lcom/flurry/sdk/q;->b:Lcom/flurry/sdk/z;

    invoke-virtual {v2}, Lcom/flurry/sdk/y;->h()J

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Lcom/flurry/sdk/z;->a(J)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 340
    sget-object v2, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Discarding expired frequency cap info for idHash="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v9, v2, v6}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 342
    iget-object v2, p0, Lcom/flurry/sdk/q;->b:Lcom/flurry/sdk/z;

    invoke-virtual {v2, v0}, Lcom/flurry/sdk/z;->b(Ljava/lang/String;)V

    .line 343
    const/4 v2, 0x0

    .line 346
    :cond_0
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/flurry/sdk/y;->c()I

    move-result v6

    invoke-virtual {v2}, Lcom/flurry/sdk/y;->e()I

    move-result v2

    if-lt v6, v2, :cond_1

    .line 347
    sget-object v1, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Frequency cap exhausted for idHash="

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v9, v1, v0}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 348
    const-string v1, "capExhausted"

    .line 351
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/q;->a:Lcom/flurry/android/impl/ads/FlurryAdModule;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Ljava/lang/String;I)V

    .line 352
    new-instance v0, Lcom/flurry/sdk/p;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    iget-object v6, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget v6, v6, Lcom/flurry/sdk/p;->e:I

    invoke-direct/range {v0 .. v6}, Lcom/flurry/sdk/p;-><init>(Ljava/lang/String;Ljava/util/Map;Landroid/content/Context;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;I)V

    add-int/lit8 v1, p3, 0x1

    invoke-interface {p2, v0, p0, v1}, Lcom/flurry/sdk/ae;->a(Lcom/flurry/sdk/p;Lcom/flurry/sdk/ad;I)V

    .line 357
    :cond_2
    return-void
.end method

.method c(Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 625
    .line 627
    const/4 v0, 0x3

    sget-object v1, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "url after is: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 629
    new-instance v0, Lcom/flurry/sdk/q$3;

    invoke-direct {v0, p0, p1}, Lcom/flurry/sdk/q$3;-><init>(Lcom/flurry/sdk/q;Ljava/lang/String;)V

    .line 636
    iget-object v1, p0, Lcom/flurry/sdk/q;->a:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v1, v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/sdk/fi;)V

    .line 637
    return-void
.end method

.method c()Z
    .locals 1

    .prologue
    .line 732
    invoke-static {}, Lcom/flurry/sdk/fe;->a()Lcom/flurry/sdk/fe;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/fe;->c()Z

    move-result v0

    return v0
.end method

.method d(Lcom/flurry/sdk/a;)V
    .locals 9

    .prologue
    const/4 v8, 0x1

    .line 200
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    invoke-virtual {v0}, Lcom/flurry/sdk/p;->a()Landroid/content/Context;

    move-result-object v1

    .line 201
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v2, v0, Lcom/flurry/sdk/p;->d:Lcom/flurry/sdk/e;

    .line 202
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v3, v0, Lcom/flurry/sdk/p;->c:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    .line 203
    invoke-virtual {v3}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->b()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 205
    iget-object v0, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v5, "url"

    invoke-interface {v0, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 206
    iget-object v0, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v5, "url"

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 207
    const-string v5, "true"

    iget-object v6, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v7, "native"

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 209
    if-eqz v5, :cond_1

    .line 210
    const/4 v5, 0x2

    sget-object v6, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    const-string v7, "Explictly instructed to use native browser in pr."

    invoke-static {v5, v6, v7}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 211
    invoke-virtual {p0, v2, v3, p1, v0}, Lcom/flurry/sdk/q;->a(Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/a;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 212
    invoke-static {v0}, Lcom/flurry/sdk/bv;->c(Ljava/lang/String;)Z

    move-result v2

    if-ne v8, v2, :cond_0

    .line 214
    invoke-virtual {p0, v1, v0, v4}, Lcom/flurry/sdk/q;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    .line 229
    :cond_0
    :goto_0
    return-void

    .line 216
    :cond_1
    const-string v4, "http"

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 217
    invoke-virtual {p0, v2, v3, p1, v0}, Lcom/flurry/sdk/q;->a(Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/a;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 218
    invoke-static {v0}, Lcom/flurry/sdk/bv;->c(Ljava/lang/String;)Z

    move-result v2

    if-ne v8, v2, :cond_0

    .line 220
    invoke-virtual {p0, v1, v0, v8, v3}, Lcom/flurry/sdk/q;->b(Landroid/content/Context;Ljava/lang/String;ZLcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    goto :goto_0

    .line 223
    :cond_2
    invoke-static {v0}, Lcom/flurry/sdk/bv;->c(Ljava/lang/String;)Z

    move-result v2

    if-ne v8, v2, :cond_0

    .line 225
    const/4 v2, 0x0

    invoke-virtual {p0, v1, v0, v2, v3}, Lcom/flurry/sdk/q;->a(Landroid/content/Context;Ljava/lang/String;ZLcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    goto :goto_0
.end method

.method d(Ljava/lang/String;)Z
    .locals 9

    .prologue
    const/4 v0, 0x1

    const/4 v8, 0x3

    const/4 v1, 0x0

    .line 641
    move v2, v1

    .line 643
    :goto_0
    const/4 v3, 0x5

    if-ge v2, v3, :cond_3

    .line 644
    const/4 v3, 0x6

    sget-object v4, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " sendURLUntilSuccess URL: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 645
    invoke-virtual {p0}, Lcom/flurry/sdk/q;->c()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p0}, Lcom/flurry/sdk/q;->b()Z

    move-result v3

    if-nez v3, :cond_1

    .line 646
    const/16 v3, 0x2710

    const/16 v4, 0x3a98

    invoke-static {p1, v3, v4, v0}, Lcom/flurry/sdk/q;->a(Ljava/lang/String;IIZ)Lorg/apache/http/HttpResponse;

    move-result-object v3

    .line 648
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v4

    .line 651
    invoke-static {}, Lcom/flurry/sdk/ex;->c()I

    move-result v5

    if-gt v5, v8, :cond_0

    invoke-static {}, Lcom/flurry/sdk/ex;->d()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 652
    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v5

    invoke-virtual {v5}, Lcom/flurry/sdk/eg;->b()Landroid/content/Context;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "sUUS HTTP Response Code: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    .line 656
    :cond_0
    if-eqz v3, :cond_2

    const/16 v3, 0xc8

    if-ne v4, v3, :cond_2

    .line 657
    sget-object v1, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "URL hit succeeded for: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v8, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 672
    :goto_1
    return v0

    .line 664
    :cond_1
    const-wide/16 v3, 0x64

    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 670
    :cond_2
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 665
    :catch_0
    move-exception v3

    .line 666
    sget-object v4, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v8, v4, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_3
    move v0, v1

    goto :goto_1
.end method

.method e(Lcom/flurry/sdk/a;)V
    .locals 4

    .prologue
    .line 247
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    invoke-virtual {v0}, Lcom/flurry/sdk/p;->a()Landroid/content/Context;

    move-result-object v1

    .line 248
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v2, v0, Lcom/flurry/sdk/p;->c:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    .line 250
    iget-object v0, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v3, "package"

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 251
    iget-object v0, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v3, "package"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 252
    invoke-virtual {p0, v1, v0, v2}, Lcom/flurry/sdk/q;->a(Landroid/content/Context;Ljava/lang/String;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    .line 254
    :cond_0
    return-void
.end method

.method e(Ljava/lang/String;)Z
    .locals 3

    .prologue
    .line 716
    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/eg;->b()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 718
    if-nez p1, :cond_0

    .line 719
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "market://details?id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 722
    :cond_0
    const-string v0, "android.intent.action.VIEW"

    invoke-virtual {p0, p1, v0}, Lcom/flurry/sdk/q;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method f(Lcom/flurry/sdk/a;)V
    .locals 4

    .prologue
    .line 257
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v1, v0, Lcom/flurry/sdk/p;->d:Lcom/flurry/sdk/e;

    .line 258
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v2, v0, Lcom/flurry/sdk/p;->c:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    .line 260
    iget-object v0, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v3, "url"

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 261
    iget-object v0, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v3, "url"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v1, v2, p1, v0}, Lcom/flurry/sdk/q;->a(Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/a;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/q;->c(Ljava/lang/String;)V

    .line 263
    :cond_0
    return-void
.end method

.method g(Lcom/flurry/sdk/a;)V
    .locals 1

    .prologue
    .line 266
    iget-object v0, p0, Lcom/flurry/sdk/q;->a:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->z()V

    .line 267
    return-void
.end method

.method h(Lcom/flurry/sdk/a;)V
    .locals 5

    .prologue
    .line 270
    iget-object v0, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v1, "__sendToServer"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v1, "__sendToServer"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "true"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 272
    :goto_0
    iget-object v1, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v2, "__sendToServer"

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 274
    iget-object v1, p0, Lcom/flurry/sdk/q;->a:Lcom/flurry/android/impl/ads/FlurryAdModule;

    iget-object v2, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v2, v2, Lcom/flurry/sdk/p;->d:Lcom/flurry/sdk/e;

    iget-object v3, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v3, v3, Lcom/flurry/sdk/p;->a:Ljava/lang/String;

    iget-object v4, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    invoke-virtual {v1, v2, v3, v0, v4}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/sdk/e;Ljava/lang/String;ZLjava/util/Map;)Lcom/flurry/sdk/e;

    .line 276
    return-void

    .line 270
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method i(Lcom/flurry/sdk/a;)V
    .locals 0

    .prologue
    .line 280
    return-void
.end method

.method j(Lcom/flurry/sdk/a;)V
    .locals 6

    .prologue
    const/4 v5, 0x4

    .line 360
    iget-object v0, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v1, "idHash"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 362
    iget-object v0, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v1, "idHash"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 364
    iget-object v1, p0, Lcom/flurry/sdk/q;->b:Lcom/flurry/sdk/z;

    invoke-virtual {v1, v0}, Lcom/flurry/sdk/z;->a(Ljava/lang/String;)Lcom/flurry/sdk/y;

    move-result-object v0

    .line 366
    if-eqz v0, :cond_0

    .line 367
    invoke-virtual {v0}, Lcom/flurry/sdk/y;->d()V

    .line 368
    sget-object v1, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateViewCount:idHash="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/flurry/sdk/y;->b()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",newCap="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/flurry/sdk/y;->e()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",prevCap="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/flurry/sdk/y;->f()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",views="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/flurry/sdk/y;->c()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 373
    invoke-virtual {v0}, Lcom/flurry/sdk/y;->c()I

    move-result v1

    invoke-virtual {v0}, Lcom/flurry/sdk/y;->e()I

    move-result v2

    if-lt v1, v2, :cond_0

    .line 374
    iget-object v1, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v1, v1, Lcom/flurry/sdk/p;->c:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    .line 375
    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->b()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 377
    invoke-virtual {v0}, Lcom/flurry/sdk/y;->c()I

    move-result v2

    invoke-virtual {v0}, Lcom/flurry/sdk/y;->e()I

    move-result v3

    if-le v2, v3, :cond_1

    .line 378
    const/4 v2, 0x6

    sget-object v3, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "FlurryAdAction: !! rendering a capped object: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/flurry/sdk/y;->b()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " for adspace: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 388
    :goto_0
    iget-object v0, p0, Lcom/flurry/sdk/q;->a:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b()Lcom/flurry/sdk/u;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/u;->d(Ljava/lang/String;)V

    .line 392
    :cond_0
    return-void

    .line 383
    :cond_1
    sget-object v2, Lcom/flurry/sdk/q;->d:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "FlurryAdAction: hit cap for object: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/flurry/sdk/y;->b()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ", cache cleared for adspace: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v2, v0}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
