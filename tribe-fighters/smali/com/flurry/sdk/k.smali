.class public final Lcom/flurry/sdk/k;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/k$a;
    }
.end annotation


# static fields
.field private static final a:Ljava/lang/String;


# instance fields
.field private final b:Lcom/flurry/android/impl/ads/FlurryAdModule;

.field private final c:Ljava/lang/String;

.field private final d:Landroid/view/ViewGroup;

.field private e:J

.field private final f:Ljava/util/concurrent/ScheduledExecutorService;

.field private final g:Ljava/lang/Runnable;

.field private h:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const-class v0, Lcom/flurry/sdk/k;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/k;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/flurry/android/impl/ads/FlurryAdModule;Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;Ljava/util/concurrent/ScheduledExecutorService;)V
    .locals 2

    .prologue
    .line 34
    invoke-direct {p0, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 29
    new-instance v0, Lcom/flurry/sdk/k$a;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/flurry/sdk/k$a;-><init>(Lcom/flurry/sdk/k;Lcom/flurry/sdk/k$1;)V

    iput-object v0, p0, Lcom/flurry/sdk/k;->g:Ljava/lang/Runnable;

    .line 36
    iput-object p1, p0, Lcom/flurry/sdk/k;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    .line 37
    iput-object p3, p0, Lcom/flurry/sdk/k;->c:Ljava/lang/String;

    .line 38
    iput-object p4, p0, Lcom/flurry/sdk/k;->d:Landroid/view/ViewGroup;

    .line 39
    iput-object p5, p0, Lcom/flurry/sdk/k;->f:Ljava/util/concurrent/ScheduledExecutorService;

    .line 40
    return-void
.end method

.method static synthetic a(Lcom/flurry/sdk/k;)Z
    .locals 1

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/flurry/sdk/k;->e()Z

    move-result v0

    return v0
.end method

.method static synthetic b(Lcom/flurry/sdk/k;)Ljava/lang/Runnable;
    .locals 1

    .prologue
    .line 20
    iget-object v0, p0, Lcom/flurry/sdk/k;->g:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic c(Lcom/flurry/sdk/k;)V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/flurry/sdk/k;->f()V

    return-void
.end method

.method private c()Z
    .locals 7

    .prologue
    .line 73
    iget-object v0, p0, Lcom/flurry/sdk/k;->f:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/k;->h:Ljava/util/concurrent/ScheduledFuture;

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    invoke-virtual {p0}, Lcom/flurry/sdk/k;->getRotationRateInMilliseconds()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 75
    const/4 v0, 0x3

    sget-object v1, Lcom/flurry/sdk/k;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "schedule banner rotation for adSpace = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flurry/sdk/k;->getAdSpace()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " with fixed rate in milliseconds = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flurry/sdk/k;->getRotationRateInMilliseconds()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 77
    iget-object v0, p0, Lcom/flurry/sdk/k;->f:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v1, Lcom/flurry/sdk/k$1;

    invoke-direct {v1, p0}, Lcom/flurry/sdk/k$1;-><init>(Lcom/flurry/sdk/k;)V

    invoke-virtual {p0}, Lcom/flurry/sdk/k;->getRotationRateInMilliseconds()J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/flurry/sdk/k;->getRotationRateInMilliseconds()J

    move-result-wide v4

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface/range {v0 .. v6}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/k;->h:Ljava/util/concurrent/ScheduledFuture;

    .line 88
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/k;->h:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private d()V
    .locals 5

    .prologue
    .line 92
    iget-object v0, p0, Lcom/flurry/sdk/k;->h:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v0, :cond_0

    .line 93
    const/4 v0, 0x3

    sget-object v1, Lcom/flurry/sdk/k;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cancel banner rotation for adSpace = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flurry/sdk/k;->getAdSpace()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " with fixed rate in milliseconds = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flurry/sdk/k;->getRotationRateInMilliseconds()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 95
    iget-object v0, p0, Lcom/flurry/sdk/k;->h:Ljava/util/concurrent/ScheduledFuture;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 96
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/k;->h:Ljava/util/concurrent/ScheduledFuture;

    .line 98
    :cond_0
    return-void
.end method

.method private e()Z
    .locals 5

    .prologue
    const/4 v4, 0x3

    const/4 v0, 0x0

    .line 121
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->e()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 122
    sget-object v1, Lcom/flurry/sdk/k;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Device is locked: banner will NOT rotate for adSpace: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flurry/sdk/k;->getAdSpace()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 134
    :cond_0
    :goto_0
    return v0

    .line 127
    :cond_1
    iget-object v1, p0, Lcom/flurry/sdk/k;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->c()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 128
    sget-object v1, Lcom/flurry/sdk/k;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Ad fullscreen panel is opened: banner will NOT rotate for adSpace: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flurry/sdk/k;->getAdSpace()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 133
    :cond_2
    invoke-direct {p0}, Lcom/flurry/sdk/k;->getCurrentBannerView()Lcom/flurry/sdk/h;

    move-result-object v1

    .line 134
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/flurry/sdk/h;->e()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method private f()V
    .locals 6

    .prologue
    .line 138
    const/4 v0, 0x3

    sget-object v1, Lcom/flurry/sdk/k;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Rotating banner for adSpace: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flurry/sdk/k;->getAdSpace()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 139
    iget-object v0, p0, Lcom/flurry/sdk/k;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b()Lcom/flurry/sdk/u;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flurry/sdk/k;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/sdk/k;->c:Ljava/lang/String;

    iget-object v3, p0, Lcom/flurry/sdk/k;->d:Landroid/view/ViewGroup;

    sget-object v4, Lcom/flurry/android/FlurryAdSize;->BANNER_BOTTOM:Lcom/flurry/android/FlurryAdSize;

    const/4 v5, 0x1

    invoke-virtual/range {v0 .. v5}, Lcom/flurry/sdk/u;->a(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/flurry/android/FlurryAdSize;Z)V

    .line 140
    return-void
.end method

.method private getCurrentBannerView()Lcom/flurry/sdk/h;
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 109
    invoke-virtual {p0}, Lcom/flurry/sdk/k;->getChildCount()I

    move-result v0

    const/4 v2, 0x1

    if-ge v0, v2, :cond_0

    move-object v0, v1

    .line 116
    :goto_0
    return-object v0

    .line 112
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/k;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 114
    :try_start_0
    check-cast v0, Lcom/flurry/sdk/h;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 115
    :catch_0
    move-exception v0

    move-object v0, v1

    .line 116
    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized a()V
    .locals 2

    .prologue
    .line 67
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/sdk/k;->d()V

    .line 68
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/flurry/sdk/k;->e:J

    .line 69
    iget-object v0, p0, Lcom/flurry/sdk/k;->g:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/k;->removeCallbacks(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    monitor-exit p0

    return-void

    .line 67
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized a(J)V
    .locals 2

    .prologue
    .line 59
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/flurry/sdk/k;->e:J

    cmp-long v0, v0, p1

    if-eqz v0, :cond_0

    .line 60
    invoke-direct {p0}, Lcom/flurry/sdk/k;->d()V

    .line 61
    iput-wide p1, p0, Lcom/flurry/sdk/k;->e:J

    .line 62
    invoke-direct {p0}, Lcom/flurry/sdk/k;->c()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    :cond_0
    monitor-exit p0

    return-void

    .line 59
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public b()V
    .locals 1

    .prologue
    .line 101
    invoke-virtual {p0}, Lcom/flurry/sdk/k;->a()V

    .line 102
    invoke-direct {p0}, Lcom/flurry/sdk/k;->getCurrentBannerView()Lcom/flurry/sdk/h;

    move-result-object v0

    .line 103
    if-eqz v0, :cond_0

    .line 104
    invoke-virtual {v0}, Lcom/flurry/sdk/h;->stop()V

    .line 106
    :cond_0
    return-void
.end method

.method public getAdSpace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/flurry/sdk/k;->c:Ljava/lang/String;

    return-object v0
.end method

.method public getRotationRateInMilliseconds()J
    .locals 2

    .prologue
    .line 43
    iget-wide v0, p0, Lcom/flurry/sdk/k;->e:J

    return-wide v0
.end method

.method public getViewGroup()Landroid/view/ViewGroup;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/flurry/sdk/k;->d:Landroid/view/ViewGroup;

    return-object v0
.end method
