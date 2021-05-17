.class public interface abstract Lcom/amazon/insights/event/adapter/EventAdapter;
.super Ljava/lang/Object;
.source "EventAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract translateFromEvent(Lcom/amazon/insights/event/InternalEvent;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/insights/event/InternalEvent;",
            ")TT;"
        }
    .end annotation
.end method
