.class public Lcom/flurry/sdk/mf;
.super Lcom/flurry/sdk/mc;
.source "SourceFile"


# annotations
.annotation runtime Lcom/flurry/sdk/kb;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/mc",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    const-class v0, Ljava/lang/String;

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
    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/mf;->b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public synthetic a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Lcom/flurry/sdk/jy;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 13
    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/mf;->b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Lcom/flurry/sdk/jy;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/String;
    .locals 3
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

    if-ne v0, v1, :cond_0

    .line 26
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->k()Ljava/lang/String;

    move-result-object v0

    .line 42
    :goto_0
    return-object v0

    .line 29
    :cond_0
    sget-object v1, Lcom/flurry/sdk/hw;->g:Lcom/flurry/sdk/hw;

    if-ne v0, v1, :cond_3

    .line 30
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->z()Ljava/lang/Object;

    move-result-object v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    const/4 v0, 0x0

    goto :goto_0

    .line 34
    :cond_1
    instance-of v1, v0, [B

    if-eqz v1, :cond_2

    .line 35
    invoke-static {}, Lcom/flurry/sdk/hm;->a()Lcom/flurry/sdk/hl;

    move-result-object v1

    check-cast v0, [B

    check-cast v0, [B

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/flurry/sdk/hl;->a([BZ)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 38
    :cond_2
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 41
    :cond_3
    invoke-virtual {v0}, Lcom/flurry/sdk/hw;->d()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 42
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->k()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 44
    :cond_4
    iget-object v1, p0, Lcom/flurry/sdk/mf;->q:Ljava/lang/Class;

    invoke-virtual {p2, v1, v0}, Lcom/flurry/sdk/ja;->a(Ljava/lang/Class;Lcom/flurry/sdk/hw;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0
.end method

.method public b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Lcom/flurry/sdk/jy;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 54
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/mf;->b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
