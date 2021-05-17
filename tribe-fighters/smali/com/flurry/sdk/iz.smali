.class public Lcom/flurry/sdk/iz;
.super Lcom/flurry/sdk/jo$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/iz$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/jo$c",
        "<",
        "Lcom/flurry/sdk/iz$a;",
        "Lcom/flurry/sdk/iz;",
        ">;"
    }
.end annotation


# instance fields
.field protected a:Lcom/flurry/sdk/qx;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/qx",
            "<",
            "Lcom/flurry/sdk/jb;",
            ">;"
        }
    .end annotation
.end field

.field protected final b:Lcom/flurry/sdk/rm;

.field protected c:Z


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/iv;Lcom/flurry/sdk/ir;Lcom/flurry/sdk/ne;Lcom/flurry/sdk/ng;Lcom/flurry/sdk/jr;Lcom/flurry/sdk/qm;Lcom/flurry/sdk/jf;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/iv",
            "<+",
            "Lcom/flurry/sdk/is;",
            ">;",
            "Lcom/flurry/sdk/ir;",
            "Lcom/flurry/sdk/ne",
            "<*>;",
            "Lcom/flurry/sdk/ng;",
            "Lcom/flurry/sdk/jr;",
            "Lcom/flurry/sdk/qm;",
            "Lcom/flurry/sdk/jf;",
            ")V"
        }
    .end annotation

    .prologue
    .line 406
    const-class v0, Lcom/flurry/sdk/iz$a;

    invoke-static {v0}, Lcom/flurry/sdk/iz;->d(Ljava/lang/Class;)I

    move-result v8

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    move-object/from16 v7, p7

    invoke-direct/range {v0 .. v8}, Lcom/flurry/sdk/jo$c;-><init>(Lcom/flurry/sdk/iv;Lcom/flurry/sdk/ir;Lcom/flurry/sdk/ne;Lcom/flurry/sdk/ng;Lcom/flurry/sdk/jr;Lcom/flurry/sdk/qm;Lcom/flurry/sdk/jf;I)V

    .line 408
    sget-object v0, Lcom/flurry/sdk/rm;->a:Lcom/flurry/sdk/rm;

    iput-object v0, p0, Lcom/flurry/sdk/iz;->b:Lcom/flurry/sdk/rm;

    .line 409
    return-void
.end method

.method protected constructor <init>(Lcom/flurry/sdk/iz;Lcom/flurry/sdk/jo$a;)V
    .locals 1

    .prologue
    .line 437
    iget-object v0, p1, Lcom/flurry/sdk/iz;->h:Lcom/flurry/sdk/ng;

    invoke-direct {p0, p1, p2, v0}, Lcom/flurry/sdk/jo$c;-><init>(Lcom/flurry/sdk/jo$c;Lcom/flurry/sdk/jo$a;Lcom/flurry/sdk/ng;)V

    .line 438
    iget-object v0, p1, Lcom/flurry/sdk/iz;->a:Lcom/flurry/sdk/qx;

    iput-object v0, p0, Lcom/flurry/sdk/iz;->a:Lcom/flurry/sdk/qx;

    .line 439
    iget-object v0, p1, Lcom/flurry/sdk/iz;->b:Lcom/flurry/sdk/rm;

    iput-object v0, p0, Lcom/flurry/sdk/iz;->b:Lcom/flurry/sdk/rm;

    .line 440
    iget-boolean v0, p1, Lcom/flurry/sdk/iz;->c:Z

    iput-boolean v0, p0, Lcom/flurry/sdk/iz;->c:Z

    .line 441
    return-void
.end method

.method private constructor <init>(Lcom/flurry/sdk/iz;Ljava/util/HashMap;Lcom/flurry/sdk/ng;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/iz;",
            "Ljava/util/HashMap",
            "<",
            "Lcom/flurry/sdk/qd;",
            "Ljava/lang/Class",
            "<*>;>;",
            "Lcom/flurry/sdk/ng;",
            ")V"
        }
    .end annotation

    .prologue
    .line 427
    iget-object v0, p1, Lcom/flurry/sdk/iz;->e:Lcom/flurry/sdk/jo$a;

    invoke-direct {p0, p1, v0}, Lcom/flurry/sdk/iz;-><init>(Lcom/flurry/sdk/iz;Lcom/flurry/sdk/jo$a;)V

    .line 428
    iput-object p2, p0, Lcom/flurry/sdk/iz;->f:Ljava/util/HashMap;

    .line 429
    iput-object p3, p0, Lcom/flurry/sdk/iz;->h:Lcom/flurry/sdk/ng;

    .line 430
    return-void
.end method


# virtual methods
.method public a()Lcom/flurry/sdk/ir;
    .locals 1

    .prologue
    .line 671
    sget-object v0, Lcom/flurry/sdk/iz$a;->a:Lcom/flurry/sdk/iz$a;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/iz;->a(Lcom/flurry/sdk/iz$a;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 672
    invoke-super {p0}, Lcom/flurry/sdk/jo$c;->a()Lcom/flurry/sdk/ir;

    move-result-object v0

    .line 674
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/flurry/sdk/nb;->a:Lcom/flurry/sdk/nb;

    goto :goto_0
.end method

.method public a(Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/is;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/flurry/sdk/is;",
            ">(",
            "Lcom/flurry/sdk/rx;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 686
    invoke-virtual {p0}, Lcom/flurry/sdk/iz;->i()Lcom/flurry/sdk/iv;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p0}, Lcom/flurry/sdk/iv;->a(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/iv$a;)Lcom/flurry/sdk/is;

    move-result-object v0

    return-object v0
.end method

.method protected a(I)Lcom/flurry/sdk/iz;
    .locals 1

    .prologue
    .line 474
    sget-object v0, Lcom/flurry/sdk/ju$a;->l:Lcom/flurry/sdk/ju$a;

    invoke-virtual {v0}, Lcom/flurry/sdk/ju$a;->b()I

    move-result v0

    and-int/2addr v0, p1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/flurry/sdk/iz;->c:Z

    .line 476
    return-object p0

    .line 474
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public a(Lcom/flurry/sdk/ng;)Lcom/flurry/sdk/iz;
    .locals 2

    .prologue
    .line 655
    iget-object v0, p0, Lcom/flurry/sdk/iz;->f:Ljava/util/HashMap;

    .line 657
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/flurry/sdk/iz;->g:Z

    .line 658
    new-instance v1, Lcom/flurry/sdk/iz;

    invoke-direct {v1, p0, v0, p1}, Lcom/flurry/sdk/iz;-><init>(Lcom/flurry/sdk/iz;Ljava/util/HashMap;Lcom/flurry/sdk/ng;)V

    return-object v1
.end method

.method public a(Lcom/flurry/sdk/mm;Ljava/lang/Class;)Lcom/flurry/sdk/jh;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mm;",
            "Ljava/lang/Class",
            "<+",
            "Lcom/flurry/sdk/jh",
            "<*>;>;)",
            "Lcom/flurry/sdk/jh",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 890
    invoke-virtual {p0}, Lcom/flurry/sdk/iz;->k()Lcom/flurry/sdk/jf;

    move-result-object v0

    .line 891
    if-eqz v0, :cond_0

    .line 892
    invoke-virtual {v0, p0, p1, p2}, Lcom/flurry/sdk/jf;->a(Lcom/flurry/sdk/iz;Lcom/flurry/sdk/mm;Ljava/lang/Class;)Lcom/flurry/sdk/jh;

    move-result-object v0

    .line 893
    if-eqz v0, :cond_0

    .line 897
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/flurry/sdk/iz;->c()Z

    move-result v0

    invoke-static {p2, v0}, Lcom/flurry/sdk/qs;->b(Ljava/lang/Class;Z)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/jh;

    goto :goto_0
.end method

.method public a(Lcom/flurry/sdk/iz$a;)Z
    .locals 2

    .prologue
    .line 755
    iget v0, p0, Lcom/flurry/sdk/iz;->i:I

    invoke-virtual {p1}, Lcom/flurry/sdk/iz$a;->b()I

    move-result v1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public b(Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/is;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/flurry/sdk/is;",
            ">(",
            "Lcom/flurry/sdk/rx;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 868
    invoke-virtual {p0}, Lcom/flurry/sdk/iz;->i()Lcom/flurry/sdk/iv;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p0}, Lcom/flurry/sdk/iv;->a(Lcom/flurry/sdk/iz;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/iv$a;)Lcom/flurry/sdk/is;

    move-result-object v0

    return-object v0
.end method

.method public b(Lcom/flurry/sdk/mm;Ljava/lang/Class;)Lcom/flurry/sdk/jm;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mm;",
            "Ljava/lang/Class",
            "<+",
            "Lcom/flurry/sdk/jm;",
            ">;)",
            "Lcom/flurry/sdk/jm;"
        }
    .end annotation

    .prologue
    .line 903
    invoke-virtual {p0}, Lcom/flurry/sdk/iz;->k()Lcom/flurry/sdk/jf;

    move-result-object v0

    .line 904
    if-eqz v0, :cond_0

    .line 905
    invoke-virtual {v0, p0, p1, p2}, Lcom/flurry/sdk/jf;->b(Lcom/flurry/sdk/iz;Lcom/flurry/sdk/mm;Ljava/lang/Class;)Lcom/flurry/sdk/jm;

    move-result-object v0

    .line 906
    if-eqz v0, :cond_0

    .line 910
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/flurry/sdk/iz;->c()Z

    move-result v0

    invoke-static {p2, v0}, Lcom/flurry/sdk/qs;->b(Ljava/lang/Class;Z)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/jm;

    goto :goto_0
.end method

.method public b()Z
    .locals 1

    .prologue
    .line 704
    sget-object v0, Lcom/flurry/sdk/iz$a;->a:Lcom/flurry/sdk/iz$a;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/iz;->a(Lcom/flurry/sdk/iz$a;)Z

    move-result v0

    return v0
.end method

.method public c(Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/is;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/flurry/sdk/is;",
            ">(",
            "Lcom/flurry/sdk/rx;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 877
    invoke-virtual {p0}, Lcom/flurry/sdk/iz;->i()Lcom/flurry/sdk/iv;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p0}, Lcom/flurry/sdk/iv;->b(Lcom/flurry/sdk/iz;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/iv$a;)Lcom/flurry/sdk/is;

    move-result-object v0

    return-object v0
.end method

.method public c(Lcom/flurry/sdk/mm;Ljava/lang/Class;)Lcom/flurry/sdk/kx;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mm;",
            "Ljava/lang/Class",
            "<+",
            "Lcom/flurry/sdk/kx;",
            ">;)",
            "Lcom/flurry/sdk/kx;"
        }
    .end annotation

    .prologue
    .line 916
    invoke-virtual {p0}, Lcom/flurry/sdk/iz;->k()Lcom/flurry/sdk/jf;

    move-result-object v0

    .line 917
    if-eqz v0, :cond_0

    .line 918
    invoke-virtual {v0, p0, p1, p2}, Lcom/flurry/sdk/jf;->c(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/mm;Ljava/lang/Class;)Lcom/flurry/sdk/kx;

    move-result-object v0

    .line 919
    if-eqz v0, :cond_0

    .line 923
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/flurry/sdk/iz;->c()Z

    move-result v0

    invoke-static {p2, v0}, Lcom/flurry/sdk/qs;->b(Ljava/lang/Class;Z)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/kx;

    goto :goto_0
.end method

.method public c()Z
    .locals 1

    .prologue
    .line 709
    sget-object v0, Lcom/flurry/sdk/iz$a;->f:Lcom/flurry/sdk/iz$a;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/iz;->a(Lcom/flurry/sdk/iz$a;)Z

    move-result v0

    return v0
.end method

.method public d()Z
    .locals 1

    .prologue
    .line 714
    iget-boolean v0, p0, Lcom/flurry/sdk/iz;->c:Z

    return v0
.end method

.method public e()Lcom/flurry/sdk/ne;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/flurry/sdk/ne",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 720
    invoke-super {p0}, Lcom/flurry/sdk/jo$c;->e()Lcom/flurry/sdk/ne;

    move-result-object v0

    .line 721
    sget-object v1, Lcom/flurry/sdk/iz$a;->b:Lcom/flurry/sdk/iz$a;

    invoke-virtual {p0, v1}, Lcom/flurry/sdk/iz;->a(Lcom/flurry/sdk/iz$a;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 722
    sget-object v1, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->NONE:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    invoke-interface {v0, v1}, Lcom/flurry/sdk/ne;->c(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne;

    move-result-object v0

    .line 724
    :cond_0
    sget-object v1, Lcom/flurry/sdk/iz$a;->c:Lcom/flurry/sdk/iz$a;

    invoke-virtual {p0, v1}, Lcom/flurry/sdk/iz;->a(Lcom/flurry/sdk/iz$a;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 725
    sget-object v1, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->NONE:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    invoke-interface {v0, v1}, Lcom/flurry/sdk/ne;->d(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne;

    move-result-object v0

    .line 727
    :cond_1
    sget-object v1, Lcom/flurry/sdk/iz$a;->d:Lcom/flurry/sdk/iz$a;

    invoke-virtual {p0, v1}, Lcom/flurry/sdk/iz;->a(Lcom/flurry/sdk/iz$a;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 728
    sget-object v1, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->NONE:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    invoke-interface {v0, v1}, Lcom/flurry/sdk/ne;->e(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne;

    move-result-object v0

    .line 730
    :cond_2
    return-object v0
.end method

.method public f()Lcom/flurry/sdk/qx;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/flurry/sdk/qx",
            "<",
            "Lcom/flurry/sdk/jb;",
            ">;"
        }
    .end annotation

    .prologue
    .line 803
    iget-object v0, p0, Lcom/flurry/sdk/iz;->a:Lcom/flurry/sdk/qx;

    return-object v0
.end method

.method public g()Lcom/flurry/sdk/hl;
    .locals 1

    .prologue
    .line 844
    invoke-static {}, Lcom/flurry/sdk/hm;->a()Lcom/flurry/sdk/hl;

    move-result-object v0

    return-object v0
.end method

.method public final h()Lcom/flurry/sdk/rm;
    .locals 1

    .prologue
    .line 851
    iget-object v0, p0, Lcom/flurry/sdk/iz;->b:Lcom/flurry/sdk/rm;

    return-object v0
.end method
