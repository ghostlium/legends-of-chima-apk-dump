.class public interface abstract Lcom/amazon/ags/storage/OfflineEventStorage;
.super Ljava/lang/Object;
.source "OfflineEventStorage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;
    }
.end annotation


# virtual methods
.method public abstract getAllEvents()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/storage/OfflineEventException;
        }
    .end annotation
.end method

.method public abstract getEvent(Lcom/amazon/ags/storage/OfflineEventId;)Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/storage/OfflineEventException;
        }
    .end annotation
.end method

.method public abstract getSize()I
.end method

.method public abstract peekEvent()Lcom/amazon/ags/storage/OfflineEventId;
.end method

.method public abstract removeAllEvents()V
.end method

.method public abstract removeEvent(Lcom/amazon/ags/storage/OfflineEventId;)V
.end method

.method public abstract storeEvent(Lorg/json/JSONObject;)Lcom/amazon/ags/storage/OfflineEventId;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/storage/OfflineEventException;
        }
    .end annotation
.end method
