.class public abstract Lcom/flurry/sdk/id;
.super Lcom/flurry/sdk/ht;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/id$1;
    }
.end annotation


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 59
    invoke-direct {p0}, Lcom/flurry/sdk/ht;-><init>()V

    return-void
.end method

.method protected constructor <init>(I)V
    .locals 0

    .prologue
    .line 61
    invoke-direct {p0, p1}, Lcom/flurry/sdk/ht;-><init>(I)V

    .line 62
    return-void
.end method

.method protected static final c(I)Ljava/lang/String;
    .locals 3

    .prologue
    .line 508
    int-to-char v0, p0

    .line 509
    invoke-static {v0}, Ljava/lang/Character;->isISOControl(C)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 510
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "(CTRL-CHAR, code "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 515
    :goto_0
    return-object v0

    .line 512
    :cond_0
    const/16 v1, 0xff

    if-le p0, v1, :cond_1

    .line 513
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\' (code "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " / 0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 515
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\' (code "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method protected abstract H()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/hs;
        }
    .end annotation
.end method

.method protected R()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 425
    const-string v0, "Unexpected end-of-String in base64 content"

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/id;->a(Ljava/lang/String;)Lcom/flurry/sdk/hs;

    move-result-object v0

    throw v0
.end method

.method protected S()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 448
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/id;->b:Lcom/flurry/sdk/hw;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/id;->c(Ljava/lang/String;)V

    .line 449
    return-void
.end method

.method protected T()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 459
    const-string v0, " in a value"

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/id;->c(Ljava/lang/String;)V

    .line 460
    return-void
.end method

.method protected final U()V
    .locals 2

    .prologue
    .line 532
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Internal error: this code path should never get executed"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected a(C)C
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 489
    sget-object v0, Lcom/flurry/sdk/ht$a;->f:Lcom/flurry/sdk/ht$a;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/id;->a(Lcom/flurry/sdk/ht$a;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 497
    :cond_0
    :goto_0
    return p1

    .line 493
    :cond_1
    const/16 v0, 0x27

    if-ne p1, v0, :cond_2

    sget-object v0, Lcom/flurry/sdk/ht$a;->d:Lcom/flurry/sdk/ht$a;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/id;->a(Lcom/flurry/sdk/ht$a;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 496
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unrecognized character escape "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lcom/flurry/sdk/id;->c(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/id;->d(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected a(Lcom/flurry/sdk/hl;CILjava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 408
    const/16 v0, 0x20

    if-gt p2, v0, :cond_1

    .line 409
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Illegal white space character (code 0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") as character #"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    add-int/lit8 v1, p3, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " of 4-char base64 unit: can only used between units"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 418
    :goto_0
    if-eqz p4, :cond_0

    .line 419
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 421
    :cond_0
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/id;->a(Ljava/lang/String;)Lcom/flurry/sdk/hs;

    move-result-object v0

    throw v0

    .line 410
    :cond_1
    invoke-virtual {p1, p2}, Lcom/flurry/sdk/hl;->a(C)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 411
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unexpected padding character (\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/flurry/sdk/hl;->b()C

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\') as character #"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    add-int/lit8 v1, p3, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " of 4-char base64 unit: padding only legal as 3rd or 4th character"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 412
    :cond_2
    invoke-static {p2}, Ljava/lang/Character;->isDefined(C)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {p2}, Ljava/lang/Character;->isISOControl(C)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 414
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Illegal character (code 0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") in base64 content"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 416
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Illegal character \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\' (code 0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") in base64 content"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0
.end method

.method protected a(Ljava/lang/String;Lcom/flurry/sdk/rz;Lcom/flurry/sdk/hl;)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    const/4 v9, 0x3

    const/4 v2, 0x0

    const/4 v8, -0x2

    const/4 v7, 0x0

    .line 313
    .line 314
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    move v0, v2

    .line 317
    :goto_0
    if-ge v0, v3, :cond_0

    .line 321
    :goto_1
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 322
    if-lt v1, v3, :cond_1

    .line 398
    :cond_0
    :goto_2
    return-void

    .line 325
    :cond_1
    const/16 v4, 0x20

    if-le v0, v4, :cond_f

    .line 326
    invoke-virtual {p3, v0}, Lcom/flurry/sdk/hl;->b(C)I

    move-result v4

    .line 327
    if-gez v4, :cond_2

    .line 328
    invoke-virtual {p0, p3, v0, v2, v7}, Lcom/flurry/sdk/id;->a(Lcom/flurry/sdk/hl;CILjava/lang/String;)V

    .line 332
    :cond_2
    if-lt v1, v3, :cond_3

    .line 333
    invoke-virtual {p0}, Lcom/flurry/sdk/id;->R()V

    .line 335
    :cond_3
    add-int/lit8 v0, v1, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 336
    invoke-virtual {p3, v1}, Lcom/flurry/sdk/hl;->b(C)I

    move-result v5

    .line 337
    if-gez v5, :cond_4

    .line 338
    const/4 v6, 0x1

    invoke-virtual {p0, p3, v1, v6, v7}, Lcom/flurry/sdk/id;->a(Lcom/flurry/sdk/hl;CILjava/lang/String;)V

    .line 340
    :cond_4
    shl-int/lit8 v1, v4, 0x6

    or-int/2addr v1, v5

    .line 342
    if-lt v0, v3, :cond_6

    .line 344
    invoke-virtual {p3}, Lcom/flurry/sdk/hl;->a()Z

    move-result v4

    if-nez v4, :cond_5

    .line 345
    shr-int/lit8 v0, v1, 0x4

    .line 346
    invoke-virtual {p2, v0}, Lcom/flurry/sdk/rz;->a(I)V

    goto :goto_2

    .line 349
    :cond_5
    invoke-virtual {p0}, Lcom/flurry/sdk/id;->R()V

    .line 351
    :cond_6
    add-int/lit8 v4, v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 352
    invoke-virtual {p3, v0}, Lcom/flurry/sdk/hl;->b(C)I

    move-result v5

    .line 355
    if-gez v5, :cond_a

    .line 356
    if-eq v5, v8, :cond_7

    .line 357
    const/4 v5, 0x2

    invoke-virtual {p0, p3, v0, v5, v7}, Lcom/flurry/sdk/id;->a(Lcom/flurry/sdk/hl;CILjava/lang/String;)V

    .line 360
    :cond_7
    if-lt v4, v3, :cond_8

    .line 361
    invoke-virtual {p0}, Lcom/flurry/sdk/id;->R()V

    .line 363
    :cond_8
    add-int/lit8 v0, v4, 0x1

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 364
    invoke-virtual {p3, v4}, Lcom/flurry/sdk/hl;->a(C)Z

    move-result v5

    if-nez v5, :cond_9

    .line 365
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "expected padding character \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p3}, Lcom/flurry/sdk/hl;->b()C

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, p3, v4, v9, v5}, Lcom/flurry/sdk/id;->a(Lcom/flurry/sdk/hl;CILjava/lang/String;)V

    .line 368
    :cond_9
    shr-int/lit8 v1, v1, 0x4

    .line 369
    invoke-virtual {p2, v1}, Lcom/flurry/sdk/rz;->a(I)V

    goto/16 :goto_0

    .line 373
    :cond_a
    shl-int/lit8 v0, v1, 0x6

    or-int v1, v0, v5

    .line 375
    if-lt v4, v3, :cond_c

    .line 377
    invoke-virtual {p3}, Lcom/flurry/sdk/hl;->a()Z

    move-result v0

    if-nez v0, :cond_b

    .line 378
    shr-int/lit8 v0, v1, 0x2

    .line 379
    invoke-virtual {p2, v0}, Lcom/flurry/sdk/rz;->b(I)V

    goto/16 :goto_2

    .line 382
    :cond_b
    invoke-virtual {p0}, Lcom/flurry/sdk/id;->R()V

    .line 384
    :cond_c
    add-int/lit8 v0, v4, 0x1

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 385
    invoke-virtual {p3, v4}, Lcom/flurry/sdk/hl;->b(C)I

    move-result v5

    .line 386
    if-gez v5, :cond_e

    .line 387
    if-eq v5, v8, :cond_d

    .line 388
    invoke-virtual {p0, p3, v4, v9, v7}, Lcom/flurry/sdk/id;->a(Lcom/flurry/sdk/hl;CILjava/lang/String;)V

    .line 390
    :cond_d
    shr-int/lit8 v1, v1, 0x2

    .line 391
    invoke-virtual {p2, v1}, Lcom/flurry/sdk/rz;->b(I)V

    goto/16 :goto_0

    .line 394
    :cond_e
    shl-int/lit8 v1, v1, 0x6

    or-int/2addr v1, v5

    .line 395
    invoke-virtual {p2, v1}, Lcom/flurry/sdk/rz;->c(I)V

    goto/16 :goto_0

    :cond_f
    move v0, v1

    goto/16 :goto_1
.end method

.method protected final a(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 527
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/id;->b(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/flurry/sdk/hs;

    move-result-object v0

    throw v0
.end method

.method protected final b(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/flurry/sdk/hs;
    .locals 2

    .prologue
    .line 537
    new-instance v0, Lcom/flurry/sdk/hs;

    invoke-virtual {p0}, Lcom/flurry/sdk/id;->i()Lcom/flurry/sdk/hq;

    move-result-object v1

    invoke-direct {v0, p1, v1, p2}, Lcom/flurry/sdk/hs;-><init>(Ljava/lang/String;Lcom/flurry/sdk/hq;Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public abstract b()Lcom/flurry/sdk/hw;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation
.end method

.method protected b(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 465
    int-to-char v0, p1

    .line 466
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Illegal character ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v0}, Lcom/flurry/sdk/id;->c(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "): only regular white space (\\r, \\n, \\t) is allowed between tokens"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 467
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/id;->d(Ljava/lang/String;)V

    .line 468
    return-void
.end method

.method protected b(ILjava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 438
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unexpected character ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lcom/flurry/sdk/id;->c(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 439
    if-eqz p2, :cond_0

    .line 440
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 442
    :cond_0
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/id;->d(Ljava/lang/String;)V

    .line 443
    return-void
.end method

.method protected c(ILjava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 479
    sget-object v0, Lcom/flurry/sdk/ht$a;->e:Lcom/flurry/sdk/ht$a;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/id;->a(Lcom/flurry/sdk/ht$a;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x20

    if-lt p1, v0, :cond_1

    .line 480
    :cond_0
    int-to-char v0, p1

    .line 481
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Illegal unquoted character ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v0}, Lcom/flurry/sdk/id;->c(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "): has to be escaped using backslash to be included in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 482
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/id;->d(Ljava/lang/String;)V

    .line 484
    :cond_1
    return-void
.end method

.method protected c(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 454
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unexpected end-of-input"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/id;->d(Ljava/lang/String;)V

    .line 455
    return-void
.end method

.method public d()Lcom/flurry/sdk/ht;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 91
    iget-object v0, p0, Lcom/flurry/sdk/id;->b:Lcom/flurry/sdk/hw;

    sget-object v1, Lcom/flurry/sdk/hw;->b:Lcom/flurry/sdk/hw;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/id;->b:Lcom/flurry/sdk/hw;

    sget-object v1, Lcom/flurry/sdk/hw;->d:Lcom/flurry/sdk/hw;

    if-eq v0, v1, :cond_0

    .line 118
    :goto_0
    return-object p0

    .line 95
    :cond_0
    const/4 v0, 0x1

    .line 101
    :cond_1
    :goto_1
    invoke-virtual {p0}, Lcom/flurry/sdk/id;->b()Lcom/flurry/sdk/hw;

    move-result-object v1

    .line 102
    if-nez v1, :cond_2

    .line 103
    invoke-virtual {p0}, Lcom/flurry/sdk/id;->H()V

    goto :goto_0

    .line 110
    :cond_2
    sget-object v2, Lcom/flurry/sdk/id$1;->a:[I

    invoke-virtual {v1}, Lcom/flurry/sdk/hw;->ordinal()I

    move-result v1

    aget v1, v2, v1

    packed-switch v1, :pswitch_data_0

    goto :goto_1

    .line 113
    :pswitch_0
    add-int/lit8 v0, v0, 0x1

    .line 114
    goto :goto_1

    .line 117
    :pswitch_1
    add-int/lit8 v0, v0, -0x1

    if-nez v0, :cond_1

    goto :goto_0

    .line 110
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method protected final d(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 521
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/id;->a(Ljava/lang/String;)Lcom/flurry/sdk/hs;

    move-result-object v0

    throw v0
.end method

.method public abstract k()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation
.end method
