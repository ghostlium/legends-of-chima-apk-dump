.class public Lcom/flurry/sdk/ot;
.super Lcom/flurry/sdk/oc;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/oc;)V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lcom/flurry/sdk/oc;-><init>(Lcom/flurry/sdk/oc;)V

    .line 22
    return-void
.end method

.method public constructor <init>(Lcom/flurry/sdk/oc;Lcom/flurry/sdk/jl;)V
    .locals 0
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
    .line 25
    invoke-direct {p0, p1, p2}, Lcom/flurry/sdk/oc;-><init>(Lcom/flurry/sdk/oc;Lcom/flurry/sdk/jl;)V

    .line 26
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
    .line 87
    iget-object v0, p0, Lcom/flurry/sdk/ot;->o:Lcom/flurry/sdk/rx;

    if-eqz v0, :cond_1

    .line 88
    iget-object v0, p0, Lcom/flurry/sdk/ot;->o:Lcom/flurry/sdk/rx;

    invoke-virtual {p3, v0, p2}, Lcom/flurry/sdk/jw;->a(Lcom/flurry/sdk/rx;Ljava/lang/Class;)Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 89
    invoke-virtual {p3, v0, p0}, Lcom/flurry/sdk/jw;->a(Lcom/flurry/sdk/rx;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;

    move-result-object v0

    .line 93
    :goto_0
    invoke-virtual {v0}, Lcom/flurry/sdk/jl;->b()Z

    move-result v1

    if-nez v1, :cond_0

    .line 94
    invoke-virtual {v0}, Lcom/flurry/sdk/jl;->a()Lcom/flurry/sdk/jl;

    move-result-object v0

    .line 96
    :cond_0
    iget-object v1, p0, Lcom/flurry/sdk/ot;->j:Lcom/flurry/sdk/op;

    invoke-virtual {v1, p2, v0}, Lcom/flurry/sdk/op;->a(Ljava/lang/Class;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/op;

    move-result-object v1

    iput-object v1, p0, Lcom/flurry/sdk/ot;->j:Lcom/flurry/sdk/op;

    .line 97
    return-object v0

    .line 91
    :cond_1
    invoke-virtual {p3, p2, p0}, Lcom/flurry/sdk/jw;->a(Ljava/lang/Class;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;

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
    .line 31
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcom/flurry/sdk/ot;

    if-eq v0, v1, :cond_0

    .line 32
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "UnwrappingBeanPropertyWriter sub-class does not override \'withSerializer()\'; needs to!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 35
    :cond_0
    invoke-virtual {p1}, Lcom/flurry/sdk/jl;->b()Z

    move-result v0

    if-nez v0, :cond_1

    .line 36
    invoke-virtual {p1}, Lcom/flurry/sdk/jl;->a()Lcom/flurry/sdk/jl;

    move-result-object p1

    .line 38
    :cond_1
    new-instance v0, Lcom/flurry/sdk/ot;

    invoke-direct {v0, p0, p1}, Lcom/flurry/sdk/ot;-><init>(Lcom/flurry/sdk/oc;Lcom/flurry/sdk/jl;)V

    return-object v0
.end method

.method public a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 45
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/ot;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 46
    if-nez v1, :cond_1

    .line 79
    :cond_0
    :goto_0
    return-void

    .line 53
    :cond_1
    if-ne v1, p1, :cond_2

    .line 54
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/ot;->b(Ljava/lang/Object;)V

    .line 56
    :cond_2
    iget-object v0, p0, Lcom/flurry/sdk/ot;->l:Ljava/lang/Object;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/flurry/sdk/ot;->l:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 59
    :cond_3
    iget-object v0, p0, Lcom/flurry/sdk/ot;->i:Lcom/flurry/sdk/jl;

    .line 60
    if-nez v0, :cond_4

    .line 61
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .line 62
    iget-object v3, p0, Lcom/flurry/sdk/ot;->j:Lcom/flurry/sdk/op;

    .line 63
    invoke-virtual {v3, v2}, Lcom/flurry/sdk/op;->a(Ljava/lang/Class;)Lcom/flurry/sdk/jl;

    move-result-object v0

    .line 64
    if-nez v0, :cond_4

    .line 65
    invoke-virtual {p0, v3, v2, p3}, Lcom/flurry/sdk/ot;->a(Lcom/flurry/sdk/op;Ljava/lang/Class;Lcom/flurry/sdk/jw;)Lcom/flurry/sdk/jl;

    move-result-object v0

    .line 70
    :cond_4
    invoke-virtual {v0}, Lcom/flurry/sdk/jl;->b()Z

    move-result v2

    if-nez v2, :cond_5

    .line 71
    iget-object v2, p0, Lcom/flurry/sdk/ot;->g:Lcom/flurry/sdk/ip;

    invoke-virtual {p2, v2}, Lcom/flurry/sdk/hp;->a(Lcom/flurry/sdk/ip;)V

    .line 74
    :cond_5
    iget-object v2, p0, Lcom/flurry/sdk/ot;->n:Lcom/flurry/sdk/jz;

    if-nez v2, :cond_6

    .line 75
    invoke-virtual {v0, v1, p2, p3}, Lcom/flurry/sdk/jl;->a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    goto :goto_0

    .line 77
    :cond_6
    iget-object v2, p0, Lcom/flurry/sdk/ot;->n:Lcom/flurry/sdk/jz;

    invoke-virtual {v0, v1, p2, p3, v2}, Lcom/flurry/sdk/jl;->a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jz;)V

    goto :goto_0
.end method
