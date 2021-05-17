.class public Lcom/amazon/ags/client/whispersync/model/LatestString;
.super Lcom/amazon/ags/client/whispersync/model/StringElement;
.source "LatestString.java"

# interfaces
.implements Lcom/amazon/ags/api/whispersync/model/SyncableString;
.implements Lcom/amazon/ags/client/whispersync/model/Mergeable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazon/ags/client/whispersync/model/StringElement;",
        "Lcom/amazon/ags/api/whispersync/model/SyncableString;",
        "Lcom/amazon/ags/client/whispersync/model/Mergeable",
        "<",
        "Lcom/amazon/ags/client/whispersync/model/LatestString;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "GC_Whispersync"


# instance fields
.field private final name:Ljava/lang/String;

.field private state:Lcom/amazon/ags/client/whispersync/model/SyncState;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/amazon/ags/client/whispersync/model/StringElement;-><init>()V

    .line 28
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 33
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->name:Ljava/lang/String;

    .line 34
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;JLcom/amazon/ags/client/whispersync/model/SyncState;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p4, "timestamp"    # J
    .param p6, "state"    # Lcom/amazon/ags/client/whispersync/model/SyncState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;J",
            "Lcom/amazon/ags/client/whispersync/model/SyncState;",
            ")V"
        }
    .end annotation

    .prologue
    .line 38
    .local p3, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/amazon/ags/client/whispersync/model/StringElement;-><init>(Ljava/lang/String;Ljava/util/Map;J)V

    .line 28
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 39
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->name:Ljava/lang/String;

    .line 40
    iput-object p6, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 41
    return-void
.end method

.method private setValue(Ljava/lang/String;Ljava/util/Map;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 100
    .local p2, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 102
    :try_start_0
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->value:Ljava/lang/String;

    .line 105
    invoke-static {}, Lcom/amazon/ags/client/whispersync/clock/ClockUtil;->getCurrentTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->timestamp:J

    .line 107
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->metadata:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 108
    if-eqz p2, :cond_0

    .line 109
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->metadata:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 111
    :cond_0
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->DIRTY:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 112
    invoke-static {}, Lcom/amazon/ags/client/whispersync/WhispersyncClientImpl;->syncPassively()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 114
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    .line 116
    return-void

    .line 114
    :catchall_0
    move-exception v0

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v0
.end method


# virtual methods
.method public completeSyncing()V
    .locals 2

    .prologue
    .line 132
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCING:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v0, v1, :cond_0

    .line 133
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCED:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 135
    :cond_0
    return-void
.end method

.method public deepCopy()Lcom/amazon/ags/client/whispersync/model/LatestString;
    .locals 7

    .prologue
    .line 45
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/LatestString;

    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->name:Ljava/lang/String;

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->value:Ljava/lang/String;

    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->metadata:Ljava/util/Map;

    iget-wide v4, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->timestamp:J

    iget-object v6, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    invoke-direct/range {v0 .. v6}, Lcom/amazon/ags/client/whispersync/model/LatestString;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;JLcom/amazon/ags/client/whispersync/model/SyncState;)V

    return-object v0
.end method

.method public bridge synthetic deepCopy()Lcom/amazon/ags/client/whispersync/model/Mergeable;
    .locals 1

    .prologue
    .line 21
    invoke-virtual {p0}, Lcom/amazon/ags/client/whispersync/model/LatestString;->deepCopy()Lcom/amazon/ags/client/whispersync/model/LatestString;

    move-result-object v0

    return-object v0
.end method

.method public getState()Lcom/amazon/ags/client/whispersync/model/SyncState;
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    return-object v0
.end method

.method public isSet()Z
    .locals 2

    .prologue
    .line 60
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public merge(Lcom/amazon/ags/client/whispersync/model/LatestString;)V
    .locals 4
    .param p1, "from"    # Lcom/amazon/ags/client/whispersync/model/LatestString;

    .prologue
    .line 65
    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/amazon/ags/client/whispersync/model/LatestString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v0, v1, :cond_2

    .line 66
    :cond_0
    const-string v0, "GC_Whispersync"

    const-string v1, "LatestString - Unable to merge LatestString from invalid value"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    const-string v0, "WHISPERSYNC_SYNCABLE_TYPE_FAILED_MERGE"

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LATEST_STRING:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-virtual {p0, v0, v1}, Lcom/amazon/ags/client/whispersync/model/LatestString;->reportEvent(Ljava/lang/String;Lcom/amazon/ags/client/whispersync/model/SyncableType;)V

    .line 82
    :cond_1
    :goto_0
    return-void

    .line 72
    :cond_2
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-eq v0, v1, :cond_3

    iget-wide v0, p1, Lcom/amazon/ags/client/whispersync/model/LatestString;->timestamp:J

    iget-wide v2, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->timestamp:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    .line 73
    :cond_3
    const-string v0, "GC_Whispersync"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "LatestString - merging value for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->value:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lcom/amazon/ags/client/whispersync/model/LatestString;->value:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    iget-object v0, p1, Lcom/amazon/ags/client/whispersync/model/LatestString;->value:Ljava/lang/String;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->value:Ljava/lang/String;

    .line 75
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->metadata:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 76
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->metadata:Ljava/util/Map;

    iget-object v1, p1, Lcom/amazon/ags/client/whispersync/model/LatestString;->metadata:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 77
    iget-wide v0, p1, Lcom/amazon/ags/client/whispersync/model/LatestString;->timestamp:J

    iput-wide v0, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->timestamp:J

    .line 78
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v0, v1, :cond_1

    .line 79
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCED:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    goto :goto_0
.end method

.method public bridge synthetic merge(Lcom/amazon/ags/client/whispersync/model/Mergeable;)V
    .locals 0
    .param p1, "x0"    # Lcom/amazon/ags/client/whispersync/model/Mergeable;

    .prologue
    .line 21
    check-cast p1, Lcom/amazon/ags/client/whispersync/model/LatestString;

    .end local p1    # "x0":Lcom/amazon/ags/client/whispersync/model/Mergeable;
    invoke-virtual {p0, p1}, Lcom/amazon/ags/client/whispersync/model/LatestString;->merge(Lcom/amazon/ags/client/whispersync/model/LatestString;)V

    return-void
.end method

.method protected reportEvent(Ljava/lang/String;Lcom/amazon/ags/client/whispersync/model/SyncableType;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "syncableType"    # Lcom/amazon/ags/client/whispersync/model/SyncableType;

    .prologue
    .line 138
    invoke-static {}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->getInstance()Lcom/amazon/ags/client/metrics/EventCollectorClient;

    move-result-object v1

    .line 139
    .local v1, "eventCollectorClient":Lcom/amazon/ags/client/metrics/EventCollectorClient;
    if-eqz v1, :cond_0

    .line 140
    invoke-static {p1, p2}, Lcom/amazon/ags/client/whispersync/metrics/WhispersyncMetricsFactory;->createSyncableTypeEvent(Ljava/lang/String;Lcom/amazon/ags/client/whispersync/model/SyncableType;)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    move-result-object v0

    .line 141
    .local v0, "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    if-eqz v0, :cond_0

    .line 142
    invoke-virtual {v1, v0}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->reportGenericEvent(Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;)V

    .line 145
    .end local v0    # "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    :cond_0
    return-void
.end method

.method public set(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/amazon/ags/client/whispersync/model/LatestString;->setValue(Ljava/lang/String;Ljava/util/Map;)V

    .line 51
    return-void
.end method

.method public set(Ljava/lang/String;Ljava/util/Map;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 55
    .local p2, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/client/whispersync/model/LatestString;->setValue(Ljava/lang/String;Ljava/util/Map;)V

    .line 56
    return-void
.end method

.method public startSyncing()V
    .locals 2

    .prologue
    .line 125
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->DIRTY:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v0, v1, :cond_0

    .line 126
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCING:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 128
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 86
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 87
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-class v2, Lcom/amazon/ags/client/whispersync/model/LatestString;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " name="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " value="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->value:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " timestamp="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->timestamp:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " metadata="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->metadata:Ljava/util/Map;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " state="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/LatestString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
