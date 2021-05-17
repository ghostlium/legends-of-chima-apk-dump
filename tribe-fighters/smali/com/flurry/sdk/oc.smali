.class public Lcom/flurry/sdk/oc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/it;


# instance fields
.field protected final a:Lcom/flurry/sdk/mq;

.field protected final b:Lcom/flurry/sdk/qp;

.field protected final c:Lcom/flurry/sdk/rx;

.field protected final d:Ljava/lang/reflect/Method;

.field protected final e:Ljava/lang/reflect/Field;

.field protected f:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field protected final g:Lcom/flurry/sdk/ip;

.field protected final h:Lcom/flurry/sdk/rx;

.field protected final i:Lcom/flurry/sdk/jl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field protected j:Lcom/flurry/sdk/op;

.field protected final k:Z

.field protected final l:Ljava/lang/Object;

.field protected m:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field protected n:Lcom/flurry/sdk/jz;

.field protected o:Lcom/flurry/sdk/rx;


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/mq;Lcom/flurry/sdk/qp;Lcom/flurry/sdk/ip;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/jl;Lcom/flurry/sdk/jz;Lcom/flurry/sdk/rx;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;ZLjava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mq;",
            "Lcom/flurry/sdk/qp;",
            "Lcom/flurry/sdk/ip;",
            "Lcom/flurry/sdk/rx;",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/flurry/sdk/jz;",
            "Lcom/flurry/sdk/rx;",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/reflect/Field;",
            "Z",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 176
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 177
    iput-object p1, p0, Lcom/flurry/sdk/oc;->a:Lcom/flurry/sdk/mq;

    .line 178
    iput-object p2, p0, Lcom/flurry/sdk/oc;->b:Lcom/flurry/sdk/qp;

    .line 179
    iput-object p3, p0, Lcom/flurry/sdk/oc;->g:Lcom/flurry/sdk/ip;

    .line 180
    iput-object p4, p0, Lcom/flurry/sdk/oc;->c:Lcom/flurry/sdk/rx;

    .line 181
    iput-object p5, p0, Lcom/flurry/sdk/oc;->i:Lcom/flurry/sdk/jl;

    .line 182
    if-nez p5, :cond_0

    invoke-static {}, Lcom/flurry/sdk/op;->a()Lcom/flurry/sdk/op;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/flurry/sdk/oc;->j:Lcom/flurry/sdk/op;

    .line 183
    iput-object p6, p0, Lcom/flurry/sdk/oc;->n:Lcom/flurry/sdk/jz;

    .line 184
    iput-object p7, p0, Lcom/flurry/sdk/oc;->h:Lcom/flurry/sdk/rx;

    .line 185
    iput-object p8, p0, Lcom/flurry/sdk/oc;->d:Ljava/lang/reflect/Method;

    .line 186
    iput-object p9, p0, Lcom/flurry/sdk/oc;->e:Ljava/lang/reflect/Field;

    .line 187
    iput-boolean p10, p0, Lcom/flurry/sdk/oc;->k:Z

    .line 188
    iput-object p11, p0, Lcom/flurry/sdk/oc;->l:Ljava/lang/Object;

    .line 189
    return-void

    .line 182
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lcom/flurry/sdk/mq;Lcom/flurry/sdk/qp;Ljava/lang/String;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/jl;Lcom/flurry/sdk/jz;Lcom/flurry/sdk/rx;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;ZLjava/lang/Object;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mq;",
            "Lcom/flurry/sdk/qp;",
            "Ljava/lang/String;",
            "Lcom/flurry/sdk/rx;",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/flurry/sdk/jz;",
            "Lcom/flurry/sdk/rx;",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/reflect/Field;",
            "Z",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 167
    new-instance v3, Lcom/flurry/sdk/ip;

    invoke-direct {v3, p3}, Lcom/flurry/sdk/ip;-><init>(Ljava/lang/String;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move/from16 v10, p10

    move-object/from16 v11, p11

    invoke-direct/range {v0 .. v11}, Lcom/flurry/sdk/oc;-><init>(Lcom/flurry/sdk/mq;Lcom/flurry/sdk/qp;Lcom/flurry/sdk/ip;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/jl;Lcom/flurry/sdk/jz;Lcom/flurry/sdk/rx;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;ZLjava/lang/Object;)V

    .line 170
    return-void
.end method

.method protected constructor <init>(Lcom/flurry/sdk/oc;)V
    .locals 1

    .prologue
    .line 196
    iget-object v0, p1, Lcom/flurry/sdk/oc;->i:Lcom/flurry/sdk/jl;

    invoke-direct {p0, p1, v0}, Lcom/flurry/sdk/oc;-><init>(Lcom/flurry/sdk/oc;Lcom/flurry/sdk/jl;)V

    .line 197
    return-void
.end method

.method protected constructor <init>(Lcom/flurry/sdk/oc;Lcom/flurry/sdk/jl;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/oc;",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 203
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 204
    iput-object p2, p0, Lcom/flurry/sdk/oc;->i:Lcom/flurry/sdk/jl;

    .line 206
    iget-object v0, p1, Lcom/flurry/sdk/oc;->a:Lcom/flurry/sdk/mq;

    iput-object v0, p0, Lcom/flurry/sdk/oc;->a:Lcom/flurry/sdk/mq;

    .line 207
    iget-object v0, p1, Lcom/flurry/sdk/oc;->b:Lcom/flurry/sdk/qp;

    iput-object v0, p0, Lcom/flurry/sdk/oc;->b:Lcom/flurry/sdk/qp;

    .line 208
    iget-object v0, p1, Lcom/flurry/sdk/oc;->c:Lcom/flurry/sdk/rx;

    iput-object v0, p0, Lcom/flurry/sdk/oc;->c:Lcom/flurry/sdk/rx;

    .line 209
    iget-object v0, p1, Lcom/flurry/sdk/oc;->d:Ljava/lang/reflect/Method;

    iput-object v0, p0, Lcom/flurry/sdk/oc;->d:Ljava/lang/reflect/Method;

    .line 210
    iget-object v0, p1, Lcom/flurry/sdk/oc;->e:Ljava/lang/reflect/Field;

    iput-object v0, p0, Lcom/flurry/sdk/oc;->e:Ljava/lang/reflect/Field;

    .line 212
    iget-object v0, p1, Lcom/flurry/sdk/oc;->f:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    .line 213
    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p1, Lcom/flurry/sdk/oc;->f:Ljava/util/HashMap;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lcom/flurry/sdk/oc;->f:Ljava/util/HashMap;

    .line 215
    :cond_0
    iget-object v0, p1, Lcom/flurry/sdk/oc;->g:Lcom/flurry/sdk/ip;

    iput-object v0, p0, Lcom/flurry/sdk/oc;->g:Lcom/flurry/sdk/ip;

    .line 216
    iget-object v0, p1, Lcom/flurry/sdk/oc;->h:Lcom/flurry/sdk/rx;

    iput-object v0, p0, Lcom/flurry/sdk/oc;->h:Lcom/flurry/sdk/rx;

    .line 217
    iget-object v0, p1, Lcom/flurry/sdk/oc;->j:Lcom/flurry/sdk/op;

    iput-object v0, p0, Lcom/flurry/sdk/oc;->j:Lcom/flurry/sdk/op;

    .line 218
    iget-boolean v0, p1, Lcom/flurry/sdk/oc;->k:Z

    iput-boolean v0, p0, Lcom/flurry/sdk/oc;->k:Z

    .line 219
    iget-object v0, p1, Lcom/flurry/sdk/oc;->l:Ljava/lang/Object;

    iput-object v0, p0, Lcom/flurry/sdk/oc;->l:Ljava/lang/Object;

    .line 220
    iget-object v0, p1, Lcom/flurry/sdk/oc;->m:[Ljava/lang/Class;

    iput-object v0, p0, Lcom/flurry/sdk/oc;->m:[Ljava/lang/Class;

    .line 221
    iget-object v0, p1, Lcom/flurry/sdk/oc;->n:Lcom/flurry/sdk/jz;

    iput-object v0, p0, Lcom/flurry/sdk/oc;->n:Lcom/flurry/sdk/jz;

    .line 222
    iget-object v0, p1, Lcom/flurry/sdk/oc;->o:Lcom/flurry/sdk/rx;

    iput-object v0, p0, Lcom/flurry/sdk/oc;->o:Lcom/flurry/sdk/rx;

    .line 223
    return-void
.end method


# virtual methods
.method protected a(Lcom/flurry/sdk/op;Ljava/lang/Class;Lcom/flurry/sdk/jw;)Lcom/flurry/sdk/jl;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/op;",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/flurry/sdk/jw;",
            ")",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/ji;
        }
    .end annotation

    .prologue
    .line 459
    iget-object v0, p0, Lcom/flurry/sdk/oc;->o:Lcom/flurry/sdk/rx;

    if-eqz v0, :cond_1

    .line 460
    iget-object v0, p0, Lcom/flurry/sdk/oc;->o:Lcom/flurry/sdk/rx;

    invoke-virtual {p3, v0, p2}, Lcom/flurry/sdk/jw;->a(Lcom/flurry/sdk/rx;Ljava/lang/Class;)Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 461
    invoke-virtual {p1, v0, p3, p0}, Lcom/flurry/sdk/op;->a(Lcom/flurry/sdk/rx;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/op$d;

    move-result-object v0

    .line 466
    :goto_0
    iget-object v1, v0, Lcom/flurry/sdk/op$d;->b:Lcom/flurry/sdk/op;

    if-eq p1, v1, :cond_0

    .line 467
    iget-object v1, v0, Lcom/flurry/sdk/op$d;->b:Lcom/flurry/sdk/op;

    iput-object v1, p0, Lcom/flurry/sdk/oc;->j:Lcom/flurry/sdk/op;

    .line 469
    :cond_0
    iget-object v0, v0, Lcom/flurry/sdk/op$d;->a:Lcom/flurry/sdk/jl;

    return-object v0

    .line 463
    :cond_1
    invoke-virtual {p1, p2, p3, p0}, Lcom/flurry/sdk/op;->a(Ljava/lang/Class;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/op$d;

    move-result-object v0

    goto :goto_0
.end method

.method public a(Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/oc;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/flurry/sdk/oc;"
        }
    .end annotation

    .prologue
    .line 233
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcom/flurry/sdk/oc;

    if-eq v0, v1, :cond_0

    .line 234
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "BeanPropertyWriter sub-class does not override \'withSerializer()\'; needs to!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 236
    :cond_0
    new-instance v0, Lcom/flurry/sdk/oc;

    invoke-direct {v0, p0, p1}, Lcom/flurry/sdk/oc;-><init>(Lcom/flurry/sdk/oc;Lcom/flurry/sdk/jl;)V

    return-object v0
.end method

.method public a()Lcom/flurry/sdk/rx;
    .locals 1

    .prologue
    .line 283
    iget-object v0, p0, Lcom/flurry/sdk/oc;->c:Lcom/flurry/sdk/rx;

    return-object v0
.end method

.method public final a(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 482
    iget-object v0, p0, Lcom/flurry/sdk/oc;->d:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    .line 483
    iget-object v0, p0, Lcom/flurry/sdk/oc;->d:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 485
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/oc;->e:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public a(Lcom/flurry/sdk/rx;)V
    .locals 0

    .prologue
    .line 267
    iput-object p1, p0, Lcom/flurry/sdk/oc;->o:Lcom/flurry/sdk/rx;

    .line 268
    return-void
.end method

.method public a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 418
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/oc;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 420
    if-nez v1, :cond_1

    .line 421
    iget-boolean v0, p0, Lcom/flurry/sdk/oc;->k:Z

    if-nez v0, :cond_0

    .line 422
    iget-object v0, p0, Lcom/flurry/sdk/oc;->g:Lcom/flurry/sdk/ip;

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/hp;->a(Lcom/flurry/sdk/ip;)V

    .line 423
    invoke-virtual {p3, p2}, Lcom/flurry/sdk/jw;->a(Lcom/flurry/sdk/hp;)V

    .line 450
    :cond_0
    :goto_0
    return-void

    .line 428
    :cond_1
    if-ne v1, p1, :cond_2

    .line 429
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/oc;->b(Ljava/lang/Object;)V

    .line 431
    :cond_2
    iget-object v0, p0, Lcom/flurry/sdk/oc;->l:Ljava/lang/Object;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/flurry/sdk/oc;->l:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 435
    :cond_3
    iget-object v0, p0, Lcom/flurry/sdk/oc;->i:Lcom/flurry/sdk/jl;

    .line 436
    if-nez v0, :cond_4

    .line 437
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .line 438
    iget-object v3, p0, Lcom/flurry/sdk/oc;->j:Lcom/flurry/sdk/op;

    .line 439
    invoke-virtual {v3, v2}, Lcom/flurry/sdk/op;->a(Ljava/lang/Class;)Lcom/flurry/sdk/jl;

    move-result-object v0

    .line 440
    if-nez v0, :cond_4

    .line 441
    invoke-virtual {p0, v3, v2, p3}, Lcom/flurry/sdk/oc;->a(Lcom/flurry/sdk/op;Ljava/lang/Class;Lcom/flurry/sdk/jw;)Lcom/flurry/sdk/jl;

    move-result-object v0

    .line 444
    :cond_4
    iget-object v2, p0, Lcom/flurry/sdk/oc;->g:Lcom/flurry/sdk/ip;

    invoke-virtual {p2, v2}, Lcom/flurry/sdk/hp;->a(Lcom/flurry/sdk/ip;)V

    .line 445
    iget-object v2, p0, Lcom/flurry/sdk/oc;->n:Lcom/flurry/sdk/jz;

    if-nez v2, :cond_5

    .line 446
    invoke-virtual {v0, v1, p2, p3}, Lcom/flurry/sdk/jl;->a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    goto :goto_0

    .line 448
    :cond_5
    iget-object v2, p0, Lcom/flurry/sdk/oc;->n:Lcom/flurry/sdk/jz;

    invoke-virtual {v0, v1, p2, p3, v2}, Lcom/flurry/sdk/jl;->a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jz;)V

    goto :goto_0
.end method

.method public a([Ljava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 257
    iput-object p1, p0, Lcom/flurry/sdk/oc;->m:[Ljava/lang/Class;

    return-void
.end method

.method public b()Lcom/flurry/sdk/mq;
    .locals 1

    .prologue
    .line 298
    iget-object v0, p0, Lcom/flurry/sdk/oc;->a:Lcom/flurry/sdk/mq;

    return-object v0
.end method

.method protected b(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/ji;
        }
    .end annotation

    .prologue
    .line 491
    new-instance v0, Lcom/flurry/sdk/ji;

    const-string v1, "Direct self-reference leading to cycle"

    invoke-direct {v0, v1}, Lcom/flurry/sdk/ji;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public c()Lcom/flurry/sdk/oc;
    .locals 1

    .prologue
    .line 246
    new-instance v0, Lcom/flurry/sdk/ot;

    invoke-direct {v0, p0}, Lcom/flurry/sdk/ot;-><init>(Lcom/flurry/sdk/oc;)V

    return-object v0
.end method

.method public d()Ljava/lang/String;
    .locals 1

    .prologue
    .line 278
    iget-object v0, p0, Lcom/flurry/sdk/oc;->g:Lcom/flurry/sdk/ip;

    invoke-virtual {v0}, Lcom/flurry/sdk/ip;->a()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public e()Z
    .locals 1

    .prologue
    .line 366
    iget-object v0, p0, Lcom/flurry/sdk/oc;->i:Lcom/flurry/sdk/jl;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public f()Lcom/flurry/sdk/rx;
    .locals 1

    .prologue
    .line 374
    iget-object v0, p0, Lcom/flurry/sdk/oc;->h:Lcom/flurry/sdk/rx;

    return-object v0
.end method

.method public g()Ljava/lang/reflect/Type;
    .locals 1

    .prologue
    .line 396
    iget-object v0, p0, Lcom/flurry/sdk/oc;->d:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    .line 397
    iget-object v0, p0, Lcom/flurry/sdk/oc;->d:Ljava/lang/reflect/Method;

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getGenericReturnType()Ljava/lang/reflect/Type;

    move-result-object v0

    .line 399
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/oc;->e:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object v0

    goto :goto_0
.end method

.method public h()[Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 402
    iget-object v0, p0, Lcom/flurry/sdk/oc;->m:[Ljava/lang/Class;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 497
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x28

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 498
    const-string v1, "property \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/flurry/sdk/oc;->d()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 499
    iget-object v1, p0, Lcom/flurry/sdk/oc;->d:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_0

    .line 500
    const-string v1, "via method "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/sdk/oc;->d:Ljava/lang/reflect/Method;

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/sdk/oc;->d:Ljava/lang/reflect/Method;

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 504
    :goto_0
    iget-object v1, p0, Lcom/flurry/sdk/oc;->i:Lcom/flurry/sdk/jl;

    if-nez v1, :cond_1

    .line 505
    const-string v1, ", no static serializer"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 509
    :goto_1
    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 510
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 502
    :cond_0
    const-string v1, "field \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/sdk/oc;->e:Ljava/lang/reflect/Field;

    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/sdk/oc;->e:Ljava/lang/reflect/Field;

    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 507
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ", static serializer of type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/sdk/oc;->i:Lcom/flurry/sdk/jl;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1
.end method
