.class public Lcom/flurry/sdk/v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/an;


# static fields
.field private static final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const-class v0, Lcom/flurry/sdk/v;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/v;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;IILjava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 35
    const/4 v0, 0x2

    if-ge p3, v0, :cond_0

    .line 36
    invoke-virtual {p0, p1, p4}, Lcom/flurry/sdk/v;->a(Ljava/lang/String;Ljava/util/List;)V

    .line 38
    :cond_0
    return-void
.end method

.method public declared-synchronized a(Ljava/lang/String;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 21
    monitor-enter p0

    const/4 v1, 0x3

    :try_start_0
    sget-object v2, Lcom/flurry/sdk/v;->a:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Starting ad request from EnsureCacheNotEmpty size: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-eqz p2, :cond_0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 24
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b()Lcom/flurry/sdk/u;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/u;->c(Ljava/lang/String;)Lcom/flurry/sdk/k;

    move-result-object v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b()Lcom/flurry/sdk/u;

    move-result-object v1

    invoke-virtual {v0}, Lcom/flurry/sdk/k;->getViewGroup()Landroid/view/ViewGroup;

    move-result-object v0

    sget-object v2, Lcom/flurry/android/FlurryAdSize;->BANNER_BOTTOM:Lcom/flurry/android/FlurryAdSize;

    const/4 v3, 0x0

    invoke-virtual {v1, p1, v0, v2, v3}, Lcom/flurry/sdk/u;->a(Ljava/lang/String;Landroid/view/ViewGroup;Lcom/flurry/android/FlurryAdSize;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :goto_1
    monitor-exit p0

    return-void

    .line 21
    :cond_0
    :try_start_1
    const-string v0, ""

    goto :goto_0

    .line 28
    :cond_1
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b()Lcom/flurry/sdk/u;

    move-result-object v0

    const/4 v1, 0x0

    sget-object v2, Lcom/flurry/android/FlurryAdSize;->FULLSCREEN:Lcom/flurry/android/FlurryAdSize;

    const/4 v3, 0x0

    invoke-virtual {v0, p1, v1, v2, v3}, Lcom/flurry/sdk/u;->a(Ljava/lang/String;Landroid/view/ViewGroup;Lcom/flurry/android/FlurryAdSize;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 21
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
