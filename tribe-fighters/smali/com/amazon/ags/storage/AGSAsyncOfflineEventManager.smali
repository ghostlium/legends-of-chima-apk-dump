.class public Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;
.super Lcom/amazon/ags/storage/AGSOfflineEventManager;
.source "AGSAsyncOfflineEventManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager$1;,
        Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager$WorkerThread;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static final WORKER_THREAD_SLEEP_TIME_MS:J


# instance fields
.field private final globalState:Lcom/amazon/ags/html5/util/GlobalState;

.field private worker:Ljava/lang/Thread;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 23
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x5

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;->WORKER_THREAD_SLEEP_TIME_MS:J

    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;Lcom/amazon/ags/html5/util/NetworkUtil;Lcom/amazon/ags/html5/service/ServiceHelper;Lcom/amazon/ags/html5/util/GlobalState;)V
    .locals 0
    .param p1, "storage"    # Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;
    .param p2, "networkUtil"    # Lcom/amazon/ags/html5/util/NetworkUtil;
    .param p3, "serviceHelper"    # Lcom/amazon/ags/html5/service/ServiceHelper;
    .param p4, "globalState"    # Lcom/amazon/ags/html5/util/GlobalState;

    .prologue
    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/amazon/ags/storage/AGSOfflineEventManager;-><init>(Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;Lcom/amazon/ags/html5/util/NetworkUtil;Lcom/amazon/ags/html5/service/ServiceHelper;)V

    .line 35
    iput-object p4, p0, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    .line 37
    invoke-direct {p0}, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;->startWorker()V

    .line 38
    return-void
.end method

.method static synthetic access$100()J
    .locals 2

    .prologue
    .line 20
    sget-wide v0, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;->WORKER_THREAD_SLEEP_TIME_MS:J

    return-wide v0
.end method

.method static synthetic access$200(Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;)V
    .locals 0
    .param p0, "x0"    # Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;->handleWorkerThreadWork()V

    return-void
.end method

.method private handleWorkerThreadWork()V
    .locals 4

    .prologue
    .line 105
    iget-object v2, p0, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    invoke-virtual {v2}, Lcom/amazon/ags/html5/util/GlobalState;->getPlayerId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 106
    invoke-super {p0}, Lcom/amazon/ags/storage/AGSOfflineEventManager;->getNetworkUtil()Lcom/amazon/ags/html5/util/NetworkUtil;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-super {p0}, Lcom/amazon/ags/storage/AGSOfflineEventManager;->getNetworkUtil()Lcom/amazon/ags/html5/util/NetworkUtil;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazon/ags/html5/util/NetworkUtil;->isNetworkConnected()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 108
    :try_start_0
    invoke-virtual {p0}, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;->getNextEvent()Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;

    move-result-object v1

    .line 110
    .local v1, "eventTuple":Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;
    if-eqz v1, :cond_0

    .line 113
    invoke-super {p0, v1}, Lcom/amazon/ags/storage/AGSOfflineEventManager;->processOfflineEvent(Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;)V
    :try_end_0
    .catch Lcom/amazon/ags/storage/OfflineEventException; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    .end local v1    # "eventTuple":Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;
    :cond_0
    :goto_0
    return-void

    .line 115
    :catch_0
    move-exception v0

    .line 116
    .local v0, "e":Lcom/amazon/ags/storage/OfflineEventException;
    sget-object v2, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;->TAG:Ljava/lang/String;

    const-string v3, "Failed to process event: "

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private declared-synchronized shutdownWorker()V
    .locals 2

    .prologue
    .line 54
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;->worker:Ljava/lang/Thread;

    if-eqz v0, :cond_1

    .line 55
    const-class v1, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 56
    :try_start_1
    iget-object v0, p0, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;->worker:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 57
    iget-object v0, p0, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;->worker:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 58
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;->worker:Ljava/lang/Thread;

    .line 60
    :cond_0
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    :cond_1
    monitor-exit p0

    return-void

    .line 60
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 54
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized startWorker()V
    .locals 3

    .prologue
    .line 66
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;->worker:Ljava/lang/Thread;

    if-nez v0, :cond_1

    .line 67
    const-class v1, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 68
    :try_start_1
    iget-object v0, p0, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;->worker:Ljava/lang/Thread;

    if-nez v0, :cond_0

    .line 69
    new-instance v0, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager$WorkerThread;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager$WorkerThread;-><init>(Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager$1;)V

    iput-object v0, p0, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;->worker:Ljava/lang/Thread;

    .line 70
    iget-object v0, p0, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;->worker:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 72
    :cond_0
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 74
    :cond_1
    monitor-exit p0

    return-void

    .line 72
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 66
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public onPause()V
    .locals 0

    .prologue
    .line 42
    invoke-super {p0}, Lcom/amazon/ags/storage/AGSOfflineEventManager;->onPause()V

    .line 43
    invoke-direct {p0}, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;->shutdownWorker()V

    .line 44
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 48
    invoke-super {p0}, Lcom/amazon/ags/storage/AGSOfflineEventManager;->onResume()V

    .line 49
    invoke-direct {p0}, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;->startWorker()V

    .line 50
    return-void
.end method
