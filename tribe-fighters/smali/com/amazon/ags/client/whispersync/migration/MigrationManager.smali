.class public final Lcom/amazon/ags/client/whispersync/migration/MigrationManager;
.super Ljava/lang/Object;
.source "MigrationManager.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "GC_Whispersync"


# instance fields
.field private eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

.field private final migrationClient:Lcom/amazon/ags/client/whispersync/migration/MigrationHttpClient;

.field private final networkUtil:Lcom/amazon/ags/html5/util/NetworkUtil;

.field private final settingsManager:Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager;


# direct methods
.method public constructor <init>(Lcom/amazon/ags/client/whispersync/migration/MigrationHttpClient;Lcom/amazon/ags/html5/util/NetworkUtil;Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager;Lcom/amazon/ags/client/metrics/EventCollectorClient;)V
    .locals 0
    .param p1, "migrationClient"    # Lcom/amazon/ags/client/whispersync/migration/MigrationHttpClient;
    .param p2, "networkUtil"    # Lcom/amazon/ags/html5/util/NetworkUtil;
    .param p3, "settingsManager"    # Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager;
    .param p4, "eventCollectorClient"    # Lcom/amazon/ags/client/metrics/EventCollectorClient;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->migrationClient:Lcom/amazon/ags/client/whispersync/migration/MigrationHttpClient;

    .line 37
    iput-object p2, p0, Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->networkUtil:Lcom/amazon/ags/html5/util/NetworkUtil;

    .line 38
    iput-object p3, p0, Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->settingsManager:Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager;

    .line 39
    iput-object p4, p0, Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    .line 40
    return-void
.end method

.method static synthetic access$000(Lcom/amazon/ags/client/whispersync/migration/MigrationManager;Lcom/amazon/ags/api/whispersync/migration/MigrationCallback;)V
    .locals 0
    .param p0, "x0"    # Lcom/amazon/ags/client/whispersync/migration/MigrationManager;
    .param p1, "x1"    # Lcom/amazon/ags/api/whispersync/migration/MigrationCallback;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->downloadBackground(Lcom/amazon/ags/api/whispersync/migration/MigrationCallback;)V

    return-void
.end method

.method private downloadBackground(Lcom/amazon/ags/api/whispersync/migration/MigrationCallback;)V
    .locals 7
    .param p1, "callback"    # Lcom/amazon/ags/api/whispersync/migration/MigrationCallback;

    .prologue
    const/4 v6, 0x0

    .line 52
    iget-object v4, p0, Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->networkUtil:Lcom/amazon/ags/html5/util/NetworkUtil;

    invoke-virtual {v4}, Lcom/amazon/ags/html5/util/NetworkUtil;->isNetworkConnected()Z

    move-result v4

    if-nez v4, :cond_0

    .line 53
    sget-object v4, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->NETWORK_FAILURE:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-interface {p1, v4, v6}, Lcom/amazon/ags/api/whispersync/migration/MigrationCallback;->onComplete(Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;[B)V

    .line 54
    sget-object v4, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->NETWORK_FAILURE:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-direct {p0, v4}, Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->reportMigrationEventWithResultCode(Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;)V

    .line 86
    :goto_0
    return-void

    .line 58
    :cond_0
    iget-object v4, p0, Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->settingsManager:Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager;

    invoke-interface {v4}, Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager;->isWhispersyncEnabled()Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;

    move-result-object v4

    sget-object v5, Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;->NO:Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;

    if-ne v4, v5, :cond_1

    .line 59
    sget-object v4, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->WHISPERSYNC_OFF:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-interface {p1, v4, v6}, Lcom/amazon/ags/api/whispersync/migration/MigrationCallback;->onComplete(Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;[B)V

    .line 60
    sget-object v4, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->WHISPERSYNC_OFF:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-direct {p0, v4}, Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->reportMigrationEventWithResultCode(Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;)V

    goto :goto_0

    .line 66
    :cond_1
    :try_start_0
    iget-object v4, p0, Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->migrationClient:Lcom/amazon/ags/client/whispersync/migration/MigrationHttpClient;

    invoke-virtual {v4}, Lcom/amazon/ags/client/whispersync/migration/MigrationHttpClient;->getV1GameDataDownloadUrl()Ljava/lang/String;
    :try_end_0
    .catch Lcom/amazon/ags/html5/comm/ConnectionException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v3

    .line 77
    .local v3, "signedURL":Ljava/lang/String;
    if-nez v3, :cond_2

    .line 78
    sget-object v4, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->FAILURE:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-interface {p1, v4, v6}, Lcom/amazon/ags/api/whispersync/migration/MigrationCallback;->onComplete(Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;[B)V

    .line 79
    sget-object v4, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->FAILURE:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-direct {p0, v4}, Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->reportMigrationEventWithResultCode(Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;)V

    goto :goto_0

    .line 67
    .end local v3    # "signedURL":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 68
    .local v0, "e":Lcom/amazon/ags/html5/comm/ConnectionException;
    sget-object v4, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->NETWORK_FAILURE:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-interface {p1, v4, v6}, Lcom/amazon/ags/api/whispersync/migration/MigrationCallback;->onComplete(Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;[B)V

    .line 69
    sget-object v4, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->NETWORK_FAILURE:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-direct {p0, v4}, Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->reportMigrationEventWithResultCode(Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;)V

    goto :goto_0

    .line 71
    .end local v0    # "e":Lcom/amazon/ags/html5/comm/ConnectionException;
    :catch_1
    move-exception v1

    .line 72
    .local v1, "others":Ljava/lang/Exception;
    sget-object v4, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->FAILURE:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-interface {p1, v4, v6}, Lcom/amazon/ags/api/whispersync/migration/MigrationCallback;->onComplete(Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;[B)V

    .line 73
    sget-object v4, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->FAILURE:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-direct {p0, v4}, Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->reportMigrationEventWithResultCode(Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;)V

    goto :goto_0

    .line 83
    .end local v1    # "others":Ljava/lang/Exception;
    .restart local v3    # "signedURL":Ljava/lang/String;
    :cond_2
    iget-object v4, p0, Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->migrationClient:Lcom/amazon/ags/client/whispersync/migration/MigrationHttpClient;

    invoke-virtual {v4, v3}, Lcom/amazon/ags/client/whispersync/migration/MigrationHttpClient;->download(Ljava/lang/String;)Lcom/amazon/ags/client/whispersync/migration/DownloadResult;

    move-result-object v2

    .line 84
    .local v2, "result":Lcom/amazon/ags/client/whispersync/migration/DownloadResult;
    invoke-virtual {v2}, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;->getResultCode()Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    move-result-object v4

    invoke-virtual {v2}, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;->getGameData()[B

    move-result-object v5

    invoke-interface {p1, v4, v5}, Lcom/amazon/ags/api/whispersync/migration/MigrationCallback;->onComplete(Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;[B)V

    .line 85
    invoke-virtual {v2}, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;->getResultCode()Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->reportMigrationEventWithResultCode(Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;)V

    goto :goto_0
.end method

.method private getEventNameFromResultCode(Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;)Ljava/lang/String;
    .locals 1
    .param p1, "resultCode"    # Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    .prologue
    .line 132
    sget-object v0, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->FAILURE:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-virtual {v0, p1}, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 133
    const-string v0, "WHISPERSYNC_V1_MIGRATION_FAILURE"

    .line 142
    :goto_0
    return-object v0

    .line 134
    :cond_0
    sget-object v0, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->NETWORK_FAILURE:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-virtual {v0, p1}, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 135
    const-string v0, "WHISPERSYNC_V1_MIGRATION_NO_NETWORK"

    goto :goto_0

    .line 136
    :cond_1
    sget-object v0, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->NO_DATA:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-virtual {v0, p1}, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 137
    const-string v0, "WHISPERSYNC_V1_MIGRATION_NO_DATA"

    goto :goto_0

    .line 138
    :cond_2
    sget-object v0, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->WHISPERSYNC_OFF:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-virtual {v0, p1}, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 139
    const-string v0, "WHISPERSYNC_V1_MIGRATION_WHISPERSYNC_OFF"

    goto :goto_0

    .line 142
    :cond_3
    const-string v0, "WHISPERSYNC_V1_MIGRATION"

    goto :goto_0
.end method

.method private reportMigrationEvent(Z)V
    .locals 3
    .param p1, "succeeded"    # Z

    .prologue
    .line 118
    const-string v1, "WHISPERSYNC_V1_MIGRATION"

    const/4 v2, 0x1

    invoke-static {v1, v2, p1}, Lcom/amazon/ags/client/whispersync/metrics/WhispersyncMetricsFactory;->createBooleanCountEvent(Ljava/lang/String;IZ)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    move-result-object v0

    .line 119
    .local v0, "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    if-eqz v0, :cond_0

    .line 120
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-virtual {v1, v0}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->reportGenericEvent(Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;)V

    .line 122
    :cond_0
    return-void
.end method

.method private reportMigrationEventWithResultCode(Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;)V
    .locals 3
    .param p1, "resultCode"    # Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    .prologue
    .line 107
    invoke-direct {p0, p1}, Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->getEventNameFromResultCode(Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;)Ljava/lang/String;

    move-result-object v1

    .line 108
    .local v1, "eventName":Ljava/lang/String;
    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/amazon/ags/client/whispersync/metrics/WhispersyncMetricsFactory;->createCountEvent(Ljava/lang/String;I)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    move-result-object v0

    .line 109
    .local v0, "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    if-eqz v0, :cond_0

    .line 110
    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-virtual {v2, v0}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->reportGenericEvent(Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;)V

    .line 114
    :cond_0
    sget-object v2, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->SUCCESS:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-virtual {v2, p1}, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->equals(Ljava/lang/Object;)Z

    move-result v2

    invoke-direct {p0, v2}, Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->reportMigrationEvent(Z)V

    .line 115
    return-void
.end method

.method private reportUnpackMultifile(Z)V
    .locals 3
    .param p1, "succeeded"    # Z

    .prologue
    .line 125
    const-string v1, "WHISPERSYNC_V1_UNPACK_MULTIFILE"

    const/4 v2, 0x1

    invoke-static {v1, v2, p1}, Lcom/amazon/ags/client/whispersync/metrics/WhispersyncMetricsFactory;->createBooleanCountEvent(Ljava/lang/String;IZ)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    move-result-object v0

    .line 126
    .local v0, "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    if-eqz v0, :cond_0

    .line 127
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-virtual {v1, v0}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->reportGenericEvent(Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;)V

    .line 129
    :cond_0
    return-void
.end method


# virtual methods
.method public downloadV1GameData(Lcom/amazon/ags/api/whispersync/migration/MigrationCallback;)V
    .locals 1
    .param p1, "callback"    # Lcom/amazon/ags/api/whispersync/migration/MigrationCallback;

    .prologue
    .line 43
    new-instance v0, Lcom/amazon/ags/client/whispersync/migration/MigrationManager$1;

    invoke-direct {v0, p0, p1}, Lcom/amazon/ags/client/whispersync/migration/MigrationManager$1;-><init>(Lcom/amazon/ags/client/whispersync/migration/MigrationManager;Lcom/amazon/ags/api/whispersync/migration/MigrationCallback;)V

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/migration/MigrationManager$1;->start()V

    .line 49
    return-void
.end method

.method public setEventCollectorClient(Lcom/amazon/ags/client/metrics/EventCollectorClient;)V
    .locals 0
    .param p1, "eventCollectorClient"    # Lcom/amazon/ags/client/metrics/EventCollectorClient;

    .prologue
    .line 101
    if-eqz p1, :cond_0

    .line 102
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    .line 104
    :cond_0
    return-void
.end method

.method public unpackV1MultiFileGameData([BLjava/io/File;)V
    .locals 4
    .param p1, "data"    # [B
    .param p2, "targetDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 89
    new-instance v1, Lcom/amazon/ags/client/whispersync/migration/ZipUtil;

    invoke-direct {v1}, Lcom/amazon/ags/client/whispersync/migration/ZipUtil;-><init>()V

    .line 91
    .local v1, "zipUtil":Lcom/amazon/ags/client/whispersync/migration/ZipUtil;
    :try_start_0
    invoke-virtual {v1, p1, p2}, Lcom/amazon/ags/client/whispersync/migration/ZipUtil;->unzip([BLjava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    const-string v2, "GC_Whispersync"

    const-string v3, "Successfully unpacked new multi-file game data"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->reportUnpackMultifile(Z)V

    .line 98
    return-void

    .line 92
    :catch_0
    move-exception v0

    .line 93
    .local v0, "ioe":Ljava/io/IOException;
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->reportUnpackMultifile(Z)V

    .line 94
    throw v0
.end method
