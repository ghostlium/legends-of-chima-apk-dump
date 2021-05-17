.class public Lcom/amazon/ags/client/whispersync/SynchronizationManager;
.super Ljava/lang/Object;
.source "SynchronizationManager.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "GC_Whispersync"


# instance fields
.field private cloudSyncInProgress:Z

.field private cloudSynchronizer:Lcom/amazon/ags/client/whispersync/CloudSynchronizer;

.field private diskSyncInProgress:Z

.field private final diskSynchronizer:Lcom/amazon/ags/client/whispersync/DiskSynchronizer;

.field private final eventPoster:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

.field private final syncRequestState:Lcom/amazon/ags/client/whispersync/SyncRequestState;


# direct methods
.method public constructor <init>(Lcom/amazon/ags/client/whispersync/DiskSynchronizer;Lcom/amazon/ags/client/whispersync/SyncRequestState;Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;)V
    .locals 2
    .param p1, "diskSynchronizer"    # Lcom/amazon/ags/client/whispersync/DiskSynchronizer;
    .param p2, "syncRequestState"    # Lcom/amazon/ags/client/whispersync/SyncRequestState;
    .param p3, "eventPoster"    # Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    .prologue
    const/4 v1, 0x0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->cloudSynchronizer:Lcom/amazon/ags/client/whispersync/CloudSynchronizer;

    .line 17
    iput-boolean v1, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->diskSyncInProgress:Z

    .line 18
    iput-boolean v1, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->cloudSyncInProgress:Z

    .line 25
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->diskSynchronizer:Lcom/amazon/ags/client/whispersync/DiskSynchronizer;

    .line 26
    iput-object p2, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->syncRequestState:Lcom/amazon/ags/client/whispersync/SyncRequestState;

    .line 27
    iput-object p3, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->eventPoster:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    .line 28
    return-void
.end method

.method static synthetic access$000(Lcom/amazon/ags/client/whispersync/SynchronizationManager;)Lcom/amazon/ags/client/whispersync/SyncRequestState;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/client/whispersync/SynchronizationManager;

    .prologue
    .line 11
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->syncRequestState:Lcom/amazon/ags/client/whispersync/SyncRequestState;

    return-object v0
.end method

.method static synthetic access$100(Lcom/amazon/ags/client/whispersync/SynchronizationManager;)Lcom/amazon/ags/client/whispersync/DiskSynchronizer;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/client/whispersync/SynchronizationManager;

    .prologue
    .line 11
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->diskSynchronizer:Lcom/amazon/ags/client/whispersync/DiskSynchronizer;

    return-object v0
.end method

.method static synthetic access$200(Lcom/amazon/ags/client/whispersync/SynchronizationManager;)V
    .locals 0
    .param p0, "x0"    # Lcom/amazon/ags/client/whispersync/SynchronizationManager;

    .prologue
    .line 11
    invoke-direct {p0}, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->startCloudSyncThread()V

    return-void
.end method

.method static synthetic access$302(Lcom/amazon/ags/client/whispersync/SynchronizationManager;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/amazon/ags/client/whispersync/SynchronizationManager;
    .param p1, "x1"    # Z

    .prologue
    .line 11
    iput-boolean p1, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->diskSyncInProgress:Z

    return p1
.end method

.method static synthetic access$400(Lcom/amazon/ags/client/whispersync/SynchronizationManager;)Lcom/amazon/ags/client/whispersync/CloudSynchronizer;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/client/whispersync/SynchronizationManager;

    .prologue
    .line 11
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->cloudSynchronizer:Lcom/amazon/ags/client/whispersync/CloudSynchronizer;

    return-object v0
.end method

.method static synthetic access$502(Lcom/amazon/ags/client/whispersync/SynchronizationManager;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/amazon/ags/client/whispersync/SynchronizationManager;
    .param p1, "x1"    # Z

    .prologue
    .line 11
    iput-boolean p1, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->cloudSyncInProgress:Z

    return p1
.end method

.method private declared-synchronized startCloudSyncThread()V
    .locals 2

    .prologue
    .line 98
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->cloudSynchronizer:Lcom/amazon/ags/client/whispersync/CloudSynchronizer;

    if-nez v0, :cond_1

    .line 99
    const-string v0, "GC_Whispersync"

    const-string v1, "WhispersyncClient has not completed initialization.  Cloud synchronization not available yet"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->eventPoster:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    sget-object v1, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->ERROR_CLIENT:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    invoke-virtual {v0, v1}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->postEvent(Lcom/amazon/ags/client/whispersync/WhispersyncEvent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 120
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 103
    :cond_1
    :try_start_1
    iget-boolean v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->cloudSyncInProgress:Z

    if-nez v0, :cond_0

    .line 104
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->cloudSyncInProgress:Z

    .line 105
    new-instance v0, Lcom/amazon/ags/client/whispersync/SynchronizationManager$2;

    invoke-direct {v0, p0}, Lcom/amazon/ags/client/whispersync/SynchronizationManager$2;-><init>(Lcom/amazon/ags/client/whispersync/SynchronizationManager;)V

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/SynchronizationManager$2;->start()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 98
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized startDiskSyncThread()V
    .locals 1

    .prologue
    .line 76
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->diskSyncInProgress:Z

    if-nez v0, :cond_0

    .line 77
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->diskSyncInProgress:Z

    .line 78
    new-instance v0, Lcom/amazon/ags/client/whispersync/SynchronizationManager$1;

    invoke-direct {v0, p0}, Lcom/amazon/ags/client/whispersync/SynchronizationManager$1;-><init>(Lcom/amazon/ags/client/whispersync/SynchronizationManager;)V

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/SynchronizationManager$1;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    :cond_0
    monitor-exit p0

    return-void

    .line 76
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public flush()V
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->diskSynchronizer:Lcom/amazon/ags/client/whispersync/DiskSynchronizer;

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->syncToDiskNow()V

    .line 53
    return-void
.end method

.method public setCloudSynchronizer(Lcom/amazon/ags/client/whispersync/CloudSynchronizer;)V
    .locals 0
    .param p1, "cloudSynchronizer"    # Lcom/amazon/ags/client/whispersync/CloudSynchronizer;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->cloudSynchronizer:Lcom/amazon/ags/client/whispersync/CloudSynchronizer;

    .line 32
    return-void
.end method

.method public setEventCollectorClient(Lcom/amazon/ags/client/metrics/EventCollectorClient;)V
    .locals 1
    .param p1, "eventCollectorClient"    # Lcom/amazon/ags/client/metrics/EventCollectorClient;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->diskSynchronizer:Lcom/amazon/ags/client/whispersync/DiskSynchronizer;

    if-eqz v0, :cond_0

    .line 64
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->diskSynchronizer:Lcom/amazon/ags/client/whispersync/DiskSynchronizer;

    invoke-virtual {v0, p1}, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->setEventCollectorClient(Lcom/amazon/ags/client/metrics/EventCollectorClient;)V

    .line 66
    :cond_0
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->cloudSynchronizer:Lcom/amazon/ags/client/whispersync/CloudSynchronizer;

    if-eqz v0, :cond_1

    .line 67
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->cloudSynchronizer:Lcom/amazon/ags/client/whispersync/CloudSynchronizer;

    invoke-virtual {v0, p1}, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->setEventCollectorClient(Lcom/amazon/ags/client/metrics/EventCollectorClient;)V

    .line 69
    :cond_1
    return-void
.end method

.method public syncActively()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 35
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->syncRequestState:Lcom/amazon/ags/client/whispersync/SyncRequestState;

    invoke-virtual {v0, v1}, Lcom/amazon/ags/client/whispersync/SyncRequestState;->setDiskWriteRequested(Z)V

    .line 36
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->syncRequestState:Lcom/amazon/ags/client/whispersync/SyncRequestState;

    invoke-virtual {v0, v1}, Lcom/amazon/ags/client/whispersync/SyncRequestState;->setCloudWriteRequested(Z)V

    .line 37
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->syncRequestState:Lcom/amazon/ags/client/whispersync/SyncRequestState;

    invoke-virtual {v0, v1}, Lcom/amazon/ags/client/whispersync/SyncRequestState;->setActiveCloudWrite(Z)V

    .line 38
    invoke-direct {p0}, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->startDiskSyncThread()V

    .line 39
    return-void
.end method

.method public declared-synchronized syncFromDiskToMemory()V
    .locals 1

    .prologue
    .line 59
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->diskSynchronizer:Lcom/amazon/ags/client/whispersync/DiskSynchronizer;

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->loadFromDisk()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    monitor-exit p0

    return-void

    .line 59
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public syncPassively()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 42
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->syncRequestState:Lcom/amazon/ags/client/whispersync/SyncRequestState;

    invoke-virtual {v0, v1}, Lcom/amazon/ags/client/whispersync/SyncRequestState;->setDiskWriteRequested(Z)V

    .line 43
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->syncRequestState:Lcom/amazon/ags/client/whispersync/SyncRequestState;

    invoke-virtual {v0, v1}, Lcom/amazon/ags/client/whispersync/SyncRequestState;->setCloudWriteRequested(Z)V

    .line 44
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->diskSynchronizer:Lcom/amazon/ags/client/whispersync/DiskSynchronizer;

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->notifyDataChanged()V

    .line 45
    invoke-direct {p0}, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->startDiskSyncThread()V

    .line 46
    return-void
.end method
