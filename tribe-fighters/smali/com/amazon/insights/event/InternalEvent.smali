.class public interface abstract Lcom/amazon/insights/event/InternalEvent;
.super Ljava/lang/Object;
.source "InternalEvent.java"

# interfaces
.implements Lcom/amazon/insights/Event;
.implements Lcom/amazon/insights/core/util/JSONSerializable;


# virtual methods
.method public abstract getApplicationKey()Ljava/lang/String;
.end method

.method public abstract getEventTimestamp()Ljava/lang/Long;
.end method

.method public abstract getSdkName()Ljava/lang/String;
.end method

.method public abstract getSdkVersion()Ljava/lang/String;
.end method

.method public abstract getUniqueId()Lcom/amazon/insights/core/idresolver/Id;
.end method
