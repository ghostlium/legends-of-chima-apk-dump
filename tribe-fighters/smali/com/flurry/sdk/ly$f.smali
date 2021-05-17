.class final Lcom/flurry/sdk/ly$f;
.super Lcom/flurry/sdk/ly$a;
.source "SourceFile"


# annotations
.annotation runtime Lcom/flurry/sdk/kb;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/ly;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "f"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/ly$a",
        "<[F>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 497
    const-class v0, [F

    invoke-direct {p0, v0}, Lcom/flurry/sdk/ly$a;-><init>(Ljava/lang/Class;)V

    return-void
.end method

.method private final c(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)[F
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 526
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->e()Lcom/flurry/sdk/hw;

    move-result-object v0

    sget-object v1, Lcom/flurry/sdk/hw;->h:Lcom/flurry/sdk/hw;

    if-ne v0, v1, :cond_0

    sget-object v0, Lcom/flurry/sdk/iz$a;->q:Lcom/flurry/sdk/iz$a;

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/ja;->a(Lcom/flurry/sdk/iz$a;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 528
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->k()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 529
    const/4 v0, 0x0

    .line 535
    :goto_0
    return-object v0

    .line 532
    :cond_0
    sget-object v0, Lcom/flurry/sdk/iz$a;->o:Lcom/flurry/sdk/iz$a;

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/ja;->a(Lcom/flurry/sdk/iz$a;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 533
    iget-object v0, p0, Lcom/flurry/sdk/ly$f;->q:Ljava/lang/Class;

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/ja;->b(Ljava/lang/Class;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0

    .line 535
    :cond_1
    const/4 v0, 0x1

    new-array v0, v0, [F

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/ly$f;->y(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)F

    move-result v2

    aput v2, v0, v1

    goto :goto_0
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
    .line 493
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/ly$f;->b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)[F

    move-result-object v0

    return-object v0
.end method

.method public b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)[F
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 503
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->j()Z

    move-result v0

    if-nez v0, :cond_0

    .line 504
    invoke-direct {p0, p1, p2}, Lcom/flurry/sdk/ly$f;->c(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)[F

    move-result-object v0

    .line 519
    :goto_0
    return-object v0

    .line 506
    :cond_0
    invoke-virtual {p2}, Lcom/flurry/sdk/ja;->h()Lcom/flurry/sdk/qq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/qq;->f()Lcom/flurry/sdk/qq$e;

    move-result-object v4

    .line 507
    invoke-virtual {v4}, Lcom/flurry/sdk/qq$e;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    move-object v2, v0

    move v0, v1

    .line 510
    :goto_1
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->b()Lcom/flurry/sdk/hw;

    move-result-object v3

    sget-object v5, Lcom/flurry/sdk/hw;->e:Lcom/flurry/sdk/hw;

    if-eq v3, v5, :cond_1

    .line 512
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/ly$f;->y(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)F

    move-result v5

    .line 513
    array-length v3, v2

    if-lt v0, v3, :cond_2

    .line 514
    invoke-virtual {v4, v2, v0}, Lcom/flurry/sdk/qq$e;->a(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    move v3, v1

    move-object v2, v0

    .line 517
    :goto_2
    add-int/lit8 v0, v3, 0x1

    aput v5, v2, v3

    goto :goto_1

    .line 519
    :cond_1
    invoke-virtual {v4, v2, v0}, Lcom/flurry/sdk/qq$e;->b(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    goto :goto_0

    :cond_2
    move v3, v0

    goto :goto_2
.end method
