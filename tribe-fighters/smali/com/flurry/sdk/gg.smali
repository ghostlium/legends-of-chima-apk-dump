.class public Lcom/flurry/sdk/gg;
.super Lcom/flurry/sdk/gb;
.source "SourceFile"


# instance fields
.field private a:Ljava/io/OutputStream;

.field private final b:[B


# direct methods
.method constructor <init>(Ljava/io/OutputStream;)V
    .locals 1

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/flurry/sdk/gb;-><init>()V

    .line 43
    const/16 v0, 0xc

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/flurry/sdk/gg;->b:[B

    .line 49
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/gg;->a(Ljava/io/OutputStream;)Lcom/flurry/sdk/gg;

    .line 50
    return-void
.end method


# virtual methods
.method a(Ljava/io/OutputStream;)Lcom/flurry/sdk/gg;
    .locals 2

    .prologue
    .line 53
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "OutputStream cannot be null!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 54
    :cond_0
    iput-object p1, p0, Lcom/flurry/sdk/gg;->a:Ljava/io/OutputStream;

    .line 55
    return-object p0
.end method

.method public a(D)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 113
    const/16 v0, 0x8

    new-array v0, v0, [B

    .line 114
    invoke-static {p1, p2, v0, v3}, Lcom/flurry/sdk/fz;->a(D[BI)I

    move-result v1

    .line 115
    iget-object v2, p0, Lcom/flurry/sdk/gg;->a:Ljava/io/OutputStream;

    invoke-virtual {v2, v0, v3, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 116
    return-void
.end method

.method public a(F)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 107
    iget-object v0, p0, Lcom/flurry/sdk/gg;->b:[B

    invoke-static {p1, v0, v3}, Lcom/flurry/sdk/fz;->a(F[BI)I

    move-result v0

    .line 108
    iget-object v1, p0, Lcom/flurry/sdk/gg;->a:Ljava/io/OutputStream;

    iget-object v2, p0, Lcom/flurry/sdk/gg;->b:[B

    invoke-virtual {v1, v2, v3, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 109
    return-void
.end method

.method public a(Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 65
    iget-object v1, p0, Lcom/flurry/sdk/gg;->a:Ljava/io/OutputStream;

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 66
    return-void

    .line 65
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public b(J)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 91
    const/4 v0, 0x1

    shl-long v0, p1, v0

    const/16 v2, 0x3f

    shr-long v2, p1, v2

    xor-long/2addr v0, v2

    .line 92
    const-wide/32 v2, -0x80000000

    and-long/2addr v2, v0

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_1

    .line 93
    long-to-int v0, v0

    .line 94
    :goto_0
    and-int/lit8 v1, v0, -0x80

    if-eqz v1, :cond_0

    .line 95
    iget-object v1, p0, Lcom/flurry/sdk/gg;->a:Ljava/io/OutputStream;

    or-int/lit16 v2, v0, 0x80

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write(I)V

    .line 96
    ushr-int/lit8 v0, v0, 0x7

    goto :goto_0

    .line 98
    :cond_0
    iget-object v1, p0, Lcom/flurry/sdk/gg;->a:Ljava/io/OutputStream;

    int-to-byte v0, v0

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 103
    :goto_1
    return-void

    .line 101
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/gg;->b:[B

    invoke-static {p1, p2, v0, v6}, Lcom/flurry/sdk/fz;->a(J[BI)I

    move-result v0

    .line 102
    iget-object v1, p0, Lcom/flurry/sdk/gg;->a:Ljava/io/OutputStream;

    iget-object v2, p0, Lcom/flurry/sdk/gg;->b:[B

    invoke-virtual {v1, v2, v6, v0}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_1
.end method

.method public b([BII)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 120
    iget-object v0, p0, Lcom/flurry/sdk/gg;->a:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 121
    return-void
.end method

.method public c(I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 73
    shl-int/lit8 v0, p1, 0x1

    shr-int/lit8 v1, p1, 0x1f

    xor-int/2addr v0, v1

    .line 74
    and-int/lit8 v1, v0, -0x80

    if-nez v1, :cond_0

    .line 75
    iget-object v1, p0, Lcom/flurry/sdk/gg;->a:Ljava/io/OutputStream;

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 84
    :goto_0
    return-void

    .line 77
    :cond_0
    and-int/lit16 v1, v0, -0x4000

    if-nez v1, :cond_1

    .line 78
    iget-object v1, p0, Lcom/flurry/sdk/gg;->a:Ljava/io/OutputStream;

    or-int/lit16 v2, v0, 0x80

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write(I)V

    .line 79
    iget-object v1, p0, Lcom/flurry/sdk/gg;->a:Ljava/io/OutputStream;

    ushr-int/lit8 v0, v0, 0x7

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write(I)V

    goto :goto_0

    .line 82
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/gg;->b:[B

    invoke-static {p1, v0, v3}, Lcom/flurry/sdk/fz;->a(I[BI)I

    move-result v0

    .line 83
    iget-object v1, p0, Lcom/flurry/sdk/gg;->a:Ljava/io/OutputStream;

    iget-object v2, p0, Lcom/flurry/sdk/gg;->b:[B

    invoke-virtual {v1, v2, v3, v0}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    iget-object v0, p0, Lcom/flurry/sdk/gg;->a:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 61
    return-void
.end method

.method protected g()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 125
    iget-object v0, p0, Lcom/flurry/sdk/gg;->a:Ljava/io/OutputStream;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 126
    return-void
.end method
