.class public Lcom/flurry/sdk/gc;
.super Lcom/flurry/sdk/gb;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/gc$1;,
        Lcom/flurry/sdk/gc$b;,
        Lcom/flurry/sdk/gc$a;
    }
.end annotation


# instance fields
.field private a:[B

.field private b:I

.field private c:Lcom/flurry/sdk/gc$a;

.field private d:I


# direct methods
.method constructor <init>(Ljava/io/OutputStream;I)V
    .locals 0

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/flurry/sdk/gb;-><init>()V

    .line 52
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/gc;->a(Ljava/io/OutputStream;I)Lcom/flurry/sdk/gc;

    .line 53
    return-void
.end method

.method private d(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    iget-object v0, p0, Lcom/flurry/sdk/gc;->a:[B

    array-length v0, v0

    iget v1, p0, Lcom/flurry/sdk/gc;->b:I

    sub-int/2addr v0, v1

    .line 104
    if-ge v0, p1, :cond_0

    .line 105
    invoke-direct {p0}, Lcom/flurry/sdk/gc;->h()V

    .line 107
    :cond_0
    return-void
.end method

.method private e(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 161
    iget v0, p0, Lcom/flurry/sdk/gc;->b:I

    iget-object v1, p0, Lcom/flurry/sdk/gc;->a:[B

    array-length v1, v1

    if-ne v0, v1, :cond_0

    .line 162
    invoke-direct {p0}, Lcom/flurry/sdk/gc;->h()V

    .line 164
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/gc;->a:[B

    iget v1, p0, Lcom/flurry/sdk/gc;->b:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/flurry/sdk/gc;->b:I

    and-int/lit16 v2, p1, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 165
    return-void
.end method

.method private h()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 89
    iget v0, p0, Lcom/flurry/sdk/gc;->b:I

    if-lez v0, :cond_0

    .line 90
    iget-object v0, p0, Lcom/flurry/sdk/gc;->c:Lcom/flurry/sdk/gc$a;

    iget-object v1, p0, Lcom/flurry/sdk/gc;->a:[B

    iget v2, p0, Lcom/flurry/sdk/gc;->b:I

    invoke-virtual {v0, v1, v3, v2}, Lcom/flurry/sdk/gc$a;->a([BII)V

    .line 91
    iput v3, p0, Lcom/flurry/sdk/gc;->b:I

    .line 93
    :cond_0
    return-void
.end method


# virtual methods
.method a(Ljava/io/OutputStream;I)Lcom/flurry/sdk/gc;
    .locals 3

    .prologue
    const/16 v2, 0x200

    .line 56
    if-nez p1, :cond_0

    .line 57
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "OutputStream cannot be null!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 58
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/gc;->c:Lcom/flurry/sdk/gc$a;

    if-eqz v0, :cond_1

    .line 59
    iget v0, p0, Lcom/flurry/sdk/gc;->b:I

    if-lez v0, :cond_1

    .line 61
    :try_start_0
    invoke-direct {p0}, Lcom/flurry/sdk/gc;->h()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    :cond_1
    new-instance v0, Lcom/flurry/sdk/gc$b;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/flurry/sdk/gc$b;-><init>(Ljava/io/OutputStream;Lcom/flurry/sdk/gc$1;)V

    iput-object v0, p0, Lcom/flurry/sdk/gc;->c:Lcom/flurry/sdk/gc$a;

    .line 68
    const/4 v0, 0x0

    iput v0, p0, Lcom/flurry/sdk/gc;->b:I

    .line 69
    iget-object v0, p0, Lcom/flurry/sdk/gc;->a:[B

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flurry/sdk/gc;->a:[B

    array-length v0, v0

    if-eq v0, p2, :cond_3

    .line 70
    :cond_2
    new-array v0, p2, [B

    iput-object v0, p0, Lcom/flurry/sdk/gc;->a:[B

    .line 72
    :cond_3
    iget-object v0, p0, Lcom/flurry/sdk/gc;->a:[B

    array-length v0, v0

    ushr-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/flurry/sdk/gc;->d:I

    .line 73
    iget v0, p0, Lcom/flurry/sdk/gc;->d:I

    if-le v0, v2, :cond_4

    .line 74
    iput v2, p0, Lcom/flurry/sdk/gc;->d:I

    .line 76
    :cond_4
    return-object p0

    .line 62
    :catch_0
    move-exception v0

    .line 63
    new-instance v1, Lcom/flurry/sdk/fk;

    const-string v2, "Failure flushing old output"

    invoke-direct {v1, v2, v0}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public a(D)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lcom/flurry/sdk/gc;->d(I)V

    .line 139
    iget v0, p0, Lcom/flurry/sdk/gc;->b:I

    iget-object v1, p0, Lcom/flurry/sdk/gc;->a:[B

    iget v2, p0, Lcom/flurry/sdk/gc;->b:I

    invoke-static {p1, p2, v1, v2}, Lcom/flurry/sdk/fz;->a(D[BI)I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/flurry/sdk/gc;->b:I

    .line 140
    return-void
.end method

.method public a(F)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 132
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/flurry/sdk/gc;->d(I)V

    .line 133
    iget v0, p0, Lcom/flurry/sdk/gc;->b:I

    iget-object v1, p0, Lcom/flurry/sdk/gc;->a:[B

    iget v2, p0, Lcom/flurry/sdk/gc;->b:I

    invoke-static {p1, v1, v2}, Lcom/flurry/sdk/fz;->a(F[BI)I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/flurry/sdk/gc;->b:I

    .line 134
    return-void
.end method

.method public a(Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    iget-object v0, p0, Lcom/flurry/sdk/gc;->a:[B

    array-length v0, v0

    iget v1, p0, Lcom/flurry/sdk/gc;->b:I

    if-ne v0, v1, :cond_0

    .line 113
    invoke-direct {p0}, Lcom/flurry/sdk/gc;->h()V

    .line 115
    :cond_0
    iget v0, p0, Lcom/flurry/sdk/gc;->b:I

    iget-object v1, p0, Lcom/flurry/sdk/gc;->a:[B

    iget v2, p0, Lcom/flurry/sdk/gc;->b:I

    invoke-static {p1, v1, v2}, Lcom/flurry/sdk/fz;->a(Z[BI)I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/flurry/sdk/gc;->b:I

    .line 116
    return-void
.end method

.method public b(J)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 126
    const/16 v0, 0xa

    invoke-direct {p0, v0}, Lcom/flurry/sdk/gc;->d(I)V

    .line 127
    iget v0, p0, Lcom/flurry/sdk/gc;->b:I

    iget-object v1, p0, Lcom/flurry/sdk/gc;->a:[B

    iget v2, p0, Lcom/flurry/sdk/gc;->b:I

    invoke-static {p1, p2, v1, v2}, Lcom/flurry/sdk/fz;->a(J[BI)I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/flurry/sdk/gc;->b:I

    .line 128
    return-void
.end method

.method public b([BII)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 144
    iget v0, p0, Lcom/flurry/sdk/gc;->d:I

    if-le p3, v0, :cond_0

    .line 146
    invoke-direct {p0}, Lcom/flurry/sdk/gc;->h()V

    .line 147
    iget-object v0, p0, Lcom/flurry/sdk/gc;->c:Lcom/flurry/sdk/gc$a;

    invoke-virtual {v0, p1, p2, p3}, Lcom/flurry/sdk/gc$a;->a([BII)V

    .line 153
    :goto_0
    return-void

    .line 150
    :cond_0
    invoke-direct {p0, p3}, Lcom/flurry/sdk/gc;->d(I)V

    .line 151
    iget-object v0, p0, Lcom/flurry/sdk/gc;->a:[B

    iget v1, p0, Lcom/flurry/sdk/gc;->b:I

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 152
    iget v0, p0, Lcom/flurry/sdk/gc;->b:I

    add-int/2addr v0, p3

    iput v0, p0, Lcom/flurry/sdk/gc;->b:I

    goto :goto_0
.end method

.method public c(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 120
    const/4 v0, 0x5

    invoke-direct {p0, v0}, Lcom/flurry/sdk/gc;->d(I)V

    .line 121
    iget v0, p0, Lcom/flurry/sdk/gc;->b:I

    iget-object v1, p0, Lcom/flurry/sdk/gc;->a:[B

    iget v2, p0, Lcom/flurry/sdk/gc;->b:I

    invoke-static {p1, v1, v2}, Lcom/flurry/sdk/fz;->a(I[BI)I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/flurry/sdk/gc;->b:I

    .line 122
    return-void
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    invoke-direct {p0}, Lcom/flurry/sdk/gc;->h()V

    .line 82
    iget-object v0, p0, Lcom/flurry/sdk/gc;->c:Lcom/flurry/sdk/gc$a;

    invoke-virtual {v0}, Lcom/flurry/sdk/gc$a;->a()V

    .line 83
    return-void
.end method

.method protected g()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 157
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/flurry/sdk/gc;->e(I)V

    .line 158
    return-void
.end method
