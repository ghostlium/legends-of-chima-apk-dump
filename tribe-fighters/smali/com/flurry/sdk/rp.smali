.class public abstract Lcom/flurry/sdk/rp;
.super Lcom/flurry/sdk/rt;
.source "SourceFile"


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/flurry/sdk/rt;-><init>()V

    return-void
.end method


# virtual methods
.method public a(D)D
    .locals 2

    .prologue
    .line 70
    invoke-virtual {p0}, Lcom/flurry/sdk/rp;->l()D

    move-result-wide v0

    return-wide v0
.end method

.method public final c()Z
    .locals 1

    .prologue
    .line 17
    const/4 v0, 0x1

    return v0
.end method

.method public abstract l()D
.end method
