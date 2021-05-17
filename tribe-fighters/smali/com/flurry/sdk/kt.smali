.class public abstract Lcom/flurry/sdk/kt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/it;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/kt$e;,
        Lcom/flurry/sdk/kt$b;,
        Lcom/flurry/sdk/kt$c;,
        Lcom/flurry/sdk/kt$a;,
        Lcom/flurry/sdk/kt$f;,
        Lcom/flurry/sdk/kt$d;
    }
.end annotation


# instance fields
.field protected final a:Ljava/lang/String;

.field protected final b:Lcom/flurry/sdk/rx;

.field protected final c:Lcom/flurry/sdk/qp;

.field protected d:Lcom/flurry/sdk/jh;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/jh",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field protected e:Lcom/flurry/sdk/jy;

.field protected f:Lcom/flurry/sdk/kt$e;

.field protected g:Ljava/lang/String;

.field protected h:I


# direct methods
.method protected constructor <init>(Lcom/flurry/sdk/kt;)V
    .locals 1

    .prologue
    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    const/4 v0, -0x1

    iput v0, p0, Lcom/flurry/sdk/kt;->h:I

    .line 113
    iget-object v0, p1, Lcom/flurry/sdk/kt;->a:Ljava/lang/String;

    iput-object v0, p0, Lcom/flurry/sdk/kt;->a:Ljava/lang/String;

    .line 114
    iget-object v0, p1, Lcom/flurry/sdk/kt;->b:Lcom/flurry/sdk/rx;

    iput-object v0, p0, Lcom/flurry/sdk/kt;->b:Lcom/flurry/sdk/rx;

    .line 115
    iget-object v0, p1, Lcom/flurry/sdk/kt;->c:Lcom/flurry/sdk/qp;

    iput-object v0, p0, Lcom/flurry/sdk/kt;->c:Lcom/flurry/sdk/qp;

    .line 116
    iget-object v0, p1, Lcom/flurry/sdk/kt;->d:Lcom/flurry/sdk/jh;

    iput-object v0, p0, Lcom/flurry/sdk/kt;->d:Lcom/flurry/sdk/jh;

    .line 117
    iget-object v0, p1, Lcom/flurry/sdk/kt;->e:Lcom/flurry/sdk/jy;

    iput-object v0, p0, Lcom/flurry/sdk/kt;->e:Lcom/flurry/sdk/jy;

    .line 118
    iget-object v0, p1, Lcom/flurry/sdk/kt;->f:Lcom/flurry/sdk/kt$e;

    iput-object v0, p0, Lcom/flurry/sdk/kt;->f:Lcom/flurry/sdk/kt$e;

    .line 119
    iget-object v0, p1, Lcom/flurry/sdk/kt;->g:Ljava/lang/String;

    iput-object v0, p0, Lcom/flurry/sdk/kt;->g:Ljava/lang/String;

    .line 120
    iget v0, p1, Lcom/flurry/sdk/kt;->h:I

    iput v0, p0, Lcom/flurry/sdk/kt;->h:I

    .line 121
    return-void
.end method

.method protected constructor <init>(Lcom/flurry/sdk/kt;Lcom/flurry/sdk/jh;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/kt;",
            "Lcom/flurry/sdk/jh",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    const/4 v1, -0x1

    iput v1, p0, Lcom/flurry/sdk/kt;->h:I

    .line 130
    iget-object v1, p1, Lcom/flurry/sdk/kt;->a:Ljava/lang/String;

    iput-object v1, p0, Lcom/flurry/sdk/kt;->a:Ljava/lang/String;

    .line 131
    iget-object v1, p1, Lcom/flurry/sdk/kt;->b:Lcom/flurry/sdk/rx;

    iput-object v1, p0, Lcom/flurry/sdk/kt;->b:Lcom/flurry/sdk/rx;

    .line 132
    iget-object v1, p1, Lcom/flurry/sdk/kt;->c:Lcom/flurry/sdk/qp;

    iput-object v1, p0, Lcom/flurry/sdk/kt;->c:Lcom/flurry/sdk/qp;

    .line 133
    iget-object v1, p1, Lcom/flurry/sdk/kt;->e:Lcom/flurry/sdk/jy;

    iput-object v1, p0, Lcom/flurry/sdk/kt;->e:Lcom/flurry/sdk/jy;

    .line 134
    iget-object v1, p1, Lcom/flurry/sdk/kt;->g:Ljava/lang/String;

    iput-object v1, p0, Lcom/flurry/sdk/kt;->g:Ljava/lang/String;

    .line 135
    iget v1, p1, Lcom/flurry/sdk/kt;->h:I

    iput v1, p0, Lcom/flurry/sdk/kt;->h:I

    .line 137
    iput-object p2, p0, Lcom/flurry/sdk/kt;->d:Lcom/flurry/sdk/jh;

    .line 138
    if-nez p2, :cond_0

    .line 139
    iput-object v0, p0, Lcom/flurry/sdk/kt;->f:Lcom/flurry/sdk/kt$e;

    .line 144
    :goto_0
    return-void

    .line 141
    :cond_0
    invoke-virtual {p2}, Lcom/flurry/sdk/jh;->b()Ljava/lang/Object;

    move-result-object v1

    .line 142
    if-nez v1, :cond_1

    :goto_1
    iput-object v0, p0, Lcom/flurry/sdk/kt;->f:Lcom/flurry/sdk/kt$e;

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/flurry/sdk/kt$e;

    iget-object v2, p0, Lcom/flurry/sdk/kt;->b:Lcom/flurry/sdk/rx;

    invoke-direct {v0, v2, v1}, Lcom/flurry/sdk/kt$e;-><init>(Lcom/flurry/sdk/rx;Ljava/lang/Object;)V

    goto :goto_1
.end method

.method protected constructor <init>(Ljava/lang/String;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/jy;Lcom/flurry/sdk/qp;)V
    .locals 1

    .prologue
    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    const/4 v0, -0x1

    iput v0, p0, Lcom/flurry/sdk/kt;->h:I

    .line 96
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 97
    :cond_0
    const-string v0, ""

    iput-object v0, p0, Lcom/flurry/sdk/kt;->a:Ljava/lang/String;

    .line 101
    :goto_0
    iput-object p2, p0, Lcom/flurry/sdk/kt;->b:Lcom/flurry/sdk/rx;

    .line 102
    iput-object p4, p0, Lcom/flurry/sdk/kt;->c:Lcom/flurry/sdk/qp;

    .line 103
    iput-object p3, p0, Lcom/flurry/sdk/kt;->e:Lcom/flurry/sdk/jy;

    .line 104
    return-void

    .line 99
    :cond_1
    sget-object v0, Lcom/flurry/sdk/sc;->a:Lcom/flurry/sdk/sc;

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/sc;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/kt;->a:Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method public abstract a(Lcom/flurry/sdk/jh;)Lcom/flurry/sdk/kt;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/jh",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/flurry/sdk/kt;"
        }
    .end annotation
.end method

.method public a()Lcom/flurry/sdk/rx;
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lcom/flurry/sdk/kt;->b:Lcom/flurry/sdk/rx;

    return-object v0
.end method

.method protected a(Ljava/lang/Exception;)Ljava/io/IOException;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 334
    instance-of v0, p1, Ljava/io/IOException;

    if-eqz v0, :cond_0

    .line 335
    check-cast p1, Ljava/io/IOException;

    throw p1

    .line 337
    :cond_0
    instance-of v0, p1, Ljava/lang/RuntimeException;

    if-eqz v0, :cond_1

    .line 338
    check-cast p1, Ljava/lang/RuntimeException;

    throw p1

    .line 342
    :cond_1
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 343
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    goto :goto_0

    .line 345
    :cond_2
    new-instance v0, Lcom/flurry/sdk/ji;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p1}, Lcom/flurry/sdk/ji;-><init>(Ljava/lang/String;Lcom/flurry/sdk/hq;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public final a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 292
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->e()Lcom/flurry/sdk/hw;

    move-result-object v0

    .line 293
    sget-object v1, Lcom/flurry/sdk/hw;->m:Lcom/flurry/sdk/hw;

    if-ne v0, v1, :cond_1

    .line 294
    iget-object v0, p0, Lcom/flurry/sdk/kt;->f:Lcom/flurry/sdk/kt$e;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 299
    :goto_0
    return-object v0

    .line 294
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/kt;->f:Lcom/flurry/sdk/kt$e;

    invoke-virtual {v0, p2}, Lcom/flurry/sdk/kt$e;->a(Lcom/flurry/sdk/ja;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 296
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/kt;->e:Lcom/flurry/sdk/jy;

    if-eqz v0, :cond_2

    .line 297
    iget-object v0, p0, Lcom/flurry/sdk/kt;->d:Lcom/flurry/sdk/jh;

    iget-object v1, p0, Lcom/flurry/sdk/kt;->e:Lcom/flurry/sdk/jy;

    invoke-virtual {v0, p1, p2, v1}, Lcom/flurry/sdk/jh;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Lcom/flurry/sdk/jy;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 299
    :cond_2
    iget-object v0, p0, Lcom/flurry/sdk/kt;->d:Lcom/flurry/sdk/jh;

    invoke-virtual {v0, p1, p2}, Lcom/flurry/sdk/jh;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public a(I)V
    .locals 3

    .prologue
    .line 172
    iget v0, p0, Lcom/flurry/sdk/kt;->h:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 173
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Property \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/flurry/sdk/kt;->c()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' already had index ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/flurry/sdk/kt;->h:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "), trying to assign "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 175
    :cond_0
    iput p1, p0, Lcom/flurry/sdk/kt;->h:I

    .line 176
    return-void
.end method

.method public abstract a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation
.end method

.method protected a(Ljava/lang/Exception;Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 315
    instance-of v0, p1, Ljava/lang/IllegalArgumentException;

    if-eqz v0, :cond_2

    .line 316
    if-nez p2, :cond_0

    const-string v0, "[NULL]"

    .line 317
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Problem deserializing property \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flurry/sdk/kt;->d()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 318
    const-string v2, "\' (expected type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flurry/sdk/kt;->a()Lcom/flurry/sdk/rx;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 319
    const-string v2, "; actual type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 321
    if-eqz v0, :cond_1

    .line 322
    const-string v2, ", problem: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 326
    :goto_1
    new-instance v0, Lcom/flurry/sdk/ji;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p1}, Lcom/flurry/sdk/ji;-><init>(Ljava/lang/String;Lcom/flurry/sdk/hq;Ljava/lang/Throwable;)V

    throw v0

    .line 316
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 324
    :cond_1
    const-string v0, " (no error message provided)"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 328
    :cond_2
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/kt;->a(Ljava/lang/Exception;)Ljava/io/IOException;

    .line 329
    return-void
.end method

.method public abstract a(Ljava/lang/Object;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public a(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 163
    iput-object p1, p0, Lcom/flurry/sdk/kt;->g:Ljava/lang/String;

    .line 164
    return-void
.end method

.method public abstract b()Lcom/flurry/sdk/mq;
.end method

.method public final c()Ljava/lang/String;
    .locals 1

    .prologue
    .line 185
    iget-object v0, p0, Lcom/flurry/sdk/kt;->a:Ljava/lang/String;

    return-object v0
.end method

.method public d()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 215
    iget-object v0, p0, Lcom/flurry/sdk/kt;->a:Ljava/lang/String;

    return-object v0
.end method

.method public e()Ljava/lang/String;
    .locals 1

    .prologue
    .line 217
    iget-object v0, p0, Lcom/flurry/sdk/kt;->g:Ljava/lang/String;

    return-object v0
.end method

.method public f()Z
    .locals 1

    .prologue
    .line 219
    iget-object v0, p0, Lcom/flurry/sdk/kt;->d:Lcom/flurry/sdk/jh;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public g()Z
    .locals 1

    .prologue
    .line 224
    iget-object v0, p0, Lcom/flurry/sdk/kt;->e:Lcom/flurry/sdk/jy;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public h()Lcom/flurry/sdk/jh;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/flurry/sdk/jh",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 229
    iget-object v0, p0, Lcom/flurry/sdk/kt;->d:Lcom/flurry/sdk/jh;

    return-object v0
.end method

.method public i()Lcom/flurry/sdk/jy;
    .locals 1

    .prologue
    .line 234
    iget-object v0, p0, Lcom/flurry/sdk/kt;->e:Lcom/flurry/sdk/jy;

    return-object v0
.end method

.method public j()I
    .locals 1

    .prologue
    .line 245
    iget v0, p0, Lcom/flurry/sdk/kt;->h:I

    return v0
.end method

.method public k()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 259
    const/4 v0, 0x0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 348
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[property \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flurry/sdk/kt;->c()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\']"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
