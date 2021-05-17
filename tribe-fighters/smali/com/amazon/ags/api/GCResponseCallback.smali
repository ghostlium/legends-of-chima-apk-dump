.class public interface abstract Lcom/amazon/ags/api/GCResponseCallback;
.super Ljava/lang/Object;
.source "GCResponseCallback.java"


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
.method public abstract onFailure(ILcom/amazon/ags/api/ErrorCode;)V
.end method

.method public abstract onSuccess(Lcom/amazon/ags/api/RequestResponse;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method
