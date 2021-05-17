.class public interface abstract Lcom/amazon/ags/client/whispersync/model/Mergeable;
.super Ljava/lang/Object;
.source "Mergeable.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/amazon/ags/client/whispersync/model/Mergeable",
        "<TT;>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract completeSyncing()V
.end method

.method public abstract deepCopy()Lcom/amazon/ags/client/whispersync/model/Mergeable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public abstract getState()Lcom/amazon/ags/client/whispersync/model/SyncState;
.end method

.method public abstract merge(Lcom/amazon/ags/client/whispersync/model/Mergeable;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

.method public abstract startSyncing()V
.end method
