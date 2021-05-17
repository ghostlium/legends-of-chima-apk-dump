.class public Lcom/flurry/sdk/t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/fc;
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# static fields
.field private static final b:Ljava/lang/String;

.field private static c:Lcom/flurry/sdk/t;


# instance fields
.field a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Landroid/content/Context;",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private d:J

.field private e:J

.field private f:J

.field private g:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/flurry/sdk/ej;",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private volatile h:Z

.field private volatile i:Z

.field private j:Lcom/flurry/android/impl/ads/FlurryAdModule;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const-class v0, Lcom/flurry/sdk/t;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/t;->b:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/t;->a:Ljava/util/Map;

    .line 39
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/t;->g:Ljava/util/Map;

    .line 42
    iput-boolean v1, p0, Lcom/flurry/sdk/t;->h:Z

    .line 43
    iput-boolean v1, p0, Lcom/flurry/sdk/t;->i:Z

    .line 47
    invoke-static {}, Lcom/flurry/sdk/eq;->a()Lcom/flurry/sdk/eq;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/flurry/sdk/eq;->a(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 48
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/t;->j:Lcom/flurry/android/impl/ads/FlurryAdModule;

    .line 49
    return-void
.end method

.method public static a()Lcom/flurry/sdk/t;
    .locals 1

    .prologue
    .line 52
    sget-object v0, Lcom/flurry/sdk/t;->c:Lcom/flurry/sdk/t;

    if-nez v0, :cond_0

    .line 53
    new-instance v0, Lcom/flurry/sdk/t;

    invoke-direct {v0}, Lcom/flurry/sdk/t;-><init>()V

    sput-object v0, Lcom/flurry/sdk/t;->c:Lcom/flurry/sdk/t;

    .line 56
    :cond_0
    sget-object v0, Lcom/flurry/sdk/t;->c:Lcom/flurry/sdk/t;

    return-object v0
.end method

.method static synthetic a(Lcom/flurry/sdk/t;)Ljava/util/Map;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/flurry/sdk/t;->g:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic a(Lcom/flurry/sdk/t;Z)Z
    .locals 0

    .prologue
    .line 28
    iput-boolean p1, p0, Lcom/flurry/sdk/t;->i:Z

    return p1
.end method

.method static synthetic b()Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    sget-object v0, Lcom/flurry/sdk/t;->b:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic b(Lcom/flurry/sdk/t;)Z
    .locals 1

    .prologue
    .line 28
    iget-boolean v0, p0, Lcom/flurry/sdk/t;->i:Z

    return v0
.end method

.method static synthetic c(Lcom/flurry/sdk/t;)Lcom/flurry/android/impl/ads/FlurryAdModule;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/flurry/sdk/t;->j:Lcom/flurry/android/impl/ads/FlurryAdModule;

    return-object v0
.end method

.method private c()V
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lcom/flurry/sdk/t;->a:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 153
    return-void
.end method


# virtual methods
.method public f(Landroid/content/Context;)V
    .locals 7

    .prologue
    .line 61
    invoke-static {}, Lcom/flurry/sdk/fe;->a()Lcom/flurry/sdk/fe;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/fe;->b()V

    .line 62
    invoke-static {}, Lcom/flurry/sdk/en;->a()Lcom/flurry/sdk/en;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/en;->b()V

    .line 63
    invoke-static {}, Lcom/flurry/sdk/en;->a()Lcom/flurry/sdk/en;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/en;->c()V

    .line 64
    iget-object v0, p0, Lcom/flurry/sdk/t;->a:Ljava/util/Map;

    invoke-interface {v0, p1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 65
    if-eqz v0, :cond_0

    .line 66
    const/4 v0, 0x5

    sget-object v1, Lcom/flurry/sdk/t;->b:Ljava/lang/String;

    const-string v2, "onStartSession called with duplicate context, use a specific Activity or Service as context instead of using a global context"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 71
    :cond_0
    iget-boolean v0, p0, Lcom/flurry/sdk/t;->h:Z

    if-nez v0, :cond_1

    .line 72
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    .line 73
    invoke-static {}, Lcom/flurry/sdk/eh;->a()Lcom/flurry/sdk/ei;

    move-result-object v0

    const-string v3, "ContinueSessionMillis"

    invoke-virtual {v0, v3}, Lcom/flurry/sdk/ei;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    .line 75
    iget-wide v5, p0, Lcom/flurry/sdk/t;->f:J

    sub-long v5, v1, v5

    cmp-long v0, v5, v3

    if-lez v0, :cond_2

    .line 77
    iput-wide v1, p0, Lcom/flurry/sdk/t;->e:J

    .line 78
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flurry/sdk/t;->d:J

    .line 80
    iget-object v0, p0, Lcom/flurry/sdk/t;->j:Lcom/flurry/android/impl/ads/FlurryAdModule;

    iget-wide v2, p0, Lcom/flurry/sdk/t;->d:J

    iget-wide v4, p0, Lcom/flurry/sdk/t;->e:J

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Landroid/content/Context;JJ)V

    .line 83
    iget-object v0, p0, Lcom/flurry/sdk/t;->j:Lcom/flurry/android/impl/ads/FlurryAdModule;

    new-instance v1, Lcom/flurry/sdk/t$1;

    invoke-direct {v1, p0}, Lcom/flurry/sdk/t$1;-><init>(Lcom/flurry/sdk/t;)V

    invoke-virtual {v0, v1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/sdk/fi;)V

    .line 110
    :goto_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/sdk/t;->h:Z

    .line 112
    :cond_1
    return-void

    .line 107
    :cond_2
    iget-object v0, p0, Lcom/flurry/sdk/t;->j:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v0, p1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b(Landroid/content/Context;)V

    goto :goto_0
.end method

.method public g(Landroid/content/Context;)V
    .locals 3

    .prologue
    .line 117
    invoke-static {}, Lcom/flurry/sdk/en;->a()Lcom/flurry/sdk/en;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/en;->d()V

    .line 119
    if-eqz p1, :cond_0

    .line 120
    iget-object v0, p0, Lcom/flurry/sdk/t;->a:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 121
    if-nez v0, :cond_0

    .line 122
    const/4 v0, 0x5

    sget-object v1, Lcom/flurry/sdk/t;->b:Ljava/lang/String;

    const-string v2, "onEndSession called without context from corresponding onStartSession"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 127
    :cond_0
    iget-boolean v0, p0, Lcom/flurry/sdk/t;->h:Z

    if-eqz v0, :cond_1

    .line 128
    iget-object v0, p0, Lcom/flurry/sdk/t;->j:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v0, p1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->d(Landroid/content/Context;)V

    .line 131
    :cond_1
    iget-boolean v0, p0, Lcom/flurry/sdk/t;->h:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flurry/sdk/t;->a:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 132
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 133
    iput-wide v0, p0, Lcom/flurry/sdk/t;->f:J

    .line 135
    iget-object v0, p0, Lcom/flurry/sdk/t;->j:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v0, p1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->c(Landroid/content/Context;)V

    .line 137
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/flurry/sdk/t;->h:Z

    .line 140
    :cond_2
    return-void
.end method

.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 0

    .prologue
    .line 148
    invoke-direct {p0}, Lcom/flurry/sdk/t;->c()V

    .line 149
    return-void
.end method
