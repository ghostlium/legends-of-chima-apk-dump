.class public Lcom/flurry/sdk/qe;
.super Lcom/flurry/sdk/qk;
.source "SourceFile"


# instance fields
.field protected final a:Lcom/flurry/sdk/rx;


# direct methods
.method protected constructor <init>(Ljava/lang/Class;Lcom/flurry/sdk/rx;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/flurry/sdk/rx;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 39
    invoke-virtual {p2}, Lcom/flurry/sdk/rx;->hashCode()I

    move-result v0

    invoke-direct {p0, p1, v0, p3, p4}, Lcom/flurry/sdk/qk;-><init>(Ljava/lang/Class;ILjava/lang/Object;Ljava/lang/Object;)V

    .line 40
    iput-object p2, p0, Lcom/flurry/sdk/qe;->a:Lcom/flurry/sdk/rx;

    .line 41
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;)Lcom/flurry/sdk/qe;
    .locals 4

    .prologue
    .line 80
    new-instance v0, Lcom/flurry/sdk/qe;

    iget-object v1, p0, Lcom/flurry/sdk/qe;->d:Ljava/lang/Class;

    iget-object v2, p0, Lcom/flurry/sdk/qe;->a:Lcom/flurry/sdk/rx;

    iget-object v3, p0, Lcom/flurry/sdk/qe;->f:Ljava/lang/Object;

    invoke-direct {v0, v1, v2, v3, p1}, Lcom/flurry/sdk/qe;-><init>(Ljava/lang/Class;Lcom/flurry/sdk/rx;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method protected a(Ljava/lang/Class;)Lcom/flurry/sdk/rx;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    .line 45
    new-instance v0, Lcom/flurry/sdk/qe;

    iget-object v1, p0, Lcom/flurry/sdk/qe;->a:Lcom/flurry/sdk/rx;

    iget-object v2, p0, Lcom/flurry/sdk/qe;->f:Ljava/lang/Object;

    iget-object v3, p0, Lcom/flurry/sdk/qe;->g:Ljava/lang/Object;

    invoke-direct {v0, p1, v1, v2, v3}, Lcom/flurry/sdk/qe;-><init>(Ljava/lang/Class;Lcom/flurry/sdk/rx;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method protected a()Ljava/lang/String;
    .locals 2

    .prologue
    .line 153
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 154
    iget-object v1, p0, Lcom/flurry/sdk/qe;->d:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    iget-object v1, p0, Lcom/flurry/sdk/qe;->a:Lcom/flurry/sdk/rx;

    if-eqz v1, :cond_0

    .line 156
    const/16 v1, 0x3c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 157
    iget-object v1, p0, Lcom/flurry/sdk/qe;->a:Lcom/flurry/sdk/rx;

    invoke-virtual {v1}, Lcom/flurry/sdk/rx;->m()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    const/16 v1, 0x3e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 160
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public a(I)Ljava/lang/String;
    .locals 1

    .prologue
    .line 133
    if-nez p1, :cond_0

    const-string v0, "E"

    .line 134
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public a_()Z
    .locals 2

    .prologue
    .line 178
    const-class v0, Ljava/util/Collection;

    iget-object v1, p0, Lcom/flurry/sdk/qe;->d:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method public b(Ljava/lang/Object;)Lcom/flurry/sdk/qe;
    .locals 5

    .prologue
    .line 87
    new-instance v0, Lcom/flurry/sdk/qe;

    iget-object v1, p0, Lcom/flurry/sdk/qe;->d:Ljava/lang/Class;

    iget-object v2, p0, Lcom/flurry/sdk/qe;->a:Lcom/flurry/sdk/rx;

    invoke-virtual {v2, p1}, Lcom/flurry/sdk/rx;->f(Ljava/lang/Object;)Lcom/flurry/sdk/rx;

    move-result-object v2

    iget-object v3, p0, Lcom/flurry/sdk/qe;->f:Ljava/lang/Object;

    iget-object v4, p0, Lcom/flurry/sdk/qe;->g:Ljava/lang/Object;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/flurry/sdk/qe;-><init>(Ljava/lang/Class;Lcom/flurry/sdk/rx;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method public b(I)Lcom/flurry/sdk/rx;
    .locals 1

    .prologue
    .line 124
    if-nez p1, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/qe;->a:Lcom/flurry/sdk/rx;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public b(Ljava/lang/Class;)Lcom/flurry/sdk/rx;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    .line 53
    iget-object v0, p0, Lcom/flurry/sdk/qe;->a:Lcom/flurry/sdk/rx;

    invoke-virtual {v0}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 56
    :goto_0
    return-object p0

    :cond_0
    new-instance v0, Lcom/flurry/sdk/qe;

    iget-object v1, p0, Lcom/flurry/sdk/qe;->d:Ljava/lang/Class;

    iget-object v2, p0, Lcom/flurry/sdk/qe;->a:Lcom/flurry/sdk/rx;

    invoke-virtual {v2, p1}, Lcom/flurry/sdk/rx;->f(Ljava/lang/Class;)Lcom/flurry/sdk/rx;

    move-result-object v2

    iget-object v3, p0, Lcom/flurry/sdk/qe;->f:Ljava/lang/Object;

    iget-object v4, p0, Lcom/flurry/sdk/qe;->g:Ljava/lang/Object;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/flurry/sdk/qe;-><init>(Ljava/lang/Class;Lcom/flurry/sdk/rx;Ljava/lang/Object;Ljava/lang/Object;)V

    move-object p0, v0

    goto :goto_0
.end method

.method public c(Ljava/lang/Object;)Lcom/flurry/sdk/qe;
    .locals 4

    .prologue
    .line 94
    new-instance v0, Lcom/flurry/sdk/qe;

    iget-object v1, p0, Lcom/flurry/sdk/qe;->d:Ljava/lang/Class;

    iget-object v2, p0, Lcom/flurry/sdk/qe;->a:Lcom/flurry/sdk/rx;

    iget-object v3, p0, Lcom/flurry/sdk/qe;->g:Ljava/lang/Object;

    invoke-direct {v0, v1, v2, p1, v3}, Lcom/flurry/sdk/qe;-><init>(Ljava/lang/Class;Lcom/flurry/sdk/rx;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method public c(Ljava/lang/Class;)Lcom/flurry/sdk/rx;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    .line 63
    iget-object v0, p0, Lcom/flurry/sdk/qe;->a:Lcom/flurry/sdk/rx;

    invoke-virtual {v0}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 66
    :goto_0
    return-object p0

    :cond_0
    new-instance v0, Lcom/flurry/sdk/qe;

    iget-object v1, p0, Lcom/flurry/sdk/qe;->d:Ljava/lang/Class;

    iget-object v2, p0, Lcom/flurry/sdk/qe;->a:Lcom/flurry/sdk/rx;

    invoke-virtual {v2, p1}, Lcom/flurry/sdk/rx;->h(Ljava/lang/Class;)Lcom/flurry/sdk/rx;

    move-result-object v2

    iget-object v3, p0, Lcom/flurry/sdk/qe;->f:Ljava/lang/Object;

    iget-object v4, p0, Lcom/flurry/sdk/qe;->g:Ljava/lang/Object;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/flurry/sdk/qe;-><init>(Ljava/lang/Class;Lcom/flurry/sdk/rx;Ljava/lang/Object;Ljava/lang/Object;)V

    move-object p0, v0

    goto :goto_0
.end method

.method public synthetic d(Ljava/lang/Object;)Lcom/flurry/sdk/rx;
    .locals 1

    .prologue
    .line 16
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/qe;->c(Ljava/lang/Object;)Lcom/flurry/sdk/qe;

    move-result-object v0

    return-object v0
.end method

.method public synthetic e(Ljava/lang/Object;)Lcom/flurry/sdk/rx;
    .locals 1

    .prologue
    .line 16
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/qe;->b(Ljava/lang/Object;)Lcom/flurry/sdk/qe;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 190
    if-ne p1, p0, :cond_1

    .line 195
    :cond_0
    :goto_0
    return v0

    .line 191
    :cond_1
    if-nez p1, :cond_2

    move v0, v1

    goto :goto_0

    .line 192
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_3

    move v0, v1

    goto :goto_0

    .line 194
    :cond_3
    check-cast p1, Lcom/flurry/sdk/qe;

    .line 195
    iget-object v2, p0, Lcom/flurry/sdk/qe;->d:Ljava/lang/Class;

    iget-object v3, p1, Lcom/flurry/sdk/qe;->d:Ljava/lang/Class;

    if-ne v2, v3, :cond_4

    iget-object v2, p0, Lcom/flurry/sdk/qe;->a:Lcom/flurry/sdk/rx;

    iget-object v3, p1, Lcom/flurry/sdk/qe;->a:Lcom/flurry/sdk/rx;

    invoke-virtual {v2, v3}, Lcom/flurry/sdk/rx;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    :cond_4
    move v0, v1

    goto :goto_0
.end method

.method public synthetic f(Ljava/lang/Object;)Lcom/flurry/sdk/rx;
    .locals 1

    .prologue
    .line 16
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/qe;->a(Ljava/lang/Object;)Lcom/flurry/sdk/qe;

    move-result-object v0

    return-object v0
.end method

.method public f()Z
    .locals 1

    .prologue
    .line 111
    const/4 v0, 0x1

    return v0
.end method

.method public g()Lcom/flurry/sdk/rx;
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lcom/flurry/sdk/qe;->a:Lcom/flurry/sdk/rx;

    return-object v0
.end method

.method public h()I
    .locals 1

    .prologue
    .line 120
    const/4 v0, 0x1

    return v0
.end method

.method public i()Z
    .locals 1

    .prologue
    .line 114
    const/4 v0, 0x1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 201
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[collection-like type; class "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/qe;->d:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", contains "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/qe;->a:Lcom/flurry/sdk/rx;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
