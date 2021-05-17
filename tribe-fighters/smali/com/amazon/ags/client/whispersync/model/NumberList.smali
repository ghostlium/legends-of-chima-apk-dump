.class public abstract Lcom/amazon/ags/client/whispersync/model/NumberList;
.super Ljava/lang/Object;
.source "NumberList.java"

# interfaces
.implements Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
.implements Lcom/amazon/ags/client/whispersync/model/Mergeable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;",
        "Lcom/amazon/ags/client/whispersync/model/Mergeable",
        "<",
        "Lcom/amazon/ags/client/whispersync/model/NumberList;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "GC_Whispersync"


# instance fields
.field protected final elements:Ljava/util/SortedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/SortedSet",
            "<",
            "Lcom/amazon/ags/client/whispersync/model/NumberElement;",
            ">;"
        }
    .end annotation
.end field

.field protected maxSize:I

.field protected final name:Ljava/lang/String;

.field protected state:Lcom/amazon/ags/client/whispersync/model/SyncState;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 46
    new-instance v0, Ljava/util/TreeSet;

    invoke-virtual {p0}, Lcom/amazon/ags/client/whispersync/model/NumberList;->getComparator()Ljava/util/Comparator;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->elements:Ljava/util/SortedSet;

    .line 47
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->name:Ljava/lang/String;

    .line 48
    const/4 v0, 0x5

    iput v0, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->maxSize:I

    .line 49
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/List;ILcom/amazon/ags/client/whispersync/model/SyncState;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p3, "maxSize"    # I
    .param p4, "state"    # Lcom/amazon/ags/client/whispersync/model/SyncState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/client/whispersync/model/NumberElement;",
            ">;I",
            "Lcom/amazon/ags/client/whispersync/model/SyncState;",
            ")V"
        }
    .end annotation

    .prologue
    .line 52
    .local p2, "elements":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/client/whispersync/model/NumberElement;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    sget-object v2, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v2, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 54
    new-instance v2, Ljava/util/TreeSet;

    invoke-virtual {p0}, Lcom/amazon/ags/client/whispersync/model/NumberList;->getComparator()Ljava/util/Comparator;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    iput-object v2, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->elements:Ljava/util/SortedSet;

    .line 55
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/client/whispersync/model/NumberElement;

    .line 56
    .local v0, "element":Lcom/amazon/ags/client/whispersync/model/NumberElement;
    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->elements:Ljava/util/SortedSet;

    new-instance v3, Lcom/amazon/ags/client/whispersync/model/NumberElement;

    invoke-direct {v3, v0}, Lcom/amazon/ags/client/whispersync/model/NumberElement;-><init>(Lcom/amazon/ags/client/whispersync/model/NumberElement;)V

    invoke-interface {v2, v3}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 58
    .end local v0    # "element":Lcom/amazon/ags/client/whispersync/model/NumberElement;
    :cond_0
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->name:Ljava/lang/String;

    .line 59
    iput p3, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->maxSize:I

    .line 60
    iput-object p4, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 61
    return-void
.end method

.method private add(Lcom/amazon/ags/client/whispersync/model/NumberElement;)V
    .locals 3
    .param p1, "numberElement"    # Lcom/amazon/ags/client/whispersync/model/NumberElement;

    .prologue
    .line 143
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 145
    if-nez p1, :cond_0

    .line 146
    :try_start_0
    const-string v0, "GC_Whispersync"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to add null NumberElement to NumberList with name "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    const-string v0, "WHISPERSYNC_SYNCABLE_TYPE_UPDATE_FAILURE"

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/model/NumberList;->reportEvent(Ljava/lang/String;)V

    .line 148
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to add null NumberElement to NumberList with name "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 168
    :catchall_0
    move-exception v0

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v0

    .line 152
    :cond_0
    :try_start_1
    const-string v0, "GC_Whispersync"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Adding number element "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to NumberList of type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/amazon/ags/client/whispersync/model/NumberList;->getSyncableType()Lcom/amazon/ags/client/whispersync/model/SyncableType;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->elements:Ljava/util/SortedSet;

    invoke-interface {v0, p1}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    .line 156
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->elements:Ljava/util/SortedSet;

    invoke-interface {v0}, Ljava/util/SortedSet;->size()I

    move-result v0

    iget v1, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->maxSize:I

    if-le v0, v1, :cond_2

    .line 157
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->elements:Ljava/util/SortedSet;

    invoke-interface {v0}, Ljava/util/SortedSet;->last()Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p1, :cond_1

    .line 158
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->DIRTY:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 159
    invoke-static {}, Lcom/amazon/ags/client/whispersync/WhispersyncClientImpl;->syncPassively()V

    .line 162
    :cond_1
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->elements:Ljava/util/SortedSet;

    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->elements:Ljava/util/SortedSet;

    invoke-interface {v1}, Ljava/util/SortedSet;->last()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/SortedSet;->remove(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 168
    :goto_0
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    .line 170
    return-void

    .line 164
    :cond_2
    :try_start_2
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->DIRTY:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 165
    invoke-static {}, Lcom/amazon/ags/client/whispersync/WhispersyncClientImpl;->syncPassively()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method private add(Ljava/math/BigDecimal;Ljava/util/Map;)V
    .locals 3
    .param p1, "value"    # Ljava/math/BigDecimal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/math/BigDecimal;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 129
    .local p2, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/NumberElement;

    invoke-static {}, Lcom/amazon/ags/client/whispersync/clock/ClockUtil;->getCurrentTime()J

    move-result-wide v1

    invoke-direct {v0, p1, p2, v1, v2}, Lcom/amazon/ags/client/whispersync/model/NumberElement;-><init>(Ljava/math/BigDecimal;Ljava/util/Map;J)V

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/model/NumberList;->add(Lcom/amazon/ags/client/whispersync/model/NumberElement;)V

    .line 130
    return-void
.end method

.method private reportEvent(Ljava/lang/String;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 260
    invoke-static {}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->getInstance()Lcom/amazon/ags/client/metrics/EventCollectorClient;

    move-result-object v1

    .line 261
    .local v1, "eventCollectorClient":Lcom/amazon/ags/client/metrics/EventCollectorClient;
    if-eqz v1, :cond_0

    .line 262
    invoke-virtual {p0}, Lcom/amazon/ags/client/whispersync/model/NumberList;->getSyncableType()Lcom/amazon/ags/client/whispersync/model/SyncableType;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/amazon/ags/client/whispersync/metrics/WhispersyncMetricsFactory;->createSyncableTypeEvent(Ljava/lang/String;Lcom/amazon/ags/client/whispersync/model/SyncableType;)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    move-result-object v0

    .line 263
    .local v0, "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    if-eqz v0, :cond_0

    .line 264
    invoke-virtual {v1, v0}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->reportGenericEvent(Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;)V

    .line 267
    .end local v0    # "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    :cond_0
    return-void
.end method


# virtual methods
.method public add(D)V
    .locals 1
    .param p1, "value"    # D

    .prologue
    .line 88
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/amazon/ags/client/whispersync/model/NumberList;->add(DLjava/util/Map;)V

    .line 89
    return-void
.end method

.method public add(DLjava/util/Map;)V
    .locals 1
    .param p1, "value"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(D",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 108
    .local p3, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1, p2}, Ljava/math/BigDecimal;-><init>(D)V

    invoke-direct {p0, v0, p3}, Lcom/amazon/ags/client/whispersync/model/NumberList;->add(Ljava/math/BigDecimal;Ljava/util/Map;)V

    .line 109
    return-void
.end method

.method public add(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 93
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/amazon/ags/client/whispersync/model/NumberList;->add(ILjava/util/Map;)V

    .line 94
    return-void
.end method

.method public add(ILjava/util/Map;)V
    .locals 1
    .param p1, "value"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 113
    .local p2, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1}, Ljava/math/BigDecimal;-><init>(I)V

    invoke-direct {p0, v0, p2}, Lcom/amazon/ags/client/whispersync/model/NumberList;->add(Ljava/math/BigDecimal;Ljava/util/Map;)V

    .line 114
    return-void
.end method

.method public add(J)V
    .locals 1
    .param p1, "value"    # J

    .prologue
    .line 83
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/amazon/ags/client/whispersync/model/NumberList;->add(JLjava/util/Map;)V

    .line 84
    return-void
.end method

.method public add(JLjava/util/Map;)V
    .locals 1
    .param p1, "value"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 103
    .local p3, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1, p2}, Ljava/math/BigDecimal;-><init>(J)V

    invoke-direct {p0, v0, p3}, Lcom/amazon/ags/client/whispersync/model/NumberList;->add(Ljava/math/BigDecimal;Ljava/util/Map;)V

    .line 104
    return-void
.end method

.method public add(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 98
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/amazon/ags/client/whispersync/model/NumberList;->add(Ljava/lang/String;Ljava/util/Map;)V

    .line 99
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
    .line 118
    .local p2, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p1, :cond_0

    .line 119
    const-string v0, "GC_Whispersync"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to add null String to NumberList with name "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    const-string v0, "WHISPERSYNC_SYNCABLE_TYPE_UPDATE_FAILURE"

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/model/NumberList;->reportEvent(Ljava/lang/String;)V

    .line 121
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to add null String to NumberList with name "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 124
    :cond_0
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, p2}, Lcom/amazon/ags/client/whispersync/model/NumberList;->add(Ljava/math/BigDecimal;Ljava/util/Map;)V

    .line 125
    return-void
.end method

.method public completeSyncing()V
    .locals 2

    .prologue
    .line 254
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCING:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v0, v1, :cond_0

    .line 255
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCED:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 257
    :cond_0
    return-void
.end method

.method public copyElements()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/client/whispersync/model/NumberElement;",
            ">;"
        }
    .end annotation

    .prologue
    .line 190
    new-instance v0, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->elements:Ljava/util/SortedSet;

    invoke-interface {v3}, Ljava/util/SortedSet;->size()I

    move-result v3

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 191
    .local v0, "copiedElements":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/client/whispersync/model/NumberElement;>;"
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 193
    :try_start_0
    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->elements:Ljava/util/SortedSet;

    invoke-interface {v3}, Ljava/util/SortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/client/whispersync/model/NumberElement;

    .line 194
    .local v1, "element":Lcom/amazon/ags/client/whispersync/model/NumberElement;
    new-instance v3, Lcom/amazon/ags/client/whispersync/model/NumberElement;

    invoke-direct {v3, v1}, Lcom/amazon/ags/client/whispersync/model/NumberElement;-><init>(Lcom/amazon/ags/client/whispersync/model/NumberElement;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 197
    .end local v1    # "element":Lcom/amazon/ags/client/whispersync/model/NumberElement;
    .end local v2    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v3

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v3

    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_0
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    .line 199
    return-object v0
.end method

.method public abstract getComparator()Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator",
            "<",
            "Lcom/amazon/ags/client/whispersync/model/NumberElement;",
            ">;"
        }
    .end annotation
.end method

.method public getMaxSize()I
    .locals 1

    .prologue
    .line 78
    iget v0, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->maxSize:I

    return v0
.end method

.method public getState()Lcom/amazon/ags/client/whispersync/model/SyncState;
    .locals 1

    .prologue
    .line 242
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    return-object v0
.end method

.method public abstract getSyncableType()Lcom/amazon/ags/client/whispersync/model/SyncableType;
.end method

.method public getValues()[Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;
    .locals 7

    .prologue
    .line 174
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 176
    :try_start_0
    iget-object v5, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->elements:Ljava/util/SortedSet;

    invoke-interface {v5}, Ljava/util/SortedSet;->size()I

    move-result v5

    iget v6, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->maxSize:I

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 177
    .local v4, "size":I
    new-array v3, v4, [Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;

    .line 178
    .local v3, "results":[Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;
    iget-object v5, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->elements:Ljava/util/SortedSet;

    invoke-interface {v5}, Ljava/util/SortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 179
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/amazon/ags/client/whispersync/model/NumberElement;>;"
    const/4 v0, 0x0

    .local v0, "index":I
    move v1, v0

    .line 180
    .end local v0    # "index":I
    .local v1, "index":I
    :goto_0
    if-ge v1, v4, :cond_0

    .line 181
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "index":I
    .restart local v0    # "index":I
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;

    aput-object v5, v3, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move v1, v0

    .end local v0    # "index":I
    .restart local v1    # "index":I
    goto :goto_0

    .line 185
    :cond_0
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    return-object v3

    .end local v1    # "index":I
    .end local v2    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/amazon/ags/client/whispersync/model/NumberElement;>;"
    .end local v3    # "results":[Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;
    .end local v4    # "size":I
    :catchall_0
    move-exception v5

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v5
.end method

.method public isSet()Z
    .locals 1

    .prologue
    .line 134
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 136
    :try_start_0
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->elements:Ljava/util/SortedSet;

    invoke-interface {v0}, Ljava/util/SortedSet;->isEmpty()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 138
    :goto_0
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    return v0

    .line 136
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 138
    :catchall_0
    move-exception v0

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v0
.end method

.method public bridge synthetic merge(Lcom/amazon/ags/client/whispersync/model/Mergeable;)V
    .locals 0
    .param p1, "x0"    # Lcom/amazon/ags/client/whispersync/model/Mergeable;

    .prologue
    .line 29
    check-cast p1, Lcom/amazon/ags/client/whispersync/model/NumberList;

    .end local p1    # "x0":Lcom/amazon/ags/client/whispersync/model/Mergeable;
    invoke-virtual {p0, p1}, Lcom/amazon/ags/client/whispersync/model/NumberList;->merge(Lcom/amazon/ags/client/whispersync/model/NumberList;)V

    return-void
.end method

.method public merge(Lcom/amazon/ags/client/whispersync/model/NumberList;)V
    .locals 5
    .param p1, "from"    # Lcom/amazon/ags/client/whispersync/model/NumberList;

    .prologue
    .line 204
    if-eqz p1, :cond_0

    iget-object v2, p1, Lcom/amazon/ags/client/whispersync/model/NumberList;->elements:Ljava/util/SortedSet;

    if-eqz v2, :cond_0

    iget-object v2, p1, Lcom/amazon/ags/client/whispersync/model/NumberList;->elements:Ljava/util/SortedSet;

    invoke-interface {v2}, Ljava/util/SortedSet;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 205
    :cond_0
    const-string v2, "GC_Whispersync"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "NumberList - Unable to merge NumberList from an invalid/unset value "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    const-string v2, "WHISPERSYNC_SYNCABLE_TYPE_FAILED_MERGE"

    invoke-direct {p0, v2}, Lcom/amazon/ags/client/whispersync/model/NumberList;->reportEvent(Ljava/lang/String;)V

    .line 228
    :cond_1
    :goto_0
    return-void

    .line 210
    :cond_2
    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/NumberList;->getSyncableType()Lcom/amazon/ags/client/whispersync/model/SyncableType;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazon/ags/client/whispersync/model/NumberList;->getSyncableType()Lcom/amazon/ags/client/whispersync/model/SyncableType;

    move-result-object v3

    if-eq v2, v3, :cond_3

    .line 211
    const-string v2, "GC_Whispersync"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cannot merge a "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/NumberList;->getSyncableType()Lcom/amazon/ags/client/whispersync/model/SyncableType;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " with a "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/amazon/ags/client/whispersync/model/NumberList;->getSyncableType()Lcom/amazon/ags/client/whispersync/model/SyncableType;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 215
    :cond_3
    iget v2, p1, Lcom/amazon/ags/client/whispersync/model/NumberList;->maxSize:I

    iget v3, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->maxSize:I

    if-le v2, v3, :cond_4

    .line 216
    const-string v2, "GC_Whispersync"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Increasing maxSize of "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->maxSize:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p1, Lcom/amazon/ags/client/whispersync/model/NumberList;->maxSize:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 217
    iget v2, p1, Lcom/amazon/ags/client/whispersync/model/NumberList;->maxSize:I

    iput v2, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->maxSize:I

    .line 219
    :cond_4
    iget-object v2, p1, Lcom/amazon/ags/client/whispersync/model/NumberList;->elements:Ljava/util/SortedSet;

    invoke-interface {v2}, Ljava/util/SortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_5
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/client/whispersync/model/NumberElement;

    .line 220
    .local v1, "item":Lcom/amazon/ags/client/whispersync/model/NumberElement;
    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->elements:Ljava/util/SortedSet;

    invoke-interface {v2, v1}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    .line 221
    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->elements:Ljava/util/SortedSet;

    invoke-interface {v2}, Ljava/util/SortedSet;->size()I

    move-result v2

    iget v3, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->maxSize:I

    if-le v2, v3, :cond_5

    .line 222
    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->elements:Ljava/util/SortedSet;

    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->elements:Ljava/util/SortedSet;

    invoke-interface {v3}, Ljava/util/SortedSet;->last()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/SortedSet;->remove(Ljava/lang/Object;)Z

    goto :goto_1

    .line 225
    .end local v1    # "item":Lcom/amazon/ags/client/whispersync/model/NumberElement;
    :cond_6
    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v3, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v2, v3, :cond_1

    .line 226
    sget-object v2, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCED:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v2, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    goto/16 :goto_0
.end method

.method public setMaxSize(I)V
    .locals 3
    .param p1, "size"    # I

    .prologue
    .line 65
    if-lez p1, :cond_0

    const/16 v0, 0x3e8

    if-le p1, v0, :cond_1

    .line 66
    :cond_0
    const-string v0, "GC_Whispersync"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to set max size to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    const-string v0, "WHISPERSYNC_SYNCABLE_TYPE_UPDATE_FAILURE"

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/model/NumberList;->reportEvent(Ljava/lang/String;)V

    .line 68
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 70
    :cond_1
    iget v0, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->maxSize:I

    if-le p1, v0, :cond_2

    .line 71
    iput p1, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->maxSize:I

    .line 74
    :cond_2
    return-void
.end method

.method public startSyncing()V
    .locals 2

    .prologue
    .line 247
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->DIRTY:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v0, v1, :cond_0

    .line 248
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCING:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 250
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 232
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 233
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/amazon/ags/client/whispersync/model/NumberList;->getSyncableType()Lcom/amazon/ags/client/whispersync/model/SyncableType;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazon/ags/client/whispersync/model/SyncableType;->getJsonName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " name="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " value="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/NumberList;->elements:Ljava/util/SortedSet;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " isSet="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/amazon/ags/client/whispersync/model/NumberList;->isSet()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
