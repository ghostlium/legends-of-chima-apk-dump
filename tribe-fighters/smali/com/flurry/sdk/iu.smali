.class public abstract Lcom/flurry/sdk/iu;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract a()Ljava/lang/String;
.end method

.method public abstract b()Z
.end method

.method public abstract c()Z
.end method

.method public abstract d()Z
.end method

.method public abstract e()Z
.end method

.method public f()Z
    .locals 1

    .prologue
    .line 42
    invoke-virtual {p0}, Lcom/flurry/sdk/iu;->k()Lcom/flurry/sdk/mq;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public abstract g()Lcom/flurry/sdk/mr;
.end method

.method public abstract h()Lcom/flurry/sdk/mr;
.end method

.method public abstract i()Lcom/flurry/sdk/mp;
.end method

.method public abstract j()Lcom/flurry/sdk/mq;
.end method

.method public abstract k()Lcom/flurry/sdk/mq;
.end method
