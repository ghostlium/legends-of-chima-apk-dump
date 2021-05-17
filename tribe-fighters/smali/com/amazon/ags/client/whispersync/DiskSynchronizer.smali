.class public Lcom/amazon/ags/client/whispersync/DiskSynchronizer;
.super Ljava/lang/Object;
.source "DiskSynchronizer.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "GC_Whispersync"


# instance fields
.field private eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

.field private final gameDataMap:Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

.field private final localStorage:Lcom/amazon/ags/client/whispersync/storage/LocalStorage;

.field private final quietListener:Lcom/amazon/ags/client/whispersync/QuietPeriodListener;

.field private final syncRequestState:Lcom/amazon/ags/client/whispersync/SyncRequestState;

.field private final whispersyncEventPoster:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;


# direct methods
.method public constructor <init>(Lcom/amazon/ags/client/whispersync/InternalGameDataMap;Lcom/amazon/ags/client/whispersync/storage/LocalStorage;Lcom/amazon/ags/client/whispersync/SyncRequestState;Lcom/amazon/ags/client/whispersync/QuietPeriodListener;Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;Lcom/amazon/ags/client/metrics/EventCollectorClient;)V
    .locals 0
    .param p1, "gameDataMap"    # Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    .param p2, "localStorage"    # Lcom/amazon/ags/client/whispersync/storage/LocalStorage;
    .param p3, "syncRequestState"    # Lcom/amazon/ags/client/whispersync/SyncRequestState;
    .param p4, "quietListener"    # Lcom/amazon/ags/client/whispersync/QuietPeriodListener;
    .param p5, "whispersyncEventPoster"    # Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;
    .param p6, "eventCollectorClient"    # Lcom/amazon/ags/client/metrics/EventCollectorClient;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->gameDataMap:Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    .line 43
    iput-object p2, p0, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->localStorage:Lcom/amazon/ags/client/whispersync/storage/LocalStorage;

    .line 44
    iput-object p3, p0, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->syncRequestState:Lcom/amazon/ags/client/whispersync/SyncRequestState;

    .line 45
    iput-object p4, p0, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->quietListener:Lcom/amazon/ags/client/whispersync/QuietPeriodListener;

    .line 46
    iput-object p5, p0, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->whispersyncEventPoster:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    .line 47
    iput-object p6, p0, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    .line 48
    return-void
.end method

.method private reportBooleanEvent(Ljava/lang/String;JZ)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "timeElapsed"    # J
    .param p4, "succeeded"    # Z

    .prologue
    .line 114
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {p1, v1, v2, v3}, Lcom/amazon/ags/client/whispersync/metrics/WhispersyncMetricsFactory;->createBooleanGenericEvent(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Boolean;)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    move-result-object v0

    .line 115
    .local v0, "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    if-eqz v0, :cond_0

    .line 116
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-virtual {v1, v0}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->reportGenericEvent(Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;)V

    .line 118
    :cond_0
    return-void
.end method

.method private reportCountEvent(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 128
    const/4 v1, 0x1

    invoke-static {p1, v1}, Lcom/amazon/ags/client/whispersync/metrics/WhispersyncMetricsFactory;->createCountEvent(Ljava/lang/String;I)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    move-result-object v0

    .line 129
    .local v0, "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    if-eqz v0, :cond_0

    .line 130
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-virtual {v1, v0}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->reportGenericEvent(Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;)V

    .line 132
    :cond_0
    return-void
.end method

.method private reportTimeEvent(Ljava/lang/String;J)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "timeElapsed"    # J

    .prologue
    .line 121
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {p1, v1, v2}, Lcom/amazon/ags/client/whispersync/metrics/WhispersyncMetricsFactory;->createGenericEvent(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Long;)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    move-result-object v0

    .line 122
    .local v0, "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    if-eqz v0, :cond_0

    .line 123
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-virtual {v1, v0}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->reportGenericEvent(Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;)V

    .line 125
    :cond_0
    return-void
.end method


# virtual methods
.method public loadFromDisk()V
    .locals 11

    .prologue
    .line 58
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 59
    .local v4, "start":J
    const-string v7, "GC_Whispersync"

    const-string v8, "Initial load from disk started"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    const/4 v6, 0x0

    .line 65
    .local v6, "succeeded":Z
    :try_start_0
    iget-object v7, p0, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->localStorage:Lcom/amazon/ags/client/whispersync/storage/LocalStorage;

    invoke-interface {v7}, Lcom/amazon/ags/client/whispersync/storage/LocalStorage;->retrieve()Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    move-result-object v3

    .line 66
    .local v3, "gameDataMapOnDisk":Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    iget-object v7, p0, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->gameDataMap:Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    invoke-interface {v7, v3}, Lcom/amazon/ags/client/whispersync/InternalGameDataMap;->merge(Lcom/amazon/ags/client/whispersync/model/Mergeable;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/amazon/ags/AGSClientException; {:try_start_0 .. :try_end_0} :catch_1

    .line 67
    const/4 v6, 0x1

    .line 75
    .end local v3    # "gameDataMapOnDisk":Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 76
    .local v1, "end":J
    const-string v7, "GC_Whispersync"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Initial load from disk completed in "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sub-long v9, v1, v4

    invoke-virtual {v8, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " msec."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    const-string v7, "WHISPERSYNC_DISK_TO_MEMORY_SYNC"

    sub-long v8, v1, v4

    invoke-direct {p0, v7, v8, v9, v6}, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->reportBooleanEvent(Ljava/lang/String;JZ)V

    .line 78
    .end local v1    # "end":J
    :goto_1
    return-void

    .line 68
    :catch_0
    move-exception v0

    .line 69
    .local v0, "e":Ljava/io/IOException;
    const-string v7, "GC_Whispersync"

    const-string v8, "Initial load from disk failed"

    invoke-static {v7, v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 71
    .end local v0    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 72
    .local v0, "e":Lcom/amazon/ags/AGSClientException;
    const-string v7, "GC_Whispersync"

    const-string v8, "Initial load from disk failed"

    invoke-static {v7, v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public notifyDataChanged()V
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->quietListener:Lcom/amazon/ags/client/whispersync/QuietPeriodListener;

    invoke-interface {v0}, Lcom/amazon/ags/client/whispersync/QuietPeriodListener;->breakSilence()V

    .line 55
    return-void
.end method

.method public setEventCollectorClient(Lcom/amazon/ags/client/metrics/EventCollectorClient;)V
    .locals 0
    .param p1, "eventCollectorClient"    # Lcom/amazon/ags/client/metrics/EventCollectorClient;

    .prologue
    .line 107
    if-eqz p1, :cond_0

    .line 108
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    .line 110
    :cond_0
    return-void
.end method

.method public syncToDisk()V
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->quietListener:Lcom/amazon/ags/client/whispersync/QuietPeriodListener;

    invoke-interface {v0}, Lcom/amazon/ags/client/whispersync/QuietPeriodListener;->blockUntilQuiet()V

    .line 82
    invoke-virtual {p0}, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->syncToDiskNow()V

    .line 83
    return-void
.end method

.method public declared-synchronized syncToDiskNow()V
    .locals 6

    .prologue
    .line 89
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->syncRequestState:Lcom/amazon/ags/client/whispersync/SyncRequestState;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/amazon/ags/client/whispersync/SyncRequestState;->setDiskWriteRequested(Z)V

    .line 90
    const-string v3, "GC_Whispersync"

    const-string v4, "Starting write to file system"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 93
    :try_start_1
    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->gameDataMap:Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    invoke-interface {v3}, Lcom/amazon/ags/client/whispersync/InternalGameDataMap;->lockAndCopy()Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    move-result-object v2

    .line 94
    .local v2, "gameDataMapInMemory":Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->localStorage:Lcom/amazon/ags/client/whispersync/storage/LocalStorage;

    invoke-interface {v3, v2}, Lcom/amazon/ags/client/whispersync/storage/LocalStorage;->save(Lcom/amazon/ags/client/whispersync/InternalGameDataMap;)I

    move-result v0

    .line 95
    .local v0, "bytesWritten":I
    const-string v3, "GC_Whispersync"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Completed write of "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " bytes to file system"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->whispersyncEventPoster:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    sget-object v4, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->DISK_WRITE_COMPLETE:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    invoke-virtual {v3, v4}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->postEvent(Lcom/amazon/ags/client/whispersync/WhispersyncEvent;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lcom/amazon/ags/AGSClientException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 104
    .end local v0    # "bytesWritten":I
    .end local v2    # "gameDataMapInMemory":Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    :goto_0
    monitor-exit p0

    return-void

    .line 97
    :catch_0
    move-exception v1

    .line 98
    .local v1, "e":Ljava/io/IOException;
    :try_start_2
    const-string v3, "GC_Whispersync"

    const-string v4, "Unable to write to file system."

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 99
    const-string v3, "WHISPERSYNC_CLOUD_SYNC_IO_EXCEPTION"

    invoke-direct {p0, v3}, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->reportCountEvent(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 89
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 100
    :catch_1
    move-exception v1

    .line 101
    .local v1, "e":Lcom/amazon/ags/AGSClientException;
    :try_start_3
    const-string v3, "GC_Whispersync"

    const-string v4, "Unable to write to file system."

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 102
    const-string v3, "WHISPERSYNC_CLOUD_SYNC_CLIENT_EXCEPTION"

    invoke-direct {p0, v3}, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->reportCountEvent(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0
.end method
