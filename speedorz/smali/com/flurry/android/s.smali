.class final Lcom/flurry/android/s;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# static fields
.field private static m:Ljava/lang/String;


# instance fields
.field private final K:Landroid/content/Context;

.field private final W:Lcom/flurry/android/FlurryAds;

.field private Z:J

.field private final a_:Ljava/lang/String;

.field private final aa:Ljava/util/concurrent/ScheduledExecutorService;

.field private final ab:Ljava/lang/Runnable;

.field private ac:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture",
            "<*>;"
        }
    .end annotation
.end field

.field private final b_:Landroid/view/ViewGroup;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const-string v0, "FlurryAgent"

    sput-object v0, Lcom/flurry/android/s;->m:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/flurry/android/FlurryAds;Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;)V
    .locals 1

    .prologue
    .line 31
    invoke-direct {p0, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 26
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/s;->aa:Ljava/util/concurrent/ScheduledExecutorService;

    .line 27
    new-instance v0, Lcom/flurry/android/cv;

    invoke-direct {v0, p0}, Lcom/flurry/android/cv;-><init>(Lcom/flurry/android/s;)V

    iput-object v0, p0, Lcom/flurry/android/s;->ab:Ljava/lang/Runnable;

    .line 32
    iput-object p1, p0, Lcom/flurry/android/s;->W:Lcom/flurry/android/FlurryAds;

    .line 33
    iput-object p2, p0, Lcom/flurry/android/s;->K:Landroid/content/Context;

    .line 34
    iput-object p3, p0, Lcom/flurry/android/s;->a_:Ljava/lang/String;

    .line 35
    iput-object p4, p0, Lcom/flurry/android/s;->b_:Landroid/view/ViewGroup;

    .line 36
    return-void
.end method

.method static synthetic a(Lcom/flurry/android/s;)Z
    .locals 2

    .prologue
    .line 17
    iget-object v0, p0, Lcom/flurry/android/s;->K:Landroid/content/Context;

    invoke-static {v0}, Lcom/flurry/android/FlurryAds;->m(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Device is locked: banner will NOT rotate for adSpace: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/s;->a_:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    :cond_0
    :goto_0
    const/4 v0, 0x0

    :goto_1
    return v0

    :cond_1
    iget-object v0, p0, Lcom/flurry/android/s;->W:Lcom/flurry/android/FlurryAds;

    invoke-virtual {v0}, Lcom/flurry/android/FlurryAds;->ay()Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Ad fullscreen panel is opened: banner will NOT rotate for adSpace: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/s;->a_:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lcom/flurry/android/s;->i()Lcom/flurry/android/l;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/flurry/android/l;->shouldRotate()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_1
.end method

.method static synthetic b(Lcom/flurry/android/s;)Ljava/lang/Runnable;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lcom/flurry/android/s;->ab:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic c(Lcom/flurry/android/s;)V
    .locals 7

    .prologue
    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Rotating banner for adSpace: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/s;->a_:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    iget-object v0, p0, Lcom/flurry/android/s;->W:Lcom/flurry/android/FlurryAds;

    iget-object v1, p0, Lcom/flurry/android/s;->K:Landroid/content/Context;

    iget-object v2, p0, Lcom/flurry/android/s;->a_:Ljava/lang/String;

    sget-object v3, Lcom/flurry/android/FlurryAdSize;->BANNER_BOTTOM:Lcom/flurry/android/FlurryAdSize;

    iget-object v4, p0, Lcom/flurry/android/s;->b_:Landroid/view/ViewGroup;

    const-wide/16 v5, 0x1

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/android/FlurryAds;->a(Landroid/content/Context;Ljava/lang/String;Lcom/flurry/android/FlurryAdSize;Landroid/view/ViewGroup;J)Z

    return-void
.end method

.method private declared-synchronized g()V
    .locals 2

    .prologue
    .line 63
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/s;->h()V

    .line 64
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/flurry/android/s;->Z:J

    .line 65
    iget-object v0, p0, Lcom/flurry/android/s;->ab:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/flurry/android/s;->removeCallbacks(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    monitor-exit p0

    return-void

    .line 63
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private h()V
    .locals 3

    .prologue
    .line 87
    iget-object v0, p0, Lcom/flurry/android/s;->ac:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v0, :cond_0

    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cancel banner rotation for adSpace = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/s;->a_:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " with fixed rate in milliseconds = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/flurry/android/s;->Z:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    iget-object v0, p0, Lcom/flurry/android/s;->ac:Ljava/util/concurrent/ScheduledFuture;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 91
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/android/s;->ac:Ljava/util/concurrent/ScheduledFuture;

    .line 93
    :cond_0
    return-void
.end method

.method private i()Lcom/flurry/android/l;
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 104
    invoke-virtual {p0}, Lcom/flurry/android/s;->getChildCount()I

    move-result v0

    const/4 v2, 0x1

    if-ge v0, v2, :cond_0

    move-object v0, v1

    .line 111
    :goto_0
    return-object v0

    .line 107
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/flurry/android/s;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 109
    :try_start_0
    check-cast v0, Lcom/flurry/android/l;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 111
    :catch_0
    move-exception v0

    move-object v0, v1

    goto :goto_0
.end method


# virtual methods
.method public final declared-synchronized a(J)V
    .locals 7

    .prologue
    .line 55
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/flurry/android/s;->Z:J

    cmp-long v0, v0, p1

    if-eqz v0, :cond_0

    .line 56
    invoke-direct {p0}, Lcom/flurry/android/s;->h()V

    .line 57
    iput-wide p1, p0, Lcom/flurry/android/s;->Z:J

    .line 58
    iget-object v0, p0, Lcom/flurry/android/s;->ac:Ljava/util/concurrent/ScheduledFuture;

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    iget-wide v2, p0, Lcom/flurry/android/s;->Z:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "schedule banner rotation for adSpace = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/s;->a_:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " with fixed rate in milliseconds = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/flurry/android/s;->Z:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    iget-object v0, p0, Lcom/flurry/android/s;->aa:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v1, Lcom/flurry/android/ag;

    invoke-direct {v1, p0}, Lcom/flurry/android/ag;-><init>(Lcom/flurry/android/s;)V

    iget-wide v2, p0, Lcom/flurry/android/s;->Z:J

    iget-wide v4, p0, Lcom/flurry/android/s;->Z:J

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface/range {v0 .. v6}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/s;->ac:Ljava/util/concurrent/ScheduledFuture;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    :cond_0
    monitor-exit p0

    return-void

    .line 55
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final f()Landroid/view/ViewGroup;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/flurry/android/s;->b_:Landroid/view/ViewGroup;

    return-object v0
.end method

.method public final stop()V
    .locals 1

    .prologue
    .line 96
    invoke-direct {p0}, Lcom/flurry/android/s;->g()V

    .line 97
    invoke-direct {p0}, Lcom/flurry/android/s;->i()Lcom/flurry/android/l;

    move-result-object v0

    .line 98
    if-eqz v0, :cond_0

    .line 99
    invoke-virtual {v0}, Lcom/flurry/android/l;->stop()V

    .line 101
    :cond_0
    return-void
.end method
