.class public abstract Lcom/flurry/sdk/rx;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected final d:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field protected final e:I

.field protected f:Ljava/lang/Object;

.field protected g:Ljava/lang/Object;


# direct methods
.method protected constructor <init>(Ljava/lang/Class;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;I)V"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    iput-object p1, p0, Lcom/flurry/sdk/rx;->d:Ljava/lang/Class;

    .line 66
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    add-int/2addr v0, p2

    iput v0, p0, Lcom/flurry/sdk/rx;->e:I

    .line 67
    iput-object v1, p0, Lcom/flurry/sdk/rx;->f:Ljava/lang/Object;

    .line 68
    iput-object v1, p0, Lcom/flurry/sdk/rx;->g:Ljava/lang/Object;

    .line 69
    return-void
.end method


# virtual methods
.method protected abstract a(Ljava/lang/Class;)Lcom/flurry/sdk/rx;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation
.end method

.method public a(I)Ljava/lang/String;
    .locals 1

    .prologue
    .line 378
    const/4 v0, 0x0

    return-object v0
.end method

.method protected a(Ljava/lang/Class;Ljava/lang/Class;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 484
    iget-object v0, p0, Lcom/flurry/sdk/rx;->d:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 485
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Class "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not assignable to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/sdk/rx;->d:Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 487
    :cond_0
    return-void
.end method

.method public b(I)Lcom/flurry/sdk/rx;
    .locals 1

    .prologue
    .line 363
    const/4 v0, 0x0

    return-object v0
.end method

.method public abstract b(Ljava/lang/Class;)Lcom/flurry/sdk/rx;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation
.end method

.method public b()Z
    .locals 1

    .prologue
    .line 279
    const/4 v0, 0x0

    return v0
.end method

.method public abstract c(Ljava/lang/Class;)Lcom/flurry/sdk/rx;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation
.end method

.method public c()Z
    .locals 1

    .prologue
    .line 255
    iget-object v0, p0, Lcom/flurry/sdk/rx;->d:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    move-result v0

    return v0
.end method

.method public d(Ljava/lang/Object;)Lcom/flurry/sdk/rx;
    .locals 0

    .prologue
    .line 103
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/rx;->j(Ljava/lang/Object;)V

    .line 104
    return-object p0
.end method

.method public d()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 262
    iget-object v1, p0, Lcom/flurry/sdk/rx;->d:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getModifiers()I

    move-result v1

    .line 263
    and-int/lit16 v1, v1, 0x600

    if-nez v1, :cond_1

    .line 272
    :cond_0
    :goto_0
    return v0

    .line 269
    :cond_1
    iget-object v1, p0, Lcom/flurry/sdk/rx;->d:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v1

    if-nez v1, :cond_0

    .line 272
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public abstract e(Ljava/lang/Object;)Lcom/flurry/sdk/rx;
.end method

.method public e()Z
    .locals 1

    .prologue
    .line 327
    invoke-virtual {p0}, Lcom/flurry/sdk/rx;->h()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public abstract equals(Ljava/lang/Object;)Z
.end method

.method public f(Ljava/lang/Class;)Lcom/flurry/sdk/rx;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    .line 159
    iget-object v0, p0, Lcom/flurry/sdk/rx;->d:Ljava/lang/Class;

    if-ne p1, v0, :cond_0

    .line 173
    :goto_0
    return-object p0

    .line 163
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/rx;->d:Ljava/lang/Class;

    invoke-virtual {p0, p1, v0}, Lcom/flurry/sdk/rx;->a(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 164
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/rx;->a(Ljava/lang/Class;)Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 167
    iget-object v1, p0, Lcom/flurry/sdk/rx;->f:Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/flurry/sdk/rx;->n()Ljava/lang/Object;

    move-result-object v2

    if-eq v1, v2, :cond_1

    .line 168
    iget-object v1, p0, Lcom/flurry/sdk/rx;->f:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/rx;->d(Ljava/lang/Object;)Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 170
    :cond_1
    iget-object v1, p0, Lcom/flurry/sdk/rx;->g:Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/flurry/sdk/rx;->o()Ljava/lang/Object;

    move-result-object v2

    if-eq v1, v2, :cond_2

    .line 171
    iget-object v1, p0, Lcom/flurry/sdk/rx;->g:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/rx;->f(Ljava/lang/Object;)Lcom/flurry/sdk/rx;

    move-result-object v0

    :cond_2
    move-object p0, v0

    .line 173
    goto :goto_0
.end method

.method public abstract f(Ljava/lang/Object;)Lcom/flurry/sdk/rx;
.end method

.method public abstract f()Z
.end method

.method public g()Lcom/flurry/sdk/rx;
    .locals 1

    .prologue
    .line 341
    const/4 v0, 0x0

    return-object v0
.end method

.method public g(Ljava/lang/Class;)Lcom/flurry/sdk/rx;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    .line 185
    iget-object v0, p0, Lcom/flurry/sdk/rx;->d:Ljava/lang/Class;

    if-ne p1, v0, :cond_0

    .line 196
    :goto_0
    return-object p0

    .line 188
    :cond_0
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/rx;->a(Ljava/lang/Class;)Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 190
    iget-object v1, p0, Lcom/flurry/sdk/rx;->f:Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/flurry/sdk/rx;->n()Ljava/lang/Object;

    move-result-object v2

    if-eq v1, v2, :cond_1

    .line 191
    iget-object v1, p0, Lcom/flurry/sdk/rx;->f:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/rx;->d(Ljava/lang/Object;)Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 193
    :cond_1
    iget-object v1, p0, Lcom/flurry/sdk/rx;->g:Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/flurry/sdk/rx;->o()Ljava/lang/Object;

    move-result-object v2

    if-eq v1, v2, :cond_2

    .line 194
    iget-object v1, p0, Lcom/flurry/sdk/rx;->g:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/rx;->f(Ljava/lang/Object;)Lcom/flurry/sdk/rx;

    move-result-object v0

    :cond_2
    move-object p0, v0

    .line 196
    goto :goto_0
.end method

.method public h()I
    .locals 1

    .prologue
    .line 350
    const/4 v0, 0x0

    return v0
.end method

.method public h(Ljava/lang/Class;)Lcom/flurry/sdk/rx;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    .line 211
    iget-object v0, p0, Lcom/flurry/sdk/rx;->d:Ljava/lang/Class;

    if-ne p1, v0, :cond_0

    .line 216
    :goto_0
    return-object p0

    .line 215
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/rx;->d:Ljava/lang/Class;

    invoke-virtual {p0, v0, p1}, Lcom/flurry/sdk/rx;->a(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 216
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/rx;->i(Ljava/lang/Class;)Lcom/flurry/sdk/rx;

    move-result-object p0

    goto :goto_0
.end method

.method public final hashCode()I
    .locals 1

    .prologue
    .line 502
    iget v0, p0, Lcom/flurry/sdk/rx;->e:I

    return v0
.end method

.method protected i(Ljava/lang/Class;)Lcom/flurry/sdk/rx;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    .line 227
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/rx;->a(Ljava/lang/Class;)Lcom/flurry/sdk/rx;

    move-result-object v0

    return-object v0
.end method

.method public i()Z
    .locals 1

    .prologue
    .line 302
    const/4 v0, 0x0

    return v0
.end method

.method public j(Ljava/lang/Object;)V
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 135
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/rx;->f:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 136
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Trying to reset value handler for type ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/flurry/sdk/rx;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]; old handler of type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/sdk/rx;->f:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", new handler of type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 139
    :cond_0
    iput-object p1, p0, Lcom/flurry/sdk/rx;->f:Ljava/lang/Object;

    .line 140
    return-void
.end method

.method public j()Z
    .locals 1

    .prologue
    .line 311
    const/4 v0, 0x0

    return v0
.end method

.method public k()Lcom/flurry/sdk/rx;
    .locals 1

    .prologue
    .line 334
    const/4 v0, 0x0

    return-object v0
.end method

.method public abstract m()Ljava/lang/String;
.end method

.method public n()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()TT;"
        }
    .end annotation

    .prologue
    .line 392
    iget-object v0, p0, Lcom/flurry/sdk/rx;->f:Ljava/lang/Object;

    return-object v0
.end method

.method public o()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()TT;"
        }
    .end annotation

    .prologue
    .line 400
    iget-object v0, p0, Lcom/flurry/sdk/rx;->g:Ljava/lang/Object;

    return-object v0
.end method

.method public final p()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 243
    iget-object v0, p0, Lcom/flurry/sdk/rx;->d:Ljava/lang/Class;

    return-object v0
.end method

.method public q()Z
    .locals 2

    .prologue
    .line 276
    const-class v0, Ljava/lang/Throwable;

    iget-object v1, p0, Lcom/flurry/sdk/rx;->d:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method public final r()Z
    .locals 1

    .prologue
    .line 281
    iget-object v0, p0, Lcom/flurry/sdk/rx;->d:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->isEnum()Z

    move-result v0

    return v0
.end method

.method public final s()Z
    .locals 1

    .prologue
    .line 283
    iget-object v0, p0, Lcom/flurry/sdk/rx;->d:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->isInterface()Z

    move-result v0

    return v0
.end method

.method public final t()Z
    .locals 1

    .prologue
    .line 285
    iget-object v0, p0, Lcom/flurry/sdk/rx;->d:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    return v0
.end method

.method public abstract toString()Ljava/lang/String;
.end method

.method public final u()Z
    .locals 1

    .prologue
    .line 287
    iget-object v0, p0, Lcom/flurry/sdk/rx;->d:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v0

    return v0
.end method
