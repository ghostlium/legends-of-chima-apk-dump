.class public Lcom/flurry/sdk/lu;
.super Lcom/flurry/sdk/mc;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/mc",
        "<",
        "Lcom/flurry/sdk/rx;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    const-class v0, Lcom/flurry/sdk/rx;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/mc;-><init>(Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public synthetic a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 14
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/lu;->b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Lcom/flurry/sdk/rx;

    move-result-object v0

    return-object v0
.end method

.method public b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Lcom/flurry/sdk/rx;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 23
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->e()Lcom/flurry/sdk/hw;

    move-result-object v0

    .line 25
    sget-object v1, Lcom/flurry/sdk/hw;->h:Lcom/flurry/sdk/hw;

    if-ne v0, v1, :cond_1

    .line 26
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->k()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    .line 28
    invoke-virtual {p0}, Lcom/flurry/sdk/lu;->c()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/rx;

    .line 34
    :goto_0
    return-object v0

    .line 30
    :cond_0
    invoke-virtual {p2}, Lcom/flurry/sdk/ja;->f()Lcom/flurry/sdk/qm;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/flurry/sdk/qm;->b(Ljava/lang/String;)Lcom/flurry/sdk/rx;

    move-result-object v0

    goto :goto_0

    .line 33
    :cond_1
    sget-object v1, Lcom/flurry/sdk/hw;->g:Lcom/flurry/sdk/hw;

    if-ne v0, v1, :cond_2

    .line 34
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->z()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/rx;

    goto :goto_0

    .line 36
    :cond_2
    iget-object v0, p0, Lcom/flurry/sdk/lu;->q:Ljava/lang/Class;

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/ja;->b(Ljava/lang/Class;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0
.end method
