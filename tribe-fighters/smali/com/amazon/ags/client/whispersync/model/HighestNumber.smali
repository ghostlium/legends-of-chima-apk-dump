.class public Lcom/amazon/ags/client/whispersync/model/HighestNumber;
.super Lcom/amazon/ags/client/whispersync/model/NumberElement;
.source "HighestNumber.java"

# interfaces
.implements Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
.implements Lcom/amazon/ags/client/whispersync/model/Mergeable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazon/ags/client/whispersync/model/NumberElement;",
        "Lcom/amazon/ags/api/whispersync/model/SyncableNumber;",
        "Lcom/amazon/ags/client/whispersync/model/Mergeable",
        "<",
        "Lcom/amazon/ags/client/whispersync/model/HighestNumber;",
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
    .line 31
    invoke-direct {p0}, Lcom/amazon/ags/client/whispersync/model/NumberElement;-><init>()V

    .line 24
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 32
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->name:Ljava/lang/String;

    .line 33
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/math/BigDecimal;Ljava/util/Map;JLcom/amazon/ags/client/whispersync/model/SyncState;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/math/BigDecimal;
    .param p4, "timestamp"    # J
    .param p6, "state"    # Lcom/amazon/ags/client/whispersync/model/SyncState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/math/BigDecimal;",
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
    .line 37
    .local p3, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/amazon/ags/client/whispersync/model/NumberElement;-><init>(Ljava/math/BigDecimal;Ljava/util/Map;J)V

    .line 24
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 38
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->name:Ljava/lang/String;

    .line 39
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCED:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 40
    iput-object p6, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 41
    return-void
.end method

.method private setValue(Ljava/math/BigDecimal;Ljava/util/Map;)V
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
    .line 121
    .local p2, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p1, :cond_0

    .line 122
    const-string v0, "GC_Whispersync"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to set null HighestNumber with name "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    const-string v0, "WHISPERSYNC_SYNCABLE_TYPE_UPDATE_FAILURE"

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncableType;->HIGHEST_NUMBER:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-virtual {p0, v0, v1}, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->reportEvent(Ljava/lang/String;Lcom/amazon/ags/client/whispersync/model/SyncableType;)V

    .line 124
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to set null HighestNumber with name "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 127
    :cond_0
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 130
    :try_start_0
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->value:Ljava/math/BigDecimal;

    invoke-virtual {v0, p1}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v0

    if-gez v0, :cond_3

    .line 131
    :cond_1
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->value:Ljava/math/BigDecimal;

    .line 132
    invoke-static {}, Lcom/amazon/ags/client/whispersync/clock/ClockUtil;->getCurrentTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->timestamp:J

    .line 133
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->DIRTY:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 134
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->metadata:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 135
    if-eqz p2, :cond_2

    .line 136
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->metadata:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 138
    :cond_2
    invoke-static {}, Lcom/amazon/ags/client/whispersync/WhispersyncClientImpl;->syncPassively()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 141
    :cond_3
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    .line 143
    return-void

    .line 141
    :catchall_0
    move-exception v0

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v0
.end method


# virtual methods
.method public completeSyncing()V
    .locals 2

    .prologue
    .line 171
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCING:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v0, v1, :cond_0

    .line 172
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCED:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 174
    :cond_0
    return-void
.end method

.method public deepCopy()Lcom/amazon/ags/client/whispersync/model/HighestNumber;
    .locals 7

    .prologue
    .line 45
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;

    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->name:Ljava/lang/String;

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->value:Ljava/math/BigDecimal;

    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->metadata:Ljava/util/Map;

    iget-wide v4, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->timestamp:J

    iget-object v6, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    invoke-direct/range {v0 .. v6}, Lcom/amazon/ags/client/whispersync/model/HighestNumber;-><init>(Ljava/lang/String;Ljava/math/BigDecimal;Ljava/util/Map;JLcom/amazon/ags/client/whispersync/model/SyncState;)V

    return-object v0
.end method

.method public bridge synthetic deepCopy()Lcom/amazon/ags/client/whispersync/model/Mergeable;
    .locals 1

    .prologue
    .line 19
    invoke-virtual {p0}, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->deepCopy()Lcom/amazon/ags/client/whispersync/model/HighestNumber;

    move-result-object v0

    return-object v0
.end method

.method public getState()Lcom/amazon/ags/client/whispersync/model/SyncState;
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    return-object v0
.end method

.method public isSet()Z
    .locals 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public merge(Lcom/amazon/ags/client/whispersync/model/HighestNumber;)V
    .locals 3
    .param p1, "from"    # Lcom/amazon/ags/client/whispersync/model/HighestNumber;

    .prologue
    .line 101
    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v0, v1, :cond_2

    .line 102
    :cond_0
    const-string v0, "GC_Whispersync"

    const-string v1, "HighestNumber - Unable to merge HighestNumber from invalid value"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    const-string v0, "WHISPERSYNC_SYNCABLE_TYPE_FAILED_MERGE"

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncableType;->HIGHEST_NUMBER:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-virtual {p0, v0, v1}, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->reportEvent(Ljava/lang/String;Lcom/amazon/ags/client/whispersync/model/SyncableType;)V

    .line 118
    :cond_1
    :goto_0
    return-void

    .line 108
    :cond_2
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-eq v0, v1, :cond_3

    iget-object v0, p1, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->value:Ljava/math/BigDecimal;

    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->value:Ljava/math/BigDecimal;

    invoke-virtual {v0, v1}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v0

    if-lez v0, :cond_1

    .line 109
    :cond_3
    const-string v0, "GC_Whispersync"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "HighestNumber - merging value for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->value:Ljava/math/BigDecimal;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->value:Ljava/math/BigDecimal;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    iget-object v0, p1, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->value:Ljava/math/BigDecimal;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->value:Ljava/math/BigDecimal;

    .line 111
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->metadata:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 112
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->metadata:Ljava/util/Map;

    iget-object v1, p1, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->metadata:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 113
    iget-wide v0, p1, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->timestamp:J

    iput-wide v0, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->timestamp:J

    .line 114
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v0, v1, :cond_1

    .line 115
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCED:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    goto :goto_0
.end method

.method public bridge synthetic merge(Lcom/amazon/ags/client/whispersync/model/Mergeable;)V
    .locals 0
    .param p1, "x0"    # Lcom/amazon/ags/client/whispersync/model/Mergeable;

    .prologue
    .line 19
    check-cast p1, Lcom/amazon/ags/client/whispersync/model/HighestNumber;

    .end local p1    # "x0":Lcom/amazon/ags/client/whispersync/model/Mergeable;
    invoke-virtual {p0, p1}, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->merge(Lcom/amazon/ags/client/whispersync/model/HighestNumber;)V

    return-void
.end method

.method public set(D)V
    .locals 1
    .param p1, "value"    # D

    .prologue
    .line 55
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->set(DLjava/util/Map;)V

    .line 56
    return-void
.end method

.method public set(DLjava/util/Map;)V
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
    .line 75
    .local p3, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1, p2}, Ljava/math/BigDecimal;-><init>(D)V

    invoke-direct {p0, v0, p3}, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->setValue(Ljava/math/BigDecimal;Ljava/util/Map;)V

    .line 76
    return-void
.end method

.method public set(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 60
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->set(ILjava/util/Map;)V

    .line 61
    return-void
.end method

.method public set(ILjava/util/Map;)V
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
    .line 80
    .local p2, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1}, Ljava/math/BigDecimal;-><init>(I)V

    invoke-direct {p0, v0, p2}, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->setValue(Ljava/math/BigDecimal;Ljava/util/Map;)V

    .line 81
    return-void
.end method

.method public set(J)V
    .locals 1
    .param p1, "value"    # J

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->set(JLjava/util/Map;)V

    .line 51
    return-void
.end method

.method public set(JLjava/util/Map;)V
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
    .line 70
    .local p3, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1, p2}, Ljava/math/BigDecimal;-><init>(J)V

    invoke-direct {p0, v0, p3}, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->setValue(Ljava/math/BigDecimal;Ljava/util/Map;)V

    .line 71
    return-void
.end method

.method public set(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 65
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->set(Ljava/lang/String;Ljava/util/Map;)V

    .line 66
    return-void
.end method

.method public set(Ljava/lang/String;Ljava/util/Map;)V
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
    .line 85
    .local p2, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p1, :cond_0

    .line 86
    const-string v0, "GC_Whispersync"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to add null String to HighestNumber with name "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    const-string v0, "WHISPERSYNC_SYNCABLE_TYPE_UPDATE_FAILURE"

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncableType;->HIGHEST_NUMBER:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-virtual {p0, v0, v1}, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->reportEvent(Ljava/lang/String;Lcom/amazon/ags/client/whispersync/model/SyncableType;)V

    .line 88
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to add null String to HighestNumber with name "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 91
    :cond_0
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, p2}, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->setValue(Ljava/math/BigDecimal;Ljava/util/Map;)V

    .line 92
    return-void
.end method

.method public startSyncing()V
    .locals 2

    .prologue
    .line 164
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->DIRTY:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v0, v1, :cond_0

    .line 165
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCING:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 167
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 147
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 148
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

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " value="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->value:Ljava/math/BigDecimal;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " timestamp="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->timestamp:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " metadata="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->metadata:Ljava/util/Map;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " state="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
