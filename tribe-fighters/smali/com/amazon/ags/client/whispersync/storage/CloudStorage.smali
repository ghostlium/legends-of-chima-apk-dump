.class public Lcom/amazon/ags/client/whispersync/storage/CloudStorage;
.super Ljava/lang/Object;
.source "CloudStorage.java"

# interfaces
.implements Lcom/amazon/ags/client/whispersync/storage/RemoteStorage;


# static fields
.field private static final TAG:Ljava/lang/String; = "GC_Whispersync"


# instance fields
.field private final marshaller:Lcom/amazon/ags/client/whispersync/marshaller/GameDataMarshaller;

.field private final serviceSyncedClock:Lcom/amazon/ags/client/whispersync/clock/GameDataServiceSyncedClock;

.field private final whispersyncHttpClient:Lcom/amazon/ags/client/whispersync/network/WhispersyncHttpClient;


# direct methods
.method public constructor <init>(Lcom/amazon/ags/client/whispersync/network/WhispersyncHttpClient;Lcom/amazon/ags/client/whispersync/marshaller/GameDataMarshaller;Lcom/amazon/ags/client/whispersync/clock/GameDataServiceSyncedClock;)V
    .locals 0
    .param p1, "whispersyncHttpClient"    # Lcom/amazon/ags/client/whispersync/network/WhispersyncHttpClient;
    .param p2, "marshaller"    # Lcom/amazon/ags/client/whispersync/marshaller/GameDataMarshaller;
    .param p3, "serviceSyncedClock"    # Lcom/amazon/ags/client/whispersync/clock/GameDataServiceSyncedClock;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/storage/CloudStorage;->whispersyncHttpClient:Lcom/amazon/ags/client/whispersync/network/WhispersyncHttpClient;

    .line 35
    iput-object p2, p0, Lcom/amazon/ags/client/whispersync/storage/CloudStorage;->marshaller:Lcom/amazon/ags/client/whispersync/marshaller/GameDataMarshaller;

    .line 36
    iput-object p3, p0, Lcom/amazon/ags/client/whispersync/storage/CloudStorage;->serviceSyncedClock:Lcom/amazon/ags/client/whispersync/clock/GameDataServiceSyncedClock;

    .line 37
    return-void
.end method


# virtual methods
.method public retrieve(Ljava/lang/String;)Lcom/amazon/ags/client/whispersync/storage/GameData;
    .locals 7
    .param p1, "priorVersionId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/AGSClientException;,
            Lcom/amazon/ags/AGSServiceException;,
            Lcom/amazon/ags/html5/comm/ConnectionException;
        }
    .end annotation

    .prologue
    .line 64
    iget-object v4, p0, Lcom/amazon/ags/client/whispersync/storage/CloudStorage;->whispersyncHttpClient:Lcom/amazon/ags/client/whispersync/network/WhispersyncHttpClient;

    invoke-interface {v4, p1}, Lcom/amazon/ags/client/whispersync/network/WhispersyncHttpClient;->getWhisperData(Ljava/lang/String;)Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;

    move-result-object v3

    .line 65
    .local v3, "whispersyncResponse":Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;
    invoke-virtual {v3}, Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;->getDocument()Ljava/lang/String;

    move-result-object v0

    .line 66
    .local v0, "document":Ljava/lang/String;
    invoke-virtual {v3}, Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;->getVersionId()Ljava/lang/String;

    move-result-object v2

    .line 68
    .local v2, "versionId":Ljava/lang/String;
    iget-object v4, p0, Lcom/amazon/ags/client/whispersync/storage/CloudStorage;->serviceSyncedClock:Lcom/amazon/ags/client/whispersync/clock/GameDataServiceSyncedClock;

    invoke-virtual {v3}, Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;->getDate()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/amazon/ags/client/whispersync/clock/GameDataServiceSyncedClock;->synchronizeClock(Ljava/lang/String;)V

    .line 70
    const/4 v1, 0x0

    .line 71
    .local v1, "gameDataMap":Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    if-eqz v0, :cond_0

    .line 72
    const-string v4, "GC_Whispersync"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Received document ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "] from the service, calling the marshaller"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    iget-object v4, p0, Lcom/amazon/ags/client/whispersync/storage/CloudStorage;->marshaller:Lcom/amazon/ags/client/whispersync/marshaller/GameDataMarshaller;

    invoke-interface {v4, v0}, Lcom/amazon/ags/client/whispersync/marshaller/GameDataMarshaller;->parse(Ljava/lang/String;)Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    move-result-object v1

    .line 78
    :goto_0
    const-string v4, "GC_Whispersync"

    const-string v5, "Finished retrieving Whispersync data from the cloud"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    new-instance v4, Lcom/amazon/ags/client/whispersync/storage/GameData;

    invoke-direct {v4, v1, v2}, Lcom/amazon/ags/client/whispersync/storage/GameData;-><init>(Lcom/amazon/ags/client/whispersync/InternalGameDataMap;Ljava/lang/String;)V

    return-object v4

    .line 75
    :cond_0
    const-string v4, "GC_Whispersync"

    const-string v5, "Received an empty document from the service"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public save(Lcom/amazon/ags/client/whispersync/storage/GameData;)Lcom/amazon/ags/client/whispersync/storage/GameData;
    .locals 9
    .param p1, "gameData"    # Lcom/amazon/ags/client/whispersync/storage/GameData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/AGSClientException;,
            Lcom/amazon/ags/AGSServiceException;,
            Lcom/amazon/ags/html5/comm/ConnectionException;
        }
    .end annotation

    .prologue
    .line 42
    iget-object v6, p0, Lcom/amazon/ags/client/whispersync/storage/CloudStorage;->marshaller:Lcom/amazon/ags/client/whispersync/marshaller/GameDataMarshaller;

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/storage/GameData;->getGameDataMap()Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/amazon/ags/client/whispersync/marshaller/GameDataMarshaller;->composeForService(Lcom/amazon/ags/client/whispersync/InternalGameDataMap;)Ljava/lang/String;

    move-result-object v1

    .line 44
    .local v1, "document":Ljava/lang/String;
    const-string v6, "GC_Whispersync"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Uploading document to cloud: ["

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "]"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    new-instance v5, Lcom/amazon/ags/client/whispersync/network/WhispersyncRequest;

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/storage/GameData;->getVersionId()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v1, v6}, Lcom/amazon/ags/client/whispersync/network/WhispersyncRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .local v5, "whispersyncRequest":Lcom/amazon/ags/client/whispersync/network/WhispersyncRequest;
    iget-object v6, p0, Lcom/amazon/ags/client/whispersync/storage/CloudStorage;->whispersyncHttpClient:Lcom/amazon/ags/client/whispersync/network/WhispersyncHttpClient;

    invoke-interface {v6, v5}, Lcom/amazon/ags/client/whispersync/network/WhispersyncHttpClient;->postWhisperData(Lcom/amazon/ags/client/whispersync/network/WhispersyncRequest;)Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;

    move-result-object v4

    .line 48
    .local v4, "response":Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;
    iget-object v6, p0, Lcom/amazon/ags/client/whispersync/storage/CloudStorage;->serviceSyncedClock:Lcom/amazon/ags/client/whispersync/clock/GameDataServiceSyncedClock;

    invoke-virtual {v4}, Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;->getDate()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/amazon/ags/client/whispersync/clock/GameDataServiceSyncedClock;->synchronizeClock(Ljava/lang/String;)V

    .line 50
    invoke-virtual {v4}, Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;->getDocument()Ljava/lang/String;

    move-result-object v0

    .line 51
    .local v0, "cloudMergedDocument":Ljava/lang/String;
    const/4 v2, 0x0

    .line 52
    .local v2, "newMap":Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    if-eqz v0, :cond_0

    .line 53
    iget-object v6, p0, Lcom/amazon/ags/client/whispersync/storage/CloudStorage;->marshaller:Lcom/amazon/ags/client/whispersync/marshaller/GameDataMarshaller;

    invoke-interface {v6, v0}, Lcom/amazon/ags/client/whispersync/marshaller/GameDataMarshaller;->parse(Ljava/lang/String;)Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    move-result-object v2

    .line 55
    :cond_0
    invoke-virtual {v4}, Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;->getVersionId()Ljava/lang/String;

    move-result-object v3

    .line 56
    .local v3, "newVersionId":Ljava/lang/String;
    new-instance v6, Lcom/amazon/ags/client/whispersync/storage/GameData;

    invoke-direct {v6, v2, v3}, Lcom/amazon/ags/client/whispersync/storage/GameData;-><init>(Lcom/amazon/ags/client/whispersync/InternalGameDataMap;Ljava/lang/String;)V

    return-object v6
.end method
