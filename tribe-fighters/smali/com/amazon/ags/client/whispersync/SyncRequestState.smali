.class public Lcom/amazon/ags/client/whispersync/SyncRequestState;
.super Ljava/lang/Object;
.source "SyncRequestState.java"


# instance fields
.field private activeCloudWrite:Z

.field private cloudWriteRequested:Z

.field private diskWriteRequested:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isActiveCloudWrite()Z
    .locals 1

    .prologue
    .line 46
    iget-boolean v0, p0, Lcom/amazon/ags/client/whispersync/SyncRequestState;->activeCloudWrite:Z

    return v0
.end method

.method public isCloudWriteRequested()Z
    .locals 1

    .prologue
    .line 38
    iget-boolean v0, p0, Lcom/amazon/ags/client/whispersync/SyncRequestState;->cloudWriteRequested:Z

    return v0
.end method

.method public isDiskWriteRequested()Z
    .locals 1

    .prologue
    .line 30
    iget-boolean v0, p0, Lcom/amazon/ags/client/whispersync/SyncRequestState;->diskWriteRequested:Z

    return v0
.end method

.method public setActiveCloudWrite(Z)V
    .locals 0
    .param p1, "activeCloudWrite"    # Z

    .prologue
    .line 50
    iput-boolean p1, p0, Lcom/amazon/ags/client/whispersync/SyncRequestState;->activeCloudWrite:Z

    .line 51
    return-void
.end method

.method public setCloudWriteRequested(Z)V
    .locals 0
    .param p1, "cloudWriteRequested"    # Z

    .prologue
    .line 42
    iput-boolean p1, p0, Lcom/amazon/ags/client/whispersync/SyncRequestState;->cloudWriteRequested:Z

    .line 43
    return-void
.end method

.method public setDiskWriteRequested(Z)V
    .locals 0
    .param p1, "diskWriteRequested"    # Z

    .prologue
    .line 34
    iput-boolean p1, p0, Lcom/amazon/ags/client/whispersync/SyncRequestState;->diskWriteRequested:Z

    .line 35
    return-void
.end method
