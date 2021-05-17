.class public final Lcom/flurry/sdk/d;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:Lcom/flurry/sdk/d;


# instance fields
.field private final b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/d;->b:Ljava/util/Map;

    .line 28
    return-void
.end method

.method public static declared-synchronized a()Lcom/flurry/sdk/d;
    .locals 2

    .prologue
    .line 31
    const-class v1, Lcom/flurry/sdk/d;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/flurry/sdk/d;->a:Lcom/flurry/sdk/d;

    if-nez v0, :cond_0

    .line 32
    new-instance v0, Lcom/flurry/sdk/d;

    invoke-direct {v0}, Lcom/flurry/sdk/d;-><init>()V

    sput-object v0, Lcom/flurry/sdk/d;->a:Lcom/flurry/sdk/d;

    .line 34
    :cond_0
    sget-object v0, Lcom/flurry/sdk/d;->a:Lcom/flurry/sdk/d;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 31
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public declared-synchronized a(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)I
    .locals 2

    .prologue
    .line 44
    monitor-enter p0

    const/4 v1, 0x0

    .line 45
    :try_start_0
    iget-object v0, p0, Lcom/flurry/sdk/d;->b:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 46
    if-eqz v0, :cond_0

    .line 47
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 49
    :goto_0
    monitor-exit p0

    return v0

    .line 44
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method public declared-synchronized a(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;I)V
    .locals 2

    .prologue
    .line 38
    monitor-enter p0

    if-eqz p1, :cond_0

    .line 39
    :try_start_0
    iget-object v0, p0, Lcom/flurry/sdk/d;->b:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    :cond_0
    monitor-exit p0

    return-void

    .line 38
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
