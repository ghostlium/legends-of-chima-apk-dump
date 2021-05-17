.class public final Lcom/google/android/gms/common/api/GoogleApiClient;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/api/GoogleApiClient$Builder;,
        Lcom/google/android/gms/common/api/GoogleApiClient$ApiOptions;,
        Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;,
        Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;,
        Lcom/google/android/gms/common/api/GoogleApiClient$a;
    }
.end annotation


# instance fields
.field private final kB:Lcom/google/android/gms/internal/dl;

.field private final kC:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/google/android/gms/common/api/GoogleApiClient$a",
            "<*>;>;"
        }
    .end annotation
.end field

.field private kD:Lcom/google/android/gms/common/ConnectionResult;

.field private kE:I

.field private kF:I

.field private kG:I

.field private final kH:Landroid/os/Bundle;

.field private final kI:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/common/api/Api$b",
            "<*>;",
            "Lcom/google/android/gms/common/api/Api$a;",
            ">;"
        }
    .end annotation
.end field

.field private kJ:Z

.field private final kK:Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;

.field private final kL:Lcom/google/android/gms/internal/dl$b;

.field private final kt:Ljava/lang/Object;


# direct methods
.method private constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/dh;Ljava/util/Map;Ljava/util/Set;Ljava/util/Set;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "commonSettings"    # Lcom/google/android/gms/internal/dh;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/android/gms/internal/dh;",
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/common/api/Api;",
            "Lcom/google/android/gms/common/api/GoogleApiClient$ApiOptions;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, "apis":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/android/gms/common/api/Api;Lcom/google/android/gms/common/api/GoogleApiClient$ApiOptions;>;"
    .local p4, "connectedCallbacks":Ljava/util/Set;, "Ljava/util/Set<Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;>;"
    .local p5, "onConnectionFailedListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kt:Ljava/lang/Object;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kC:Ljava/util/Queue;

    const/4 v0, 0x3

    iput v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kF:I

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kH:Landroid/os/Bundle;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kI:Ljava/util/Map;

    new-instance v0, Lcom/google/android/gms/common/api/GoogleApiClient$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/common/api/GoogleApiClient$1;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kK:Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;

    new-instance v0, Lcom/google/android/gms/common/api/GoogleApiClient$2;

    invoke-direct {v0, p0}, Lcom/google/android/gms/common/api/GoogleApiClient$2;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kL:Lcom/google/android/gms/internal/dl$b;

    new-instance v0, Lcom/google/android/gms/internal/dl;

    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kL:Lcom/google/android/gms/internal/dl$b;

    invoke-direct {v0, p1, v1}, Lcom/google/android/gms/internal/dl;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/dl$b;)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kB:Lcom/google/android/gms/internal/dl;

    invoke-interface {p4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;

    iget-object v2, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kB:Lcom/google/android/gms/internal/dl;

    invoke-virtual {v2, v0}, Lcom/google/android/gms/internal/dl;->registerConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V

    goto :goto_0

    :cond_0
    invoke-interface {p5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

    iget-object v2, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kB:Lcom/google/android/gms/internal/dl;

    invoke-virtual {v2, v0}, Lcom/google/android/gms/internal/dl;->registerConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V

    goto :goto_1

    :cond_1
    invoke-interface {p3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lcom/google/android/gms/common/api/Api;

    invoke-virtual {v1}, Lcom/google/android/gms/common/api/Api;->aV()Lcom/google/android/gms/common/api/Api$b;

    move-result-object v0

    invoke-interface {p3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/common/api/GoogleApiClient$ApiOptions;

    iget-object v7, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kI:Ljava/util/Map;

    iget-object v4, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kK:Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;

    new-instance v5, Lcom/google/android/gms/common/api/GoogleApiClient$3;

    invoke-direct {v5, p0, v0}, Lcom/google/android/gms/common/api/GoogleApiClient$3;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/common/api/Api$b;)V

    move-object v1, p1

    move-object v2, p2

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/common/api/Api$b;->b(Landroid/content/Context;Lcom/google/android/gms/internal/dh;Lcom/google/android/gms/common/api/GoogleApiClient$ApiOptions;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)Lcom/google/android/gms/common/api/Api$a;

    move-result-object v1

    invoke-interface {v7, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_2
    return-void
.end method

.method synthetic constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/dh;Ljava/util/Map;Ljava/util/Set;Ljava/util/Set;Lcom/google/android/gms/common/api/GoogleApiClient$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/content/Context;
    .param p2, "x1"    # Lcom/google/android/gms/internal/dh;
    .param p3, "x2"    # Ljava/util/Map;
    .param p4, "x3"    # Ljava/util/Set;
    .param p5, "x4"    # Ljava/util/Set;
    .param p6, "x5"    # Lcom/google/android/gms/common/api/GoogleApiClient$1;

    .prologue
    invoke-direct/range {p0 .. p5}, Lcom/google/android/gms/common/api/GoogleApiClient;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/dh;Ljava/util/Map;Ljava/util/Set;Ljava/util/Set;)V

    return-void
.end method

.method static synthetic a(Lcom/google/android/gms/common/api/GoogleApiClient;I)I
    .locals 0

    iput p1, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kE:I

    return p1
.end method

.method static synthetic a(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/common/ConnectionResult;)Lcom/google/android/gms/common/ConnectionResult;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kD:Lcom/google/android/gms/common/ConnectionResult;

    return-object p1
.end method

.method static synthetic a(Lcom/google/android/gms/common/api/GoogleApiClient;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kt:Ljava/lang/Object;

    return-object v0
.end method

.method private a(Lcom/google/android/gms/common/api/GoogleApiClient$a;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A::",
            "Lcom/google/android/gms/common/api/Api$a;",
            ">(",
            "Lcom/google/android/gms/common/api/GoogleApiClient$a",
            "<TA;>;)V"
        }
    .end annotation

    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kt:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/GoogleApiClient;->isConnected()Z

    move-result v0

    const-string v2, "GoogleApiClient is not connected yet."

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/du;->a(ZLjava/lang/Object;)V

    invoke-interface {p1}, Lcom/google/android/gms/common/api/GoogleApiClient$a;->aV()Lcom/google/android/gms/common/api/Api$b;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    const-string v2, "This task can not be executed or enqueued (it\'s probably a Batch or malformed)"

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/du;->a(ZLjava/lang/Object;)V

    invoke-interface {p1}, Lcom/google/android/gms/common/api/GoogleApiClient$a;->aV()Lcom/google/android/gms/common/api/Api$b;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->a(Lcom/google/android/gms/common/api/Api$b;)Lcom/google/android/gms/common/api/Api$a;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/google/android/gms/common/api/GoogleApiClient$a;->a(Lcom/google/android/gms/common/api/Api$a;)V

    monitor-exit v1

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private aY()V
    .locals 3

    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kt:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kG:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kG:I

    iget v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kG:I

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kD:Lcom/google/android/gms/common/ConnectionResult;

    if-eqz v0, :cond_2

    const/4 v0, 0x3

    iput v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kF:I

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kI:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Api$a;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/Api$a;->disconnect()V

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kB:Lcom/google/android/gms/internal/dl;

    iget-object v2, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kD:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/dl;->a(Lcom/google/android/gms/common/ConnectionResult;)V

    :cond_1
    :goto_1
    monitor-exit v1

    return-void

    :cond_2
    const/4 v0, 0x2

    iput v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kF:I

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kH:Landroid/os/Bundle;

    invoke-virtual {v0}, Landroid/os/Bundle;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x0

    :goto_2
    iget-object v2, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kB:Lcom/google/android/gms/internal/dl;

    invoke-virtual {v2, v0}, Lcom/google/android/gms/internal/dl;->b(Landroid/os/Bundle;)V

    invoke-direct {p0}, Lcom/google/android/gms/common/api/GoogleApiClient;->aZ()V

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kH:Landroid/os/Bundle;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2
.end method

.method private aZ()V
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/GoogleApiClient;->isConnected()Z

    move-result v0

    const-string v1, "GoogleApiClient is not connected yet."

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/du;->a(ZLjava/lang/Object;)V

    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kt:Ljava/lang/Object;

    monitor-enter v1

    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kC:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kC:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/GoogleApiClient$a;

    invoke-direct {p0, v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->a(Lcom/google/android/gms/common/api/GoogleApiClient$a;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_0
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void
.end method

.method static synthetic b(Lcom/google/android/gms/common/api/GoogleApiClient;)I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kF:I

    return v0
.end method

.method private ba()V
    .locals 4

    const/4 v3, 0x3

    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kt:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kJ:Z

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kC:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->clear()V

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kI:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Api$a;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/Api$a;->disconnect()V

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_0
    :try_start_1
    iget v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kF:I

    if-eq v0, v3, :cond_1

    const/4 v0, 0x3

    iput v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kF:I

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kB:Lcom/google/android/gms/internal/dl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/dl;->bG()V

    :cond_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void
.end method

.method static synthetic c(Lcom/google/android/gms/common/api/GoogleApiClient;)Landroid/os/Bundle;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kH:Landroid/os/Bundle;

    return-object v0
.end method

.method static synthetic d(Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/common/api/GoogleApiClient;->aY()V

    return-void
.end method

.method static synthetic e(Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/common/api/GoogleApiClient;->ba()V

    return-void
.end method

.method static synthetic f(Lcom/google/android/gms/common/api/GoogleApiClient;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kJ:Z

    return v0
.end method

.method static synthetic g(Lcom/google/android/gms/common/api/GoogleApiClient;)Lcom/google/android/gms/common/ConnectionResult;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kD:Lcom/google/android/gms/common/ConnectionResult;

    return-object v0
.end method

.method static synthetic h(Lcom/google/android/gms/common/api/GoogleApiClient;)I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kE:I

    return v0
.end method


# virtual methods
.method public a(Lcom/google/android/gms/common/api/Api$b;)Lcom/google/android/gms/common/api/Api$a;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C::",
            "Lcom/google/android/gms/common/api/Api$a;",
            ">(",
            "Lcom/google/android/gms/common/api/Api$b",
            "<TC;>;)TC;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kI:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Api$a;

    const-string v1, "Appropriate Api was not requested."

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/du;->c(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public a(Lcom/google/android/gms/common/api/a$a;)Lcom/google/android/gms/common/api/a$a;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A::",
            "Lcom/google/android/gms/common/api/Api$a;",
            "T:",
            "Lcom/google/android/gms/common/api/a$a",
            "<**TA;>;>(TT;)TT;"
        }
    .end annotation

    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kt:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/GoogleApiClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/GoogleApiClient;->b(Lcom/google/android/gms/common/api/a$a;)Lcom/google/android/gms/common/api/a$a;

    :goto_0
    monitor-exit v1

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kC:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public b(Lcom/google/android/gms/common/api/a$a;)Lcom/google/android/gms/common/api/a$a;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A::",
            "Lcom/google/android/gms/common/api/Api$a;",
            "T:",
            "Lcom/google/android/gms/common/api/a$a",
            "<**TA;>;>(TT;)TT;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/GoogleApiClient;->isConnected()Z

    move-result v0

    const-string v1, "GoogleApiClient is not connected yet."

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/du;->a(ZLjava/lang/Object;)V

    invoke-direct {p0}, Lcom/google/android/gms/common/api/GoogleApiClient;->aZ()V

    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/GoogleApiClient;->a(Lcom/google/android/gms/common/api/GoogleApiClient$a;)V

    return-object p1
.end method

.method public connect()V
    .locals 3

    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kt:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/GoogleApiClient;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/GoogleApiClient;->isConnecting()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    monitor-exit v1

    :goto_0
    return-void

    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kJ:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kD:Lcom/google/android/gms/common/ConnectionResult;

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kF:I

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kH:Landroid/os/Bundle;

    invoke-virtual {v0}, Landroid/os/Bundle;->clear()V

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kI:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kG:I

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kI:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Api$a;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/Api$a;->connect()V

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_2
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public disconnect()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/common/api/GoogleApiClient;->ba()V

    return-void
.end method

.method public isConnected()Z
    .locals 3

    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kt:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kF:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit v1

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public isConnecting()Z
    .locals 3

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kt:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget v2, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kF:I

    if-ne v2, v0, :cond_0

    :goto_0
    monitor-exit v1

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public isConnectionCallbacksRegistered(Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;)Z
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kB:Lcom/google/android/gms/internal/dl;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/dl;->isConnectionCallbacksRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)Z

    move-result v0

    return v0
.end method

.method public isConnectionFailedListenerRegistered(Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)Z
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kB:Lcom/google/android/gms/internal/dl;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/dl;->isConnectionFailedListenerRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)Z

    move-result v0

    return v0
.end method

.method public reconnect()V
    .locals 0

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/GoogleApiClient;->disconnect()V

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/GoogleApiClient;->connect()V

    return-void
.end method

.method public registerConnectionCallbacks(Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kB:Lcom/google/android/gms/internal/dl;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/dl;->registerConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V

    return-void
.end method

.method public registerConnectionFailedListener(Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kB:Lcom/google/android/gms/internal/dl;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/dl;->registerConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V

    return-void
.end method

.method public unregisterConnectionCallbacks(Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kB:Lcom/google/android/gms/internal/dl;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/dl;->unregisterConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V

    return-void
.end method

.method public unregisterConnectionFailedListener(Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient;->kB:Lcom/google/android/gms/internal/dl;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/dl;->unregisterConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V

    return-void
.end method
