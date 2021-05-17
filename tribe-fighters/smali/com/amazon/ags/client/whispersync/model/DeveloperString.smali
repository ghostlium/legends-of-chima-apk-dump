.class public Lcom/amazon/ags/client/whispersync/model/DeveloperString;
.super Ljava/lang/Object;
.source "DeveloperString.java"

# interfaces
.implements Lcom/amazon/ags/api/whispersync/model/SyncableDeveloperString;
.implements Lcom/amazon/ags/client/whispersync/model/Mergeable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/amazon/ags/api/whispersync/model/SyncableDeveloperString;",
        "Lcom/amazon/ags/client/whispersync/model/Mergeable",
        "<",
        "Lcom/amazon/ags/client/whispersync/model/DeveloperString;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "GC_Whispersync"


# instance fields
.field private cloud:Ljava/lang/String;

.field private cloudTimestamp:J

.field private isCloudValueSet:Z

.field private local:Ljava/lang/String;

.field private final name:Ljava/lang/String;

.field private pending:Ljava/lang/String;

.field private pendingTimestamp:J

.field private state:Lcom/amazon/ags/client/whispersync/model/SyncState;

.field private timestamp:J


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->isCloudValueSet:Z

    .line 41
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 44
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->name:Ljava/lang/String;

    .line 45
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JLcom/amazon/ags/client/whispersync/model/SyncState;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "local"    # Ljava/lang/String;
    .param p3, "timestamp"    # J
    .param p5, "state"    # Lcom/amazon/ags/client/whispersync/model/SyncState;

    .prologue
    const/4 v1, 0x0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-boolean v1, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->isCloudValueSet:Z

    .line 41
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 48
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->name:Ljava/lang/String;

    .line 49
    iput-object p2, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->local:Ljava/lang/String;

    .line 50
    iput-object p5, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 51
    iput-wide p3, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->timestamp:J

    .line 52
    iput-boolean v1, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->isCloudValueSet:Z

    .line 53
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJLcom/amazon/ags/client/whispersync/model/SyncState;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "local"    # Ljava/lang/String;
    .param p3, "remote"    # Ljava/lang/String;
    .param p4, "timestamp"    # J
    .param p6, "remoteTimestamp"    # J
    .param p8, "state"    # Lcom/amazon/ags/client/whispersync/model/SyncState;

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->isCloudValueSet:Z

    .line 41
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 56
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->name:Ljava/lang/String;

    .line 57
    iput-object p2, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->local:Ljava/lang/String;

    .line 58
    iput-object p3, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->cloud:Ljava/lang/String;

    .line 59
    iput-object p8, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 60
    iput-wide p4, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->timestamp:J

    .line 61
    iput-wide p6, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->cloudTimestamp:J

    .line 62
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->isCloudValueSet:Z

    .line 63
    return-void
.end method


# virtual methods
.method public completeSyncing()V
    .locals 2

    .prologue
    .line 167
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCING:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->DIRTY:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v0, v1, :cond_1

    .line 168
    :cond_0
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->pending:Ljava/lang/String;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->cloud:Ljava/lang/String;

    .line 169
    iget-wide v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->pendingTimestamp:J

    iput-wide v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->cloudTimestamp:J

    .line 170
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->isCloudValueSet:Z

    .line 173
    :cond_1
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCING:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v0, v1, :cond_2

    .line 174
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCED:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 176
    :cond_2
    return-void
.end method

.method public deepCopy()Lcom/amazon/ags/client/whispersync/model/DeveloperString;
    .locals 9

    .prologue
    .line 146
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;

    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->name:Ljava/lang/String;

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->local:Ljava/lang/String;

    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->cloud:Ljava/lang/String;

    iget-wide v4, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->timestamp:J

    iget-wide v6, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->cloudTimestamp:J

    iget-object v8, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    invoke-direct/range {v0 .. v8}, Lcom/amazon/ags/client/whispersync/model/DeveloperString;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJLcom/amazon/ags/client/whispersync/model/SyncState;)V

    .line 147
    .local v0, "developerStringCopy":Lcom/amazon/ags/client/whispersync/model/DeveloperString;
    iget-boolean v1, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->isCloudValueSet:Z

    iput-boolean v1, v0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->isCloudValueSet:Z

    .line 148
    return-object v0
.end method

.method public bridge synthetic deepCopy()Lcom/amazon/ags/client/whispersync/model/Mergeable;
    .locals 1

    .prologue
    .line 18
    invoke-virtual {p0}, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->deepCopy()Lcom/amazon/ags/client/whispersync/model/DeveloperString;

    move-result-object v0

    return-object v0
.end method

.method public getCloudTimestamp()J
    .locals 2

    .prologue
    .line 82
    iget-wide v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->cloudTimestamp:J

    return-wide v0
.end method

.method public getCloudValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->cloud:Ljava/lang/String;

    return-object v0
.end method

.method public getState()Lcom/amazon/ags/client/whispersync/model/SyncState;
    .locals 1

    .prologue
    .line 153
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    return-object v0
.end method

.method public getTimestamp()J
    .locals 2

    .prologue
    .line 91
    iget-wide v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->timestamp:J

    return-wide v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->local:Ljava/lang/String;

    return-object v0
.end method

.method public inConflict()Z
    .locals 2

    .prologue
    .line 67
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->IN_CONFLICT:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isCloudValueSet()Z
    .locals 1

    .prologue
    .line 86
    iget-boolean v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->isCloudValueSet:Z

    return v0
.end method

.method public isSet()Z
    .locals 2

    .prologue
    .line 116
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public markAsResolved()V
    .locals 1

    .prologue
    .line 72
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->DIRTY:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 73
    return-void
.end method

.method public merge(Lcom/amazon/ags/client/whispersync/model/DeveloperString;)V
    .locals 3
    .param p1, "other"    # Lcom/amazon/ags/client/whispersync/model/DeveloperString;

    .prologue
    .line 121
    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v0, v1, :cond_2

    .line 122
    :cond_0
    const-string v0, "GC_Whispersync"

    const-string v1, "DeveloperString - Unable to merge DeveloperString from invalid value"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    const-string v0, "WHISPERSYNC_SYNCABLE_TYPE_FAILED_MERGE"

    invoke-virtual {p0, v0}, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->reportEvent(Ljava/lang/String;)V

    .line 142
    :cond_1
    :goto_0
    return-void

    .line 127
    :cond_2
    iget-object v0, p1, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->local:Ljava/lang/String;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->cloud:Ljava/lang/String;

    .line 128
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->isCloudValueSet:Z

    .line 130
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-eq v0, v1, :cond_3

    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCED:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v0, v1, :cond_4

    .line 131
    :cond_3
    const-string v0, "GC_Whispersync"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DeveloperString - merging value for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->local:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->local:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    iget-object v0, p1, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->local:Ljava/lang/String;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->local:Ljava/lang/String;

    .line 133
    iget-wide v0, p1, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->timestamp:J

    iput-wide v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->timestamp:J

    .line 134
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCED:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    goto :goto_0

    .line 136
    :cond_4
    iget-wide v0, p1, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->timestamp:J

    iput-wide v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->cloudTimestamp:J

    .line 138
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->local:Ljava/lang/String;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->local:Ljava/lang/String;

    iget-object v1, p1, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->local:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    :cond_5
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->local:Ljava/lang/String;

    if-nez v0, :cond_1

    iget-object v0, p1, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->local:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 139
    :cond_6
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->IN_CONFLICT:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    goto :goto_0
.end method

.method public bridge synthetic merge(Lcom/amazon/ags/client/whispersync/model/Mergeable;)V
    .locals 0
    .param p1, "x0"    # Lcom/amazon/ags/client/whispersync/model/Mergeable;

    .prologue
    .line 18
    check-cast p1, Lcom/amazon/ags/client/whispersync/model/DeveloperString;

    .end local p1    # "x0":Lcom/amazon/ags/client/whispersync/model/Mergeable;
    invoke-virtual {p0, p1}, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->merge(Lcom/amazon/ags/client/whispersync/model/DeveloperString;)V

    return-void
.end method

.method protected reportEvent(Ljava/lang/String;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 179
    invoke-static {}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->getInstance()Lcom/amazon/ags/client/metrics/EventCollectorClient;

    move-result-object v1

    .line 180
    .local v1, "eventCollectorClient":Lcom/amazon/ags/client/metrics/EventCollectorClient;
    if-eqz v1, :cond_0

    .line 181
    sget-object v2, Lcom/amazon/ags/client/whispersync/model/SyncableType;->DEVELOPER_STRING:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-static {p1, v2}, Lcom/amazon/ags/client/whispersync/metrics/WhispersyncMetricsFactory;->createSyncableTypeEvent(Ljava/lang/String;Lcom/amazon/ags/client/whispersync/model/SyncableType;)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    move-result-object v0

    .line 182
    .local v0, "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    if-eqz v0, :cond_0

    .line 183
    invoke-virtual {v1, v0}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->reportGenericEvent(Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;)V

    .line 186
    .end local v0    # "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    :cond_0
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 101
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 103
    :try_start_0
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->local:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->local:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->local:Ljava/lang/String;

    if-nez v0, :cond_2

    if-eqz p1, :cond_2

    .line 104
    :cond_1
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->local:Ljava/lang/String;

    .line 105
    invoke-static {}, Lcom/amazon/ags/client/whispersync/clock/ClockUtil;->getCurrentTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->timestamp:J

    .line 106
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->DIRTY:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 107
    invoke-static {}, Lcom/amazon/ags/client/whispersync/WhispersyncClientImpl;->syncPassively()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 110
    :cond_2
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    .line 112
    return-void

    .line 110
    :catchall_0
    move-exception v0

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v0
.end method

.method public startSyncing()V
    .locals 2

    .prologue
    .line 158
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->DIRTY:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCING:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v0, v1, :cond_1

    .line 159
    :cond_0
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->local:Ljava/lang/String;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->pending:Ljava/lang/String;

    .line 160
    iget-wide v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->timestamp:J

    iput-wide v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->pendingTimestamp:J

    .line 161
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCING:Lcom/amazon/ags/client/whispersync/model/SyncState;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 163
    :cond_1
    return-void
.end method
