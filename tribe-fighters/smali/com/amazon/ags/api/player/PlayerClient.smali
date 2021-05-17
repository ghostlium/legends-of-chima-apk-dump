.class public interface abstract Lcom/amazon/ags/api/player/PlayerClient;
.super Ljava/lang/Object;
.source "PlayerClient.java"


# virtual methods
.method public varargs abstract getLocalPlayer([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<",
            "Lcom/amazon/ags/api/player/RequestPlayerResponse;",
            ">;"
        }
    .end annotation
.end method

.method public abstract isSignedIn()Z
.end method

.method public abstract setSignedInListener(Lcom/amazon/ags/api/player/AGSignedInListener;)V
.end method
