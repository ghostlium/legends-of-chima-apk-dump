.class public final Lcom/flurry/sdk/qj;
.super Lcom/flurry/sdk/qk;
.source "SourceFile"


# instance fields
.field protected final a:[Lcom/flurry/sdk/rx;

.field protected final b:[Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/Class;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 34
    move-object v0, p0

    move-object v1, p1

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/qj;-><init>(Ljava/lang/Class;[Ljava/lang/String;[Lcom/flurry/sdk/rx;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 35
    return-void
.end method

.method protected constructor <init>(Ljava/lang/Class;[Ljava/lang/String;[Lcom/flurry/sdk/rx;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/String;",
            "[",
            "Lcom/flurry/sdk/rx;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 46
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p4, p5}, Lcom/flurry/sdk/qk;-><init>(Ljava/lang/Class;ILjava/lang/Object;Ljava/lang/Object;)V

    .line 47
    if-eqz p2, :cond_0

    array-length v0, p2

    if-nez v0, :cond_1

    .line 48
    :cond_0
    iput-object v1, p0, Lcom/flurry/sdk/qj;->b:[Ljava/lang/String;

    .line 49
    iput-object v1, p0, Lcom/flurry/sdk/qj;->a:[Lcom/flurry/sdk/rx;

    .line 54
    :goto_0
    return-void

    .line 51
    :cond_1
    iput-object p2, p0, Lcom/flurry/sdk/qj;->b:[Ljava/lang/String;

    .line 52
    iput-object p3, p0, Lcom/flurry/sdk/qj;->a:[Lcom/flurry/sdk/rx;

    goto :goto_0
.end method

.method public static d(Ljava/lang/Class;)Lcom/flurry/sdk/qj;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/qj;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 63
    new-instance v0, Lcom/flurry/sdk/qj;

    move-object v1, p0

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/qj;-><init>(Ljava/lang/Class;[Ljava/lang/String;[Lcom/flurry/sdk/rx;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method public a(Ljava/lang/Object;)Lcom/flurry/sdk/qj;
    .locals 6

    .prologue
    .line 109
    new-instance v0, Lcom/flurry/sdk/qj;

    iget-object v1, p0, Lcom/flurry/sdk/qj;->d:Ljava/lang/Class;

    iget-object v2, p0, Lcom/flurry/sdk/qj;->b:[Ljava/lang/String;

    iget-object v3, p0, Lcom/flurry/sdk/qj;->a:[Lcom/flurry/sdk/rx;

    iget-object v4, p0, Lcom/flurry/sdk/qj;->f:Ljava/lang/Object;

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/qj;-><init>(Ljava/lang/Class;[Ljava/lang/String;[Lcom/flurry/sdk/rx;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method protected a(Ljava/lang/Class;)Lcom/flurry/sdk/rx;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    .line 70
    new-instance v0, Lcom/flurry/sdk/qj;

    iget-object v2, p0, Lcom/flurry/sdk/qj;->b:[Ljava/lang/String;

    iget-object v3, p0, Lcom/flurry/sdk/qj;->a:[Lcom/flurry/sdk/rx;

    iget-object v4, p0, Lcom/flurry/sdk/qj;->f:Ljava/lang/Object;

    iget-object v5, p0, Lcom/flurry/sdk/qj;->g:Ljava/lang/Object;

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/qj;-><init>(Ljava/lang/Class;[Ljava/lang/String;[Lcom/flurry/sdk/rx;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method protected a()Ljava/lang/String;
    .locals 8

    .prologue
    const/4 v1, 0x0

    .line 138
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 139
    iget-object v0, p0, Lcom/flurry/sdk/qj;->d:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    iget-object v0, p0, Lcom/flurry/sdk/qj;->a:[Lcom/flurry/sdk/rx;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flurry/sdk/qj;->a:[Lcom/flurry/sdk/rx;

    array-length v0, v0

    if-lez v0, :cond_2

    .line 141
    const/16 v0, 0x3c

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 142
    const/4 v0, 0x1

    .line 143
    iget-object v4, p0, Lcom/flurry/sdk/qj;->a:[Lcom/flurry/sdk/rx;

    array-length v5, v4

    move v2, v1

    :goto_0
    if-ge v2, v5, :cond_1

    aget-object v6, v4, v2

    .line 144
    if-eqz v0, :cond_0

    move v0, v1

    .line 149
    :goto_1
    invoke-virtual {v6}, Lcom/flurry/sdk/rx;->m()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 147
    :cond_0
    const/16 v7, 0x2c

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 151
    :cond_1
    const/16 v0, 0x3e

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 153
    :cond_2
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public a(I)Ljava/lang/String;
    .locals 1

    .prologue
    .line 182
    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/qj;->b:[Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/qj;->b:[Ljava/lang/String;

    array-length v0, v0

    if-lt p1, v0, :cond_1

    .line 183
    :cond_0
    const/4 v0, 0x0

    .line 185
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/qj;->b:[Ljava/lang/String;

    aget-object v0, v0, p1

    goto :goto_0
.end method

.method public b(Ljava/lang/Object;)Lcom/flurry/sdk/qj;
    .locals 6

    .prologue
    .line 122
    iget-object v0, p0, Lcom/flurry/sdk/qj;->f:Ljava/lang/Object;

    if-ne p1, v0, :cond_0

    .line 125
    :goto_0
    return-object p0

    :cond_0
    new-instance v0, Lcom/flurry/sdk/qj;

    iget-object v1, p0, Lcom/flurry/sdk/qj;->d:Ljava/lang/Class;

    iget-object v2, p0, Lcom/flurry/sdk/qj;->b:[Ljava/lang/String;

    iget-object v3, p0, Lcom/flurry/sdk/qj;->a:[Lcom/flurry/sdk/rx;

    iget-object v5, p0, Lcom/flurry/sdk/qj;->g:Ljava/lang/Object;

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/qj;-><init>(Ljava/lang/Class;[Ljava/lang/String;[Lcom/flurry/sdk/rx;Ljava/lang/Object;Ljava/lang/Object;)V

    move-object p0, v0

    goto :goto_0
.end method

.method public b(I)Lcom/flurry/sdk/rx;
    .locals 1

    .prologue
    .line 173
    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/qj;->a:[Lcom/flurry/sdk/rx;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/qj;->a:[Lcom/flurry/sdk/rx;

    array-length v0, v0

    if-lt p1, v0, :cond_1

    .line 174
    :cond_0
    const/4 v0, 0x0

    .line 176
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/qj;->a:[Lcom/flurry/sdk/rx;

    aget-object v0, v0, p1

    goto :goto_0
.end method

.method public b(Ljava/lang/Class;)Lcom/flurry/sdk/rx;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    .line 77
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Internal error: SimpleType.narrowContentsBy() should never be called"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public c(Ljava/lang/Class;)Lcom/flurry/sdk/rx;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    .line 84
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Internal error: SimpleType.widenContentsBy() should never be called"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public synthetic d(Ljava/lang/Object;)Lcom/flurry/sdk/rx;
    .locals 1

    .prologue
    .line 13
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/qj;->b(Ljava/lang/Object;)Lcom/flurry/sdk/qj;

    move-result-object v0

    return-object v0
.end method

.method public e(Ljava/lang/Object;)Lcom/flurry/sdk/rx;
    .locals 2

    .prologue
    .line 116
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Simple types have no content types; can not call withContenTypeHandler()"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 8

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 225
    if-ne p1, p0, :cond_1

    move v0, v1

    .line 248
    :cond_0
    :goto_0
    return v0

    .line 226
    :cond_1
    if-eqz p1, :cond_0

    .line 227
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_0

    .line 229
    check-cast p1, Lcom/flurry/sdk/qj;

    .line 232
    iget-object v2, p1, Lcom/flurry/sdk/qj;->d:Ljava/lang/Class;

    iget-object v3, p0, Lcom/flurry/sdk/qj;->d:Ljava/lang/Class;

    if-ne v2, v3, :cond_0

    .line 235
    iget-object v3, p0, Lcom/flurry/sdk/qj;->a:[Lcom/flurry/sdk/rx;

    .line 236
    iget-object v4, p1, Lcom/flurry/sdk/qj;->a:[Lcom/flurry/sdk/rx;

    .line 237
    if-nez v3, :cond_3

    .line 238
    if-eqz v4, :cond_2

    array-length v2, v4

    if-nez v2, :cond_0

    :cond_2
    move v0, v1

    goto :goto_0

    .line 240
    :cond_3
    if-eqz v4, :cond_0

    .line 242
    array-length v2, v3

    array-length v5, v4

    if-ne v2, v5, :cond_0

    .line 243
    array-length v5, v3

    move v2, v0

    :goto_1
    if-ge v2, v5, :cond_4

    .line 244
    aget-object v6, v3, v2

    aget-object v7, v4, v2

    invoke-virtual {v6, v7}, Lcom/flurry/sdk/rx;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 243
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_4
    move v0, v1

    .line 248
    goto :goto_0
.end method

.method public synthetic f(Ljava/lang/Object;)Lcom/flurry/sdk/rx;
    .locals 1

    .prologue
    .line 13
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/qj;->a(Ljava/lang/Object;)Lcom/flurry/sdk/qj;

    move-result-object v0

    return-object v0
.end method

.method public f()Z
    .locals 1

    .prologue
    .line 163
    const/4 v0, 0x0

    return v0
.end method

.method public h()I
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Lcom/flurry/sdk/qj;->a:[Lcom/flurry/sdk/rx;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/qj;->a:[Lcom/flurry/sdk/rx;

    array-length v0, v0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 217
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x28

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 218
    const-string v1, "[simple type, class "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/flurry/sdk/qj;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x5d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 219
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
