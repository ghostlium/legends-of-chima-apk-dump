.class public abstract Lcom/flurry/sdk/jo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/iv$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/jo$c;,
        Lcom/flurry/sdk/jo$a;,
        Lcom/flurry/sdk/jo$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/flurry/sdk/jo",
        "<TT;>;>",
        "Ljava/lang/Object;",
        "Lcom/flurry/sdk/iv$a;"
    }
.end annotation


# static fields
.field protected static final d:Ljava/text/DateFormat;


# instance fields
.field protected e:Lcom/flurry/sdk/jo$a;

.field protected f:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/flurry/sdk/qd;",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation
.end field

.field protected g:Z

.field protected h:Lcom/flurry/sdk/ng;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 53
    sget-object v0, Lcom/flurry/sdk/rc;->f:Lcom/flurry/sdk/rc;

    sput-object v0, Lcom/flurry/sdk/jo;->d:Ljava/text/DateFormat;

    return-void
.end method

.method protected constructor <init>(Lcom/flurry/sdk/iv;Lcom/flurry/sdk/ir;Lcom/flurry/sdk/ne;Lcom/flurry/sdk/ng;Lcom/flurry/sdk/jr;Lcom/flurry/sdk/qm;Lcom/flurry/sdk/jf;)V
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
    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    new-instance v0, Lcom/flurry/sdk/jo$a;

    const/4 v6, 0x0

    sget-object v7, Lcom/flurry/sdk/jo;->d:Ljava/text/DateFormat;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p5

    move-object v5, p6

    move-object/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Lcom/flurry/sdk/jo$a;-><init>(Lcom/flurry/sdk/iv;Lcom/flurry/sdk/ir;Lcom/flurry/sdk/ne;Lcom/flurry/sdk/jr;Lcom/flurry/sdk/qm;Lcom/flurry/sdk/ni;Ljava/text/DateFormat;Lcom/flurry/sdk/jf;)V

    iput-object v0, p0, Lcom/flurry/sdk/jo;->e:Lcom/flurry/sdk/jo$a;

    .line 131
    iput-object p4, p0, Lcom/flurry/sdk/jo;->h:Lcom/flurry/sdk/ng;

    .line 133
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/sdk/jo;->g:Z

    .line 134
    return-void
.end method

.method protected constructor <init>(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/jo$a;Lcom/flurry/sdk/ng;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/jo",
            "<TT;>;",
            "Lcom/flurry/sdk/jo$a;",
            "Lcom/flurry/sdk/ng;",
            ")V"
        }
    .end annotation

    .prologue
    .line 149
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 150
    iput-object p2, p0, Lcom/flurry/sdk/jo;->e:Lcom/flurry/sdk/jo$a;

    .line 151
    iput-object p3, p0, Lcom/flurry/sdk/jo;->h:Lcom/flurry/sdk/ng;

    .line 153
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/sdk/jo;->g:Z

    .line 154
    iget-object v0, p1, Lcom/flurry/sdk/jo;->f:Ljava/util/HashMap;

    iput-object v0, p0, Lcom/flurry/sdk/jo;->f:Ljava/util/HashMap;

    .line 155
    return-void
.end method


# virtual methods
.method public a()Lcom/flurry/sdk/ir;
    .locals 1

    .prologue
    .line 383
    iget-object v0, p0, Lcom/flurry/sdk/jo;->e:Lcom/flurry/sdk/jo$a;

    invoke-virtual {v0}, Lcom/flurry/sdk/jo$a;->b()Lcom/flurry/sdk/ir;

    move-result-object v0

    return-object v0
.end method

.method public abstract a(Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/is;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<DESC:",
            "Lcom/flurry/sdk/is;",
            ">(",
            "Lcom/flurry/sdk/rx;",
            ")TDESC;"
        }
    .end annotation
.end method

.method public a(Lcom/flurry/sdk/rx;Ljava/lang/Class;)Lcom/flurry/sdk/rx;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/rx;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    .line 599
    invoke-virtual {p0}, Lcom/flurry/sdk/jo;->m()Lcom/flurry/sdk/qm;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/flurry/sdk/qm;->a(Lcom/flurry/sdk/rx;Ljava/lang/Class;)Lcom/flurry/sdk/rx;

    move-result-object v0

    return-object v0
.end method

.method public final a(Ljava/lang/Class;)Ljava/lang/Class;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 518
    iget-object v0, p0, Lcom/flurry/sdk/jo;->f:Ljava/util/HashMap;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/jo;->f:Ljava/util/HashMap;

    new-instance v1, Lcom/flurry/sdk/qd;

    invoke-direct {v1, p1}, Lcom/flurry/sdk/qd;-><init>(Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    goto :goto_0
.end method

.method public final b(Ljava/lang/Class;)Lcom/flurry/sdk/rx;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    .line 578
    invoke-virtual {p0}, Lcom/flurry/sdk/jo;->m()Lcom/flurry/sdk/qm;

    move-result-object v1

    const/4 v0, 0x0

    check-cast v0, Lcom/flurry/sdk/ql;

    invoke-virtual {v1, p1, v0}, Lcom/flurry/sdk/qm;->a(Ljava/lang/reflect/Type;Lcom/flurry/sdk/ql;)Lcom/flurry/sdk/rx;

    move-result-object v0

    return-object v0
.end method

.method public abstract b()Z
.end method

.method public c(Ljava/lang/Class;)Lcom/flurry/sdk/is;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<DESC:",
            "Lcom/flurry/sdk/is;",
            ">(",
            "Ljava/lang/Class",
            "<*>;)TDESC;"
        }
    .end annotation

    .prologue
    .line 634
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/jo;->b(Ljava/lang/Class;)Lcom/flurry/sdk/rx;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/jo;->a(Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/is;

    move-result-object v0

    return-object v0
.end method

.method public abstract c()Z
.end method

.method public d(Lcom/flurry/sdk/mm;Ljava/lang/Class;)Lcom/flurry/sdk/ni;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mm;",
            "Ljava/lang/Class",
            "<+",
            "Lcom/flurry/sdk/ni",
            "<*>;>;)",
            "Lcom/flurry/sdk/ni",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 678
    invoke-virtual {p0}, Lcom/flurry/sdk/jo;->k()Lcom/flurry/sdk/jf;

    move-result-object v0

    .line 679
    if-eqz v0, :cond_0

    .line 680
    invoke-virtual {v0, p0, p1, p2}, Lcom/flurry/sdk/jf;->a(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/mm;Ljava/lang/Class;)Lcom/flurry/sdk/ni;

    move-result-object v0

    .line 681
    if-eqz v0, :cond_0

    .line 685
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/flurry/sdk/jo;->c()Z

    move-result v0

    invoke-static {p2, v0}, Lcom/flurry/sdk/qs;->b(Ljava/lang/Class;Z)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/ni;

    goto :goto_0
.end method

.method public final d(Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/ni;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/rx;",
            ")",
            "Lcom/flurry/sdk/ni",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 543
    iget-object v0, p0, Lcom/flurry/sdk/jo;->e:Lcom/flurry/sdk/jo$a;

    invoke-virtual {v0}, Lcom/flurry/sdk/jo$a;->f()Lcom/flurry/sdk/ni;

    move-result-object v0

    return-object v0
.end method

.method public abstract d()Z
.end method

.method public e()Lcom/flurry/sdk/ne;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/flurry/sdk/ne",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 434
    iget-object v0, p0, Lcom/flurry/sdk/jo;->e:Lcom/flurry/sdk/jo$a;

    invoke-virtual {v0}, Lcom/flurry/sdk/jo$a;->c()Lcom/flurry/sdk/ne;

    move-result-object v0

    return-object v0
.end method

.method public e(Lcom/flurry/sdk/mm;Ljava/lang/Class;)Lcom/flurry/sdk/nh;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mm;",
            "Ljava/lang/Class",
            "<+",
            "Lcom/flurry/sdk/nh;",
            ">;)",
            "Lcom/flurry/sdk/nh;"
        }
    .end annotation

    .prologue
    .line 697
    invoke-virtual {p0}, Lcom/flurry/sdk/jo;->k()Lcom/flurry/sdk/jf;

    move-result-object v0

    .line 698
    if-eqz v0, :cond_0

    .line 699
    invoke-virtual {v0, p0, p1, p2}, Lcom/flurry/sdk/jf;->b(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/mm;Ljava/lang/Class;)Lcom/flurry/sdk/nh;

    move-result-object v0

    .line 700
    if-eqz v0, :cond_0

    .line 704
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/flurry/sdk/jo;->c()Z

    move-result v0

    invoke-static {p2, v0}, Lcom/flurry/sdk/qs;->b(Ljava/lang/Class;Z)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/nh;

    goto :goto_0
.end method

.method public i()Lcom/flurry/sdk/iv;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/flurry/sdk/iv",
            "<+",
            "Lcom/flurry/sdk/is;",
            ">;"
        }
    .end annotation

    .prologue
    .line 373
    iget-object v0, p0, Lcom/flurry/sdk/jo;->e:Lcom/flurry/sdk/jo$a;

    invoke-virtual {v0}, Lcom/flurry/sdk/jo$a;->a()Lcom/flurry/sdk/iv;

    move-result-object v0

    return-object v0
.end method

.method public final j()Lcom/flurry/sdk/jr;
    .locals 1

    .prologue
    .line 441
    iget-object v0, p0, Lcom/flurry/sdk/jo;->e:Lcom/flurry/sdk/jo$a;

    invoke-virtual {v0}, Lcom/flurry/sdk/jo$a;->d()Lcom/flurry/sdk/jr;

    move-result-object v0

    return-object v0
.end method

.method public final k()Lcom/flurry/sdk/jf;
    .locals 1

    .prologue
    .line 448
    iget-object v0, p0, Lcom/flurry/sdk/jo;->e:Lcom/flurry/sdk/jo$a;

    invoke-virtual {v0}, Lcom/flurry/sdk/jo$a;->h()Lcom/flurry/sdk/jf;

    move-result-object v0

    return-object v0
.end method

.method public final l()Lcom/flurry/sdk/ng;
    .locals 1

    .prologue
    .line 554
    iget-object v0, p0, Lcom/flurry/sdk/jo;->h:Lcom/flurry/sdk/ng;

    if-nez v0, :cond_0

    .line 555
    new-instance v0, Lcom/flurry/sdk/nt;

    invoke-direct {v0}, Lcom/flurry/sdk/nt;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/jo;->h:Lcom/flurry/sdk/ng;

    .line 557
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/jo;->h:Lcom/flurry/sdk/ng;

    return-object v0
.end method

.method public final m()Lcom/flurry/sdk/qm;
    .locals 1

    .prologue
    .line 564
    iget-object v0, p0, Lcom/flurry/sdk/jo;->e:Lcom/flurry/sdk/jo$a;

    invoke-virtual {v0}, Lcom/flurry/sdk/jo$a;->e()Lcom/flurry/sdk/qm;

    move-result-object v0

    return-object v0
.end method

.method public final n()Ljava/text/DateFormat;
    .locals 1

    .prologue
    .line 624
    iget-object v0, p0, Lcom/flurry/sdk/jo;->e:Lcom/flurry/sdk/jo$a;

    invoke-virtual {v0}, Lcom/flurry/sdk/jo$a;->g()Ljava/text/DateFormat;

    move-result-object v0

    return-object v0
.end method
