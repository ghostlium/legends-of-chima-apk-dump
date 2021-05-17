.class public Lcom/amazon/ags/api/whispersync/WhispersyncEventListener;
.super Ljava/lang/Object;
.source "WhispersyncEventListener.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAlreadySynchronized()V
    .locals 0

    .prologue
    .line 52
    return-void
.end method

.method public onDataUploadedToCloud()V
    .locals 0

    .prologue
    .line 26
    return-void
.end method

.method public onDiskWriteComplete()V
    .locals 0

    .prologue
    .line 38
    return-void
.end method

.method public onFirstSynchronize()V
    .locals 0

    .prologue
    .line 45
    return-void
.end method

.method public onNewCloudData()V
    .locals 0

    .prologue
    .line 20
    return-void
.end method

.method public onSyncFailed(Lcom/amazon/ags/api/whispersync/FailReason;)V
    .locals 0
    .param p1, "reason"    # Lcom/amazon/ags/api/whispersync/FailReason;

    .prologue
    .line 58
    return-void
.end method

.method public onThrottled()V
    .locals 0

    .prologue
    .line 32
    return-void
.end method
