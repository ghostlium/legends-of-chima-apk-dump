.class public abstract Lcom/flurry/sdk/ht;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/ht$a;,
        Lcom/flurry/sdk/ht$b;
    }
.end annotation


# instance fields
.field protected a:I

.field protected b:Lcom/flurry/sdk/hw;

.field protected c:Lcom/flurry/sdk/hw;


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 287
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected constructor <init>(I)V
    .locals 0

    .prologue
    .line 288
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 289
    iput p1, p0, Lcom/flurry/sdk/ht;->a:I

    .line 290
    return-void
.end method


# virtual methods
.method protected a(Ljava/lang/String;)Lcom/flurry/sdk/hs;
    .locals 2

    .prologue
    .line 1432
    new-instance v0, Lcom/flurry/sdk/hs;

    invoke-virtual {p0}, Lcom/flurry/sdk/ht;->i()Lcom/flurry/sdk/hq;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/flurry/sdk/hs;-><init>(Ljava/lang/String;Lcom/flurry/sdk/hq;)V

    return-object v0
.end method

.method public abstract a()Lcom/flurry/sdk/hx;
.end method

.method public a(Lcom/flurry/sdk/ht$a;)Z
    .locals 2

    .prologue
    .line 501
    iget v0, p0, Lcom/flurry/sdk/ht;->a:I

    invoke-virtual {p1}, Lcom/flurry/sdk/ht$a;->c()I

    move-result v1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public abstract a(Lcom/flurry/sdk/hl;)[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation
.end method

.method public abstract b()Lcom/flurry/sdk/hw;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation
.end method

.method public c()Lcom/flurry/sdk/hw;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 567
    invoke-virtual {p0}, Lcom/flurry/sdk/ht;->b()Lcom/flurry/sdk/hw;

    move-result-object v0

    .line 568
    sget-object v1, Lcom/flurry/sdk/hw;->f:Lcom/flurry/sdk/hw;

    if-ne v0, v1, :cond_0

    .line 569
    invoke-virtual {p0}, Lcom/flurry/sdk/ht;->b()Lcom/flurry/sdk/hw;

    move-result-object v0

    .line 571
    :cond_0
    return-object v0
.end method

.method public abstract close()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract d()Lcom/flurry/sdk/ht;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation
.end method

.method public e()Lcom/flurry/sdk/hw;
    .locals 1

    .prologue
    .line 725
    iget-object v0, p0, Lcom/flurry/sdk/ht;->b:Lcom/flurry/sdk/hw;

    return-object v0
.end method

.method public f()V
    .locals 1

    .prologue
    .line 757
    iget-object v0, p0, Lcom/flurry/sdk/ht;->b:Lcom/flurry/sdk/hw;

    if-eqz v0, :cond_0

    .line 758
    iget-object v0, p0, Lcom/flurry/sdk/ht;->b:Lcom/flurry/sdk/hw;

    iput-object v0, p0, Lcom/flurry/sdk/ht;->c:Lcom/flurry/sdk/hw;

    .line 759
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/ht;->b:Lcom/flurry/sdk/hw;

    .line 761
    :cond_0
    return-void
.end method

.method public abstract g()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation
.end method

.method public abstract h()Lcom/flurry/sdk/hq;
.end method

.method public abstract i()Lcom/flurry/sdk/hq;
.end method

.method public j()Z
    .locals 2

    .prologue
    .line 829
    invoke-virtual {p0}, Lcom/flurry/sdk/ht;->e()Lcom/flurry/sdk/hw;

    move-result-object v0

    sget-object v1, Lcom/flurry/sdk/hw;->d:Lcom/flurry/sdk/hw;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public abstract k()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation
.end method

.method public abstract l()[C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation
.end method

.method public abstract m()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation
.end method

.method public abstract n()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation
.end method

.method public o()Z
    .locals 1

    .prologue
    .line 917
    const/4 v0, 0x0

    return v0
.end method

.method public abstract p()Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation
.end method

.method public abstract q()Lcom/flurry/sdk/ht$b;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation
.end method

.method public r()B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 960
    invoke-virtual {p0}, Lcom/flurry/sdk/ht;->t()I

    move-result v0

    .line 962
    const/16 v1, -0x80

    if-lt v0, v1, :cond_0

    const/16 v1, 0x7f

    if-le v0, v1, :cond_1

    .line 963
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Numeric value ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flurry/sdk/ht;->k()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") out of range of Java byte"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/ht;->a(Ljava/lang/String;)Lcom/flurry/sdk/hs;

    move-result-object v0

    throw v0

    .line 965
    :cond_1
    int-to-byte v0, v0

    return v0
.end method

.method public s()S
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 984
    invoke-virtual {p0}, Lcom/flurry/sdk/ht;->t()I

    move-result v0

    .line 985
    const/16 v1, -0x8000

    if-lt v0, v1, :cond_0

    const/16 v1, 0x7fff

    if-le v0, v1, :cond_1

    .line 986
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Numeric value ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flurry/sdk/ht;->k()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") out of range of Java short"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/ht;->a(Ljava/lang/String;)Lcom/flurry/sdk/hs;

    move-result-object v0

    throw v0

    .line 988
    :cond_1
    int-to-short v0, v0

    return v0
.end method

.method public abstract t()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation
.end method

.method public abstract u()J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation
.end method

.method public abstract v()Ljava/math/BigInteger;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation
.end method

.method public abstract w()F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation
.end method

.method public abstract x()D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation
.end method

.method public abstract y()Ljava/math/BigDecimal;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation
.end method

.method public z()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hs;
        }
    .end annotation

    .prologue
    .line 1117
    const/4 v0, 0x0

    return-object v0
.end method
