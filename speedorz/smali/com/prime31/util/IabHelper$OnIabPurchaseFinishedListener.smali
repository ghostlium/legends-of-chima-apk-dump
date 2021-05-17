.class public interface abstract Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;
.super Ljava/lang/Object;
.source "IabHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/prime31/util/IabHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnIabPurchaseFinishedListener"
.end annotation


# virtual methods
.method public abstract onIabPurchaseCompleteAwaitingVerification(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract onIabPurchaseFinished(Lcom/prime31/util/IabResult;Lcom/prime31/util/Purchase;)V
.end method
