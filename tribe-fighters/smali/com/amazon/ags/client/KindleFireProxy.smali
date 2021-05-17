.class public interface abstract Lcom/amazon/ags/client/KindleFireProxy;
.super Ljava/lang/Object;
.source "KindleFireProxy.java"


# virtual methods
.method public abstract bindToGameCircleService(Lcom/amazon/ags/client/KindleFireBindingCallback;)V
.end method

.method public abstract getStatus()Lcom/amazon/ags/client/KindleFireStatus;
.end method

.method public abstract isKindle()Z
.end method

.method public abstract isOptedIn()Z
.end method

.method public abstract isOverlaysSupported()Z
.end method

.method public abstract isReady()Z
.end method

.method public abstract isRegistered()Z
.end method

.method public abstract isUniversalSupported()Z
.end method

.method public abstract isWhispersyncEnabled()Z
.end method

.method public abstract setOptIn(Z)V
.end method

.method public abstract showOverlay(Ljava/lang/String;)V
.end method

.method public abstract signMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method
