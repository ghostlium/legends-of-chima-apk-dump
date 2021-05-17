.class public interface abstract Lcom/amazon/insights/event/InternalEventClient;
.super Ljava/lang/Object;
.source "InternalEventClient.java"

# interfaces
.implements Lcom/amazon/insights/EventClient;


# virtual methods
.method public abstract addEventObserver(Lcom/amazon/insights/event/EventObserver;)V
.end method

.method public abstract createInternalEvent(Ljava/lang/String;)Lcom/amazon/insights/event/InternalEvent;
.end method

.method public abstract recordEvent(Lcom/amazon/insights/Event;Z)V
.end method

.method public abstract removeEventObserver(Lcom/amazon/insights/event/EventObserver;)V
.end method
