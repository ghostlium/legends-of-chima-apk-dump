.class public interface abstract Lcom/amazon/insights/EventClient;
.super Ljava/lang/Object;
.source "EventClient.java"


# virtual methods
.method public abstract addGlobalAttribute(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract addGlobalAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract addGlobalMetric(Ljava/lang/String;Ljava/lang/Number;)V
.end method

.method public abstract addGlobalMetric(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Number;)V
.end method

.method public abstract createEvent(Ljava/lang/String;)Lcom/amazon/insights/Event;
.end method

.method public abstract recordEvent(Lcom/amazon/insights/Event;)V
.end method

.method public abstract removeGlobalAttribute(Ljava/lang/String;)V
.end method

.method public abstract removeGlobalAttribute(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract removeGlobalMetric(Ljava/lang/String;)V
.end method

.method public abstract removeGlobalMetric(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract submitEvents()V
.end method
