.class public interface abstract Lcom/amuzo/tech/legoid/IAsyncCaller;
.super Ljava/lang/Object;
.source "IAsyncCaller.java"


# virtual methods
.method public abstract cancelRequest()V
.end method

.method public abstract executeRequest()V
.end method

.method public abstract notifyCallerOnConnectionFailure(Lcom/amuzo/tech/legoid/ConnectionErrors;Ljava/lang/String;)V
.end method

.method public abstract notifyCallerOnPostExecute(Ljava/lang/String;)V
.end method

.method public abstract notifyCallerOnRequestCancelled()V
.end method
