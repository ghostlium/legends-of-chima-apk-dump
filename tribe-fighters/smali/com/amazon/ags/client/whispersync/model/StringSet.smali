.class public Lcom/amazon/ags/client/whispersync/model/StringSet;
.super Ljava/lang/Object;
.source "StringSet.java"

# interfaces
.implements Lcom/amazon/ags/api/whispersync/model/SyncableStringSet;
.implements Lcom/amazon/ags/client/whispersync/model/Mergeable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/amazon/ags/api/whispersync/model/SyncableStringSet;",
        "Lcom/amazon/ags/client/whispersync/model/Mergeable",
        "<",
        "Lcom/amazon/ags/client/whispersync/model/StringSet;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "GC_Whispersync"


# instance fields
.field private final elements:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;",
            ">;"
        }
    .end annotation
.end field

.field private final name:Ljava/lang/String;

.field private state:Lcom/amazon/ags/client/whispersync/model/SyncState;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 40
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->name:Ljava/lang/String;

    .line 41
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->elements:Ljava/util/Set;

    .line 42
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Set;Lcom/amazon/ags/client/whispersync/model/SyncState;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p3, "state"    # Lcom/amazon/ags/client/whispersync/model/SyncState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;",
            ">;",
            "Lcom/amazon/ags/client/whispersync/model/SyncState;",
            ")V"
        }
    .end annotation

    .prologue
    .line 50
    .local p2, "elements":Ljava/util/Set;, "Ljava/util/Set<Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    sget-object v2, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v2, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 52
    new-instance v2, Ljava/util/HashSet;

    invoke-interface {p2}, Ljava/util/Set;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/HashSet;-><init>(I)V

    iput-object v2, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->elements:Ljava/util/Set;

    .line 53
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;

    .line 54
    .local v0, "element":Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;
    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->elements:Ljava/util/Set;

    new-instance v3, Lcom/amazon/ags/client/whispersync/model/StringElement;

    check-cast v0, Lcom/amazon/ags/client/whispersync/model/StringElement;

    .end local v0    # "element":Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;
    invoke-direct {v3, v0}, Lcom/amazon/ags/client/whispersync/model/StringElement;-><init>(Lcom/amazon/ags/client/whispersync/model/StringElement;)V

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 56
    :cond_0
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->name:Ljava/lang/String;

    .line 57
    iput-object p3, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 58
    return-void
.end method

.method private add(Lcom/amazon/ags/client/whispersync/model/StringElement;)V
    .locals 3
    .param p1, "element"    # Lcom/amazon/ags/client/whispersync/model/StringElement;

    .prologue
    .line 127
    if-nez p1, :cond_0

    .line 128
    const-string v0, "GC_Whispersync"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to add null StringElement to StringSet with name "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    const-string v0, "WHISPERSYNC_SYNCABLE_TYPE_UPDATE_FAILURE"

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/model/StringSet;->reportEvent(Ljava/lang/String;)V

    .line 130
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to add null StringElement to StringSet with name "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 134
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 137
    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/StringElement;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/amazon/ags/client/whispersync/model/StringSet;->contains(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 138
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->elements:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 139
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->DIRTY:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 140
    invoke-static {}, Lcom/amazon/ags/client/whispersync/WhispersyncClientImpl;->syncPassively()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 143
    :cond_1
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    .line 145
    return-void

    .line 143
    :catchall_0
    move-exception v0

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v0
.end method

.method private reportEvent(Ljava/lang/String;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 205
    invoke-static {}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->getInstance()Lcom/amazon/ags/client/metrics/EventCollectorClient;

    move-result-object v1

    .line 206
    .local v1, "eventCollectorClient":Lcom/amazon/ags/client/metrics/EventCollectorClient;
    if-eqz v1, :cond_0

    .line 207
    sget-object v2, Lcom/amazon/ags/client/whispersync/model/SyncableType;->STRING_SET:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-static {p1, v2}, Lcom/amazon/ags/client/whispersync/metrics/WhispersyncMetricsFactory;->createSyncableTypeEvent(Ljava/lang/String;Lcom/amazon/ags/client/whispersync/model/SyncableType;)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    move-result-object v0

    .line 208
    .local v0, "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    if-eqz v0, :cond_0

    .line 209
    invoke-virtual {v1, v0}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->reportGenericEvent(Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;)V

    .line 212
    .end local v0    # "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    :cond_0
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;)V
    .locals 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 73
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/StringElement;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-static {}, Lcom/amazon/ags/client/whispersync/clock/ClockUtil;->getCurrentTime()J

    move-result-wide v2

    invoke-direct {v0, p1, v1, v2, v3}, Lcom/amazon/ags/client/whispersync/model/StringElement;-><init>(Ljava/lang/String;Ljava/util/Map;J)V

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/model/StringSet;->add(Lcom/amazon/ags/client/whispersync/model/StringElement;)V

    .line 74
    return-void
.end method

.method public add(Ljava/lang/String;Ljava/util/Map;)V
    .locals 3
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
    .line 79
    .local p2, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/StringElement;

    invoke-static {}, Lcom/amazon/ags/client/whispersync/clock/ClockUtil;->getCurrentTime()J

    move-result-wide v1

    invoke-direct {v0, p1, p2, v1, v2}, Lcom/amazon/ags/client/whispersync/model/StringElement;-><init>(Ljava/lang/String;Ljava/util/Map;J)V

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/model/StringSet;->add(Lcom/amazon/ags/client/whispersync/model/StringElement;)V

    .line 80
    return-void
.end method

.method public completeSyncing()V
    .locals 2

    .prologue
    .line 189
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCING:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v0, v1, :cond_0

    .line 190
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCED:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 192
    :cond_0
    return-void
.end method

.method public contains(Ljava/lang/String;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 103
    invoke-virtual {p0, p1}, Lcom/amazon/ags/client/whispersync/model/StringSet;->get(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic deepCopy()Lcom/amazon/ags/client/whispersync/model/Mergeable;
    .locals 1

    .prologue
    .line 26
    invoke-virtual {p0}, Lcom/amazon/ags/client/whispersync/model/StringSet;->deepCopy()Lcom/amazon/ags/client/whispersync/model/StringSet;

    move-result-object v0

    return-object v0
.end method

.method public deepCopy()Lcom/amazon/ags/client/whispersync/model/StringSet;
    .locals 4

    .prologue
    .line 62
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/StringSet;

    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->name:Ljava/lang/String;

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->elements:Ljava/util/Set;

    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/ags/client/whispersync/model/StringSet;-><init>(Ljava/lang/String;Ljava/util/Set;Lcom/amazon/ags/client/whispersync/model/SyncState;)V

    return-object v0
.end method

.method public get(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;
    .locals 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 84
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 87
    :try_start_0
    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->elements:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;

    .line 89
    .local v0, "element":Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;->getValue()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 90
    invoke-interface {v0}, Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-eqz v2, :cond_0

    .line 97
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    .end local v0    # "element":Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;
    :goto_0
    return-object v0

    .line 95
    :cond_1
    const/4 v0, 0x0

    .line 97
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    goto :goto_0

    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v2

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v2
.end method

.method public getState()Lcom/amazon/ags/client/whispersync/model/SyncState;
    .locals 1

    .prologue
    .line 177
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    return-object v0
.end method

.method public getValues()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;",
            ">;"
        }
    .end annotation

    .prologue
    .line 118
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 120
    :try_start_0
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->elements:Ljava/util/Set;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 122
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v0
.end method

.method public isSet()Z
    .locals 1

    .prologue
    .line 108
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 110
    :try_start_0
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->elements:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 112
    :goto_0
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    return v0

    .line 110
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 112
    :catchall_0
    move-exception v0

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;",
            ">;"
        }
    .end annotation

    .prologue
    .line 67
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->elements:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic merge(Lcom/amazon/ags/client/whispersync/model/Mergeable;)V
    .locals 0
    .param p1, "x0"    # Lcom/amazon/ags/client/whispersync/model/Mergeable;

    .prologue
    .line 26
    check-cast p1, Lcom/amazon/ags/client/whispersync/model/StringSet;

    .end local p1    # "x0":Lcom/amazon/ags/client/whispersync/model/Mergeable;
    invoke-virtual {p0, p1}, Lcom/amazon/ags/client/whispersync/model/StringSet;->merge(Lcom/amazon/ags/client/whispersync/model/StringSet;)V

    return-void
.end method

.method public merge(Lcom/amazon/ags/client/whispersync/model/StringSet;)V
    .locals 7
    .param p1, "from"    # Lcom/amazon/ags/client/whispersync/model/StringSet;

    .prologue
    .line 149
    if-eqz p1, :cond_0

    iget-object v3, p1, Lcom/amazon/ags/client/whispersync/model/StringSet;->elements:Ljava/util/Set;

    if-eqz v3, :cond_0

    iget-object v3, p1, Lcom/amazon/ags/client/whispersync/model/StringSet;->elements:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 150
    :cond_0
    const-string v3, "GC_Whispersync"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "StringSet - Unable to merge StringSet from an invalid/unset value "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    const-string v3, "WHISPERSYNC_SYNCABLE_TYPE_FAILED_MERGE"

    invoke-direct {p0, v3}, Lcom/amazon/ags/client/whispersync/model/StringSet;->reportEvent(Ljava/lang/String;)V

    .line 173
    :cond_1
    :goto_0
    return-void

    .line 155
    :cond_2
    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/StringSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_3
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;

    .line 157
    .local v1, "fromElement":Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;
    invoke-interface {v1}, Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/amazon/ags/client/whispersync/model/StringSet;->get(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;

    move-result-object v0

    .line 159
    .local v0, "elementInCurrentSet":Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;
    if-nez v0, :cond_4

    .line 161
    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->elements:Ljava/util/Set;

    new-instance v4, Lcom/amazon/ags/client/whispersync/model/StringElement;

    check-cast v1, Lcom/amazon/ags/client/whispersync/model/StringElement;

    .end local v1    # "fromElement":Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;
    invoke-direct {v4, v1}, Lcom/amazon/ags/client/whispersync/model/StringElement;-><init>(Lcom/amazon/ags/client/whispersync/model/StringElement;)V

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 164
    .restart local v1    # "fromElement":Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;
    :cond_4
    invoke-interface {v0}, Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;->getTimestamp()J

    move-result-wide v3

    invoke-interface {v1}, Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;->getTimestamp()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-gez v3, :cond_3

    .line 165
    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->elements:Ljava/util/Set;

    invoke-interface {v3, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 166
    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->elements:Ljava/util/Set;

    new-instance v4, Lcom/amazon/ags/client/whispersync/model/StringElement;

    check-cast v1, Lcom/amazon/ags/client/whispersync/model/StringElement;

    .end local v1    # "fromElement":Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;
    invoke-direct {v4, v1}, Lcom/amazon/ags/client/whispersync/model/StringElement;-><init>(Lcom/amazon/ags/client/whispersync/model/StringElement;)V

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 170
    .end local v0    # "elementInCurrentSet":Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;
    :cond_5
    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v4, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v3, v4, :cond_1

    .line 171
    sget-object v3, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCED:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v3, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    goto :goto_0
.end method

.method public startSyncing()V
    .locals 2

    .prologue
    .line 182
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->DIRTY:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v0, v1, :cond_0

    .line 183
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCING:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 185
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 196
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 197
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-class v2, Lcom/amazon/ags/client/whispersync/model/HighestNumber;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " name="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " value="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->elements:Ljava/util/Set;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " state="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/StringSet;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
