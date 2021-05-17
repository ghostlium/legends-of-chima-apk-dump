.class public Lcom/flurry/sdk/ju;
.super Lcom/flurry/sdk/jo$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/ju$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/jo$c",
        "<",
        "Lcom/flurry/sdk/ju$a;",
        "Lcom/flurry/sdk/ju;",
        ">;"
    }
.end annotation


# instance fields
.field protected a:Lcom/flurry/sdk/kg$a;

.field protected b:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field protected c:Lcom/flurry/sdk/oh;


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
    .line 490
    const-class v0, Lcom/flurry/sdk/ju$a;

    invoke-static {v0}, Lcom/flurry/sdk/ju;->d(Ljava/lang/Class;)I

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

    .line 459
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/ju;->a:Lcom/flurry/sdk/kg$a;

    .line 492
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/ju;->c:Lcom/flurry/sdk/oh;

    .line 493
    return-void
.end method

.method protected constructor <init>(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/jo$a;)V
    .locals 1

    .prologue
    .line 520
    iget-object v0, p1, Lcom/flurry/sdk/ju;->h:Lcom/flurry/sdk/ng;

    invoke-direct {p0, p1, p2, v0}, Lcom/flurry/sdk/jo$c;-><init>(Lcom/flurry/sdk/jo$c;Lcom/flurry/sdk/jo$a;Lcom/flurry/sdk/ng;)V

    .line 459
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/ju;->a:Lcom/flurry/sdk/kg$a;

    .line 521
    iget-object v0, p1, Lcom/flurry/sdk/ju;->a:Lcom/flurry/sdk/kg$a;

    iput-object v0, p0, Lcom/flurry/sdk/ju;->a:Lcom/flurry/sdk/kg$a;

    .line 522
    iget-object v0, p1, Lcom/flurry/sdk/ju;->b:Ljava/lang/Class;

    iput-object v0, p0, Lcom/flurry/sdk/ju;->b:Ljava/lang/Class;

    .line 523
    iget-object v0, p1, Lcom/flurry/sdk/ju;->c:Lcom/flurry/sdk/oh;

    iput-object v0, p0, Lcom/flurry/sdk/ju;->c:Lcom/flurry/sdk/oh;

    .line 524
    return-void
.end method

.method protected constructor <init>(Lcom/flurry/sdk/ju;Ljava/util/HashMap;Lcom/flurry/sdk/ng;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ju;",
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
    .line 510
    iget-object v0, p1, Lcom/flurry/sdk/ju;->e:Lcom/flurry/sdk/jo$a;

    invoke-direct {p0, p1, v0}, Lcom/flurry/sdk/ju;-><init>(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/jo$a;)V

    .line 511
    iput-object p2, p0, Lcom/flurry/sdk/ju;->f:Ljava/util/HashMap;

    .line 512
    iput-object p3, p0, Lcom/flurry/sdk/ju;->h:Lcom/flurry/sdk/ng;

    .line 513
    return-void
.end method


# virtual methods
.method public a()Lcom/flurry/sdk/ir;
    .locals 1

    .prologue
    .line 785
    sget-object v0, Lcom/flurry/sdk/ju$a;->a:Lcom/flurry/sdk/ju$a;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/ju;->a(Lcom/flurry/sdk/ju$a;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 786
    invoke-super {p0}, Lcom/flurry/sdk/jo$c;->a()Lcom/flurry/sdk/ir;

    move-result-object v0

    .line 788
    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/flurry/sdk/ir;->a()Lcom/flurry/sdk/ir;

    move-result-object v0

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
    .line 800
    invoke-virtual {p0}, Lcom/flurry/sdk/ju;->i()Lcom/flurry/sdk/iv;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p0}, Lcom/flurry/sdk/iv;->a(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/iv$a;)Lcom/flurry/sdk/is;

    move-result-object v0

    return-object v0
.end method

.method public a(Lcom/flurry/sdk/mm;Ljava/lang/Class;)Lcom/flurry/sdk/jl;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mm;",
            "Ljava/lang/Class",
            "<+",
            "Lcom/flurry/sdk/jl",
            "<*>;>;)",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 985
    invoke-virtual {p0}, Lcom/flurry/sdk/ju;->k()Lcom/flurry/sdk/jf;

    move-result-object v0

    .line 986
    if-eqz v0, :cond_0

    .line 987
    invoke-virtual {v0, p0, p1, p2}, Lcom/flurry/sdk/jf;->a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/mm;Ljava/lang/Class;)Lcom/flurry/sdk/jl;

    move-result-object v0

    .line 988
    if-eqz v0, :cond_0

    .line 992
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/flurry/sdk/ju;->c()Z

    move-result v0

    invoke-static {p2, v0}, Lcom/flurry/sdk/qs;->b(Ljava/lang/Class;Z)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/jl;

    goto :goto_0
.end method

.method public a(Lcom/flurry/sdk/ng;)Lcom/flurry/sdk/ju;
    .locals 2

    .prologue
    .line 774
    iget-object v0, p0, Lcom/flurry/sdk/ju;->f:Ljava/util/HashMap;

    .line 775
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/flurry/sdk/ju;->g:Z

    .line 776
    new-instance v1, Lcom/flurry/sdk/ju;

    invoke-direct {v1, p0, v0, p1}, Lcom/flurry/sdk/ju;-><init>(Lcom/flurry/sdk/ju;Ljava/util/HashMap;Lcom/flurry/sdk/ng;)V

    return-object v1
.end method

.method public a(Lcom/flurry/sdk/ju$a;)Z
    .locals 2

    .prologue
    .line 867
    iget v0, p0, Lcom/flurry/sdk/ju;->i:I

    invoke-virtual {p1}, Lcom/flurry/sdk/ju$a;->b()I

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
    .line 973
    invoke-virtual {p0}, Lcom/flurry/sdk/ju;->i()Lcom/flurry/sdk/iv;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p0}, Lcom/flurry/sdk/iv;->a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/iv$a;)Lcom/flurry/sdk/is;

    move-result-object v0

    return-object v0
.end method

.method public b()Z
    .locals 1

    .prologue
    .line 818
    sget-object v0, Lcom/flurry/sdk/ju$a;->a:Lcom/flurry/sdk/ju$a;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/ju;->a(Lcom/flurry/sdk/ju$a;)Z

    move-result v0

    return v0
.end method

.method public c()Z
    .locals 1

    .prologue
    .line 823
    sget-object v0, Lcom/flurry/sdk/ju$a;->e:Lcom/flurry/sdk/ju$a;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/ju;->a(Lcom/flurry/sdk/ju$a;)Z

    move-result v0

    return v0
.end method

.method public d()Z
    .locals 1

    .prologue
    .line 828
    sget-object v0, Lcom/flurry/sdk/ju$a;->l:Lcom/flurry/sdk/ju$a;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/ju;->a(Lcom/flurry/sdk/ju$a;)Z

    move-result v0

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
    .line 834
    invoke-super {p0}, Lcom/flurry/sdk/jo$c;->e()Lcom/flurry/sdk/ne;

    move-result-object v0

    .line 835
    sget-object v1, Lcom/flurry/sdk/ju$a;->b:Lcom/flurry/sdk/ju$a;

    invoke-virtual {p0, v1}, Lcom/flurry/sdk/ju;->a(Lcom/flurry/sdk/ju$a;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 836
    sget-object v1, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->NONE:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    invoke-interface {v0, v1}, Lcom/flurry/sdk/ne;->a(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne;

    move-result-object v0

    .line 839
    :cond_0
    sget-object v1, Lcom/flurry/sdk/ju$a;->c:Lcom/flurry/sdk/ju$a;

    invoke-virtual {p0, v1}, Lcom/flurry/sdk/ju;->a(Lcom/flurry/sdk/ju$a;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 840
    sget-object v1, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->NONE:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    invoke-interface {v0, v1}, Lcom/flurry/sdk/ne;->b(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne;

    move-result-object v0

    .line 842
    :cond_1
    sget-object v1, Lcom/flurry/sdk/ju$a;->d:Lcom/flurry/sdk/ju$a;

    invoke-virtual {p0, v1}, Lcom/flurry/sdk/ju;->a(Lcom/flurry/sdk/ju$a;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 843
    sget-object v1, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->NONE:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    invoke-interface {v0, v1}, Lcom/flurry/sdk/ne;->e(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne;

    move-result-object v0

    .line 845
    :cond_2
    return-object v0
.end method

.method public f()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 915
    iget-object v0, p0, Lcom/flurry/sdk/ju;->b:Ljava/lang/Class;

    return-object v0
.end method

.method public g()Lcom/flurry/sdk/kg$a;
    .locals 1

    .prologue
    .line 919
    iget-object v0, p0, Lcom/flurry/sdk/ju;->a:Lcom/flurry/sdk/kg$a;

    if-eqz v0, :cond_0

    .line 920
    iget-object v0, p0, Lcom/flurry/sdk/ju;->a:Lcom/flurry/sdk/kg$a;

    .line 922
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/flurry/sdk/ju$a;->g:Lcom/flurry/sdk/ju$a;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/ju;->a(Lcom/flurry/sdk/ju$a;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/flurry/sdk/kg$a;->a:Lcom/flurry/sdk/kg$a;

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/flurry/sdk/kg$a;->b:Lcom/flurry/sdk/kg$a;

    goto :goto_0
.end method

.method public h()Lcom/flurry/sdk/oh;
    .locals 1

    .prologue
    .line 958
    iget-object v0, p0, Lcom/flurry/sdk/ju;->c:Lcom/flurry/sdk/oh;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1037
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[SerializationConfig: flags=0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/flurry/sdk/ju;->i:I

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
