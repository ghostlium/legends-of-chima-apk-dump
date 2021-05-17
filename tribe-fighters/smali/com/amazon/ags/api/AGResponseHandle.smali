.class public interface abstract Lcom/amazon/ags/api/AGResponseHandle;
.super Ljava/lang/Object;
.source "AGResponseHandle.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/amazon/ags/api/RequestResponse;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract getResponse()Lcom/amazon/ags/api/RequestResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public abstract getStatus()Lcom/amazon/ags/api/AGHandleStatus;
.end method

.method public abstract setCallback(Lcom/amazon/ags/api/AGResponseCallback;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/api/AGResponseCallback",
            "<TT;>;)V"
        }
    .end annotation
.end method
