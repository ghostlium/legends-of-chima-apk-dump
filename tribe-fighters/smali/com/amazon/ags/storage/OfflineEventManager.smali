.class public interface abstract Lcom/amazon/ags/storage/OfflineEventManager;
.super Ljava/lang/Object;
.source "OfflineEventManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;
    }
.end annotation


# virtual methods
.method public abstract getNextEvent()Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/storage/OfflineEventException;
        }
    .end annotation
.end method

.method public abstract onPause()V
.end method

.method public abstract onResume()V
.end method

.method public abstract processOfflineEvent(Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/storage/OfflineEventException;
        }
    .end annotation
.end method

.method public abstract removeEvent(Lcom/amazon/ags/storage/OfflineEventId;)V
.end method

.method public abstract removeNextEvent()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/storage/OfflineEventException;
        }
    .end annotation
.end method

.method public abstract submitEvent(Lcom/amazon/ags/storage/OfflineEvent;)Lcom/amazon/ags/storage/OfflineEventId;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/storage/OfflineEventException;
        }
    .end annotation
.end method
