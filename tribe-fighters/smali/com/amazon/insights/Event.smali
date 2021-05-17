.class public interface abstract Lcom/amazon/insights/Event;
.super Ljava/lang/Object;
.source "Event.java"


# virtual methods
.method public abstract addAttribute(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract addMetric(Ljava/lang/String;Ljava/lang/Number;)V
.end method

.method public abstract getAllAttributes()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getAllMetrics()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Number;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getAttribute(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getEventType()Ljava/lang/String;
.end method

.method public abstract getMetric(Ljava/lang/String;)Ljava/lang/Number;
.end method

.method public abstract hasAttribute(Ljava/lang/String;)Z
.end method

.method public abstract hasMetric(Ljava/lang/String;)Z
.end method

.method public abstract withAttribute(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/Event;
.end method

.method public abstract withMetric(Ljava/lang/String;Ljava/lang/Number;)Lcom/amazon/insights/Event;
.end method
