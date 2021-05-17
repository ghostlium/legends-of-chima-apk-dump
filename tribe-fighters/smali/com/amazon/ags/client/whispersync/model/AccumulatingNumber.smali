.class public Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;
.super Ljava/lang/Object;
.source "AccumulatingNumber.java"

# interfaces
.implements Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;
.implements Lcom/amazon/ags/client/whispersync/model/Mergeable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;",
        "Lcom/amazon/ags/client/whispersync/model/Mergeable",
        "<",
        "Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "GC_Whispersync"


# instance fields
.field private local:Ljava/math/BigDecimal;

.field private final name:Ljava/lang/String;

.field private remote:Ljava/math/BigDecimal;

.field private state:Lcom/amazon/ags/client/whispersync/model/SyncState;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 30
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->name:Ljava/lang/String;

    .line 31
    sget-object v0, Ljava/math/BigDecimal;->ZERO:Ljava/math/BigDecimal;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->local:Ljava/math/BigDecimal;

    .line 32
    sget-object v0, Ljava/math/BigDecimal;->ZERO:Ljava/math/BigDecimal;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->remote:Ljava/math/BigDecimal;

    .line 33
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/math/BigDecimal;Ljava/math/BigDecimal;Lcom/amazon/ags/client/whispersync/model/SyncState;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "localValue"    # Ljava/math/BigDecimal;
    .param p3, "remoteValue"    # Ljava/math/BigDecimal;
    .param p4, "state"    # Lcom/amazon/ags/client/whispersync/model/SyncState;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 36
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->name:Ljava/lang/String;

    .line 37
    iput-object p2, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->local:Ljava/math/BigDecimal;

    .line 38
    iput-object p3, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->remote:Ljava/math/BigDecimal;

    .line 39
    iput-object p4, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 40
    return-void
.end method

.method private decrement(Ljava/math/BigDecimal;)V
    .locals 1
    .param p1, "delta"    # Ljava/math/BigDecimal;

    .prologue
    .line 108
    invoke-virtual {p1}, Ljava/math/BigDecimal;->negate()Ljava/math/BigDecimal;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->update(Ljava/math/BigDecimal;)V

    .line 109
    return-void
.end method

.method private reportEvent(Ljava/lang/String;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 196
    invoke-static {}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->getInstance()Lcom/amazon/ags/client/metrics/EventCollectorClient;

    move-result-object v1

    .line 197
    .local v1, "eventCollectorClient":Lcom/amazon/ags/client/metrics/EventCollectorClient;
    if-eqz v1, :cond_0

    .line 198
    sget-object v2, Lcom/amazon/ags/client/whispersync/model/SyncableType;->ACCUMULATING_NUMBER:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-static {p1, v2}, Lcom/amazon/ags/client/whispersync/metrics/WhispersyncMetricsFactory;->createSyncableTypeEvent(Ljava/lang/String;Lcom/amazon/ags/client/whispersync/model/SyncableType;)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    move-result-object v0

    .line 199
    .local v0, "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    if-eqz v0, :cond_0

    .line 200
    invoke-virtual {v1, v0}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->reportGenericEvent(Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;)V

    .line 203
    .end local v0    # "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    :cond_0
    return-void
.end method

.method private update(Ljava/math/BigDecimal;)V
    .locals 3
    .param p1, "delta"    # Ljava/math/BigDecimal;

    .prologue
    .line 150
    if-nez p1, :cond_0

    .line 151
    const-string v0, "GC_Whispersync"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "delta cannot be null for AccumulatingNumber with name "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    const-string v0, "WHISPERSYNC_SYNCABLE_TYPE_UPDATE_FAILURE"

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->reportEvent(Ljava/lang/String;)V

    .line 153
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "delta cannot be null for AccumulatingNumber with name "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 155
    :cond_0
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 157
    :try_start_0
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->local:Ljava/math/BigDecimal;

    invoke-virtual {v0, p1}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->local:Ljava/math/BigDecimal;

    .line 158
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->DIRTY:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 159
    invoke-static {}, Lcom/amazon/ags/client/whispersync/WhispersyncClientImpl;->syncPassively()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 161
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    .line 163
    return-void

    .line 161
    :catchall_0
    move-exception v0

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v0
.end method


# virtual methods
.method public asDecimal()Ljava/math/BigDecimal;
    .locals 2

    .prologue
    .line 133
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->local:Ljava/math/BigDecimal;

    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->remote:Ljava/math/BigDecimal;

    invoke-virtual {v0, v1}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v0

    return-object v0
.end method

.method public asDouble()D
    .locals 2

    .prologue
    .line 118
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->local:Ljava/math/BigDecimal;

    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->remote:Ljava/math/BigDecimal;

    invoke-virtual {v0, v1}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v0

    return-wide v0
.end method

.method public asInt()I
    .locals 2

    .prologue
    .line 123
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->local:Ljava/math/BigDecimal;

    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->remote:Ljava/math/BigDecimal;

    invoke-virtual {v0, v1}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigDecimal;->intValue()I

    move-result v0

    return v0
.end method

.method public asLong()J
    .locals 2

    .prologue
    .line 113
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->local:Ljava/math/BigDecimal;

    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->remote:Ljava/math/BigDecimal;

    invoke-virtual {v0, v1}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigDecimal;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public asString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 128
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->local:Ljava/math/BigDecimal;

    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->remote:Ljava/math/BigDecimal;

    invoke-virtual {v0, v1}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigDecimal;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public completeSyncing()V
    .locals 2

    .prologue
    .line 190
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCING:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v0, v1, :cond_0

    .line 191
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCED:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 193
    :cond_0
    return-void
.end method

.method public decrement(D)V
    .locals 1
    .param p1, "delta"    # D

    .prologue
    .line 88
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1, p2}, Ljava/math/BigDecimal;-><init>(D)V

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->decrement(Ljava/math/BigDecimal;)V

    .line 89
    return-void
.end method

.method public decrement(I)V
    .locals 1
    .param p1, "delta"    # I

    .prologue
    .line 93
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1}, Ljava/math/BigDecimal;-><init>(I)V

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->decrement(Ljava/math/BigDecimal;)V

    .line 94
    return-void
.end method

.method public decrement(J)V
    .locals 1
    .param p1, "delta"    # J

    .prologue
    .line 83
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1, p2}, Ljava/math/BigDecimal;-><init>(J)V

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->decrement(Ljava/math/BigDecimal;)V

    .line 84
    return-void
.end method

.method public decrement(Ljava/lang/String;)V
    .locals 3
    .param p1, "delta"    # Ljava/lang/String;

    .prologue
    .line 98
    if-nez p1, :cond_0

    .line 99
    const-string v0, "GC_Whispersync"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "delta cannot be null for AccumulatingNumber with name "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    const-string v0, "WHISPERSYNC_SYNCABLE_TYPE_UPDATE_FAILURE"

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->reportEvent(Ljava/lang/String;)V

    .line 101
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "delta cannot be null for AccumulatingNumber with name "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 104
    :cond_0
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->decrement(Ljava/math/BigDecimal;)V

    .line 105
    return-void
.end method

.method public deepCopy()Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;
    .locals 5

    .prologue
    .line 44
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;

    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->name:Ljava/lang/String;

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->local:Ljava/math/BigDecimal;

    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->remote:Ljava/math/BigDecimal;

    iget-object v4, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;-><init>(Ljava/lang/String;Ljava/math/BigDecimal;Ljava/math/BigDecimal;Lcom/amazon/ags/client/whispersync/model/SyncState;)V

    return-object v0
.end method

.method public bridge synthetic deepCopy()Lcom/amazon/ags/client/whispersync/model/Mergeable;
    .locals 1

    .prologue
    .line 20
    invoke-virtual {p0}, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->deepCopy()Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;

    move-result-object v0

    return-object v0
.end method

.method public getLocal()Ljava/math/BigDecimal;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->local:Ljava/math/BigDecimal;

    return-object v0
.end method

.method public getRemote()Ljava/math/BigDecimal;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->remote:Ljava/math/BigDecimal;

    return-object v0
.end method

.method public getState()Lcom/amazon/ags/client/whispersync/model/SyncState;
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    return-object v0
.end method

.method public increment(D)V
    .locals 1
    .param p1, "delta"    # D

    .prologue
    .line 62
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1, p2}, Ljava/math/BigDecimal;-><init>(D)V

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->update(Ljava/math/BigDecimal;)V

    .line 63
    return-void
.end method

.method public increment(I)V
    .locals 1
    .param p1, "delta"    # I

    .prologue
    .line 67
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1}, Ljava/math/BigDecimal;-><init>(I)V

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->update(Ljava/math/BigDecimal;)V

    .line 68
    return-void
.end method

.method public increment(J)V
    .locals 1
    .param p1, "delta"    # J

    .prologue
    .line 57
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1, p2}, Ljava/math/BigDecimal;-><init>(J)V

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->update(Ljava/math/BigDecimal;)V

    .line 58
    return-void
.end method

.method public increment(Ljava/lang/String;)V
    .locals 3
    .param p1, "delta"    # Ljava/lang/String;

    .prologue
    .line 72
    if-nez p1, :cond_0

    .line 73
    const-string v0, "GC_Whispersync"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "delta cannot be null for AccumulatingNumber with name "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    const-string v0, "WHISPERSYNC_SYNCABLE_TYPE_UPDATE_FAILURE"

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->reportEvent(Ljava/lang/String;)V

    .line 75
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "delta cannot be null for AccumulatingNumber with name "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 78
    :cond_0
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->update(Ljava/math/BigDecimal;)V

    .line 79
    return-void
.end method

.method public merge(Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;)V
    .locals 3
    .param p1, "from"    # Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;

    .prologue
    .line 139
    invoke-static {}, Lcom/amazon/ags/client/whispersync/WhispersyncClientImpl;->hasSuccessfullySynchronized()Z

    move-result v0

    .line 140
    .local v0, "hasSuccessfullySynchronized":Z
    iget-object v1, p1, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->remote:Ljava/math/BigDecimal;

    iput-object v1, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->remote:Ljava/math/BigDecimal;

    .line 141
    if-nez v0, :cond_0

    .line 142
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->local:Ljava/math/BigDecimal;

    iget-object v2, p1, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->local:Ljava/math/BigDecimal;

    invoke-virtual {v1, v2}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v1

    iput-object v1, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->local:Ljava/math/BigDecimal;

    .line 144
    :cond_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v2, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v1, v2, :cond_1

    .line 145
    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCED:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v1, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 147
    :cond_1
    return-void
.end method

.method public bridge synthetic merge(Lcom/amazon/ags/client/whispersync/model/Mergeable;)V
    .locals 0
    .param p1, "x0"    # Lcom/amazon/ags/client/whispersync/model/Mergeable;

    .prologue
    .line 20
    check-cast p1, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;

    .end local p1    # "x0":Lcom/amazon/ags/client/whispersync/model/Mergeable;
    invoke-virtual {p0, p1}, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->merge(Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;)V

    return-void
.end method

.method public startSyncing()V
    .locals 2

    .prologue
    .line 183
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->DIRTY:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v0, v1, :cond_0

    .line 184
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCING:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 186
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 167
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 168
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-class v2, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " name="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " local="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->local:Ljava/math/BigDecimal;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " remote="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->remote:Ljava/math/BigDecimal;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " state="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
