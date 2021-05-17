.class public final Lcom/flurry/sdk/me;
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
        "Ljava/lang/String;",
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
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected final c:Z

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
.method public constructor <init>(Lcom/flurry/sdk/rx;Lcom/flurry/sdk/jh;Lcom/flurry/sdk/kx;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/rx;",
            "Lcom/flurry/sdk/jh",
            "<*>;",
            "Lcom/flurry/sdk/kx;",
            ")V"
        }
    .end annotation

    .prologue
    .line 65
    invoke-virtual {p1}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flurry/sdk/lo;-><init>(Ljava/lang/Class;)V

    .line 66
    iput-object p1, p0, Lcom/flurry/sdk/me;->a:Lcom/flurry/sdk/rx;

    .line 67
    iput-object p2, p0, Lcom/flurry/sdk/me;->b:Lcom/flurry/sdk/jh;

    .line 68
    iput-object p3, p0, Lcom/flurry/sdk/me;->d:Lcom/flurry/sdk/kx;

    .line 69
    invoke-virtual {p0, p2}, Lcom/flurry/sdk/me;->a(Lcom/flurry/sdk/jh;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/flurry/sdk/me;->c:Z

    .line 70
    return-void
.end method

.method private b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Ljava/util/Collection;)Ljava/util/Collection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ht;",
            "Lcom/flurry/sdk/ja;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
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
    .line 175
    iget-object v1, p0, Lcom/flurry/sdk/me;->b:Lcom/flurry/sdk/jh;

    .line 177
    :goto_0
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->b()Lcom/flurry/sdk/hw;

    move-result-object v0

    sget-object v2, Lcom/flurry/sdk/hw;->e:Lcom/flurry/sdk/hw;

    if-eq v0, v2, :cond_1

    .line 180
    sget-object v2, Lcom/flurry/sdk/hw;->m:Lcom/flurry/sdk/hw;

    if-ne v0, v2, :cond_0

    .line 181
    const/4 v0, 0x0

    .line 185
    :goto_1
    invoke-interface {p3, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 183
    :cond_0
    invoke-virtual {v1, p1, p2}, Lcom/flurry/sdk/jh;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_1

    .line 187
    :cond_1
    return-object p3
.end method

.method private final c(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Ljava/util/Collection;)Ljava/util/Collection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ht;",
            "Lcom/flurry/sdk/ja;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
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
    .line 209
    sget-object v0, Lcom/flurry/sdk/iz$a;->o:Lcom/flurry/sdk/iz$a;

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/ja;->a(Lcom/flurry/sdk/iz$a;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 210
    iget-object v0, p0, Lcom/flurry/sdk/me;->a:Lcom/flurry/sdk/rx;

    invoke-virtual {v0}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/ja;->b(Ljava/lang/Class;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0

    .line 213
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/me;->b:Lcom/flurry/sdk/jh;

    .line 214
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->e()Lcom/flurry/sdk/hw;

    move-result-object v1

    .line 218
    sget-object v2, Lcom/flurry/sdk/hw;->m:Lcom/flurry/sdk/hw;

    if-ne v1, v2, :cond_1

    .line 219
    const/4 v0, 0x0

    .line 223
    :goto_0
    invoke-interface {p3, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 224
    return-object p3

    .line 221
    :cond_1
    if-nez v0, :cond_2

    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->k()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    invoke-virtual {v0, p1, p2}, Lcom/flurry/sdk/jh;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

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
    .line 18
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/me;->b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/util/Collection;

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
    .line 196
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
    .line 18
    check-cast p3, Ljava/util/Collection;

    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/me;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Ljava/util/Collection;)Ljava/util/Collection;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ht;",
            "Lcom/flurry/sdk/ja;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
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
    .line 155
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->j()Z

    move-result v0

    if-nez v0, :cond_1

    .line 156
    invoke-direct {p0, p1, p2, p3}, Lcom/flurry/sdk/me;->c(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object p3

    .line 167
    :cond_0
    :goto_0
    return-object p3

    .line 159
    :cond_1
    iget-boolean v0, p0, Lcom/flurry/sdk/me;->c:Z

    if-nez v0, :cond_2

    .line 160
    invoke-direct {p0, p1, p2, p3}, Lcom/flurry/sdk/me;->b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object p3

    goto :goto_0

    .line 164
    :cond_2
    :goto_1
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->b()Lcom/flurry/sdk/hw;

    move-result-object v0

    sget-object v1, Lcom/flurry/sdk/hw;->e:Lcom/flurry/sdk/hw;

    if-eq v0, v1, :cond_0

    .line 165
    sget-object v1, Lcom/flurry/sdk/hw;->m:Lcom/flurry/sdk/hw;

    if-ne v0, v1, :cond_3

    const/4 v0, 0x0

    :goto_2
    invoke-interface {p3, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_3
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->k()Ljava/lang/String;

    move-result-object v0

    goto :goto_2
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

    .line 103
    iget-object v0, p0, Lcom/flurry/sdk/me;->d:Lcom/flurry/sdk/kx;

    invoke-virtual {v0}, Lcom/flurry/sdk/kx;->o()Lcom/flurry/sdk/mu;

    move-result-object v0

    .line 104
    if-eqz v0, :cond_0

    .line 105
    iget-object v1, p0, Lcom/flurry/sdk/me;->d:Lcom/flurry/sdk/kx;

    invoke-virtual {v1}, Lcom/flurry/sdk/kx;->l()Lcom/flurry/sdk/rx;

    move-result-object v1

    .line 107
    new-instance v2, Lcom/flurry/sdk/it$a;

    invoke-direct {v2, v3, v1, v3, v0}, Lcom/flurry/sdk/it$a;-><init>(Ljava/lang/String;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/qp;Lcom/flurry/sdk/mq;)V

    .line 109
    invoke-virtual {p0, p1, p2, v1, v2}, Lcom/flurry/sdk/me;->a(Lcom/flurry/sdk/iz;Lcom/flurry/sdk/jd;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jh;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/me;->e:Lcom/flurry/sdk/jh;

    .line 111
    :cond_0
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
            "Ljava/lang/String;",
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
    .line 142
    iget-object v0, p0, Lcom/flurry/sdk/me;->e:Lcom/flurry/sdk/jh;

    if-eqz v0, :cond_0

    .line 143
    iget-object v0, p0, Lcom/flurry/sdk/me;->d:Lcom/flurry/sdk/kx;

    iget-object v1, p0, Lcom/flurry/sdk/me;->e:Lcom/flurry/sdk/jh;

    invoke-virtual {v1, p1, p2}, Lcom/flurry/sdk/jh;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/kx;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    .line 146
    :goto_0
    return-object v0

    .line 145
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/me;->d:Lcom/flurry/sdk/kx;

    invoke-virtual {v0}, Lcom/flurry/sdk/kx;->m()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    .line 146
    invoke-virtual {p0, p1, p2, v0}, Lcom/flurry/sdk/me;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Ljava/util/Collection;)Ljava/util/Collection;

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
    .line 127
    iget-object v0, p0, Lcom/flurry/sdk/me;->b:Lcom/flurry/sdk/jh;

    .line 128
    return-object v0
.end method
