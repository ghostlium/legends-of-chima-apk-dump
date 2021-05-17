.class public interface abstract Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;
.super Ljava/lang/Object;
.source "GlobalState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/ags/html5/util/GlobalState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "GlobalStateListener"
.end annotation


# virtual methods
.method public abstract notifyIsGuestModeSet(Z)V
.end method

.method public abstract notifyPlayerIdSet(Ljava/lang/String;)V
.end method

.method public abstract notifyStateSet(Ljava/lang/String;Ljava/lang/String;)V
.end method
