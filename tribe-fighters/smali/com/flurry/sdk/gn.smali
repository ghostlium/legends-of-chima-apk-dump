.class public Lcom/flurry/sdk/gn;
.super Lcom/flurry/sdk/gq;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/gn$1;,
        Lcom/flurry/sdk/gn$a;
    }
.end annotation


# static fields
.field private static a:Lcom/flurry/sdk/gi;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 281
    new-instance v0, Lcom/flurry/sdk/gi;

    invoke-direct {v0}, Lcom/flurry/sdk/gi;-><init>()V

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/gi;->a(I)Lcom/flurry/sdk/gi;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/gn;->a:Lcom/flurry/sdk/gi;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/flurry/sdk/gq;-><init>()V

    .line 464
    return-void
.end method

.method private static a(Ljava/util/List;Ljava/util/List;)Lcom/flurry/sdk/gp;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/flurry/sdk/gp;"
        }
    .end annotation

    .prologue
    .line 409
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    new-array v2, v0, [Ljava/lang/Object;

    .line 410
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    array-length v0, v2

    if-ge v1, v0, :cond_1

    .line 411
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v3

    .line 412
    const/4 v0, -0x1

    if-ne v3, v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No match for "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_1
    aput-object v0, v2, v1

    .line 410
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    .line 412
    :cond_0
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, v3}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_1

    .line 415
    :cond_1
    new-instance v0, Lcom/flurry/sdk/gp$c;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1, v2}, Lcom/flurry/sdk/gp$c;-><init>(I[Ljava/lang/Object;)V

    return-object v0
.end method

.method public static a(Lcom/flurry/sdk/gh;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/hr;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 309
    sget-object v0, Lcom/flurry/sdk/gn$1;->a:[I

    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->a()Lcom/flurry/sdk/fm$v;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/sdk/fm$v;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 405
    :cond_0
    :goto_0
    return-void

    .line 311
    :pswitch_0
    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->b()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm$f;

    .line 312
    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->a()Ljava/lang/String;

    move-result-object v3

    .line 313
    invoke-virtual {p2, v3}, Lcom/flurry/sdk/hr;->a(Ljava/lang/String;)Lcom/flurry/sdk/hr;

    move-result-object v1

    .line 314
    if-nez v1, :cond_1

    .line 315
    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->e()Lcom/flurry/sdk/hr;

    move-result-object v1

    .line 317
    :cond_1
    if-nez v1, :cond_2

    .line 318
    new-instance v0, Lcom/flurry/sdk/fl;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No default value for: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fl;-><init>(Ljava/lang/String;)V

    throw v0

    .line 320
    :cond_2
    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->c()Lcom/flurry/sdk/fm;

    move-result-object v0

    invoke-static {p0, v0, v1}, Lcom/flurry/sdk/gn;->a(Lcom/flurry/sdk/gh;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/hr;)V

    goto :goto_1

    .line 324
    :pswitch_1
    invoke-virtual {p2}, Lcom/flurry/sdk/hr;->h()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/fm;->c(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/gh;->a(I)V

    goto :goto_0

    .line 327
    :pswitch_2
    invoke-virtual {p0}, Lcom/flurry/sdk/gh;->b()V

    .line 328
    invoke-virtual {p2}, Lcom/flurry/sdk/hr;->o()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Lcom/flurry/sdk/gh;->a(J)V

    .line 329
    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->i()Lcom/flurry/sdk/fm;

    move-result-object v1

    .line 330
    invoke-virtual {p2}, Lcom/flurry/sdk/hr;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/hr;

    .line 331
    invoke-virtual {p0}, Lcom/flurry/sdk/gh;->c()V

    .line 332
    invoke-static {p0, v1, v0}, Lcom/flurry/sdk/gn;->a(Lcom/flurry/sdk/gh;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/hr;)V

    goto :goto_2

    .line 334
    :cond_3
    invoke-virtual {p0}, Lcom/flurry/sdk/gh;->d()V

    goto :goto_0

    .line 337
    :pswitch_3
    invoke-virtual {p0}, Lcom/flurry/sdk/gh;->e()V

    .line 338
    invoke-virtual {p2}, Lcom/flurry/sdk/hr;->o()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Lcom/flurry/sdk/gh;->a(J)V

    .line 339
    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->j()Lcom/flurry/sdk/fm;

    move-result-object v1

    .line 340
    invoke-virtual {p2}, Lcom/flurry/sdk/hr;->q()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 341
    invoke-virtual {p0}, Lcom/flurry/sdk/gh;->c()V

    .line 342
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 343
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/gh;->a(Ljava/lang/String;)V

    .line 344
    invoke-virtual {p2, v0}, Lcom/flurry/sdk/hr;->a(Ljava/lang/String;)Lcom/flurry/sdk/hr;

    move-result-object v0

    invoke-static {p0, v1, v0}, Lcom/flurry/sdk/gn;->a(Lcom/flurry/sdk/gh;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/hr;)V

    goto :goto_3

    .line 346
    :cond_4
    invoke-virtual {p0}, Lcom/flurry/sdk/gh;->f()V

    goto/16 :goto_0

    .line 349
    :pswitch_4
    invoke-virtual {p0, v4}, Lcom/flurry/sdk/gh;->b(I)V

    .line 350
    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->k()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm;

    invoke-static {p0, v0, p2}, Lcom/flurry/sdk/gn;->a(Lcom/flurry/sdk/gh;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/hr;)V

    goto/16 :goto_0

    .line 353
    :pswitch_5
    invoke-virtual {p2}, Lcom/flurry/sdk/hr;->e()Z

    move-result v0

    if-nez v0, :cond_5

    .line 354
    new-instance v0, Lcom/flurry/sdk/fl;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Non-string default value for fixed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fl;-><init>(Ljava/lang/String;)V

    throw v0

    .line 355
    :cond_5
    invoke-virtual {p2}, Lcom/flurry/sdk/hr;->h()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ISO-8859-1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    .line 356
    array-length v0, v2

    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->l()I

    move-result v1

    if-eq v0, v1, :cond_f

    .line 358
    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->l()I

    move-result v0

    new-array v1, v0, [B

    .line 359
    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->l()I

    move-result v0

    array-length v3, v2

    if-le v0, v3, :cond_6

    array-length v0, v2

    :goto_4
    invoke-static {v2, v4, v1, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v0, v1

    .line 362
    :goto_5
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/gh;->b([B)V

    goto/16 :goto_0

    .line 359
    :cond_6
    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->l()I

    move-result v0

    goto :goto_4

    .line 365
    :pswitch_6
    invoke-virtual {p2}, Lcom/flurry/sdk/hr;->e()Z

    move-result v0

    if-nez v0, :cond_7

    .line 366
    new-instance v0, Lcom/flurry/sdk/fl;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Non-string default value for string: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fl;-><init>(Ljava/lang/String;)V

    throw v0

    .line 367
    :cond_7
    invoke-virtual {p2}, Lcom/flurry/sdk/hr;->h()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/gh;->a(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 370
    :pswitch_7
    invoke-virtual {p2}, Lcom/flurry/sdk/hr;->e()Z

    move-result v0

    if-nez v0, :cond_8

    .line 371
    new-instance v0, Lcom/flurry/sdk/fl;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Non-string default value for bytes: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fl;-><init>(Ljava/lang/String;)V

    throw v0

    .line 372
    :cond_8
    invoke-virtual {p2}, Lcom/flurry/sdk/hr;->h()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ISO-8859-1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/gh;->a([B)V

    goto/16 :goto_0

    .line 375
    :pswitch_8
    invoke-virtual {p2}, Lcom/flurry/sdk/hr;->c()Z

    move-result v0

    if-nez v0, :cond_9

    .line 376
    new-instance v0, Lcom/flurry/sdk/fl;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Non-numeric default value for int: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fl;-><init>(Ljava/lang/String;)V

    throw v0

    .line 377
    :cond_9
    invoke-virtual {p2}, Lcom/flurry/sdk/hr;->j()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/gh;->c(I)V

    goto/16 :goto_0

    .line 380
    :pswitch_9
    invoke-virtual {p2}, Lcom/flurry/sdk/hr;->c()Z

    move-result v0

    if-nez v0, :cond_a

    .line 381
    new-instance v0, Lcom/flurry/sdk/fl;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Non-numeric default value for long: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fl;-><init>(Ljava/lang/String;)V

    throw v0

    .line 382
    :cond_a
    invoke-virtual {p2}, Lcom/flurry/sdk/hr;->k()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/flurry/sdk/gh;->b(J)V

    goto/16 :goto_0

    .line 385
    :pswitch_a
    invoke-virtual {p2}, Lcom/flurry/sdk/hr;->c()Z

    move-result v0

    if-nez v0, :cond_b

    .line 386
    new-instance v0, Lcom/flurry/sdk/fl;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Non-numeric default value for float: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fl;-><init>(Ljava/lang/String;)V

    throw v0

    .line 387
    :cond_b
    invoke-virtual {p2}, Lcom/flurry/sdk/hr;->l()D

    move-result-wide v0

    double-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/gh;->a(F)V

    goto/16 :goto_0

    .line 390
    :pswitch_b
    invoke-virtual {p2}, Lcom/flurry/sdk/hr;->c()Z

    move-result v0

    if-nez v0, :cond_c

    .line 391
    new-instance v0, Lcom/flurry/sdk/fl;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Non-numeric default value for double: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fl;-><init>(Ljava/lang/String;)V

    throw v0

    .line 392
    :cond_c
    invoke-virtual {p2}, Lcom/flurry/sdk/hr;->l()D

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/flurry/sdk/gh;->a(D)V

    goto/16 :goto_0

    .line 395
    :pswitch_c
    invoke-virtual {p2}, Lcom/flurry/sdk/hr;->f()Z

    move-result v0

    if-nez v0, :cond_d

    .line 396
    new-instance v0, Lcom/flurry/sdk/fl;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Non-boolean default for boolean: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fl;-><init>(Ljava/lang/String;)V

    throw v0

    .line 397
    :cond_d
    invoke-virtual {p2}, Lcom/flurry/sdk/hr;->i()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/gh;->a(Z)V

    goto/16 :goto_0

    .line 400
    :pswitch_d
    invoke-virtual {p2}, Lcom/flurry/sdk/hr;->g()Z

    move-result v0

    if-nez v0, :cond_e

    .line 401
    new-instance v0, Lcom/flurry/sdk/fl;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Non-null default value for null type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fl;-><init>(Ljava/lang/String;)V

    throw v0

    .line 402
    :cond_e
    invoke-virtual {p0}, Lcom/flurry/sdk/gh;->a()V

    goto/16 :goto_0

    :cond_f
    move-object v0, v2

    goto/16 :goto_5

    .line 309
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_d
        :pswitch_c
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_6
        :pswitch_7
        :pswitch_5
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method

.method private static a(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/hr;)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 291
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 292
    sget-object v1, Lcom/flurry/sdk/gn;->a:Lcom/flurry/sdk/gi;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/flurry/sdk/gi;->a(Ljava/io/OutputStream;Lcom/flurry/sdk/gb;)Lcom/flurry/sdk/gb;

    move-result-object v1

    .line 293
    invoke-static {v1, p0, p1}, Lcom/flurry/sdk/gn;->a(Lcom/flurry/sdk/gh;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/hr;)V

    .line 294
    invoke-virtual {v1}, Lcom/flurry/sdk/gh;->flush()V

    .line 295
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    return-object v0
.end method

.method private static b(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;)I
    .locals 7

    .prologue
    const/4 v2, 0x0

    .line 419
    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->a()Lcom/flurry/sdk/fm$v;

    move-result-object v3

    .line 422
    invoke-virtual {p0}, Lcom/flurry/sdk/fm;->k()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move v1, v2

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm;

    .line 423
    invoke-virtual {v0}, Lcom/flurry/sdk/fm;->a()Lcom/flurry/sdk/fm$v;

    move-result-object v5

    if-ne v3, v5, :cond_3

    .line 424
    sget-object v5, Lcom/flurry/sdk/fm$v;->a:Lcom/flurry/sdk/fm$v;

    if-eq v3, v5, :cond_0

    sget-object v5, Lcom/flurry/sdk/fm$v;->b:Lcom/flurry/sdk/fm$v;

    if-eq v3, v5, :cond_0

    sget-object v5, Lcom/flurry/sdk/fm$v;->f:Lcom/flurry/sdk/fm$v;

    if-ne v3, v5, :cond_2

    .line 426
    :cond_0
    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->g()Ljava/lang/String;

    move-result-object v5

    .line 427
    invoke-virtual {v0}, Lcom/flurry/sdk/fm;->g()Ljava/lang/String;

    move-result-object v0

    .line 428
    if-eqz v5, :cond_1

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    :cond_1
    if-ne v5, v0, :cond_3

    sget-object v0, Lcom/flurry/sdk/fm$v;->a:Lcom/flurry/sdk/fm$v;

    if-ne v3, v0, :cond_3

    .line 456
    :cond_2
    :goto_1
    return v1

    .line 433
    :cond_3
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    .line 438
    :cond_4
    invoke-virtual {p0}, Lcom/flurry/sdk/fm;->k()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm;

    .line 439
    sget-object v4, Lcom/flurry/sdk/gn$1;->a:[I

    invoke-virtual {v3}, Lcom/flurry/sdk/fm$v;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    .line 454
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 441
    :pswitch_0
    sget-object v4, Lcom/flurry/sdk/gn$1;->a:[I

    invoke-virtual {v0}, Lcom/flurry/sdk/fm;->a()Lcom/flurry/sdk/fm$v;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$v;->ordinal()I

    move-result v0

    aget v0, v4, v0

    packed-switch v0, :pswitch_data_1

    :pswitch_1
    goto :goto_3

    :pswitch_2
    move v1, v2

    .line 443
    goto :goto_1

    .line 448
    :pswitch_3
    sget-object v4, Lcom/flurry/sdk/gn$1;->a:[I

    invoke-virtual {v0}, Lcom/flurry/sdk/fm;->a()Lcom/flurry/sdk/fm$v;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$v;->ordinal()I

    move-result v0

    aget v0, v4, v0

    packed-switch v0, :pswitch_data_2

    goto :goto_3

    :pswitch_4
    move v1, v2

    .line 450
    goto :goto_1

    .line 456
    :cond_5
    const/4 v1, -0x1

    goto :goto_1

    .line 439
    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
        :pswitch_3
        :pswitch_3
    .end packed-switch

    .line 441
    :pswitch_data_1
    .packed-switch 0x4
        :pswitch_2
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 448
    :pswitch_data_2
    .packed-switch 0x6
        :pswitch_4
    .end packed-switch
.end method

.method private b(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;Ljava/util/Map;)Lcom/flurry/sdk/gp;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/fm;",
            "Lcom/flurry/sdk/fm;",
            "Ljava/util/Map",
            "<",
            "Lcom/flurry/sdk/gq$a;",
            "Lcom/flurry/sdk/gp;",
            ">;)",
            "Lcom/flurry/sdk/gp;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 181
    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->k()Ljava/util/List;

    move-result-object v0

    .line 182
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    .line 183
    new-array v3, v1, [Lcom/flurry/sdk/gp;

    .line 184
    new-array v4, v1, [Ljava/lang/String;

    .line 191
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move v1, v2

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm;

    .line 192
    invoke-virtual {p0, v0, p2, p3}, Lcom/flurry/sdk/gn;->a(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;Ljava/util/Map;)Lcom/flurry/sdk/gp;

    move-result-object v6

    aput-object v6, v3, v1

    .line 193
    invoke-virtual {v0}, Lcom/flurry/sdk/fm;->g()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v4, v1

    .line 194
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    .line 196
    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/flurry/sdk/gp;

    invoke-static {v3, v4}, Lcom/flurry/sdk/gp;->a([Lcom/flurry/sdk/gp;[Ljava/lang/String;)Lcom/flurry/sdk/gp;

    move-result-object v1

    aput-object v1, v0, v2

    const/4 v1, 0x1

    new-instance v2, Lcom/flurry/sdk/gp$q;

    invoke-direct {v2}, Lcom/flurry/sdk/gp$q;-><init>()V

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/flurry/sdk/gp;->b([Lcom/flurry/sdk/gp;)Lcom/flurry/sdk/gp;

    move-result-object v0

    return-object v0
.end method

.method private c(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;Ljava/util/Map;)Lcom/flurry/sdk/gp;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/fm;",
            "Lcom/flurry/sdk/fm;",
            "Ljava/util/Map",
            "<",
            "Lcom/flurry/sdk/gq$a;",
            "Lcom/flurry/sdk/gp;",
            ">;)",
            "Lcom/flurry/sdk/gp;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    .line 202
    new-instance v4, Lcom/flurry/sdk/gn$a;

    invoke-direct {v4, p1, p2}, Lcom/flurry/sdk/gn$a;-><init>(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;)V

    .line 203
    invoke-interface {p3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/gp;

    .line 204
    if-nez v0, :cond_1

    .line 205
    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->b()Ljava/util/List;

    move-result-object v5

    .line 206
    invoke-virtual {p2}, Lcom/flurry/sdk/fm;->b()Ljava/util/List;

    move-result-object v6

    .line 210
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v0

    new-array v7, v0, [Lcom/flurry/sdk/fm$f;

    .line 211
    const/4 v0, 0x0

    .line 212
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v2, v1, 0x1

    .line 214
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v1, v0

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm$f;

    .line 215
    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->a()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/fm;->b(Ljava/lang/String;)Lcom/flurry/sdk/fm$f;

    move-result-object v8

    .line 216
    if-eqz v8, :cond_9

    .line 217
    add-int/lit8 v0, v1, 0x1

    aput-object v8, v7, v1

    :goto_1
    move v1, v0

    .line 219
    goto :goto_0

    .line 221
    :cond_0
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    move v10, v2

    move v2, v1

    move v1, v10

    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm$f;

    .line 222
    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->a()Ljava/lang/String;

    move-result-object v3

    .line 223
    invoke-virtual {p1, v3}, Lcom/flurry/sdk/fm;->b(Ljava/lang/String;)Lcom/flurry/sdk/fm$f;

    move-result-object v3

    if-nez v3, :cond_8

    .line 224
    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->e()Lcom/flurry/sdk/hr;

    move-result-object v3

    if-nez v3, :cond_2

    .line 225
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Found "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1, v9}, Lcom/flurry/sdk/fm;->a(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", expecting "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2, v9}, Lcom/flurry/sdk/fm;->a(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flurry/sdk/gp;->a(Ljava/lang/String;)Lcom/flurry/sdk/gp;

    move-result-object v0

    .line 227
    invoke-interface {p3, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    :cond_1
    :goto_3
    return-object v0

    .line 230
    :cond_2
    add-int/lit8 v3, v2, 0x1

    aput-object v0, v7, v2

    .line 231
    add-int/lit8 v0, v1, 0x3

    move v1, v3

    :goto_4
    move v2, v1

    move v1, v0

    .line 234
    goto :goto_2

    .line 236
    :cond_3
    new-array v3, v1, [Lcom/flurry/sdk/gp;

    .line 237
    add-int/lit8 v0, v1, -0x1

    new-instance v1, Lcom/flurry/sdk/gp$e;

    invoke-direct {v1, v7}, Lcom/flurry/sdk/gp$e;-><init>([Lcom/flurry/sdk/fm$f;)V

    aput-object v1, v3, v0

    .line 243
    invoke-static {v3}, Lcom/flurry/sdk/gp;->b([Lcom/flurry/sdk/gp;)Lcom/flurry/sdk/gp;

    move-result-object v2

    .line 244
    invoke-interface {p3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move v1, v0

    :goto_5
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm$f;

    .line 255
    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->a()Ljava/lang/String;

    move-result-object v5

    .line 256
    invoke-virtual {p2, v5}, Lcom/flurry/sdk/fm;->b(Ljava/lang/String;)Lcom/flurry/sdk/fm$f;

    move-result-object v5

    .line 257
    if-nez v5, :cond_4

    .line 258
    add-int/lit8 v1, v1, -0x1

    new-instance v5, Lcom/flurry/sdk/gp$n;

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->c()Lcom/flurry/sdk/fm;

    move-result-object v7

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->c()Lcom/flurry/sdk/fm;

    move-result-object v0

    invoke-virtual {p0, v7, v0, p3}, Lcom/flurry/sdk/gn;->a(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;Ljava/util/Map;)Lcom/flurry/sdk/gp;

    move-result-object v0

    invoke-direct {v5, v0}, Lcom/flurry/sdk/gp$n;-><init>(Lcom/flurry/sdk/gp;)V

    aput-object v5, v3, v1

    move v0, v1

    :goto_6
    move v1, v0

    .line 264
    goto :goto_5

    .line 261
    :cond_4
    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->c()Lcom/flurry/sdk/fm;

    move-result-object v0

    invoke-virtual {v5}, Lcom/flurry/sdk/fm$f;->c()Lcom/flurry/sdk/fm;

    move-result-object v5

    invoke-virtual {p0, v0, v5, p3}, Lcom/flurry/sdk/gn;->a(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;Ljava/util/Map;)Lcom/flurry/sdk/gp;

    move-result-object v0

    aput-object v0, v3, v1

    move v0, v1

    goto :goto_6

    .line 267
    :cond_5
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_6
    :goto_7
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm$f;

    .line 268
    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->a()Ljava/lang/String;

    move-result-object v5

    .line 269
    invoke-virtual {p1, v5}, Lcom/flurry/sdk/fm;->b(Ljava/lang/String;)Lcom/flurry/sdk/fm$f;

    move-result-object v5

    .line 270
    if-nez v5, :cond_6

    .line 271
    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->c()Lcom/flurry/sdk/fm;

    move-result-object v5

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->e()Lcom/flurry/sdk/hr;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/flurry/sdk/gn;->a(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/hr;)[B

    move-result-object v5

    .line 272
    add-int/lit8 v1, v1, -0x1

    new-instance v6, Lcom/flurry/sdk/gp$b;

    invoke-direct {v6, v5}, Lcom/flurry/sdk/gp$b;-><init>([B)V

    aput-object v6, v3, v1

    .line 273
    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->c()Lcom/flurry/sdk/fm;

    move-result-object v5

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->c()Lcom/flurry/sdk/fm;

    move-result-object v0

    invoke-virtual {p0, v5, v0, p3}, Lcom/flurry/sdk/gn;->a(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;Ljava/util/Map;)Lcom/flurry/sdk/gp;

    move-result-object v0

    aput-object v0, v3, v1

    .line 274
    add-int/lit8 v1, v1, -0x1

    sget-object v0, Lcom/flurry/sdk/gp;->x:Lcom/flurry/sdk/gp;

    aput-object v0, v3, v1

    goto :goto_7

    :cond_7
    move-object v0, v2

    goto/16 :goto_3

    :cond_8
    move v0, v1

    move v1, v2

    goto/16 :goto_4

    :cond_9
    move v0, v1

    goto/16 :goto_1
.end method


# virtual methods
.method public final a(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;)Lcom/flurry/sdk/gp;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 50
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/flurry/sdk/gp;

    const/4 v1, 0x0

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p0, p1, p2, v2}, Lcom/flurry/sdk/gn;->a(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;Ljava/util/Map;)Lcom/flurry/sdk/gp;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/flurry/sdk/gp;->a([Lcom/flurry/sdk/gp;)Lcom/flurry/sdk/gp;

    move-result-object v0

    return-object v0
.end method

.method public a(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;Ljava/util/Map;)Lcom/flurry/sdk/gp;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/fm;",
            "Lcom/flurry/sdk/fm;",
            "Ljava/util/Map",
            "<",
            "Lcom/flurry/sdk/gq$a;",
            "Lcom/flurry/sdk/gp;",
            ">;)",
            "Lcom/flurry/sdk/gp;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x2

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 69
    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->a()Lcom/flurry/sdk/fm$v;

    move-result-object v0

    .line 70
    invoke-virtual {p2}, Lcom/flurry/sdk/fm;->a()Lcom/flurry/sdk/fm$v;

    move-result-object v1

    .line 72
    if-ne v0, v1, :cond_1

    .line 73
    sget-object v1, Lcom/flurry/sdk/gn$1;->a:[I

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$v;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 122
    new-instance v1, Lcom/flurry/sdk/fl;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unkown type for schema: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/flurry/sdk/fl;-><init>(Ljava/lang/String;)V

    throw v1

    .line 75
    :pswitch_0
    sget-object v0, Lcom/flurry/sdk/gp;->c:Lcom/flurry/sdk/gp;

    .line 175
    :goto_0
    return-object v0

    .line 77
    :pswitch_1
    sget-object v0, Lcom/flurry/sdk/gp;->d:Lcom/flurry/sdk/gp;

    goto :goto_0

    .line 79
    :pswitch_2
    sget-object v0, Lcom/flurry/sdk/gp;->e:Lcom/flurry/sdk/gp;

    goto :goto_0

    .line 81
    :pswitch_3
    sget-object v0, Lcom/flurry/sdk/gp;->f:Lcom/flurry/sdk/gp;

    goto :goto_0

    .line 83
    :pswitch_4
    sget-object v0, Lcom/flurry/sdk/gp;->g:Lcom/flurry/sdk/gp;

    goto :goto_0

    .line 85
    :pswitch_5
    sget-object v0, Lcom/flurry/sdk/gp;->h:Lcom/flurry/sdk/gp;

    goto :goto_0

    .line 87
    :pswitch_6
    sget-object v0, Lcom/flurry/sdk/gp;->i:Lcom/flurry/sdk/gp;

    goto :goto_0

    .line 89
    :pswitch_7
    sget-object v0, Lcom/flurry/sdk/gp;->j:Lcom/flurry/sdk/gp;

    goto :goto_0

    .line 91
    :pswitch_8
    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->g()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/flurry/sdk/fm;->g()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->l()I

    move-result v0

    invoke-virtual {p2}, Lcom/flurry/sdk/fm;->l()I

    move-result v1

    if-ne v0, v1, :cond_3

    .line 93
    new-array v0, v4, [Lcom/flurry/sdk/gp;

    new-instance v1, Lcom/flurry/sdk/gp$h;

    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->l()I

    move-result v2

    invoke-direct {v1, v2}, Lcom/flurry/sdk/gp$h;-><init>(I)V

    aput-object v1, v0, v6

    sget-object v1, Lcom/flurry/sdk/gp;->k:Lcom/flurry/sdk/gp;

    aput-object v1, v0, v5

    invoke-static {v0}, Lcom/flurry/sdk/gp;->b([Lcom/flurry/sdk/gp;)Lcom/flurry/sdk/gp;

    move-result-object v0

    goto :goto_0

    .line 99
    :pswitch_9
    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->g()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->g()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/flurry/sdk/fm;->g()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 101
    :cond_0
    new-array v0, v4, [Lcom/flurry/sdk/gp;

    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->c()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p2}, Lcom/flurry/sdk/fm;->c()Ljava/util/List;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/flurry/sdk/gn;->a(Ljava/util/List;Ljava/util/List;)Lcom/flurry/sdk/gp;

    move-result-object v1

    aput-object v1, v0, v6

    sget-object v1, Lcom/flurry/sdk/gp;->l:Lcom/flurry/sdk/gp;

    aput-object v1, v0, v5

    invoke-static {v0}, Lcom/flurry/sdk/gp;->b([Lcom/flurry/sdk/gp;)Lcom/flurry/sdk/gp;

    move-result-object v0

    goto :goto_0

    .line 107
    :pswitch_a
    new-array v0, v4, [Lcom/flurry/sdk/gp;

    sget-object v1, Lcom/flurry/sdk/gp;->o:Lcom/flurry/sdk/gp;

    new-array v2, v5, [Lcom/flurry/sdk/gp;

    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->i()Lcom/flurry/sdk/fm;

    move-result-object v3

    invoke-virtual {p2}, Lcom/flurry/sdk/fm;->i()Lcom/flurry/sdk/fm;

    move-result-object v4

    invoke-virtual {p0, v3, v4, p3}, Lcom/flurry/sdk/gn;->a(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;Ljava/util/Map;)Lcom/flurry/sdk/gp;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-static {v1, v2}, Lcom/flurry/sdk/gp;->a(Lcom/flurry/sdk/gp;[Lcom/flurry/sdk/gp;)Lcom/flurry/sdk/gp;

    move-result-object v1

    aput-object v1, v0, v6

    sget-object v1, Lcom/flurry/sdk/gp;->n:Lcom/flurry/sdk/gp;

    aput-object v1, v0, v5

    invoke-static {v0}, Lcom/flurry/sdk/gp;->b([Lcom/flurry/sdk/gp;)Lcom/flurry/sdk/gp;

    move-result-object v0

    goto/16 :goto_0

    .line 113
    :pswitch_b
    new-array v0, v4, [Lcom/flurry/sdk/gp;

    sget-object v1, Lcom/flurry/sdk/gp;->q:Lcom/flurry/sdk/gp;

    new-array v2, v4, [Lcom/flurry/sdk/gp;

    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->j()Lcom/flurry/sdk/fm;

    move-result-object v3

    invoke-virtual {p2}, Lcom/flurry/sdk/fm;->j()Lcom/flurry/sdk/fm;

    move-result-object v4

    invoke-virtual {p0, v3, v4, p3}, Lcom/flurry/sdk/gn;->a(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;Ljava/util/Map;)Lcom/flurry/sdk/gp;

    move-result-object v3

    aput-object v3, v2, v6

    sget-object v3, Lcom/flurry/sdk/gp;->i:Lcom/flurry/sdk/gp;

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Lcom/flurry/sdk/gp;->a(Lcom/flurry/sdk/gp;[Lcom/flurry/sdk/gp;)Lcom/flurry/sdk/gp;

    move-result-object v1

    aput-object v1, v0, v6

    sget-object v1, Lcom/flurry/sdk/gp;->p:Lcom/flurry/sdk/gp;

    aput-object v1, v0, v5

    invoke-static {v0}, Lcom/flurry/sdk/gp;->b([Lcom/flurry/sdk/gp;)Lcom/flurry/sdk/gp;

    move-result-object v0

    goto/16 :goto_0

    .line 118
    :pswitch_c
    invoke-direct {p0, p1, p2, p3}, Lcom/flurry/sdk/gn;->c(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;Ljava/util/Map;)Lcom/flurry/sdk/gp;

    move-result-object v0

    goto/16 :goto_0

    .line 120
    :pswitch_d
    invoke-direct {p0, p1, p2, p3}, Lcom/flurry/sdk/gn;->b(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;Ljava/util/Map;)Lcom/flurry/sdk/gp;

    move-result-object v0

    goto/16 :goto_0

    .line 125
    :cond_1
    sget-object v2, Lcom/flurry/sdk/fm$v;->e:Lcom/flurry/sdk/fm$v;

    if-ne v0, v2, :cond_2

    .line 126
    invoke-direct {p0, p1, p2, p3}, Lcom/flurry/sdk/gn;->b(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;Ljava/util/Map;)Lcom/flurry/sdk/gp;

    move-result-object v0

    goto/16 :goto_0

    .line 129
    :cond_2
    sget-object v2, Lcom/flurry/sdk/gn$1;->a:[I

    invoke-virtual {v1}, Lcom/flurry/sdk/fm$v;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_1

    .line 172
    :pswitch_e
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected schema type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 131
    :pswitch_f
    sget-object v1, Lcom/flurry/sdk/gn$1;->a:[I

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$v;->ordinal()I

    move-result v0

    aget v0, v1, v0

    packed-switch v0, :pswitch_data_2

    .line 175
    :cond_3
    :goto_1
    :pswitch_10
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Found "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1, v5}, Lcom/flurry/sdk/fm;->a(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", expecting "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2, v5}, Lcom/flurry/sdk/fm;->a(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flurry/sdk/gp;->a(Ljava/lang/String;)Lcom/flurry/sdk/gp;

    move-result-object v0

    goto/16 :goto_0

    .line 133
    :pswitch_11
    invoke-super {p0, p1, p3}, Lcom/flurry/sdk/gq;->a(Lcom/flurry/sdk/fm;Ljava/util/Map;)Lcom/flurry/sdk/gp;

    move-result-object v0

    sget-object v1, Lcom/flurry/sdk/gp;->f:Lcom/flurry/sdk/gp;

    invoke-static {v0, v1}, Lcom/flurry/sdk/gp;->a(Lcom/flurry/sdk/gp;Lcom/flurry/sdk/gp;)Lcom/flurry/sdk/gp;

    move-result-object v0

    goto/16 :goto_0

    .line 138
    :pswitch_12
    sget-object v1, Lcom/flurry/sdk/gn$1;->a:[I

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$v;->ordinal()I

    move-result v0

    aget v0, v1, v0

    packed-switch v0, :pswitch_data_3

    goto :goto_1

    .line 141
    :pswitch_13
    invoke-super {p0, p1, p3}, Lcom/flurry/sdk/gq;->a(Lcom/flurry/sdk/fm;Ljava/util/Map;)Lcom/flurry/sdk/gp;

    move-result-object v0

    sget-object v1, Lcom/flurry/sdk/gp;->g:Lcom/flurry/sdk/gp;

    invoke-static {v0, v1}, Lcom/flurry/sdk/gp;->a(Lcom/flurry/sdk/gp;Lcom/flurry/sdk/gp;)Lcom/flurry/sdk/gp;

    move-result-object v0

    goto/16 :goto_0

    .line 146
    :pswitch_14
    sget-object v1, Lcom/flurry/sdk/gn$1;->a:[I

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$v;->ordinal()I

    move-result v0

    aget v0, v1, v0

    packed-switch v0, :pswitch_data_4

    goto :goto_1

    .line 150
    :pswitch_15
    invoke-super {p0, p1, p3}, Lcom/flurry/sdk/gq;->a(Lcom/flurry/sdk/fm;Ljava/util/Map;)Lcom/flurry/sdk/gp;

    move-result-object v0

    sget-object v1, Lcom/flurry/sdk/gp;->h:Lcom/flurry/sdk/gp;

    invoke-static {v0, v1}, Lcom/flurry/sdk/gp;->a(Lcom/flurry/sdk/gp;Lcom/flurry/sdk/gp;)Lcom/flurry/sdk/gp;

    move-result-object v0

    goto/16 :goto_0

    .line 155
    :pswitch_16
    invoke-static {p2, p1}, Lcom/flurry/sdk/gn;->b(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;)I

    move-result v1

    .line 156
    if-ltz v1, :cond_3

    .line 157
    invoke-virtual {p2}, Lcom/flurry/sdk/fm;->k()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm;

    invoke-virtual {p0, p1, v0, p3}, Lcom/flurry/sdk/gn;->a(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;Ljava/util/Map;)Lcom/flurry/sdk/gp;

    move-result-object v0

    .line 158
    new-array v2, v4, [Lcom/flurry/sdk/gp;

    new-instance v3, Lcom/flurry/sdk/gp$p;

    invoke-direct {v3, v1, v0}, Lcom/flurry/sdk/gp$p;-><init>(ILcom/flurry/sdk/gp;)V

    aput-object v3, v2, v6

    sget-object v0, Lcom/flurry/sdk/gp;->m:Lcom/flurry/sdk/gp;

    aput-object v0, v2, v5

    invoke-static {v2}, Lcom/flurry/sdk/gp;->b([Lcom/flurry/sdk/gp;)Lcom/flurry/sdk/gp;

    move-result-object v0

    goto/16 :goto_0

    .line 73
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
    .end packed-switch

    .line 129
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_f
        :pswitch_12
        :pswitch_14
        :pswitch_10
        :pswitch_10
        :pswitch_e
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_16
    .end packed-switch

    .line 131
    :pswitch_data_2
    .packed-switch 0x3
        :pswitch_11
    .end packed-switch

    .line 138
    :pswitch_data_3
    .packed-switch 0x3
        :pswitch_13
        :pswitch_13
    .end packed-switch

    .line 146
    :pswitch_data_4
    .packed-switch 0x3
        :pswitch_15
        :pswitch_15
        :pswitch_15
    .end packed-switch
.end method
