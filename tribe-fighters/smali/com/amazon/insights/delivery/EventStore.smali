.class public interface abstract Lcom/amazon/insights/delivery/EventStore;
.super Ljava/lang/Object;
.source "EventStore.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/insights/delivery/EventStore$EventIterator;
    }
.end annotation


# virtual methods
.method public abstract iterator()Lcom/amazon/insights/delivery/EventStore$EventIterator;
.end method

.method public abstract put(Ljava/lang/String;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/insights/delivery/EventStoreException;
        }
    .end annotation
.end method
