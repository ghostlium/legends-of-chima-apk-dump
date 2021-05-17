.class public Lcom/flurry/sdk/sg;
.super Lcom/flurry/sdk/hp;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/sg$1;,
        Lcom/flurry/sdk/sg$b;,
        Lcom/flurry/sdk/sg$a;
    }
.end annotation


# static fields
.field protected static final b:I


# instance fields
.field protected c:Lcom/flurry/sdk/hx;

.field protected d:I

.field protected e:Z

.field protected f:Lcom/flurry/sdk/sg$b;

.field protected g:Lcom/flurry/sdk/sg$b;

.field protected h:I

.field protected i:Lcom/flurry/sdk/if;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    invoke-static {}, Lcom/flurry/sdk/ht$a;->a()I

    move-result v0

    sput v0, Lcom/flurry/sdk/sg;->b:I

    return-void
.end method

.method public constructor <init>(Lcom/flurry/sdk/hx;)V
    .locals 1

    .prologue
    .line 97
    invoke-direct {p0}, Lcom/flurry/sdk/hp;-><init>()V

    .line 98
    iput-object p1, p0, Lcom/flurry/sdk/sg;->c:Lcom/flurry/sdk/hx;

    .line 99
    sget v0, Lcom/flurry/sdk/sg;->b:I

    iput v0, p0, Lcom/flurry/sdk/sg;->d:I

    .line 100
    invoke-static {}, Lcom/flurry/sdk/if;->g()Lcom/flurry/sdk/if;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/sg;->i:Lcom/flurry/sdk/if;

    .line 102
    new-instance v0, Lcom/flurry/sdk/sg$b;

    invoke-direct {v0}, Lcom/flurry/sdk/sg$b;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/sg;->g:Lcom/flurry/sdk/sg$b;

    iput-object v0, p0, Lcom/flurry/sdk/sg;->f:Lcom/flurry/sdk/sg$b;

    .line 103
    const/4 v0, 0x0

    iput v0, p0, Lcom/flurry/sdk/sg;->h:I

    .line 104
    return-void
.end method


# virtual methods
.method public a()Lcom/flurry/sdk/hp;
    .locals 0

    .prologue
    .line 327
    return-object p0
.end method

.method public a(Lcom/flurry/sdk/ht;)Lcom/flurry/sdk/ht;
    .locals 3

    .prologue
    .line 145
    new-instance v0, Lcom/flurry/sdk/sg$a;

    iget-object v1, p0, Lcom/flurry/sdk/sg;->f:Lcom/flurry/sdk/sg$b;

    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->a()Lcom/flurry/sdk/hx;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/flurry/sdk/sg$a;-><init>(Lcom/flurry/sdk/sg$b;Lcom/flurry/sdk/hx;)V

    .line 146
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->h()Lcom/flurry/sdk/hq;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/sg$a;->a(Lcom/flurry/sdk/hq;)V

    .line 147
    return-object v0
.end method

.method public a(Lcom/flurry/sdk/hx;)Lcom/flurry/sdk/ht;
    .locals 2

    .prologue
    .line 136
    new-instance v0, Lcom/flurry/sdk/sg$a;

    iget-object v1, p0, Lcom/flurry/sdk/sg;->f:Lcom/flurry/sdk/sg$b;

    invoke-direct {v0, v1, p1}, Lcom/flurry/sdk/sg$a;-><init>(Lcom/flurry/sdk/sg$b;Lcom/flurry/sdk/hx;)V

    return-object v0
.end method

.method public a(C)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 491
    invoke-virtual {p0}, Lcom/flurry/sdk/sg;->i()V

    .line 492
    return-void
.end method

.method public a(D)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 527
    sget-object v0, Lcom/flurry/sdk/hw;->j:Lcom/flurry/sdk/hw;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/flurry/sdk/sg;->a(Lcom/flurry/sdk/hw;Ljava/lang/Object;)V

    .line 528
    return-void
.end method

.method public a(F)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 532
    sget-object v0, Lcom/flurry/sdk/hw;->j:Lcom/flurry/sdk/hw;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/flurry/sdk/sg;->a(Lcom/flurry/sdk/hw;Ljava/lang/Object;)V

    .line 533
    return-void
.end method

.method public a(J)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 522
    sget-object v0, Lcom/flurry/sdk/hw;->i:Lcom/flurry/sdk/hw;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/flurry/sdk/sg;->a(Lcom/flurry/sdk/hw;Ljava/lang/Object;)V

    .line 523
    return-void
.end method

.method public a(Lcom/flurry/sdk/hl;[BII)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 611
    new-array v0, p4, [B

    .line 612
    const/4 v1, 0x0

    invoke-static {p2, p3, v0, v1, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 613
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/sg;->a(Ljava/lang/Object;)V

    .line 614
    return-void
.end method

.method public a(Lcom/flurry/sdk/hp;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 169
    iget-object v3, p0, Lcom/flurry/sdk/sg;->f:Lcom/flurry/sdk/sg$b;

    .line 170
    const/4 v1, -0x1

    move v0, v1

    move-object v1, v3

    .line 173
    :goto_0
    add-int/lit8 v0, v0, 0x1

    const/16 v3, 0x10

    if-lt v0, v3, :cond_b

    .line 175
    invoke-virtual {v1}, Lcom/flurry/sdk/sg$b;->a()Lcom/flurry/sdk/sg$b;

    move-result-object v0

    .line 176
    if-nez v0, :cond_1

    .line 262
    :cond_0
    return-void

    :cond_1
    move v1, v2

    move-object v3, v0

    .line 178
    :goto_1
    invoke-virtual {v3, v1}, Lcom/flurry/sdk/sg$b;->a(I)Lcom/flurry/sdk/hw;

    move-result-object v0

    .line 179
    if-eqz v0, :cond_0

    .line 182
    sget-object v4, Lcom/flurry/sdk/sg$1;->a:[I

    invoke-virtual {v0}, Lcom/flurry/sdk/hw;->ordinal()I

    move-result v0

    aget v0, v4, v0

    packed-switch v0, :pswitch_data_0

    .line 259
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Internal error: should never end up through this code path"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 184
    :pswitch_0
    invoke-virtual {p1}, Lcom/flurry/sdk/hp;->d()V

    :goto_2
    move v0, v1

    move-object v1, v3

    .line 261
    goto :goto_0

    .line 187
    :pswitch_1
    invoke-virtual {p1}, Lcom/flurry/sdk/hp;->e()V

    goto :goto_2

    .line 190
    :pswitch_2
    invoke-virtual {p1}, Lcom/flurry/sdk/hp;->b()V

    goto :goto_2

    .line 193
    :pswitch_3
    invoke-virtual {p1}, Lcom/flurry/sdk/hp;->c()V

    goto :goto_2

    .line 198
    :pswitch_4
    invoke-virtual {v3, v1}, Lcom/flurry/sdk/sg$b;->b(I)Ljava/lang/Object;

    move-result-object v0

    .line 199
    instance-of v4, v0, Lcom/flurry/sdk/hz;

    if-eqz v4, :cond_2

    .line 200
    check-cast v0, Lcom/flurry/sdk/hz;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/hp;->a(Lcom/flurry/sdk/hz;)V

    goto :goto_2

    .line 202
    :cond_2
    check-cast v0, Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/hp;->a(Ljava/lang/String;)V

    goto :goto_2

    .line 208
    :pswitch_5
    invoke-virtual {v3, v1}, Lcom/flurry/sdk/sg$b;->b(I)Ljava/lang/Object;

    move-result-object v0

    .line 209
    instance-of v4, v0, Lcom/flurry/sdk/hz;

    if-eqz v4, :cond_3

    .line 210
    check-cast v0, Lcom/flurry/sdk/hz;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/hp;->b(Lcom/flurry/sdk/hz;)V

    goto :goto_2

    .line 212
    :cond_3
    check-cast v0, Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/hp;->b(Ljava/lang/String;)V

    goto :goto_2

    .line 218
    :pswitch_6
    invoke-virtual {v3, v1}, Lcom/flurry/sdk/sg$b;->b(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    .line 219
    instance-of v4, v0, Ljava/math/BigInteger;

    if-eqz v4, :cond_4

    .line 220
    check-cast v0, Ljava/math/BigInteger;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/hp;->a(Ljava/math/BigInteger;)V

    goto :goto_2

    .line 221
    :cond_4
    instance-of v4, v0, Ljava/lang/Long;

    if-eqz v4, :cond_5

    .line 222
    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Lcom/flurry/sdk/hp;->a(J)V

    goto :goto_2

    .line 224
    :cond_5
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/hp;->b(I)V

    goto :goto_2

    .line 230
    :pswitch_7
    invoke-virtual {v3, v1}, Lcom/flurry/sdk/sg$b;->b(I)Ljava/lang/Object;

    move-result-object v0

    .line 231
    instance-of v4, v0, Ljava/math/BigDecimal;

    if-eqz v4, :cond_6

    .line 232
    check-cast v0, Ljava/math/BigDecimal;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/hp;->a(Ljava/math/BigDecimal;)V

    goto :goto_2

    .line 233
    :cond_6
    instance-of v4, v0, Ljava/lang/Float;

    if-eqz v4, :cond_7

    .line 234
    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/hp;->a(F)V

    goto :goto_2

    .line 235
    :cond_7
    instance-of v4, v0, Ljava/lang/Double;

    if-eqz v4, :cond_8

    .line 236
    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Lcom/flurry/sdk/hp;->a(D)V

    goto/16 :goto_2

    .line 237
    :cond_8
    if-nez v0, :cond_9

    .line 238
    invoke-virtual {p1}, Lcom/flurry/sdk/hp;->f()V

    goto/16 :goto_2

    .line 239
    :cond_9
    instance-of v4, v0, Ljava/lang/String;

    if-eqz v4, :cond_a

    .line 240
    check-cast v0, Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/hp;->e(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 242
    :cond_a
    new-instance v1, Lcom/flurry/sdk/ho;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unrecognized value type for VALUE_NUMBER_FLOAT: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", can not serialize"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/flurry/sdk/ho;-><init>(Ljava/lang/String;)V

    throw v1

    .line 247
    :pswitch_8
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/hp;->a(Z)V

    goto/16 :goto_2

    .line 250
    :pswitch_9
    invoke-virtual {p1, v2}, Lcom/flurry/sdk/hp;->a(Z)V

    goto/16 :goto_2

    .line 253
    :pswitch_a
    invoke-virtual {p1}, Lcom/flurry/sdk/hp;->f()V

    goto/16 :goto_2

    .line 256
    :pswitch_b
    invoke-virtual {v3, v1}, Lcom/flurry/sdk/sg$b;->b(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/hp;->a(Ljava/lang/Object;)V

    goto/16 :goto_2

    :cond_b
    move-object v3, v1

    move v1, v0

    goto/16 :goto_1

    .line 182
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
    .end packed-switch
.end method

.method public a(Lcom/flurry/sdk/hr;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 592
    sget-object v0, Lcom/flurry/sdk/hw;->g:Lcom/flurry/sdk/hw;

    invoke-virtual {p0, v0, p1}, Lcom/flurry/sdk/sg;->a(Lcom/flurry/sdk/hw;Ljava/lang/Object;)V

    .line 593
    return-void
.end method

.method protected final a(Lcom/flurry/sdk/hw;)V
    .locals 2

    .prologue
    .line 726
    iget-object v0, p0, Lcom/flurry/sdk/sg;->g:Lcom/flurry/sdk/sg$b;

    iget v1, p0, Lcom/flurry/sdk/sg;->h:I

    invoke-virtual {v0, v1, p1}, Lcom/flurry/sdk/sg$b;->a(ILcom/flurry/sdk/hw;)Lcom/flurry/sdk/sg$b;

    move-result-object v0

    .line 727
    if-nez v0, :cond_0

    .line 728
    iget v0, p0, Lcom/flurry/sdk/sg;->h:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/flurry/sdk/sg;->h:I

    .line 733
    :goto_0
    return-void

    .line 730
    :cond_0
    iput-object v0, p0, Lcom/flurry/sdk/sg;->g:Lcom/flurry/sdk/sg$b;

    .line 731
    const/4 v0, 0x1

    iput v0, p0, Lcom/flurry/sdk/sg;->h:I

    goto :goto_0
.end method

.method protected final a(Lcom/flurry/sdk/hw;Ljava/lang/Object;)V
    .locals 2

    .prologue
    .line 736
    iget-object v0, p0, Lcom/flurry/sdk/sg;->g:Lcom/flurry/sdk/sg$b;

    iget v1, p0, Lcom/flurry/sdk/sg;->h:I

    invoke-virtual {v0, v1, p1, p2}, Lcom/flurry/sdk/sg$b;->a(ILcom/flurry/sdk/hw;Ljava/lang/Object;)Lcom/flurry/sdk/sg$b;

    move-result-object v0

    .line 737
    if-nez v0, :cond_0

    .line 738
    iget v0, p0, Lcom/flurry/sdk/sg;->h:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/flurry/sdk/sg;->h:I

    .line 743
    :goto_0
    return-void

    .line 740
    :cond_0
    iput-object v0, p0, Lcom/flurry/sdk/sg;->g:Lcom/flurry/sdk/sg$b;

    .line 741
    const/4 v0, 0x1

    iput v0, p0, Lcom/flurry/sdk/sg;->h:I

    goto :goto_0
.end method

.method public a(Lcom/flurry/sdk/hz;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 417
    sget-object v0, Lcom/flurry/sdk/hw;->f:Lcom/flurry/sdk/hw;

    invoke-virtual {p0, v0, p1}, Lcom/flurry/sdk/sg;->a(Lcom/flurry/sdk/hw;Ljava/lang/Object;)V

    .line 418
    iget-object v0, p0, Lcom/flurry/sdk/sg;->i:Lcom/flurry/sdk/if;

    invoke-interface {p1}, Lcom/flurry/sdk/hz;->a()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/if;->a(Ljava/lang/String;)I

    .line 419
    return-void
.end method

.method public a(Lcom/flurry/sdk/ip;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 425
    sget-object v0, Lcom/flurry/sdk/hw;->f:Lcom/flurry/sdk/hw;

    invoke-virtual {p0, v0, p1}, Lcom/flurry/sdk/sg;->a(Lcom/flurry/sdk/hw;Ljava/lang/Object;)V

    .line 426
    iget-object v0, p0, Lcom/flurry/sdk/sg;->i:Lcom/flurry/sdk/if;

    invoke-virtual {p1}, Lcom/flurry/sdk/ip;->a()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/if;->a(Ljava/lang/String;)I

    .line 427
    return-void
.end method

.method public a(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 582
    sget-object v0, Lcom/flurry/sdk/hw;->g:Lcom/flurry/sdk/hw;

    invoke-virtual {p0, v0, p1}, Lcom/flurry/sdk/sg;->a(Lcom/flurry/sdk/hw;Ljava/lang/Object;)V

    .line 583
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 409
    sget-object v0, Lcom/flurry/sdk/hw;->f:Lcom/flurry/sdk/hw;

    invoke-virtual {p0, v0, p1}, Lcom/flurry/sdk/sg;->a(Lcom/flurry/sdk/hw;Ljava/lang/Object;)V

    .line 410
    iget-object v0, p0, Lcom/flurry/sdk/sg;->i:Lcom/flurry/sdk/if;

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/if;->a(Ljava/lang/String;)I

    .line 411
    return-void
.end method

.method public a(Ljava/math/BigDecimal;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 537
    if-nez p1, :cond_0

    .line 538
    invoke-virtual {p0}, Lcom/flurry/sdk/sg;->f()V

    .line 542
    :goto_0
    return-void

    .line 540
    :cond_0
    sget-object v0, Lcom/flurry/sdk/hw;->j:Lcom/flurry/sdk/hw;

    invoke-virtual {p0, v0, p1}, Lcom/flurry/sdk/sg;->a(Lcom/flurry/sdk/hw;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public a(Ljava/math/BigInteger;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 546
    if-nez p1, :cond_0

    .line 547
    invoke-virtual {p0}, Lcom/flurry/sdk/sg;->f()V

    .line 551
    :goto_0
    return-void

    .line 549
    :cond_0
    sget-object v0, Lcom/flurry/sdk/hw;->i:Lcom/flurry/sdk/hw;

    invoke-virtual {p0, v0, p1}, Lcom/flurry/sdk/sg;->a(Lcom/flurry/sdk/hw;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public a(Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 563
    if-eqz p1, :cond_0

    sget-object v0, Lcom/flurry/sdk/hw;->k:Lcom/flurry/sdk/hw;

    :goto_0
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/sg;->a(Lcom/flurry/sdk/hw;)V

    .line 564
    return-void

    .line 563
    :cond_0
    sget-object v0, Lcom/flurry/sdk/hw;->l:Lcom/flurry/sdk/hw;

    goto :goto_0
.end method

.method public a([CII)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 446
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/sg;->b(Ljava/lang/String;)V

    .line 447
    return-void
.end method

.method public final b()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 369
    sget-object v0, Lcom/flurry/sdk/hw;->d:Lcom/flurry/sdk/hw;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/sg;->a(Lcom/flurry/sdk/hw;)V

    .line 370
    iget-object v0, p0, Lcom/flurry/sdk/sg;->i:Lcom/flurry/sdk/if;

    invoke-virtual {v0}, Lcom/flurry/sdk/if;->h()Lcom/flurry/sdk/if;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/sg;->i:Lcom/flurry/sdk/if;

    .line 371
    return-void
.end method

.method public b(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 517
    sget-object v0, Lcom/flurry/sdk/hw;->i:Lcom/flurry/sdk/hw;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/flurry/sdk/sg;->a(Lcom/flurry/sdk/hw;Ljava/lang/Object;)V

    .line 518
    return-void
.end method

.method public b(Lcom/flurry/sdk/ht;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 625
    sget-object v0, Lcom/flurry/sdk/sg$1;->a:[I

    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->e()Lcom/flurry/sdk/hw;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/sdk/hw;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 685
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Internal error: should never end up through this code path"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 627
    :pswitch_0
    invoke-virtual {p0}, Lcom/flurry/sdk/sg;->d()V

    .line 687
    :goto_0
    return-void

    .line 630
    :pswitch_1
    invoke-virtual {p0}, Lcom/flurry/sdk/sg;->e()V

    goto :goto_0

    .line 633
    :pswitch_2
    invoke-virtual {p0}, Lcom/flurry/sdk/sg;->b()V

    goto :goto_0

    .line 636
    :pswitch_3
    invoke-virtual {p0}, Lcom/flurry/sdk/sg;->c()V

    goto :goto_0

    .line 639
    :pswitch_4
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->g()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/sg;->a(Ljava/lang/String;)V

    goto :goto_0

    .line 642
    :pswitch_5
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->o()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 643
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->l()[C

    move-result-object v0

    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->n()I

    move-result v1

    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->m()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/flurry/sdk/sg;->a([CII)V

    goto :goto_0

    .line 645
    :cond_0
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->k()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/sg;->b(Ljava/lang/String;)V

    goto :goto_0

    .line 649
    :pswitch_6
    sget-object v0, Lcom/flurry/sdk/sg$1;->b:[I

    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->q()Lcom/flurry/sdk/ht$b;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/sdk/ht$b;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_1

    .line 657
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->u()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/flurry/sdk/sg;->a(J)V

    goto :goto_0

    .line 651
    :pswitch_7
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->t()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/sg;->b(I)V

    goto :goto_0

    .line 654
    :pswitch_8
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->v()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/sg;->a(Ljava/math/BigInteger;)V

    goto :goto_0

    .line 661
    :pswitch_9
    sget-object v0, Lcom/flurry/sdk/sg$1;->b:[I

    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->q()Lcom/flurry/sdk/ht$b;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/sdk/ht$b;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_2

    .line 669
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->x()D

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/flurry/sdk/sg;->a(D)V

    goto :goto_0

    .line 663
    :pswitch_a
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->y()Ljava/math/BigDecimal;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/sg;->a(Ljava/math/BigDecimal;)V

    goto :goto_0

    .line 666
    :pswitch_b
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->w()F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/sg;->a(F)V

    goto :goto_0

    .line 673
    :pswitch_c
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/sg;->a(Z)V

    goto/16 :goto_0

    .line 676
    :pswitch_d
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/sg;->a(Z)V

    goto/16 :goto_0

    .line 679
    :pswitch_e
    invoke-virtual {p0}, Lcom/flurry/sdk/sg;->f()V

    goto/16 :goto_0

    .line 682
    :pswitch_f
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->z()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/sg;->a(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 625
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
        :pswitch_9
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
    .end packed-switch

    .line 649
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_7
        :pswitch_8
    .end packed-switch

    .line 661
    :pswitch_data_2
    .packed-switch 0x3
        :pswitch_a
        :pswitch_b
    .end packed-switch
.end method

.method public b(Lcom/flurry/sdk/hz;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 451
    if-nez p1, :cond_0

    .line 452
    invoke-virtual {p0}, Lcom/flurry/sdk/sg;->f()V

    .line 456
    :goto_0
    return-void

    .line 454
    :cond_0
    sget-object v0, Lcom/flurry/sdk/hw;->h:Lcom/flurry/sdk/hw;

    invoke-virtual {p0, v0, p1}, Lcom/flurry/sdk/sg;->a(Lcom/flurry/sdk/hw;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public b(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 437
    if-nez p1, :cond_0

    .line 438
    invoke-virtual {p0}, Lcom/flurry/sdk/sg;->f()V

    .line 442
    :goto_0
    return-void

    .line 440
    :cond_0
    sget-object v0, Lcom/flurry/sdk/hw;->h:Lcom/flurry/sdk/hw;

    invoke-virtual {p0, v0, p1}, Lcom/flurry/sdk/sg;->a(Lcom/flurry/sdk/hw;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public b([CII)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 486
    invoke-virtual {p0}, Lcom/flurry/sdk/sg;->i()V

    .line 487
    return-void
.end method

.method public final c()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 377
    sget-object v0, Lcom/flurry/sdk/hw;->e:Lcom/flurry/sdk/hw;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/sg;->a(Lcom/flurry/sdk/hw;)V

    .line 379
    iget-object v0, p0, Lcom/flurry/sdk/sg;->i:Lcom/flurry/sdk/if;

    invoke-virtual {v0}, Lcom/flurry/sdk/if;->j()Lcom/flurry/sdk/if;

    move-result-object v0

    .line 380
    if-eqz v0, :cond_0

    .line 381
    iput-object v0, p0, Lcom/flurry/sdk/sg;->i:Lcom/flurry/sdk/if;

    .line 383
    :cond_0
    return-void
.end method

.method public c(Lcom/flurry/sdk/ht;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 691
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->e()Lcom/flurry/sdk/hw;

    move-result-object v0

    .line 694
    sget-object v1, Lcom/flurry/sdk/hw;->f:Lcom/flurry/sdk/hw;

    if-ne v0, v1, :cond_0

    .line 695
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->g()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/sg;->a(Ljava/lang/String;)V

    .line 696
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->b()Lcom/flurry/sdk/hw;

    move-result-object v0

    .line 700
    :cond_0
    sget-object v1, Lcom/flurry/sdk/sg$1;->a:[I

    invoke-virtual {v0}, Lcom/flurry/sdk/hw;->ordinal()I

    move-result v0

    aget v0, v1, v0

    packed-switch v0, :pswitch_data_0

    .line 716
    :pswitch_0
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/sg;->b(Lcom/flurry/sdk/ht;)V

    .line 718
    :goto_0
    return-void

    .line 702
    :pswitch_1
    invoke-virtual {p0}, Lcom/flurry/sdk/sg;->b()V

    .line 703
    :goto_1
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->b()Lcom/flurry/sdk/hw;

    move-result-object v0

    sget-object v1, Lcom/flurry/sdk/hw;->e:Lcom/flurry/sdk/hw;

    if-eq v0, v1, :cond_1

    .line 704
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/sg;->c(Lcom/flurry/sdk/ht;)V

    goto :goto_1

    .line 706
    :cond_1
    invoke-virtual {p0}, Lcom/flurry/sdk/sg;->c()V

    goto :goto_0

    .line 709
    :pswitch_2
    invoke-virtual {p0}, Lcom/flurry/sdk/sg;->d()V

    .line 710
    :goto_2
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->b()Lcom/flurry/sdk/hw;

    move-result-object v0

    sget-object v1, Lcom/flurry/sdk/hw;->c:Lcom/flurry/sdk/hw;

    if-eq v0, v1, :cond_2

    .line 711
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/sg;->c(Lcom/flurry/sdk/ht;)V

    goto :goto_2

    .line 713
    :cond_2
    invoke-virtual {p0}, Lcom/flurry/sdk/sg;->e()V

    goto :goto_0

    .line 700
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public c(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 476
    invoke-virtual {p0}, Lcom/flurry/sdk/sg;->i()V

    .line 477
    return-void
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 353
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/sdk/sg;->e:Z

    .line 354
    return-void
.end method

.method public final d()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 389
    sget-object v0, Lcom/flurry/sdk/hw;->b:Lcom/flurry/sdk/hw;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/sg;->a(Lcom/flurry/sdk/hw;)V

    .line 390
    iget-object v0, p0, Lcom/flurry/sdk/sg;->i:Lcom/flurry/sdk/if;

    invoke-virtual {v0}, Lcom/flurry/sdk/if;->i()Lcom/flurry/sdk/if;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/sg;->i:Lcom/flurry/sdk/if;

    .line 391
    return-void
.end method

.method public d(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 496
    invoke-virtual {p0}, Lcom/flurry/sdk/sg;->i()V

    .line 497
    return-void
.end method

.method public final e()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 397
    sget-object v0, Lcom/flurry/sdk/hw;->c:Lcom/flurry/sdk/hw;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/sg;->a(Lcom/flurry/sdk/hw;)V

    .line 399
    iget-object v0, p0, Lcom/flurry/sdk/sg;->i:Lcom/flurry/sdk/if;

    invoke-virtual {v0}, Lcom/flurry/sdk/if;->j()Lcom/flurry/sdk/if;

    move-result-object v0

    .line 400
    if-eqz v0, :cond_0

    .line 401
    iput-object v0, p0, Lcom/flurry/sdk/sg;->i:Lcom/flurry/sdk/if;

    .line 403
    :cond_0
    return-void
.end method

.method public e(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 558
    sget-object v0, Lcom/flurry/sdk/hw;->j:Lcom/flurry/sdk/hw;

    invoke-virtual {p0, v0, p1}, Lcom/flurry/sdk/sg;->a(Lcom/flurry/sdk/hw;Ljava/lang/Object;)V

    .line 559
    return-void
.end method

.method public f()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 568
    sget-object v0, Lcom/flurry/sdk/hw;->m:Lcom/flurry/sdk/hw;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/sg;->a(Lcom/flurry/sdk/hw;)V

    .line 569
    return-void
.end method

.method public g()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 349
    return-void
.end method

.method public h()Lcom/flurry/sdk/ht;
    .locals 1

    .prologue
    .line 118
    iget-object v0, p0, Lcom/flurry/sdk/sg;->c:Lcom/flurry/sdk/hx;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/sg;->a(Lcom/flurry/sdk/hx;)Lcom/flurry/sdk/ht;

    move-result-object v0

    return-object v0
.end method

.method protected i()V
    .locals 2

    .prologue
    .line 746
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Called operation not supported for TokenBuffer"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .prologue
    const/16 v5, 0x64

    .line 268
    .line 270
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 271
    const-string v0, "[TokenBuffer: "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 272
    invoke-virtual {p0}, Lcom/flurry/sdk/sg;->h()Lcom/flurry/sdk/ht;

    move-result-object v2

    .line 273
    const/4 v0, 0x0

    .line 278
    :goto_0
    :try_start_0
    invoke-virtual {v2}, Lcom/flurry/sdk/ht;->b()Lcom/flurry/sdk/hw;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 282
    if-nez v3, :cond_1

    .line 292
    if-lt v0, v5, :cond_0

    .line 293
    const-string v2, " ... (truncated "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    add-int/lit8 v0, v0, -0x64

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " entries)"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 295
    :cond_0
    const/16 v0, 0x5d

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 296
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 279
    :catch_0
    move-exception v0

    .line 280
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 283
    :cond_1
    if-ge v0, v5, :cond_3

    .line 284
    if-lez v0, :cond_2

    .line 285
    const-string v4, ", "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 287
    :cond_2
    invoke-virtual {v3}, Lcom/flurry/sdk/hw;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 289
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 290
    goto :goto_0
.end method
