.class public Lcom/flurry/sdk/ln;
.super Lcom/flurry/sdk/lo;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/js;


# annotations
.annotation runtime Lcom/flurry/sdk/kb;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/lo",
        "<",
        "Ljava/util/Collection",
        "<",
        "Ljava/lang/Object;",
        ">;>;",
        "Lcom/flurry/sdk/js;"
    }
.end annotation


# instance fields
.field protected final a:Lcom/flurry/sdk/rx;

.field protected final b:Lcom/flurry/sdk/jh;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/jh",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field protected final c:Lcom/flurry/sdk/jy;

.field protected final d:Lcom/flurry/sdk/kx;

.field protected e:Lcom/flurry/sdk/jh;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/jh",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/rx;Lcom/flurry/sdk/jh;Lcom/flurry/sdk/jy;Lcom/flurry/sdk/kx;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/rx;",
            "Lcom/flurry/sdk/jh",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/flurry/sdk/jy;",
            "Lcom/flurry/sdk/kx;",
            ")V"
        }
    .end annotation

    .prologue
    .line 99
    invoke-virtual {p1}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flurry/sdk/lo;-><init>(Ljava/lang/Class;)V

    .line 100
    iput-object p1, p0, Lcom/flurry/sdk/ln;->a:Lcom/flurry/sdk/rx;

    .line 101
    iput-object p2, p0, Lcom/flurry/sdk/ln;->b:Lcom/flurry/sdk/jh;

    .line 102
    iput-object p3, p0, Lcom/flurry/sdk/ln;->c:Lcom/flurry/sdk/jy;

    .line 103
    iput-object p4, p0, Lcom/flurry/sdk/ln;->d:Lcom/flurry/sdk/kx;

    .line 104
    return-void
.end method

.method private final b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Ljava/util/Collection;)Ljava/util/Collection;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ht;",
            "Lcom/flurry/sdk/ja;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 245
    sget-object v0, Lcom/flurry/sdk/iz$a;->o:Lcom/flurry/sdk/iz$a;

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/ja;->a(Lcom/flurry/sdk/iz$a;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 246
    iget-object v0, p0, Lcom/flurry/sdk/ln;->a:Lcom/flurry/sdk/rx;

    invoke-virtual {v0}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/ja;->b(Ljava/lang/Class;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0

    .line 248
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/ln;->b:Lcom/flurry/sdk/jh;

    .line 249
    iget-object v1, p0, Lcom/flurry/sdk/ln;->c:Lcom/flurry/sdk/jy;

    .line 250
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->e()Lcom/flurry/sdk/hw;

    move-result-object v2

    .line 254
    sget-object v3, Lcom/flurry/sdk/hw;->m:Lcom/flurry/sdk/hw;

    if-ne v2, v3, :cond_1

    .line 255
    const/4 v0, 0x0

    .line 261
    :goto_0
    invoke-interface {p3, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 262
    return-object p3

    .line 256
    :cond_1
    if-nez v1, :cond_2

    .line 257
    invoke-virtual {v0, p1, p2}, Lcom/flurry/sdk/jh;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 259
    :cond_2
    invoke-virtual {v0, p1, p2, v1}, Lcom/flurry/sdk/jh;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Lcom/flurry/sdk/jy;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public synthetic a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 30
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/ln;->b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Lcom/flurry/sdk/jy;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 232
    invoke-virtual {p3, p1, p2}, Lcom/flurry/sdk/jy;->b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 30
    check-cast p3, Ljava/util/Collection;

    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/ln;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Ljava/util/Collection;)Ljava/util/Collection;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ht;",
            "Lcom/flurry/sdk/ja;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 203
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->j()Z

    move-result v0

    if-nez v0, :cond_1

    .line 204
    invoke-direct {p0, p1, p2, p3}, Lcom/flurry/sdk/ln;->b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object p3

    .line 223
    :cond_0
    return-object p3

    .line 207
    :cond_1
    iget-object v1, p0, Lcom/flurry/sdk/ln;->b:Lcom/flurry/sdk/jh;

    .line 209
    iget-object v2, p0, Lcom/flurry/sdk/ln;->c:Lcom/flurry/sdk/jy;

    .line 211
    :goto_0
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->b()Lcom/flurry/sdk/hw;

    move-result-object v0

    sget-object v3, Lcom/flurry/sdk/hw;->e:Lcom/flurry/sdk/hw;

    if-eq v0, v3, :cond_0

    .line 214
    sget-object v3, Lcom/flurry/sdk/hw;->m:Lcom/flurry/sdk/hw;

    if-ne v0, v3, :cond_2

    .line 215
    const/4 v0, 0x0

    .line 221
    :goto_1
    invoke-interface {p3, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 216
    :cond_2
    if-nez v2, :cond_3

    .line 217
    invoke-virtual {v1, p1, p2}, Lcom/flurry/sdk/jh;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_1

    .line 219
    :cond_3
    invoke-virtual {v1, p1, p2, v2}, Lcom/flurry/sdk/jh;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Lcom/flurry/sdk/jy;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_1
.end method

.method public a(Lcom/flurry/sdk/iz;Lcom/flurry/sdk/jd;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/ji;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 138
    iget-object v0, p0, Lcom/flurry/sdk/ln;->d:Lcom/flurry/sdk/kx;

    invoke-virtual {v0}, Lcom/flurry/sdk/kx;->i()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 139
    iget-object v0, p0, Lcom/flurry/sdk/ln;->d:Lcom/flurry/sdk/kx;

    invoke-virtual {v0}, Lcom/flurry/sdk/kx;->l()Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 140
    if-nez v0, :cond_0

    .line 141
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid delegate-creator definition for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/sdk/ln;->a:Lcom/flurry/sdk/rx;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": value instantiator ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/sdk/ln;->d:Lcom/flurry/sdk/kx;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") returned true for \'canCreateUsingDelegate()\', but null for \'getDelegateType()\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 145
    :cond_0
    iget-object v1, p0, Lcom/flurry/sdk/ln;->d:Lcom/flurry/sdk/kx;

    invoke-virtual {v1}, Lcom/flurry/sdk/kx;->o()Lcom/flurry/sdk/mu;

    move-result-object v1

    .line 148
    new-instance v2, Lcom/flurry/sdk/it$a;

    invoke-direct {v2, v3, v0, v3, v1}, Lcom/flurry/sdk/it$a;-><init>(Ljava/lang/String;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/qp;Lcom/flurry/sdk/mq;)V

    .line 150
    invoke-virtual {p0, p1, p2, v0, v2}, Lcom/flurry/sdk/ln;->a(Lcom/flurry/sdk/iz;Lcom/flurry/sdk/jd;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jh;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/ln;->e:Lcom/flurry/sdk/jh;

    .line 152
    :cond_1
    return-void
.end method

.method public b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/util/Collection;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ht;",
            "Lcom/flurry/sdk/ja;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 181
    iget-object v0, p0, Lcom/flurry/sdk/ln;->e:Lcom/flurry/sdk/jh;

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/flurry/sdk/ln;->d:Lcom/flurry/sdk/kx;

    iget-object v1, p0, Lcom/flurry/sdk/ln;->e:Lcom/flurry/sdk/jh;

    invoke-virtual {v1, p1, p2}, Lcom/flurry/sdk/jh;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/kx;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    .line 194
    :goto_0
    return-object v0

    .line 188
    :cond_0
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->e()Lcom/flurry/sdk/hw;

    move-result-object v0

    sget-object v1, Lcom/flurry/sdk/hw;->h:Lcom/flurry/sdk/hw;

    if-ne v0, v1, :cond_1

    .line 189
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->k()Ljava/lang/String;

    move-result-object v0

    .line 190
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 191
    iget-object v1, p0, Lcom/flurry/sdk/ln;->d:Lcom/flurry/sdk/kx;

    invoke-virtual {v1, v0}, Lcom/flurry/sdk/kx;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    goto :goto_0

    .line 194
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/ln;->d:Lcom/flurry/sdk/kx;

    invoke-virtual {v0}, Lcom/flurry/sdk/kx;->m()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    invoke-virtual {p0, p1, p2, v0}, Lcom/flurry/sdk/ln;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    goto :goto_0
.end method

.method public d()Lcom/flurry/sdk/jh;
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
    .line 167
    iget-object v0, p0, Lcom/flurry/sdk/ln;->b:Lcom/flurry/sdk/jh;

    return-object v0
.end method
