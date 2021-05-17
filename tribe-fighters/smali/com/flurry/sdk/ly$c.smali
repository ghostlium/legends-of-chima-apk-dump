.class final Lcom/flurry/sdk/ly$c;
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
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/ly$a",
        "<[B>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 279
    const-class v0, [B

    invoke-direct {p0, v0}, Lcom/flurry/sdk/ly$a;-><init>(Ljava/lang/Class;)V

    return-void
.end method

.method private final c(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 332
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->e()Lcom/flurry/sdk/hw;

    move-result-object v0

    sget-object v2, Lcom/flurry/sdk/hw;->h:Lcom/flurry/sdk/hw;

    if-ne v0, v2, :cond_0

    sget-object v0, Lcom/flurry/sdk/iz$a;->q:Lcom/flurry/sdk/iz$a;

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/ja;->a(Lcom/flurry/sdk/iz$a;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 334
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->k()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 335
    const/4 v0, 0x0

    .line 353
    :goto_0
    return-object v0

    .line 338
    :cond_0
    sget-object v0, Lcom/flurry/sdk/iz$a;->o:Lcom/flurry/sdk/iz$a;

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/ja;->a(Lcom/flurry/sdk/iz$a;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 339
    iget-object v0, p0, Lcom/flurry/sdk/ly$c;->q:Ljava/lang/Class;

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/ja;->b(Ljava/lang/Class;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0

    .line 342
    :cond_1
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->e()Lcom/flurry/sdk/hw;

    move-result-object v0

    .line 343
    sget-object v2, Lcom/flurry/sdk/hw;->i:Lcom/flurry/sdk/hw;

    if-eq v0, v2, :cond_2

    sget-object v2, Lcom/flurry/sdk/hw;->j:Lcom/flurry/sdk/hw;

    if-ne v0, v2, :cond_3

    .line 345
    :cond_2
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->r()B

    move-result v0

    .line 353
    :goto_1
    const/4 v2, 0x1

    new-array v2, v2, [B

    aput-byte v0, v2, v1

    move-object v0, v2

    goto :goto_0

    .line 348
    :cond_3
    sget-object v2, Lcom/flurry/sdk/hw;->m:Lcom/flurry/sdk/hw;

    if-eq v0, v2, :cond_4

    .line 349
    iget-object v0, p0, Lcom/flurry/sdk/ly$c;->q:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/ja;->b(Ljava/lang/Class;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0

    :cond_4
    move v0, v1

    .line 351
    goto :goto_1
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
    .line 275
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/ly$c;->b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)[B

    move-result-object v0

    return-object v0
.end method

.method public b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)[B
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 285
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->e()Lcom/flurry/sdk/hw;

    move-result-object v0

    .line 288
    sget-object v2, Lcom/flurry/sdk/hw;->h:Lcom/flurry/sdk/hw;

    if-ne v0, v2, :cond_0

    .line 289
    invoke-virtual {p2}, Lcom/flurry/sdk/ja;->c()Lcom/flurry/sdk/hl;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/ht;->a(Lcom/flurry/sdk/hl;)[B

    move-result-object v0

    .line 325
    :goto_0
    return-object v0

    .line 292
    :cond_0
    sget-object v2, Lcom/flurry/sdk/hw;->g:Lcom/flurry/sdk/hw;

    if-ne v0, v2, :cond_2

    .line 293
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->z()Ljava/lang/Object;

    move-result-object v0

    .line 294
    if-nez v0, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    .line 295
    :cond_1
    instance-of v2, v0, [B

    if-eqz v2, :cond_2

    .line 296
    check-cast v0, [B

    check-cast v0, [B

    goto :goto_0

    .line 299
    :cond_2
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->j()Z

    move-result v0

    if-nez v0, :cond_3

    .line 300
    invoke-direct {p0, p1, p2}, Lcom/flurry/sdk/ly$c;->c(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)[B

    move-result-object v0

    goto :goto_0

    .line 302
    :cond_3
    invoke-virtual {p2}, Lcom/flurry/sdk/ja;->h()Lcom/flurry/sdk/qq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/qq;->b()Lcom/flurry/sdk/qq$c;

    move-result-object v5

    .line 303
    invoke-virtual {v5}, Lcom/flurry/sdk/qq$c;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    move-object v2, v0

    move v0, v1

    .line 306
    :goto_1
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->b()Lcom/flurry/sdk/hw;

    move-result-object v3

    sget-object v4, Lcom/flurry/sdk/hw;->e:Lcom/flurry/sdk/hw;

    if-eq v3, v4, :cond_7

    .line 309
    sget-object v4, Lcom/flurry/sdk/hw;->i:Lcom/flurry/sdk/hw;

    if-eq v3, v4, :cond_4

    sget-object v4, Lcom/flurry/sdk/hw;->j:Lcom/flurry/sdk/hw;

    if-ne v3, v4, :cond_5

    .line 311
    :cond_4
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->r()B

    move-result v3

    .line 319
    :goto_2
    array-length v4, v2

    if-lt v0, v4, :cond_8

    .line 320
    invoke-virtual {v5, v2, v0}, Lcom/flurry/sdk/qq$c;->a(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    move v4, v1

    move-object v2, v0

    .line 323
    :goto_3
    add-int/lit8 v0, v4, 0x1

    aput-byte v3, v2, v4

    goto :goto_1

    .line 314
    :cond_5
    sget-object v4, Lcom/flurry/sdk/hw;->m:Lcom/flurry/sdk/hw;

    if-eq v3, v4, :cond_6

    .line 315
    iget-object v0, p0, Lcom/flurry/sdk/ly$c;->q:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/ja;->b(Ljava/lang/Class;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0

    :cond_6
    move v3, v1

    .line 317
    goto :goto_2

    .line 325
    :cond_7
    invoke-virtual {v5, v2, v0}, Lcom/flurry/sdk/qq$c;->b(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    goto :goto_0

    :cond_8
    move v4, v0

    goto :goto_3
.end method
