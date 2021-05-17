.class public abstract Lcom/flurry/sdk/gw;
.super Lcom/flurry/sdk/fp;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/flurry/sdk/gu;",
        ">",
        "Lcom/flurry/sdk/fp",
        "<TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/fm;)V
    .locals 1

    .prologue
    .line 35
    invoke-static {}, Lcom/flurry/sdk/gr;->b()Lcom/flurry/sdk/gr;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/flurry/sdk/fp;-><init>(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fs;)V

    .line 36
    return-void
.end method
