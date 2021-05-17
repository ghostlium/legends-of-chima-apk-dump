.class public final Lcom/flurry/sdk/qx;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final a:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field final b:Lcom/flurry/sdk/qx;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/qx",
            "<TT;>;"
        }
    .end annotation
.end field


# virtual methods
.method public a()Lcom/flurry/sdk/qx;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/flurry/sdk/qx",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 21
    iget-object v0, p0, Lcom/flurry/sdk/qx;->b:Lcom/flurry/sdk/qx;

    return-object v0
.end method

.method public b()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 23
    iget-object v0, p0, Lcom/flurry/sdk/qx;->a:Ljava/lang/Object;

    return-object v0
.end method
