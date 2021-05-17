.class public Lcom/flurry/sdk/nt;
.super Lcom/flurry/sdk/ng;
.source "SourceFile"


# instance fields
.field protected a:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet",
            "<",
            "Lcom/flurry/sdk/nf;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/flurry/sdk/ng;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/mn;Lcom/flurry/sdk/jo;Lcom/flurry/sdk/ir;)Ljava/util/Collection;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mn;",
            "Lcom/flurry/sdk/jo",
            "<*>;",
            "Lcom/flurry/sdk/ir;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Lcom/flurry/sdk/nf;",
            ">;"
        }
    .end annotation

    .prologue
    .line 89
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 91
    iget-object v0, p0, Lcom/flurry/sdk/nt;->a:Ljava/util/LinkedHashSet;

    if-eqz v0, :cond_1

    .line 92
    invoke-virtual {p1}, Lcom/flurry/sdk/mn;->d()Ljava/lang/Class;

    move-result-object v6

    .line 93
    iget-object v0, p0, Lcom/flurry/sdk/nt;->a:Ljava/util/LinkedHashSet;

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_0
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flurry/sdk/nf;

    .line 95
    invoke-virtual {v2}, Lcom/flurry/sdk/nf;->a()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 96
    invoke-virtual {v2}, Lcom/flurry/sdk/nf;->a()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p3, p2}, Lcom/flurry/sdk/mn;->b(Ljava/lang/Class;Lcom/flurry/sdk/ir;Lcom/flurry/sdk/iv$a;)Lcom/flurry/sdk/mn;

    move-result-object v1

    move-object v0, p0

    move-object v3, p2

    move-object v4, p3

    .line 97
    invoke-virtual/range {v0 .. v5}, Lcom/flurry/sdk/nt;->a(Lcom/flurry/sdk/mn;Lcom/flurry/sdk/nf;Lcom/flurry/sdk/jo;Lcom/flurry/sdk/ir;Ljava/util/HashMap;)V

    goto :goto_0

    .line 102
    :cond_1
    new-instance v2, Lcom/flurry/sdk/nf;

    invoke-virtual {p1}, Lcom/flurry/sdk/mn;->d()Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {v2, v0, v1}, Lcom/flurry/sdk/nf;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    .line 103
    invoke-virtual/range {v0 .. v5}, Lcom/flurry/sdk/nt;->a(Lcom/flurry/sdk/mn;Lcom/flurry/sdk/nf;Lcom/flurry/sdk/jo;Lcom/flurry/sdk/ir;Ljava/util/HashMap;)V

    .line 104
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public a(Lcom/flurry/sdk/mq;Lcom/flurry/sdk/jo;Lcom/flurry/sdk/ir;)Ljava/util/Collection;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mq;",
            "Lcom/flurry/sdk/jo",
            "<*>;",
            "Lcom/flurry/sdk/ir;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Lcom/flurry/sdk/nf;",
            ">;"
        }
    .end annotation

    .prologue
    .line 56
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 58
    iget-object v0, p0, Lcom/flurry/sdk/nt;->a:Ljava/util/LinkedHashSet;

    if-eqz v0, :cond_1

    .line 59
    invoke-virtual {p1}, Lcom/flurry/sdk/mq;->d()Ljava/lang/Class;

    move-result-object v6

    .line 60
    iget-object v0, p0, Lcom/flurry/sdk/nt;->a:Ljava/util/LinkedHashSet;

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_0
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flurry/sdk/nf;

    .line 62
    invoke-virtual {v2}, Lcom/flurry/sdk/nf;->a()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 63
    invoke-virtual {v2}, Lcom/flurry/sdk/nf;->a()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p3, p2}, Lcom/flurry/sdk/mn;->b(Ljava/lang/Class;Lcom/flurry/sdk/ir;Lcom/flurry/sdk/iv$a;)Lcom/flurry/sdk/mn;

    move-result-object v1

    move-object v0, p0

    move-object v3, p2

    move-object v4, p3

    .line 64
    invoke-virtual/range {v0 .. v5}, Lcom/flurry/sdk/nt;->a(Lcom/flurry/sdk/mn;Lcom/flurry/sdk/nf;Lcom/flurry/sdk/jo;Lcom/flurry/sdk/ir;Ljava/util/HashMap;)V

    goto :goto_0

    .line 70
    :cond_1
    invoke-virtual {p3, p1}, Lcom/flurry/sdk/ir;->a(Lcom/flurry/sdk/mm;)Ljava/util/List;

    move-result-object v0

    .line 71
    if-eqz v0, :cond_2

    .line 72
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flurry/sdk/nf;

    .line 73
    invoke-virtual {v2}, Lcom/flurry/sdk/nf;->a()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p3, p2}, Lcom/flurry/sdk/mn;->b(Ljava/lang/Class;Lcom/flurry/sdk/ir;Lcom/flurry/sdk/iv$a;)Lcom/flurry/sdk/mn;

    move-result-object v1

    move-object v0, p0

    move-object v3, p2

    move-object v4, p3

    .line 74
    invoke-virtual/range {v0 .. v5}, Lcom/flurry/sdk/nt;->a(Lcom/flurry/sdk/mn;Lcom/flurry/sdk/nf;Lcom/flurry/sdk/jo;Lcom/flurry/sdk/ir;Ljava/util/HashMap;)V

    goto :goto_1

    .line 77
    :cond_2
    new-instance v2, Lcom/flurry/sdk/nf;

    invoke-virtual {p1}, Lcom/flurry/sdk/mq;->d()Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {v2, v0, v1}, Lcom/flurry/sdk/nf;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 78
    invoke-virtual {p1}, Lcom/flurry/sdk/mq;->d()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p3, p2}, Lcom/flurry/sdk/mn;->b(Ljava/lang/Class;Lcom/flurry/sdk/ir;Lcom/flurry/sdk/iv$a;)Lcom/flurry/sdk/mn;

    move-result-object v1

    move-object v0, p0

    move-object v3, p2

    move-object v4, p3

    .line 81
    invoke-virtual/range {v0 .. v5}, Lcom/flurry/sdk/nt;->a(Lcom/flurry/sdk/mn;Lcom/flurry/sdk/nf;Lcom/flurry/sdk/jo;Lcom/flurry/sdk/ir;Ljava/util/HashMap;)V

    .line 82
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method protected a(Lcom/flurry/sdk/mn;Lcom/flurry/sdk/nf;Lcom/flurry/sdk/jo;Lcom/flurry/sdk/ir;Ljava/util/HashMap;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mn;",
            "Lcom/flurry/sdk/nf;",
            "Lcom/flurry/sdk/jo",
            "<*>;",
            "Lcom/flurry/sdk/ir;",
            "Ljava/util/HashMap",
            "<",
            "Lcom/flurry/sdk/nf;",
            "Lcom/flurry/sdk/nf;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 119
    invoke-virtual {p2}, Lcom/flurry/sdk/nf;->c()Z

    move-result v0

    if-nez v0, :cond_0

    .line 120
    invoke-virtual {p4, p1}, Lcom/flurry/sdk/ir;->g(Lcom/flurry/sdk/mn;)Ljava/lang/String;

    move-result-object v1

    .line 121
    if-eqz v1, :cond_0

    .line 122
    new-instance v0, Lcom/flurry/sdk/nf;

    invoke-virtual {p2}, Lcom/flurry/sdk/nf;->a()Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v0, v2, v1}, Lcom/flurry/sdk/nf;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    move-object p2, v0

    .line 127
    :cond_0
    invoke-virtual {p5, p2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 129
    invoke-virtual {p2}, Lcom/flurry/sdk/nf;->c()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 130
    invoke-virtual {p5, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/nf;

    .line 131
    invoke-virtual {v0}, Lcom/flurry/sdk/nf;->c()Z

    move-result v0

    if-nez v0, :cond_1

    .line 132
    invoke-virtual {p5, p2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    :cond_1
    return-void

    .line 138
    :cond_2
    invoke-virtual {p5, p2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    invoke-virtual {p4, p1}, Lcom/flurry/sdk/ir;->a(Lcom/flurry/sdk/mm;)Ljava/util/List;

    move-result-object v0

    .line 140
    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 141
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/nf;

    .line 142
    invoke-virtual {v0}, Lcom/flurry/sdk/nf;->a()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p4, p3}, Lcom/flurry/sdk/mn;->b(Ljava/lang/Class;Lcom/flurry/sdk/ir;Lcom/flurry/sdk/iv$a;)Lcom/flurry/sdk/mn;

    move-result-object v1

    .line 144
    invoke-virtual {v0}, Lcom/flurry/sdk/nf;->c()Z

    move-result v2

    if-nez v2, :cond_3

    .line 145
    new-instance v2, Lcom/flurry/sdk/nf;

    invoke-virtual {v0}, Lcom/flurry/sdk/nf;->a()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p4, v1}, Lcom/flurry/sdk/ir;->g(Lcom/flurry/sdk/mn;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v0, v3}, Lcom/flurry/sdk/nf;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    :goto_1
    move-object v0, p0

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 147
    invoke-virtual/range {v0 .. v5}, Lcom/flurry/sdk/nt;->a(Lcom/flurry/sdk/mn;Lcom/flurry/sdk/nf;Lcom/flurry/sdk/jo;Lcom/flurry/sdk/ir;Ljava/util/HashMap;)V

    goto :goto_0

    :cond_3
    move-object v2, v0

    goto :goto_1
.end method
