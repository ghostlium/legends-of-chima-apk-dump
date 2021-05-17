.class public final Lcom/flurry/sdk/rf;
.super Lcom/flurry/sdk/rp;
.source "SourceFile"


# instance fields
.field protected final c:Ljava/math/BigInteger;


# direct methods
.method public constructor <init>(Ljava/math/BigInteger;)V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/flurry/sdk/rp;-><init>()V

    iput-object p1, p0, Lcom/flurry/sdk/rf;->c:Ljava/math/BigInteger;

    return-void
.end method

.method public static a(Ljava/math/BigInteger;)Lcom/flurry/sdk/rf;
    .locals 1

    .prologue
    .line 26
    new-instance v0, Lcom/flurry/sdk/rf;

    invoke-direct {v0, p0}, Lcom/flurry/sdk/rf;-><init>(Ljava/math/BigInteger;)V

    return-object v0
.end method


# virtual methods
.method public final a(Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 86
    iget-object v0, p0, Lcom/flurry/sdk/rf;->c:Ljava/math/BigInteger;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/hp;->a(Ljava/math/BigInteger;)V

    .line 87
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 92
    if-ne p1, p0, :cond_1

    .line 97
    :cond_0
    :goto_0
    return v0

    .line 93
    :cond_1
    if-nez p1, :cond_2

    move v0, v1

    goto :goto_0

    .line 94
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_3

    move v0, v1

    .line 95
    goto :goto_0

    .line 97
    :cond_3
    check-cast p1, Lcom/flurry/sdk/rf;

    iget-object v2, p1, Lcom/flurry/sdk/rf;->c:Ljava/math/BigInteger;

    iget-object v3, p0, Lcom/flurry/sdk/rf;->c:Ljava/math/BigInteger;

    if-eq v2, v3, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lcom/flurry/sdk/rf;->c:Ljava/math/BigInteger;

    invoke-virtual {v0}, Ljava/math/BigInteger;->hashCode()I

    move-result v0

    return v0
.end method

.method public j()I
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/flurry/sdk/rf;->c:Ljava/math/BigInteger;

    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    move-result v0

    return v0
.end method

.method public k()J
    .locals 2

    .prologue
    .line 55
    iget-object v0, p0, Lcom/flurry/sdk/rf;->c:Ljava/math/BigInteger;

    invoke-virtual {v0}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public l()D
    .locals 2

    .prologue
    .line 61
    iget-object v0, p0, Lcom/flurry/sdk/rf;->c:Ljava/math/BigInteger;

    invoke-virtual {v0}, Ljava/math/BigInteger;->doubleValue()D

    move-result-wide v0

    return-wide v0
.end method

.method public m()Ljava/lang/String;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/flurry/sdk/rf;->c:Ljava/math/BigInteger;

    invoke-virtual {v0}, Ljava/math/BigInteger;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
