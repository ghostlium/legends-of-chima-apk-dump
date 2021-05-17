.class public final Lcom/flurry/sdk/rn;
.super Lcom/flurry/sdk/rp;
.source "SourceFile"


# instance fields
.field final c:J


# direct methods
.method public constructor <init>(J)V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/flurry/sdk/rp;-><init>()V

    iput-wide p1, p0, Lcom/flurry/sdk/rn;->c:J

    return-void
.end method

.method public static a(J)Lcom/flurry/sdk/rn;
    .locals 1

    .prologue
    .line 27
    new-instance v0, Lcom/flurry/sdk/rn;

    invoke-direct {v0, p0, p1}, Lcom/flurry/sdk/rn;-><init>(J)V

    return-object v0
.end method


# virtual methods
.method public final a(Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 81
    iget-wide v0, p0, Lcom/flurry/sdk/rn;->c:J

    invoke-virtual {p1, v0, v1}, Lcom/flurry/sdk/hp;->a(J)V

    .line 82
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 87
    if-ne p1, p0, :cond_1

    .line 92
    :cond_0
    :goto_0
    return v0

    .line 88
    :cond_1
    if-nez p1, :cond_2

    move v0, v1

    goto :goto_0

    .line 89
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_3

    move v0, v1

    .line 90
    goto :goto_0

    .line 92
    :cond_3
    check-cast p1, Lcom/flurry/sdk/rn;

    iget-wide v2, p1, Lcom/flurry/sdk/rn;->c:J

    iget-wide v4, p0, Lcom/flurry/sdk/rn;->c:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    .line 97
    iget-wide v0, p0, Lcom/flurry/sdk/rn;->c:J

    long-to-int v0, v0

    iget-wide v1, p0, Lcom/flurry/sdk/rn;->c:J

    const/16 v3, 0x20

    shr-long/2addr v1, v3

    long-to-int v1, v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public j()I
    .locals 2

    .prologue
    .line 53
    iget-wide v0, p0, Lcom/flurry/sdk/rn;->c:J

    long-to-int v0, v0

    return v0
.end method

.method public k()J
    .locals 2

    .prologue
    .line 56
    iget-wide v0, p0, Lcom/flurry/sdk/rn;->c:J

    return-wide v0
.end method

.method public l()D
    .locals 2

    .prologue
    .line 59
    iget-wide v0, p0, Lcom/flurry/sdk/rn;->c:J

    long-to-double v0, v0

    return-wide v0
.end method

.method public m()Ljava/lang/String;
    .locals 2

    .prologue
    .line 69
    iget-wide v0, p0, Lcom/flurry/sdk/rn;->c:J

    invoke-static {v0, v1}, Lcom/flurry/sdk/in;->a(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
