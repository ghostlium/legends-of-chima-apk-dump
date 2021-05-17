.class public final Lcom/flurry/sdk/ij;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected final a:Ljava/lang/Object;

.field protected final b:Z

.field protected final c:Lcom/flurry/sdk/ry;

.field protected d:[B

.field protected e:[B

.field protected f:[C

.field protected g:[C

.field protected h:[C


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/ry;Ljava/lang/Object;Z)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object v0, p0, Lcom/flurry/sdk/ij;->d:[B

    .line 63
    iput-object v0, p0, Lcom/flurry/sdk/ij;->e:[B

    .line 70
    iput-object v0, p0, Lcom/flurry/sdk/ij;->f:[C

    .line 77
    iput-object v0, p0, Lcom/flurry/sdk/ij;->g:[C

    .line 85
    iput-object v0, p0, Lcom/flurry/sdk/ij;->h:[C

    .line 95
    iput-object p1, p0, Lcom/flurry/sdk/ij;->c:Lcom/flurry/sdk/ry;

    .line 96
    iput-object p2, p0, Lcom/flurry/sdk/ij;->a:Ljava/lang/Object;

    .line 97
    iput-boolean p3, p0, Lcom/flurry/sdk/ij;->b:Z

    .line 98
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lcom/flurry/sdk/ij;->a:Ljava/lang/Object;

    return-object v0
.end method

.method public final a([C)V
    .locals 2

    .prologue
    .line 209
    if-eqz p1, :cond_1

    .line 210
    iget-object v0, p0, Lcom/flurry/sdk/ij;->f:[C

    if-eq p1, v0, :cond_0

    .line 211
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Trying to release buffer not owned by the context"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 213
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/ij;->f:[C

    .line 214
    iget-object v0, p0, Lcom/flurry/sdk/ij;->c:Lcom/flurry/sdk/ry;

    sget-object v1, Lcom/flurry/sdk/ry$b;->a:Lcom/flurry/sdk/ry$b;

    invoke-virtual {v0, v1, p1}, Lcom/flurry/sdk/ry;->a(Lcom/flurry/sdk/ry$b;[C)V

    .line 216
    :cond_1
    return-void
.end method

.method public final a(I)[C
    .locals 2

    .prologue
    .line 168
    iget-object v0, p0, Lcom/flurry/sdk/ij;->h:[C

    if-eqz v0, :cond_0

    .line 169
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Trying to call allocNameCopyBuffer() second time"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 171
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/ij;->c:Lcom/flurry/sdk/ry;

    sget-object v1, Lcom/flurry/sdk/ry$b;->d:Lcom/flurry/sdk/ry$b;

    invoke-virtual {v0, v1, p1}, Lcom/flurry/sdk/ry;->a(Lcom/flurry/sdk/ry$b;I)[C

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/ij;->h:[C

    .line 172
    iget-object v0, p0, Lcom/flurry/sdk/ij;->h:[C

    return-object v0
.end method

.method public final b([C)V
    .locals 2

    .prologue
    .line 220
    if-eqz p1, :cond_1

    .line 221
    iget-object v0, p0, Lcom/flurry/sdk/ij;->g:[C

    if-eq p1, v0, :cond_0

    .line 222
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Trying to release buffer not owned by the context"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 224
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/ij;->g:[C

    .line 225
    iget-object v0, p0, Lcom/flurry/sdk/ij;->c:Lcom/flurry/sdk/ry;

    sget-object v1, Lcom/flurry/sdk/ry$b;->b:Lcom/flurry/sdk/ry$b;

    invoke-virtual {v0, v1, p1}, Lcom/flurry/sdk/ry;->a(Lcom/flurry/sdk/ry$b;[C)V

    .line 227
    :cond_1
    return-void
.end method

.method public final b()Z
    .locals 1

    .prologue
    .line 113
    iget-boolean v0, p0, Lcom/flurry/sdk/ij;->b:Z

    return v0
.end method

.method public final c()Lcom/flurry/sdk/sf;
    .locals 2

    .prologue
    .line 122
    new-instance v0, Lcom/flurry/sdk/sf;

    iget-object v1, p0, Lcom/flurry/sdk/ij;->c:Lcom/flurry/sdk/ry;

    invoke-direct {v0, v1}, Lcom/flurry/sdk/sf;-><init>(Lcom/flurry/sdk/ry;)V

    return-object v0
.end method

.method public final c([C)V
    .locals 2

    .prologue
    .line 231
    if-eqz p1, :cond_1

    .line 232
    iget-object v0, p0, Lcom/flurry/sdk/ij;->h:[C

    if-eq p1, v0, :cond_0

    .line 233
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Trying to release buffer not owned by the context"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 235
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/ij;->h:[C

    .line 236
    iget-object v0, p0, Lcom/flurry/sdk/ij;->c:Lcom/flurry/sdk/ry;

    sget-object v1, Lcom/flurry/sdk/ry$b;->d:Lcom/flurry/sdk/ry$b;

    invoke-virtual {v0, v1, p1}, Lcom/flurry/sdk/ry;->a(Lcom/flurry/sdk/ry$b;[C)V

    .line 238
    :cond_1
    return-void
.end method

.method public final d()[C
    .locals 2

    .prologue
    .line 150
    iget-object v0, p0, Lcom/flurry/sdk/ij;->f:[C

    if-eqz v0, :cond_0

    .line 151
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Trying to call allocTokenBuffer() second time"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 153
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/ij;->c:Lcom/flurry/sdk/ry;

    sget-object v1, Lcom/flurry/sdk/ry$b;->a:Lcom/flurry/sdk/ry$b;

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/ry;->a(Lcom/flurry/sdk/ry$b;)[C

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/ij;->f:[C

    .line 154
    iget-object v0, p0, Lcom/flurry/sdk/ij;->f:[C

    return-object v0
.end method

.method public final e()[C
    .locals 2

    .prologue
    .line 159
    iget-object v0, p0, Lcom/flurry/sdk/ij;->g:[C

    if-eqz v0, :cond_0

    .line 160
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Trying to call allocConcatBuffer() second time"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 162
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/ij;->c:Lcom/flurry/sdk/ry;

    sget-object v1, Lcom/flurry/sdk/ry$b;->b:Lcom/flurry/sdk/ry$b;

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/ry;->a(Lcom/flurry/sdk/ry$b;)[C

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/ij;->g:[C

    .line 163
    iget-object v0, p0, Lcom/flurry/sdk/ij;->g:[C

    return-object v0
.end method
