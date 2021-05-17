.class public Lcom/flurry/sdk/nc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected final a:Lcom/flurry/sdk/jo;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/jo",
            "<*>;"
        }
    .end annotation
.end field

.field protected final b:Z

.field protected final c:Lcom/flurry/sdk/rx;

.field protected final d:Lcom/flurry/sdk/mn;

.field protected final e:Lcom/flurry/sdk/ne;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/ne",
            "<*>;"
        }
    .end annotation
.end field

.field protected final f:Lcom/flurry/sdk/ir;

.field protected final g:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/flurry/sdk/nd;",
            ">;"
        }
    .end annotation
.end field

.field protected h:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/flurry/sdk/nd;",
            ">;"
        }
    .end annotation
.end field

.field protected i:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/flurry/sdk/mr;",
            ">;"
        }
    .end annotation
.end field

.field protected j:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/flurry/sdk/mr;",
            ">;"
        }
    .end annotation
.end field

.field protected k:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/flurry/sdk/mr;",
            ">;"
        }
    .end annotation
.end field

.field protected l:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected m:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected n:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/Object;",
            "Lcom/flurry/sdk/mq;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lcom/flurry/sdk/jo;ZLcom/flurry/sdk/rx;Lcom/flurry/sdk/mn;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/jo",
            "<*>;Z",
            "Lcom/flurry/sdk/rx;",
            "Lcom/flurry/sdk/mn;",
            ")V"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v1, p0, Lcom/flurry/sdk/nc;->g:Ljava/util/LinkedHashMap;

    .line 60
    iput-object v0, p0, Lcom/flurry/sdk/nc;->h:Ljava/util/LinkedList;

    .line 62
    iput-object v0, p0, Lcom/flurry/sdk/nc;->i:Ljava/util/LinkedList;

    .line 64
    iput-object v0, p0, Lcom/flurry/sdk/nc;->j:Ljava/util/LinkedList;

    .line 69
    iput-object v0, p0, Lcom/flurry/sdk/nc;->k:Ljava/util/LinkedList;

    .line 104
    iput-object p1, p0, Lcom/flurry/sdk/nc;->a:Lcom/flurry/sdk/jo;

    .line 105
    iput-boolean p2, p0, Lcom/flurry/sdk/nc;->b:Z

    .line 106
    iput-object p3, p0, Lcom/flurry/sdk/nc;->c:Lcom/flurry/sdk/rx;

    .line 107
    iput-object p4, p0, Lcom/flurry/sdk/nc;->d:Lcom/flurry/sdk/mn;

    .line 108
    invoke-virtual {p1}, Lcom/flurry/sdk/jo;->b()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/nc;->a:Lcom/flurry/sdk/jo;

    invoke-virtual {v0}, Lcom/flurry/sdk/jo;->a()Lcom/flurry/sdk/ir;

    move-result-object v0

    :cond_0
    iput-object v0, p0, Lcom/flurry/sdk/nc;->f:Lcom/flurry/sdk/ir;

    .line 110
    iget-object v0, p0, Lcom/flurry/sdk/nc;->f:Lcom/flurry/sdk/ir;

    if-nez v0, :cond_1

    .line 111
    iget-object v0, p0, Lcom/flurry/sdk/nc;->a:Lcom/flurry/sdk/jo;

    invoke-virtual {v0}, Lcom/flurry/sdk/jo;->e()Lcom/flurry/sdk/ne;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/nc;->e:Lcom/flurry/sdk/ne;

    .line 116
    :goto_0
    return-void

    .line 113
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/nc;->f:Lcom/flurry/sdk/ir;

    iget-object v1, p0, Lcom/flurry/sdk/nc;->a:Lcom/flurry/sdk/jo;

    invoke-virtual {v1}, Lcom/flurry/sdk/jo;->e()Lcom/flurry/sdk/ne;

    move-result-object v1

    invoke-virtual {v0, p4, v1}, Lcom/flurry/sdk/ir;->a(Lcom/flurry/sdk/mn;Lcom/flurry/sdk/ne;)Lcom/flurry/sdk/ne;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/nc;->e:Lcom/flurry/sdk/ne;

    goto :goto_0
.end method

.method private a(Ljava/util/Set;Ljava/lang/String;)Ljava/util/Set;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 707
    if-nez p1, :cond_0

    .line 708
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 710
    :cond_0
    invoke-interface {p1, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 711
    return-object p1
.end method

.method private a(Lcom/flurry/sdk/nd;)V
    .locals 2

    .prologue
    .line 590
    iget-boolean v0, p0, Lcom/flurry/sdk/nc;->b:Z

    if-eqz v0, :cond_1

    .line 603
    :cond_0
    :goto_0
    return-void

    .line 598
    :cond_1
    invoke-virtual {p1}, Lcom/flurry/sdk/nd;->a()Ljava/lang/String;

    move-result-object v0

    .line 599
    iget-object v1, p0, Lcom/flurry/sdk/nc;->l:Ljava/util/Set;

    invoke-direct {p0, v1, v0}, Lcom/flurry/sdk/nc;->a(Ljava/util/Set;Ljava/lang/String;)Ljava/util/Set;

    move-result-object v1

    iput-object v1, p0, Lcom/flurry/sdk/nc;->l:Ljava/util/Set;

    .line 600
    invoke-virtual {p1}, Lcom/flurry/sdk/nd;->t()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 601
    iget-object v1, p0, Lcom/flurry/sdk/nc;->m:Ljava/util/Set;

    invoke-direct {p0, v1, v0}, Lcom/flurry/sdk/nc;->a(Ljava/util/Set;Ljava/lang/String;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/nc;->m:Ljava/util/Set;

    goto :goto_0
.end method


# virtual methods
.method public a()Lcom/flurry/sdk/jo;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/flurry/sdk/jo",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 125
    iget-object v0, p0, Lcom/flurry/sdk/nc;->a:Lcom/flurry/sdk/jo;

    return-object v0
.end method

.method protected a(Lcom/flurry/sdk/jr;)V
    .locals 7

    .prologue
    .line 646
    iget-object v0, p0, Lcom/flurry/sdk/nc;->g:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/nc;->g:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->size()I

    move-result v1

    new-array v1, v1, [Lcom/flurry/sdk/nd;

    invoke-interface {v0, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flurry/sdk/nd;

    .line 647
    iget-object v1, p0, Lcom/flurry/sdk/nc;->g:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->clear()V

    .line 648
    array-length v5, v0

    const/4 v1, 0x0

    move v4, v1

    :goto_0
    if-ge v4, v5, :cond_7

    aget-object v3, v0, v4

    .line 649
    invoke-virtual {v3}, Lcom/flurry/sdk/nd;->a()Ljava/lang/String;

    move-result-object v1

    .line 650
    iget-boolean v2, p0, Lcom/flurry/sdk/nc;->b:Z

    if-eqz v2, :cond_2

    .line 651
    invoke-virtual {v3}, Lcom/flurry/sdk/nd;->b()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 652
    iget-object v2, p0, Lcom/flurry/sdk/nc;->a:Lcom/flurry/sdk/jo;

    invoke-virtual {v3}, Lcom/flurry/sdk/nd;->g()Lcom/flurry/sdk/mr;

    move-result-object v6

    invoke-virtual {p1, v2, v6, v1}, Lcom/flurry/sdk/jr;->a(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/mr;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    move-object v2, v1

    .line 670
    :goto_1
    invoke-virtual {v3}, Lcom/flurry/sdk/nd;->a()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 671
    invoke-virtual {v3, v2}, Lcom/flurry/sdk/nd;->a(Ljava/lang/String;)Lcom/flurry/sdk/nd;

    move-result-object v1

    move-object v3, v1

    .line 676
    :cond_0
    iget-object v1, p0, Lcom/flurry/sdk/nc;->g:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flurry/sdk/nd;

    .line 677
    if-nez v1, :cond_6

    .line 678
    iget-object v1, p0, Lcom/flurry/sdk/nc;->g:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, v2, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 648
    :goto_2
    add-int/lit8 v1, v4, 0x1

    move v4, v1

    goto :goto_0

    .line 653
    :cond_1
    invoke-virtual {v3}, Lcom/flurry/sdk/nd;->d()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 654
    iget-object v2, p0, Lcom/flurry/sdk/nc;->a:Lcom/flurry/sdk/jo;

    invoke-virtual {v3}, Lcom/flurry/sdk/nd;->i()Lcom/flurry/sdk/mp;

    move-result-object v6

    invoke-virtual {p1, v2, v6, v1}, Lcom/flurry/sdk/jr;->a(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/mp;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    move-object v2, v1

    goto :goto_1

    .line 657
    :cond_2
    invoke-virtual {v3}, Lcom/flurry/sdk/nd;->c()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 658
    iget-object v2, p0, Lcom/flurry/sdk/nc;->a:Lcom/flurry/sdk/jo;

    invoke-virtual {v3}, Lcom/flurry/sdk/nd;->h()Lcom/flurry/sdk/mr;

    move-result-object v6

    invoke-virtual {p1, v2, v6, v1}, Lcom/flurry/sdk/jr;->b(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/mr;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    move-object v2, v1

    goto :goto_1

    .line 659
    :cond_3
    invoke-virtual {v3}, Lcom/flurry/sdk/nd;->e()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 660
    iget-object v2, p0, Lcom/flurry/sdk/nc;->a:Lcom/flurry/sdk/jo;

    invoke-virtual {v3}, Lcom/flurry/sdk/nd;->m()Lcom/flurry/sdk/mt;

    move-result-object v6

    invoke-virtual {p1, v2, v6, v1}, Lcom/flurry/sdk/jr;->a(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/mt;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    move-object v2, v1

    goto :goto_1

    .line 661
    :cond_4
    invoke-virtual {v3}, Lcom/flurry/sdk/nd;->d()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 662
    iget-object v2, p0, Lcom/flurry/sdk/nc;->a:Lcom/flurry/sdk/jo;

    invoke-virtual {v3}, Lcom/flurry/sdk/nd;->i()Lcom/flurry/sdk/mp;

    move-result-object v6

    invoke-virtual {p1, v2, v6, v1}, Lcom/flurry/sdk/jr;->a(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/mp;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    move-object v2, v1

    goto :goto_1

    .line 663
    :cond_5
    invoke-virtual {v3}, Lcom/flurry/sdk/nd;->b()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 667
    iget-object v2, p0, Lcom/flurry/sdk/nc;->a:Lcom/flurry/sdk/jo;

    invoke-virtual {v3}, Lcom/flurry/sdk/nd;->g()Lcom/flurry/sdk/mr;

    move-result-object v6

    invoke-virtual {p1, v2, v6, v1}, Lcom/flurry/sdk/jr;->a(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/mr;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    move-object v2, v1

    goto :goto_1

    .line 680
    :cond_6
    invoke-virtual {v1, v3}, Lcom/flurry/sdk/nd;->b(Lcom/flurry/sdk/nd;)V

    goto :goto_2

    .line 683
    :cond_7
    return-void

    :cond_8
    move-object v2, v1

    goto/16 :goto_1
.end method

.method protected a(Ljava/lang/Object;Lcom/flurry/sdk/mq;)V
    .locals 4

    .prologue
    .line 535
    if-nez p1, :cond_1

    .line 547
    :cond_0
    return-void

    .line 538
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/nc;->n:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_2

    .line 539
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/nc;->n:Ljava/util/LinkedHashMap;

    .line 541
    :cond_2
    iget-object v0, p0, Lcom/flurry/sdk/nc;->n:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/mq;

    .line 542
    if-eqz v0, :cond_0

    .line 543
    if-nez p1, :cond_3

    const-string v0, "[null]"

    .line 544
    :goto_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Duplicate injectable value with id \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' (of type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 543
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method protected a(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 692
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Problem with definition of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/sdk/nc;->d:Lcom/flurry/sdk/mn;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected b(Ljava/lang/String;)Lcom/flurry/sdk/nd;
    .locals 2

    .prologue
    .line 697
    iget-object v0, p0, Lcom/flurry/sdk/nc;->g:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/nd;

    .line 698
    if-nez v0, :cond_0

    .line 699
    new-instance v0, Lcom/flurry/sdk/nd;

    invoke-direct {v0, p1}, Lcom/flurry/sdk/nd;-><init>(Ljava/lang/String;)V

    .line 700
    iget-object v1, p0, Lcom/flurry/sdk/nc;->g:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 702
    :cond_0
    return-object v0
.end method

.method public b()Lcom/flurry/sdk/rx;
    .locals 1

    .prologue
    .line 129
    iget-object v0, p0, Lcom/flurry/sdk/nc;->c:Lcom/flurry/sdk/rx;

    return-object v0
.end method

.method public c()Lcom/flurry/sdk/mn;
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lcom/flurry/sdk/nc;->d:Lcom/flurry/sdk/mn;

    return-object v0
.end method

.method public d()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/sdk/iu;",
            ">;"
        }
    .end annotation

    .prologue
    .line 142
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/flurry/sdk/nc;->g:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public e()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Lcom/flurry/sdk/mq;",
            ">;"
        }
    .end annotation

    .prologue
    .line 146
    iget-object v0, p0, Lcom/flurry/sdk/nc;->n:Ljava/util/LinkedHashMap;

    return-object v0
.end method

.method public f()Lcom/flurry/sdk/mr;
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 152
    iget-object v0, p0, Lcom/flurry/sdk/nc;->k:Ljava/util/LinkedList;

    if-eqz v0, :cond_1

    .line 153
    iget-object v0, p0, Lcom/flurry/sdk/nc;->k:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-le v0, v3, :cond_0

    .line 154
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Multiple value properties defined ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/nc;->k:Ljava/util/LinkedList;

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " vs "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/nc;->k:Ljava/util/LinkedList;

    invoke-virtual {v1, v3}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/nc;->a(Ljava/lang/String;)V

    .line 158
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/nc;->k:Ljava/util/LinkedList;

    invoke-virtual {v0, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/mr;

    .line 160
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public g()Lcom/flurry/sdk/mr;
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 165
    iget-object v0, p0, Lcom/flurry/sdk/nc;->i:Ljava/util/LinkedList;

    if-eqz v0, :cond_1

    .line 166
    iget-object v0, p0, Lcom/flurry/sdk/nc;->i:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-le v0, v3, :cond_0

    .line 167
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Multiple \'any-getters\' defined ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/nc;->i:Ljava/util/LinkedList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " vs "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/nc;->i:Ljava/util/LinkedList;

    invoke-virtual {v1, v3}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/nc;->a(Ljava/lang/String;)V

    .line 170
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/nc;->i:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/mr;

    .line 172
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public h()Lcom/flurry/sdk/mr;
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 177
    iget-object v0, p0, Lcom/flurry/sdk/nc;->j:Ljava/util/LinkedList;

    if-eqz v0, :cond_1

    .line 178
    iget-object v0, p0, Lcom/flurry/sdk/nc;->j:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-le v0, v3, :cond_0

    .line 179
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Multiple \'any-setters\' defined ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/nc;->j:Ljava/util/LinkedList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " vs "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/nc;->j:Ljava/util/LinkedList;

    invoke-virtual {v1, v3}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/nc;->a(Ljava/lang/String;)V

    .line 182
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/nc;->j:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/mr;

    .line 184
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public i()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 188
    iget-object v0, p0, Lcom/flurry/sdk/nc;->l:Ljava/util/Set;

    return-object v0
.end method

.method public j()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 195
    iget-object v0, p0, Lcom/flurry/sdk/nc;->m:Ljava/util/Set;

    return-object v0
.end method

.method public k()Lcom/flurry/sdk/nc;
    .locals 3

    .prologue
    .line 215
    iget-object v0, p0, Lcom/flurry/sdk/nc;->g:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    .line 218
    invoke-virtual {p0}, Lcom/flurry/sdk/nc;->m()V

    .line 219
    invoke-virtual {p0}, Lcom/flurry/sdk/nc;->o()V

    .line 220
    invoke-virtual {p0}, Lcom/flurry/sdk/nc;->n()V

    .line 221
    invoke-virtual {p0}, Lcom/flurry/sdk/nc;->p()V

    .line 224
    invoke-virtual {p0}, Lcom/flurry/sdk/nc;->q()V

    .line 227
    invoke-virtual {p0}, Lcom/flurry/sdk/nc;->r()V

    .line 229
    iget-object v0, p0, Lcom/flurry/sdk/nc;->a:Lcom/flurry/sdk/jo;

    invoke-virtual {v0}, Lcom/flurry/sdk/jo;->j()Lcom/flurry/sdk/jr;

    move-result-object v0

    .line 230
    if-eqz v0, :cond_0

    .line 231
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/nc;->a(Lcom/flurry/sdk/jr;)V

    .line 238
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/nc;->g:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/nd;

    .line 239
    invoke-virtual {v0}, Lcom/flurry/sdk/nd;->p()V

    goto :goto_0

    .line 243
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/nc;->g:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/nd;

    .line 244
    iget-boolean v2, p0, Lcom/flurry/sdk/nc;->b:Z

    invoke-virtual {v0, v2}, Lcom/flurry/sdk/nd;->a(Z)V

    goto :goto_1

    .line 248
    :cond_2
    invoke-virtual {p0}, Lcom/flurry/sdk/nc;->l()V

    .line 249
    return-object p0
.end method

.method protected l()V
    .locals 11

    .prologue
    .line 264
    iget-object v0, p0, Lcom/flurry/sdk/nc;->a:Lcom/flurry/sdk/jo;

    invoke-virtual {v0}, Lcom/flurry/sdk/jo;->a()Lcom/flurry/sdk/ir;

    move-result-object v1

    .line 266
    iget-object v0, p0, Lcom/flurry/sdk/nc;->d:Lcom/flurry/sdk/mn;

    invoke-virtual {v1, v0}, Lcom/flurry/sdk/ir;->i(Lcom/flurry/sdk/mn;)Ljava/lang/Boolean;

    move-result-object v0

    .line 268
    if-nez v0, :cond_0

    .line 269
    iget-object v0, p0, Lcom/flurry/sdk/nc;->a:Lcom/flurry/sdk/jo;

    invoke-virtual {v0}, Lcom/flurry/sdk/jo;->d()Z

    move-result v0

    .line 273
    :goto_0
    iget-object v2, p0, Lcom/flurry/sdk/nc;->d:Lcom/flurry/sdk/mn;

    invoke-virtual {v1, v2}, Lcom/flurry/sdk/ir;->h(Lcom/flurry/sdk/mn;)[Ljava/lang/String;

    move-result-object v5

    .line 276
    if-nez v0, :cond_1

    iget-object v1, p0, Lcom/flurry/sdk/nc;->h:Ljava/util/LinkedList;

    if-nez v1, :cond_1

    if-nez v5, :cond_1

    .line 322
    :goto_1
    return-void

    .line 271
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_0

    .line 279
    :cond_1
    iget-object v1, p0, Lcom/flurry/sdk/nc;->g:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->size()I

    move-result v1

    .line 282
    if-eqz v0, :cond_2

    .line 283
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    move-object v2, v0

    .line 288
    :goto_2
    iget-object v0, p0, Lcom/flurry/sdk/nc;->g:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/nd;

    .line 289
    invoke-virtual {v0}, Lcom/flurry/sdk/nd;->a()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 285
    :cond_2
    new-instance v0, Ljava/util/LinkedHashMap;

    add-int v2, v1, v1

    invoke-direct {v0, v2}, Ljava/util/LinkedHashMap;-><init>(I)V

    move-object v2, v0

    goto :goto_2

    .line 291
    :cond_3
    new-instance v6, Ljava/util/LinkedHashMap;

    add-int v0, v1, v1

    invoke-direct {v6, v0}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 293
    if-eqz v5, :cond_6

    .line 294
    array-length v7, v5

    const/4 v0, 0x0

    move v4, v0

    :goto_4
    if-ge v4, v7, :cond_6

    aget-object v3, v5, v4

    .line 295
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/nd;

    .line 296
    if-nez v0, :cond_8

    .line 297
    iget-object v1, p0, Lcom/flurry/sdk/nc;->g:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_4
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flurry/sdk/nd;

    .line 298
    invoke-virtual {v1}, Lcom/flurry/sdk/nd;->l()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 301
    invoke-virtual {v1}, Lcom/flurry/sdk/nd;->a()Ljava/lang/String;

    move-result-object v0

    move-object v10, v1

    move-object v1, v0

    move-object v0, v10

    .line 306
    :goto_5
    if-eqz v0, :cond_5

    .line 307
    invoke-interface {v6, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    :cond_5
    add-int/lit8 v0, v4, 0x1

    move v4, v0

    goto :goto_4

    .line 312
    :cond_6
    iget-object v0, p0, Lcom/flurry/sdk/nc;->h:Ljava/util/LinkedList;

    if-eqz v0, :cond_7

    .line 313
    iget-object v0, p0, Lcom/flurry/sdk/nc;->h:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/nd;

    .line 314
    invoke-virtual {v0}, Lcom/flurry/sdk/nd;->a()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v6, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_6

    .line 318
    :cond_7
    invoke-interface {v6, v2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 320
    iget-object v0, p0, Lcom/flurry/sdk/nc;->g:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    .line 321
    iget-object v0, p0, Lcom/flurry/sdk/nc;->g:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, v6}, Ljava/util/LinkedHashMap;->putAll(Ljava/util/Map;)V

    goto/16 :goto_1

    :cond_8
    move-object v1, v3

    goto :goto_5
.end method

.method protected m()V
    .locals 9

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 335
    iget-object v7, p0, Lcom/flurry/sdk/nc;->f:Lcom/flurry/sdk/ir;

    .line 337
    iget-object v0, p0, Lcom/flurry/sdk/nc;->d:Lcom/flurry/sdk/mn;

    invoke-virtual {v0}, Lcom/flurry/sdk/mn;->l()Ljava/lang/Iterable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/mp;

    .line 338
    invoke-virtual {v0}, Lcom/flurry/sdk/mp;->b()Ljava/lang/String;

    move-result-object v6

    .line 341
    if-nez v7, :cond_0

    .line 342
    const/4 v1, 0x0

    .line 353
    :goto_1
    const-string v4, ""

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    move-object v5, v6

    .line 357
    :goto_2
    if-eqz v5, :cond_2

    move v1, v2

    .line 358
    :goto_3
    if-nez v1, :cond_5

    .line 359
    iget-object v1, p0, Lcom/flurry/sdk/nc;->e:Lcom/flurry/sdk/ne;

    invoke-interface {v1, v0}, Lcom/flurry/sdk/ne;->a(Lcom/flurry/sdk/mp;)Z

    move-result v1

    move v4, v1

    .line 362
    :goto_4
    if-eqz v7, :cond_3

    invoke-virtual {v7, v0}, Lcom/flurry/sdk/ir;->c(Lcom/flurry/sdk/mq;)Z

    move-result v1

    if-eqz v1, :cond_3

    move v1, v2

    .line 363
    :goto_5
    invoke-virtual {p0, v6}, Lcom/flurry/sdk/nc;->b(Ljava/lang/String;)Lcom/flurry/sdk/nd;

    move-result-object v6

    invoke-virtual {v6, v0, v5, v4, v1}, Lcom/flurry/sdk/nd;->a(Lcom/flurry/sdk/mp;Ljava/lang/String;ZZ)V

    goto :goto_0

    .line 343
    :cond_0
    iget-boolean v1, p0, Lcom/flurry/sdk/nc;->b:Z

    if-eqz v1, :cond_1

    .line 349
    invoke-virtual {v7, v0}, Lcom/flurry/sdk/ir;->b(Lcom/flurry/sdk/mp;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 351
    :cond_1
    invoke-virtual {v7, v0}, Lcom/flurry/sdk/ir;->c(Lcom/flurry/sdk/mp;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_2
    move v1, v3

    .line 357
    goto :goto_3

    :cond_3
    move v1, v3

    .line 362
    goto :goto_5

    .line 365
    :cond_4
    return-void

    :cond_5
    move v4, v1

    goto :goto_4

    :cond_6
    move-object v5, v1

    goto :goto_2
.end method

.method protected n()V
    .locals 10

    .prologue
    const/4 v9, 0x1

    const/4 v2, 0x0

    .line 372
    iget-object v3, p0, Lcom/flurry/sdk/nc;->f:Lcom/flurry/sdk/ir;

    .line 374
    if-nez v3, :cond_1

    .line 409
    :cond_0
    return-void

    .line 377
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/nc;->d:Lcom/flurry/sdk/mn;

    invoke-virtual {v0}, Lcom/flurry/sdk/mn;->i()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/mo;

    .line 378
    iget-object v1, p0, Lcom/flurry/sdk/nc;->h:Ljava/util/LinkedList;

    if-nez v1, :cond_3

    .line 379
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lcom/flurry/sdk/nc;->h:Ljava/util/LinkedList;

    .line 381
    :cond_3
    invoke-virtual {v0}, Lcom/flurry/sdk/mo;->f()I

    move-result v5

    move v1, v2

    :goto_0
    if-ge v1, v5, :cond_2

    .line 382
    invoke-virtual {v0, v1}, Lcom/flurry/sdk/mo;->c(I)Lcom/flurry/sdk/mt;

    move-result-object v6

    .line 383
    invoke-virtual {v3, v6}, Lcom/flurry/sdk/ir;->a(Lcom/flurry/sdk/mt;)Ljava/lang/String;

    move-result-object v7

    .line 385
    if-eqz v7, :cond_4

    .line 387
    invoke-virtual {p0, v7}, Lcom/flurry/sdk/nc;->b(Ljava/lang/String;)Lcom/flurry/sdk/nd;

    move-result-object v8

    .line 388
    invoke-virtual {v8, v6, v7, v9, v2}, Lcom/flurry/sdk/nd;->a(Lcom/flurry/sdk/mt;Ljava/lang/String;ZZ)V

    .line 389
    iget-object v6, p0, Lcom/flurry/sdk/nc;->h:Ljava/util/LinkedList;

    invoke-virtual {v6, v8}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 381
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 393
    :cond_5
    iget-object v0, p0, Lcom/flurry/sdk/nc;->d:Lcom/flurry/sdk/mn;

    invoke-virtual {v0}, Lcom/flurry/sdk/mn;->j()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_6
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/mr;

    .line 394
    iget-object v1, p0, Lcom/flurry/sdk/nc;->h:Ljava/util/LinkedList;

    if-nez v1, :cond_7

    .line 395
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lcom/flurry/sdk/nc;->h:Ljava/util/LinkedList;

    .line 397
    :cond_7
    invoke-virtual {v0}, Lcom/flurry/sdk/mr;->f()I

    move-result v5

    move v1, v2

    :goto_1
    if-ge v1, v5, :cond_6

    .line 398
    invoke-virtual {v0, v1}, Lcom/flurry/sdk/mr;->c(I)Lcom/flurry/sdk/mt;

    move-result-object v6

    .line 399
    invoke-virtual {v3, v6}, Lcom/flurry/sdk/ir;->a(Lcom/flurry/sdk/mt;)Ljava/lang/String;

    move-result-object v7

    .line 401
    if-eqz v7, :cond_8

    .line 403
    invoke-virtual {p0, v7}, Lcom/flurry/sdk/nc;->b(Ljava/lang/String;)Lcom/flurry/sdk/nd;

    move-result-object v8

    .line 404
    invoke-virtual {v8, v6, v7, v9, v2}, Lcom/flurry/sdk/nd;->a(Lcom/flurry/sdk/mt;Ljava/lang/String;ZZ)V

    .line 405
    iget-object v6, p0, Lcom/flurry/sdk/nc;->h:Ljava/util/LinkedList;

    invoke-virtual {v6, v8}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 397
    :cond_8
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method protected o()V
    .locals 10

    .prologue
    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 416
    iget-object v8, p0, Lcom/flurry/sdk/nc;->f:Lcom/flurry/sdk/ir;

    .line 418
    iget-object v0, p0, Lcom/flurry/sdk/nc;->d:Lcom/flurry/sdk/mn;

    invoke-virtual {v0}, Lcom/flurry/sdk/mn;->k()Ljava/lang/Iterable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_0
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_13

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/mr;

    .line 427
    invoke-virtual {v0}, Lcom/flurry/sdk/mr;->f()I

    move-result v1

    .line 430
    if-nez v1, :cond_b

    .line 432
    if-eqz v8, :cond_4

    .line 433
    invoke-virtual {v8, v0}, Lcom/flurry/sdk/ir;->f(Lcom/flurry/sdk/mr;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 434
    iget-object v1, p0, Lcom/flurry/sdk/nc;->i:Ljava/util/LinkedList;

    if-nez v1, :cond_1

    .line 435
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lcom/flurry/sdk/nc;->i:Ljava/util/LinkedList;

    .line 437
    :cond_1
    iget-object v1, p0, Lcom/flurry/sdk/nc;->i:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 441
    :cond_2
    invoke-virtual {v8, v0}, Lcom/flurry/sdk/ir;->c(Lcom/flurry/sdk/mr;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 442
    iget-object v1, p0, Lcom/flurry/sdk/nc;->k:Ljava/util/LinkedList;

    if-nez v1, :cond_3

    .line 443
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lcom/flurry/sdk/nc;->k:Ljava/util/LinkedList;

    .line 445
    :cond_3
    iget-object v1, p0, Lcom/flurry/sdk/nc;->k:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 450
    :cond_4
    if-nez v8, :cond_5

    move-object v2, v7

    .line 451
    :goto_1
    if-nez v2, :cond_7

    .line 452
    invoke-virtual {v0}, Lcom/flurry/sdk/mr;->b()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/sdk/qr;->a(Lcom/flurry/sdk/mr;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 453
    if-nez v5, :cond_6

    .line 454
    invoke-virtual {v0}, Lcom/flurry/sdk/mr;->b()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/sdk/qr;->b(Lcom/flurry/sdk/mr;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 455
    if-eqz v5, :cond_0

    .line 458
    iget-object v1, p0, Lcom/flurry/sdk/nc;->e:Lcom/flurry/sdk/ne;

    invoke-interface {v1, v0}, Lcom/flurry/sdk/ne;->b(Lcom/flurry/sdk/mr;)Z

    move-result v1

    move-object v6, v2

    move v2, v1

    .line 474
    :goto_2
    if-nez v8, :cond_a

    move v1, v3

    .line 475
    :goto_3
    invoke-virtual {p0, v5}, Lcom/flurry/sdk/nc;->b(Ljava/lang/String;)Lcom/flurry/sdk/nd;

    move-result-object v5

    invoke-virtual {v5, v0, v6, v2, v1}, Lcom/flurry/sdk/nd;->a(Lcom/flurry/sdk/mr;Ljava/lang/String;ZZ)V

    goto :goto_0

    .line 450
    :cond_5
    invoke-virtual {v8, v0}, Lcom/flurry/sdk/ir;->b(Lcom/flurry/sdk/mr;)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 460
    :cond_6
    iget-object v1, p0, Lcom/flurry/sdk/nc;->e:Lcom/flurry/sdk/ne;

    invoke-interface {v1, v0}, Lcom/flurry/sdk/ne;->a(Lcom/flurry/sdk/mr;)Z

    move-result v1

    move-object v6, v2

    move v2, v1

    goto :goto_2

    .line 464
    :cond_7
    invoke-static {v0}, Lcom/flurry/sdk/qr;->a(Lcom/flurry/sdk/mr;)Ljava/lang/String;

    move-result-object v1

    .line 466
    if-nez v1, :cond_8

    .line 467
    invoke-virtual {v0}, Lcom/flurry/sdk/mr;->b()Ljava/lang/String;

    move-result-object v1

    .line 469
    :cond_8
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_9

    move-object v2, v1

    :cond_9
    move-object v5, v1

    move-object v6, v2

    move v2, v4

    .line 472
    goto :goto_2

    .line 474
    :cond_a
    invoke-virtual {v8, v0}, Lcom/flurry/sdk/ir;->c(Lcom/flurry/sdk/mq;)Z

    move-result v1

    goto :goto_3

    .line 476
    :cond_b
    if-ne v1, v4, :cond_11

    .line 477
    if-nez v8, :cond_c

    move-object v2, v7

    .line 478
    :goto_4
    if-nez v2, :cond_d

    .line 479
    invoke-static {v0}, Lcom/flurry/sdk/qr;->b(Lcom/flurry/sdk/mr;)Ljava/lang/String;

    move-result-object v5

    .line 480
    if-eqz v5, :cond_0

    .line 483
    iget-object v1, p0, Lcom/flurry/sdk/nc;->e:Lcom/flurry/sdk/ne;

    invoke-interface {v1, v0}, Lcom/flurry/sdk/ne;->c(Lcom/flurry/sdk/mr;)Z

    move-result v1

    move-object v6, v2

    move v2, v1

    .line 496
    :goto_5
    if-nez v8, :cond_10

    move v1, v3

    .line 497
    :goto_6
    invoke-virtual {p0, v5}, Lcom/flurry/sdk/nc;->b(Ljava/lang/String;)Lcom/flurry/sdk/nd;

    move-result-object v5

    invoke-virtual {v5, v0, v6, v2, v1}, Lcom/flurry/sdk/nd;->b(Lcom/flurry/sdk/mr;Ljava/lang/String;ZZ)V

    goto/16 :goto_0

    .line 477
    :cond_c
    invoke-virtual {v8, v0}, Lcom/flurry/sdk/ir;->d(Lcom/flurry/sdk/mr;)Ljava/lang/String;

    move-result-object v2

    goto :goto_4

    .line 486
    :cond_d
    invoke-static {v0}, Lcom/flurry/sdk/qr;->b(Lcom/flurry/sdk/mr;)Ljava/lang/String;

    move-result-object v1

    .line 488
    if-nez v1, :cond_e

    .line 489
    invoke-virtual {v0}, Lcom/flurry/sdk/mr;->b()Ljava/lang/String;

    move-result-object v1

    .line 491
    :cond_e
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_f

    move-object v2, v1

    :cond_f
    move-object v5, v1

    move-object v6, v2

    move v2, v4

    .line 494
    goto :goto_5

    .line 496
    :cond_10
    invoke-virtual {v8, v0}, Lcom/flurry/sdk/ir;->c(Lcom/flurry/sdk/mq;)Z

    move-result v1

    goto :goto_6

    .line 499
    :cond_11
    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    .line 500
    if-eqz v8, :cond_0

    invoke-virtual {v8, v0}, Lcom/flurry/sdk/ir;->e(Lcom/flurry/sdk/mr;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 501
    iget-object v1, p0, Lcom/flurry/sdk/nc;->j:Ljava/util/LinkedList;

    if-nez v1, :cond_12

    .line 502
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lcom/flurry/sdk/nc;->j:Ljava/util/LinkedList;

    .line 504
    :cond_12
    iget-object v1, p0, Lcom/flurry/sdk/nc;->j:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 508
    :cond_13
    return-void
.end method

.method protected p()V
    .locals 5

    .prologue
    .line 512
    iget-object v1, p0, Lcom/flurry/sdk/nc;->f:Lcom/flurry/sdk/ir;

    .line 513
    if-nez v1, :cond_1

    .line 531
    :cond_0
    return-void

    .line 518
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/nc;->d:Lcom/flurry/sdk/mn;

    invoke-virtual {v0}, Lcom/flurry/sdk/mn;->l()Ljava/lang/Iterable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/mp;

    .line 519
    invoke-virtual {v1, v0}, Lcom/flurry/sdk/ir;->d(Lcom/flurry/sdk/mq;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v3, v0}, Lcom/flurry/sdk/nc;->a(Ljava/lang/Object;Lcom/flurry/sdk/mq;)V

    goto :goto_0

    .line 522
    :cond_2
    iget-object v0, p0, Lcom/flurry/sdk/nc;->d:Lcom/flurry/sdk/mn;

    invoke-virtual {v0}, Lcom/flurry/sdk/mn;->k()Ljava/lang/Iterable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_3
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/mr;

    .line 526
    invoke-virtual {v0}, Lcom/flurry/sdk/mr;->f()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_3

    .line 529
    invoke-virtual {v1, v0}, Lcom/flurry/sdk/ir;->d(Lcom/flurry/sdk/mq;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v3, v0}, Lcom/flurry/sdk/nc;->a(Ljava/lang/Object;Lcom/flurry/sdk/mq;)V

    goto :goto_1
.end method

.method protected q()V
    .locals 3

    .prologue
    .line 561
    iget-object v0, p0, Lcom/flurry/sdk/nc;->g:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 562
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 563
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 564
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/nd;

    .line 567
    invoke-virtual {v0}, Lcom/flurry/sdk/nd;->r()Z

    move-result v2

    if-nez v2, :cond_0

    .line 568
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 572
    :cond_0
    invoke-virtual {v0}, Lcom/flurry/sdk/nd;->s()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 573
    invoke-direct {p0, v0}, Lcom/flurry/sdk/nc;->a(Lcom/flurry/sdk/nd;)V

    .line 575
    invoke-virtual {v0}, Lcom/flurry/sdk/nd;->q()Z

    move-result v2

    if-nez v2, :cond_1

    .line 576
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 580
    :cond_1
    invoke-virtual {v0}, Lcom/flurry/sdk/nd;->n()V

    .line 583
    :cond_2
    invoke-virtual {v0}, Lcom/flurry/sdk/nd;->o()V

    goto :goto_0

    .line 585
    :cond_3
    return-void
.end method

.method protected r()V
    .locals 4

    .prologue
    .line 614
    iget-object v0, p0, Lcom/flurry/sdk/nc;->g:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 615
    const/4 v1, 0x0

    .line 616
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 617
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 618
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/nd;

    .line 619
    invoke-virtual {v0}, Lcom/flurry/sdk/nd;->u()Ljava/lang/String;

    move-result-object v3

    .line 620
    if-eqz v3, :cond_0

    .line 621
    if-nez v1, :cond_1

    .line 622
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 624
    :cond_1
    invoke-virtual {v0, v3}, Lcom/flurry/sdk/nd;->a(Ljava/lang/String;)Lcom/flurry/sdk/nd;

    move-result-object v0

    .line 625
    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 626
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 631
    :cond_2
    if-eqz v1, :cond_4

    .line 632
    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/nd;

    .line 633
    invoke-virtual {v0}, Lcom/flurry/sdk/nd;->a()Ljava/lang/String;

    move-result-object v3

    .line 634
    iget-object v1, p0, Lcom/flurry/sdk/nc;->g:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flurry/sdk/nd;

    .line 635
    if-nez v1, :cond_3

    .line 636
    iget-object v1, p0, Lcom/flurry/sdk/nc;->g:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, v3, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 638
    :cond_3
    invoke-virtual {v1, v0}, Lcom/flurry/sdk/nd;->b(Lcom/flurry/sdk/nd;)V

    goto :goto_1

    .line 642
    :cond_4
    return-void
.end method
