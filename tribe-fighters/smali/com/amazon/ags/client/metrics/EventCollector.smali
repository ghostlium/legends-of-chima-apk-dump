.class public interface abstract Lcom/amazon/ags/client/metrics/EventCollector;
.super Ljava/lang/Object;
.source "EventCollector.java"


# virtual methods
.method public abstract pauseInsightsSession()V
.end method

.method public abstract reportGenericEvent(Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/client/metrics/EventReportException;
        }
    .end annotation
.end method

.method public abstract resumeInsightsSession()V
.end method

.method public abstract setIsGuest(Z)V
.end method

.method public abstract setPlayerId(Ljava/lang/String;)V
.end method

.method public abstract submitEvents()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/client/metrics/EventReportException;
        }
    .end annotation
.end method
