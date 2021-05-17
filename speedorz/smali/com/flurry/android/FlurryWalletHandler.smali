.class public abstract Lcom/flurry/android/FlurryWalletHandler;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/android/AppCloudValueUpdateHandler;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract onValueUpdated(Lcom/flurry/android/FlurryWalletInfo;)V
.end method

.method public onValueUpdated(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 13
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
