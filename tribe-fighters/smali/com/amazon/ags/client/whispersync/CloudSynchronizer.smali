.class public Lcom/amazon/ags/client/whispersync/CloudSynchronizer;
.super Ljava/lang/Object;
.source "CloudSynchronizer.java"


# static fields
.field private static final MIN_TIME_BETWEEN_ACTIVE_SYNCS_MS:J

.field private static final MIN_TIME_BETWEEN_PASSIVE_SYNCS_MS:J

.field private static final TAG:Ljava/lang/String; = "GC_Whispersync"


# instance fields
.field private final cloudStorage:Lcom/amazon/ags/client/whispersync/storage/RemoteStorage;

.field private eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

.field private final eventPoster:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

.field private final gameDataMap:Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

.field private final localStorage:Lcom/amazon/ags/client/whispersync/storage/LocalStorage;

.field private final networkUtil:Lcom/amazon/ags/html5/util/NetworkUtil;

.field private priorSyncTime:J

.field private final settingsManager:Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager;

.field private final syncRequestState:Lcom/amazon/ags/client/whispersync/SyncRequestState;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 28
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0xa

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->MIN_TIME_BETWEEN_ACTIVE_SYNCS_MS:J

    .line 29
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x1e

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->MIN_TIME_BETWEEN_PASSIVE_SYNCS_MS:J

    return-void
.end method

.method public constructor <init>(Lcom/amazon/ags/client/whispersync/InternalGameDataMap;Lcom/amazon/ags/client/whispersync/storage/LocalStorage;Lcom/amazon/ags/client/whispersync/storage/RemoteStorage;Lcom/amazon/ags/client/whispersync/SyncRequestState;Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;Lcom/amazon/ags/client/metrics/EventCollectorClient;Lcom/amazon/ags/html5/util/NetworkUtil;Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager;)V
    .locals 0
    .param p1, "gameDataMap"    # Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    .param p2, "localStorage"    # Lcom/amazon/ags/client/whispersync/storage/LocalStorage;
    .param p3, "cloudStorage"    # Lcom/amazon/ags/client/whispersync/storage/RemoteStorage;
    .param p4, "syncRequestState"    # Lcom/amazon/ags/client/whispersync/SyncRequestState;
    .param p5, "eventPoster"    # Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;
    .param p6, "eventCollectorClient"    # Lcom/amazon/ags/client/metrics/EventCollectorClient;
    .param p7, "networkUtil"    # Lcom/amazon/ags/html5/util/NetworkUtil;
    .param p8, "settingsManager"    # Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->gameDataMap:Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    .line 62
    iput-object p2, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->localStorage:Lcom/amazon/ags/client/whispersync/storage/LocalStorage;

    .line 63
    iput-object p3, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->cloudStorage:Lcom/amazon/ags/client/whispersync/storage/RemoteStorage;

    .line 64
    iput-object p4, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->syncRequestState:Lcom/amazon/ags/client/whispersync/SyncRequestState;

    .line 65
    iput-object p5, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->eventPoster:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    .line 66
    iput-object p6, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    .line 67
    iput-object p7, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->networkUtil:Lcom/amazon/ags/html5/util/NetworkUtil;

    .line 68
    iput-object p8, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->settingsManager:Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager;

    .line 69
    return-void
.end method

.method private downloadFromCloud()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/AGSClientException;,
            Lcom/amazon/ags/html5/comm/ConnectionException;,
            Lcom/amazon/ags/AGSServiceException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 109
    iget-object v6, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->networkUtil:Lcom/amazon/ags/html5/util/NetworkUtil;

    invoke-virtual {v6}, Lcom/amazon/ags/html5/util/NetworkUtil;->isNetworkConnected()Z

    move-result v6

    if-nez v6, :cond_0

    .line 110
    const-string v6, "GC_Whispersync"

    const-string v7, "Cannot sync with cloud because network is not connected"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    iget-object v6, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->eventPoster:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    sget-object v7, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->OFFLINE:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    invoke-virtual {v6, v7}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->postEvent(Lcom/amazon/ags/client/whispersync/WhispersyncEvent;)V

    .line 145
    :goto_0
    return-void

    .line 115
    :cond_0
    iget-object v6, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->settingsManager:Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager;

    invoke-interface {v6}, Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager;->isWhispersyncEnabled()Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;

    move-result-object v3

    .line 116
    .local v3, "isWhispersyncEnabled":Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;
    sget-object v6, Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;->NO:Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;

    if-ne v3, v6, :cond_1

    .line 117
    const-string v6, "GC_Whispersync"

    const-string v7, "Cannot sync with cloud because Whispersync is disabled"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    iget-object v6, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->eventPoster:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    sget-object v7, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->DISABLED:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    invoke-virtual {v6, v7}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->postEvent(Lcom/amazon/ags/client/whispersync/WhispersyncEvent;)V

    goto :goto_0

    .line 120
    :cond_1
    sget-object v6, Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;->MAYBE:Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;

    if-ne v3, v6, :cond_2

    .line 121
    const-string v6, "GC_Whispersync"

    const-string v7, "Cannot determine whether Whispersync is enabled."

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    iget-object v6, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->eventPoster:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    sget-object v7, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->ERROR_CLIENT:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    invoke-virtual {v6, v7}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->postEvent(Lcom/amazon/ags/client/whispersync/WhispersyncEvent;)V

    goto :goto_0

    .line 126
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 127
    .local v4, "start":J
    const-string v6, "GC_Whispersync"

    const-string v7, "Download from cloud started"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    iget-object v6, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->cloudStorage:Lcom/amazon/ags/client/whispersync/storage/RemoteStorage;

    iget-object v7, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->localStorage:Lcom/amazon/ags/client/whispersync/storage/LocalStorage;

    invoke-interface {v7}, Lcom/amazon/ags/client/whispersync/storage/LocalStorage;->getVersionId()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/amazon/ags/client/whispersync/storage/RemoteStorage;->retrieve(Ljava/lang/String;)Lcom/amazon/ags/client/whispersync/storage/GameData;

    move-result-object v0

    .line 129
    .local v0, "cloudData":Lcom/amazon/ags/client/whispersync/storage/GameData;
    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/storage/GameData;->getGameDataMap()Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    move-result-object v6

    if-eqz v6, :cond_4

    .line 130
    iget-object v6, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->gameDataMap:Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/storage/GameData;->getGameDataMap()Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/amazon/ags/client/whispersync/InternalGameDataMap;->merge(Lcom/amazon/ags/client/whispersync/model/Mergeable;)V

    .line 131
    iget-object v6, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->syncRequestState:Lcom/amazon/ags/client/whispersync/SyncRequestState;

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Lcom/amazon/ags/client/whispersync/SyncRequestState;->setDiskWriteRequested(Z)V

    .line 132
    iget-object v6, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->eventPoster:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    sget-object v7, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->NEW_DATA_FROM_CLOUD:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    invoke-virtual {v6, v7}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->postEvent(Lcom/amazon/ags/client/whispersync/WhispersyncEvent;)V

    .line 133
    invoke-direct {p0}, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->notifyJniNewCloudData()V

    .line 134
    const-string v6, "GC_Whispersync"

    const-string v7, "Download from cloud completed - New game data"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    :goto_1
    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/storage/GameData;->getVersionId()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_3

    .line 141
    iget-object v6, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->localStorage:Lcom/amazon/ags/client/whispersync/storage/LocalStorage;

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/storage/GameData;->getVersionId()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/amazon/ags/client/whispersync/storage/LocalStorage;->putVersionId(Ljava/lang/String;)V

    .line 143
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 144
    .local v1, "end":J
    const-string v6, "WHISPERSYNC_DOWNLOAD_FROM_CLOUD"

    sub-long v7, v1, v4

    invoke-direct {p0, v6, v7, v8}, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->reportTimeEvent(Ljava/lang/String;J)V

    goto/16 :goto_0

    .line 136
    .end local v1    # "end":J
    :cond_4
    const-string v6, "GC_Whispersync"

    const-string v7, "Download from cloud completed - No new game data"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private hasSuccessfullySynchronized()Z
    .locals 1

    .prologue
    .line 210
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->localStorage:Lcom/amazon/ags/client/whispersync/storage/LocalStorage;

    invoke-interface {v0}, Lcom/amazon/ags/client/whispersync/storage/LocalStorage;->hasSuccessfullySynchronized()Z

    move-result v0

    return v0
.end method

.method private notifyJniNewCloudData()V
    .locals 3

    .prologue
    .line 231
    :try_start_0
    invoke-static {}, Lcom/amazon/ags/jni/whispersync/WhispersyncJni;->onNewCloudData()V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 235
    :goto_0
    return-void

    .line 232
    :catch_0
    move-exception v0

    .line 233
    .local v0, "e":Ljava/lang/UnsatisfiedLinkError;
    const-string v1, "GC_Whispersync"

    const-string v2, "GameCircle JNI library not loaded, cannot call WhispersyncJni"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private reportCountEvent(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 245
    const/4 v1, 0x1

    invoke-static {p1, v1}, Lcom/amazon/ags/client/whispersync/metrics/WhispersyncMetricsFactory;->createCountEvent(Ljava/lang/String;I)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    move-result-object v0

    .line 246
    .local v0, "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    if-eqz v0, :cond_0

    .line 247
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-virtual {v1, v0}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->reportGenericEvent(Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;)V

    .line 249
    :cond_0
    return-void
.end method

.method private reportTimeEvent(Ljava/lang/String;J)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "timeElapsed"    # J

    .prologue
    .line 238
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {p1, v1, v2}, Lcom/amazon/ags/client/whispersync/metrics/WhispersyncMetricsFactory;->createGenericEvent(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Long;)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    move-result-object v0

    .line 239
    .local v0, "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    if-eqz v0, :cond_0

    .line 240
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-virtual {v1, v0}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->reportGenericEvent(Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;)V

    .line 242
    :cond_0
    return-void
.end method

.method private sleepWhileThrottled()V
    .locals 9

    .prologue
    .line 214
    iget-object v5, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->syncRequestState:Lcom/amazon/ags/client/whispersync/SyncRequestState;

    invoke-virtual {v5}, Lcom/amazon/ags/client/whispersync/SyncRequestState;->isActiveCloudWrite()Z

    move-result v5

    if-eqz v5, :cond_1

    sget-wide v3, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->MIN_TIME_BETWEEN_ACTIVE_SYNCS_MS:J

    .line 215
    .local v3, "throttleDuration":J
    :goto_0
    iget-object v5, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->syncRequestState:Lcom/amazon/ags/client/whispersync/SyncRequestState;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lcom/amazon/ags/client/whispersync/SyncRequestState;->setActiveCloudWrite(Z)V

    .line 216
    iget-wide v5, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->priorSyncTime:J

    add-long/2addr v5, v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long v1, v5, v7

    .line 217
    .local v1, "sleepInMsec":J
    const-wide/16 v5, 0x0

    cmp-long v5, v1, v5

    if-lez v5, :cond_0

    .line 219
    :try_start_0
    const-string v5, "GC_Whispersync"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Throttling network request.  Retrying in "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " msec."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    iget-object v5, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->eventPoster:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    sget-object v6, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->THROTTLED:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    invoke-virtual {v5, v6}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->postEvent(Lcom/amazon/ags/client/whispersync/WhispersyncEvent;)V

    .line 221
    const-string v5, "WHISPERSYNC_CLOUD_SYNC_THROTTLED"

    invoke-direct {p0, v5}, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->reportCountEvent(Ljava/lang/String;)V

    .line 222
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 227
    :cond_0
    :goto_1
    return-void

    .line 214
    .end local v1    # "sleepInMsec":J
    .end local v3    # "throttleDuration":J
    :cond_1
    sget-wide v3, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->MIN_TIME_BETWEEN_PASSIVE_SYNCS_MS:J

    goto :goto_0

    .line 223
    .restart local v1    # "sleepInMsec":J
    .restart local v3    # "throttleDuration":J
    :catch_0
    move-exception v0

    .line 224
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->interrupt()V

    goto :goto_1
.end method

.method private uploadToCloud()V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/amazon/ags/AGSClientException;,
            Lcom/amazon/ags/html5/comm/ConnectionException;,
            Lcom/amazon/ags/AGSServiceException;
        }
    .end annotation

    .prologue
    .line 149
    invoke-direct {p0}, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->sleepWhileThrottled()V

    .line 151
    iget-object v9, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->networkUtil:Lcom/amazon/ags/html5/util/NetworkUtil;

    invoke-virtual {v9}, Lcom/amazon/ags/html5/util/NetworkUtil;->isNetworkConnected()Z

    move-result v9

    if-nez v9, :cond_0

    .line 152
    const-string v9, "GC_Whispersync"

    const-string v10, "Cannot sync with cloud because network is not connected"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    iget-object v9, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->eventPoster:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    sget-object v10, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->OFFLINE:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    invoke-virtual {v9, v10}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->postEvent(Lcom/amazon/ags/client/whispersync/WhispersyncEvent;)V

    .line 207
    :goto_0
    return-void

    .line 157
    :cond_0
    iget-object v9, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->settingsManager:Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager;

    invoke-interface {v9}, Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager;->isWhispersyncEnabled()Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;

    move-result-object v4

    .line 158
    .local v4, "isWhispersyncEnabled":Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;
    sget-object v9, Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;->NO:Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;

    if-ne v4, v9, :cond_1

    .line 159
    const-string v9, "GC_Whispersync"

    const-string v10, "Cannot sync with cloud because Whispersync is disabled"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    iget-object v9, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->eventPoster:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    sget-object v10, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->DISABLED:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    invoke-virtual {v9, v10}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->postEvent(Lcom/amazon/ags/client/whispersync/WhispersyncEvent;)V

    goto :goto_0

    .line 162
    :cond_1
    sget-object v9, Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;->MAYBE:Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;

    if-ne v4, v9, :cond_2

    .line 163
    const-string v9, "GC_Whispersync"

    const-string v10, "Cannot determine whether Whispersync is enabled."

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    iget-object v9, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->eventPoster:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    sget-object v10, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->ERROR_CLIENT:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    invoke-virtual {v9, v10}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->postEvent(Lcom/amazon/ags/client/whispersync/WhispersyncEvent;)V

    goto :goto_0

    .line 168
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 169
    .local v6, "start":J
    const-string v9, "GC_Whispersync"

    const-string v10, "Upload to cloud started"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    iget-object v9, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->localStorage:Lcom/amazon/ags/client/whispersync/storage/LocalStorage;

    invoke-interface {v9}, Lcom/amazon/ags/client/whispersync/storage/LocalStorage;->getVersionId()Ljava/lang/String;

    move-result-object v8

    .line 175
    .local v8, "versionId":Ljava/lang/String;
    iget-object v9, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->syncRequestState:Lcom/amazon/ags/client/whispersync/SyncRequestState;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lcom/amazon/ags/client/whispersync/SyncRequestState;->setCloudWriteRequested(Z)V

    .line 178
    iget-object v9, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->gameDataMap:Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    invoke-interface {v9}, Lcom/amazon/ags/client/whispersync/InternalGameDataMap;->startSyncing()V

    .line 181
    iget-object v9, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->gameDataMap:Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    invoke-interface {v9}, Lcom/amazon/ags/client/whispersync/InternalGameDataMap;->lockAndCopy()Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    move-result-object v5

    .line 183
    .local v5, "snapshot":Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    new-instance v3, Lcom/amazon/ags/client/whispersync/storage/GameData;

    invoke-direct {v3, v5, v8}, Lcom/amazon/ags/client/whispersync/storage/GameData;-><init>(Lcom/amazon/ags/client/whispersync/InternalGameDataMap;Ljava/lang/String;)V

    .line 184
    .local v3, "gameData":Lcom/amazon/ags/client/whispersync/storage/GameData;
    iget-object v9, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->cloudStorage:Lcom/amazon/ags/client/whispersync/storage/RemoteStorage;

    invoke-interface {v9, v3}, Lcom/amazon/ags/client/whispersync/storage/RemoteStorage;->save(Lcom/amazon/ags/client/whispersync/storage/GameData;)Lcom/amazon/ags/client/whispersync/storage/GameData;

    move-result-object v0

    .line 185
    .local v0, "cloudGameData":Lcom/amazon/ags/client/whispersync/storage/GameData;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    iput-wide v9, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->priorSyncTime:J

    .line 186
    iget-object v9, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->eventPoster:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    sget-object v10, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->DATA_UPLOADED_TO_CLOUD:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    invoke-virtual {v9, v10}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->postEvent(Lcom/amazon/ags/client/whispersync/WhispersyncEvent;)V

    .line 187
    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/storage/GameData;->getGameDataMap()Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    move-result-object v9

    if-eqz v9, :cond_4

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/storage/GameData;->getGameDataMap()Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    move-result-object v9

    invoke-interface {v9}, Lcom/amazon/ags/client/whispersync/InternalGameDataMap;->size()I

    move-result v9

    if-lez v9, :cond_4

    .line 189
    const-string v9, "GC_Whispersync"

    const-string v10, "Upload to cloud resulted in new data merged from another device!"

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    iget-object v9, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->gameDataMap:Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/storage/GameData;->getGameDataMap()Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    move-result-object v10

    invoke-interface {v9, v10}, Lcom/amazon/ags/client/whispersync/InternalGameDataMap;->merge(Lcom/amazon/ags/client/whispersync/model/Mergeable;)V

    .line 191
    iget-object v9, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->syncRequestState:Lcom/amazon/ags/client/whispersync/SyncRequestState;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Lcom/amazon/ags/client/whispersync/SyncRequestState;->setDiskWriteRequested(Z)V

    .line 192
    iget-object v9, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->eventPoster:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    sget-object v10, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->NEW_DATA_FROM_CLOUD:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    invoke-virtual {v9, v10}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->postEvent(Lcom/amazon/ags/client/whispersync/WhispersyncEvent;)V

    .line 193
    const-string v9, "WHISPERSYNC_MERGE_ON_UPLOAD"

    invoke-direct {p0, v9}, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->reportCountEvent(Ljava/lang/String;)V

    .line 194
    invoke-direct {p0}, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->notifyJniNewCloudData()V

    .line 198
    :goto_1
    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/storage/GameData;->getVersionId()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_3

    .line 199
    iget-object v9, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->localStorage:Lcom/amazon/ags/client/whispersync/storage/LocalStorage;

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/storage/GameData;->getVersionId()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Lcom/amazon/ags/client/whispersync/storage/LocalStorage;->putVersionId(Ljava/lang/String;)V

    .line 202
    :cond_3
    iget-object v9, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->gameDataMap:Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    invoke-interface {v9}, Lcom/amazon/ags/client/whispersync/InternalGameDataMap;->completeSyncing()V

    .line 204
    const-string v9, "GC_Whispersync"

    const-string v10, "Upload to cloud completed"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 206
    .local v1, "end":J
    const-string v9, "WHISPERSYNC_UPLOAD_TO_CLOUD"

    sub-long v10, v1, v6

    invoke-direct {p0, v9, v10, v11}, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->reportTimeEvent(Ljava/lang/String;J)V

    goto/16 :goto_0

    .line 196
    .end local v1    # "end":J
    :cond_4
    iget-object v9, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->eventPoster:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    sget-object v10, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->ALREADY_SYNCED:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    invoke-virtual {v9, v10}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->postEvent(Lcom/amazon/ags/client/whispersync/WhispersyncEvent;)V

    goto :goto_1
.end method


# virtual methods
.method public setEventCollectorClient(Lcom/amazon/ags/client/metrics/EventCollectorClient;)V
    .locals 0
    .param p1, "eventCollectorClient"    # Lcom/amazon/ags/client/metrics/EventCollectorClient;

    .prologue
    .line 103
    if-eqz p1, :cond_0

    .line 104
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    .line 106
    :cond_0
    return-void
.end method

.method public syncToCloud()V
    .locals 3

    .prologue
    .line 73
    :try_start_0
    invoke-direct {p0}, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->hasSuccessfullySynchronized()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 74
    invoke-direct {p0}, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->uploadToCloud()V

    .line 100
    :cond_0
    :goto_0
    return-void

    .line 76
    :cond_1
    const-string v1, "GC_Whispersync"

    const-string v2, "Never synced from cloud.  Attempting initial download and merge."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    invoke-direct {p0}, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->downloadFromCloud()V

    .line 78
    invoke-direct {p0}, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->hasSuccessfullySynchronized()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 79
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->eventPoster:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    sget-object v2, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->FIRST_SYNC:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    invoke-virtual {v1, v2}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->postEvent(Lcom/amazon/ags/client/whispersync/WhispersyncEvent;)V

    .line 80
    invoke-direct {p0}, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->uploadToCloud()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/amazon/ags/AGSClientException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/amazon/ags/AGSServiceException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/amazon/ags/html5/comm/ConnectionException; {:try_start_0 .. :try_end_0} :catch_3

    goto :goto_0

    .line 83
    :catch_0
    move-exception v0

    .line 84
    .local v0, "e":Ljava/io/IOException;
    const-string v1, "GC_Whispersync"

    const-string v2, "Unable to perform full sync."

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 85
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->eventPoster:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    sget-object v2, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->ERROR_CLIENT:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    invoke-virtual {v1, v2}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->postEvent(Lcom/amazon/ags/client/whispersync/WhispersyncEvent;)V

    .line 86
    const-string v1, "WHISPERSYNC_CLOUD_SYNC_IO_EXCEPTION"

    invoke-direct {p0, v1}, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->reportCountEvent(Ljava/lang/String;)V

    goto :goto_0

    .line 87
    .end local v0    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 88
    .local v0, "e":Lcom/amazon/ags/AGSClientException;
    const-string v1, "GC_Whispersync"

    const-string v2, "Unable to perform full sync."

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 89
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->eventPoster:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    sget-object v2, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->ERROR_CLIENT:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    invoke-virtual {v1, v2}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->postEvent(Lcom/amazon/ags/client/whispersync/WhispersyncEvent;)V

    .line 90
    const-string v1, "WHISPERSYNC_CLOUD_SYNC_CLIENT_EXCEPTION"

    invoke-direct {p0, v1}, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->reportCountEvent(Ljava/lang/String;)V

    goto :goto_0

    .line 91
    .end local v0    # "e":Lcom/amazon/ags/AGSClientException;
    :catch_2
    move-exception v0

    .line 92
    .local v0, "e":Lcom/amazon/ags/AGSServiceException;
    const-string v1, "GC_Whispersync"

    const-string v2, "Unable to perform full sync."

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 93
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->eventPoster:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    sget-object v2, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->ERROR_SERVICE:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    invoke-virtual {v1, v2}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->postEvent(Lcom/amazon/ags/client/whispersync/WhispersyncEvent;)V

    .line 94
    const-string v1, "WHISPERSYNC_CLOUD_SYNC_SERVER_EXCEPTION"

    invoke-direct {p0, v1}, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->reportCountEvent(Ljava/lang/String;)V

    goto :goto_0

    .line 95
    .end local v0    # "e":Lcom/amazon/ags/AGSServiceException;
    :catch_3
    move-exception v0

    .line 96
    .local v0, "e":Lcom/amazon/ags/html5/comm/ConnectionException;
    const-string v1, "GC_Whispersync"

    const-string v2, "Unable to perform full sync due to Network Connection"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 97
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->eventPoster:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    sget-object v2, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->OFFLINE:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    invoke-virtual {v1, v2}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->postEvent(Lcom/amazon/ags/client/whispersync/WhispersyncEvent;)V

    .line 98
    const-string v1, "WHISPERSYNC_CLOUD_SYNC_NETWORK_EXCEPTION"

    invoke-direct {p0, v1}, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->reportCountEvent(Ljava/lang/String;)V

    goto :goto_0
.end method
