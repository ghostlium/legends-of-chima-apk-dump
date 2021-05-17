.class Lcom/flurry/sdk/fm$s;
.super Lcom/flurry/sdk/fm$n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/fm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "s"
.end annotation


# instance fields
.field private i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/flurry/sdk/fm$f;",
            ">;"
        }
    .end annotation
.end field

.field private j:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/flurry/sdk/fm$f;",
            ">;"
        }
    .end annotation
.end field

.field private final k:Z


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/fm$m;Ljava/lang/String;Z)V
    .locals 1

    .prologue
    .line 597
    sget-object v0, Lcom/flurry/sdk/fm$v;->a:Lcom/flurry/sdk/fm$v;

    invoke-direct {p0, v0, p1, p2}, Lcom/flurry/sdk/fm$n;-><init>(Lcom/flurry/sdk/fm$v;Lcom/flurry/sdk/fm$m;Ljava/lang/String;)V

    .line 598
    iput-boolean p3, p0, Lcom/flurry/sdk/fm$s;->k:Z

    .line 599
    return-void
.end method


# virtual methods
.method a(Lcom/flurry/sdk/fm$o;Lcom/flurry/sdk/hp;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 664
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/fm$s;->c(Lcom/flurry/sdk/fm$o;Lcom/flurry/sdk/hp;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 678
    :goto_0
    return-void

    .line 665
    :cond_0
    invoke-static {p1}, Lcom/flurry/sdk/fm$o;->a(Lcom/flurry/sdk/fm$o;)Ljava/lang/String;

    move-result-object v1

    .line 666
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->d()V

    .line 667
    const-string v2, "type"

    iget-boolean v0, p0, Lcom/flurry/sdk/fm$s;->k:Z

    if-eqz v0, :cond_2

    const-string v0, "error"

    :goto_1
    invoke-virtual {p2, v2, v0}, Lcom/flurry/sdk/hp;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 668
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/fm$s;->d(Lcom/flurry/sdk/fm$o;Lcom/flurry/sdk/hp;)V

    .line 669
    iget-object v0, p0, Lcom/flurry/sdk/fm$s;->f:Lcom/flurry/sdk/fm$m;

    invoke-static {v0}, Lcom/flurry/sdk/fm$m;->c(Lcom/flurry/sdk/fm$m;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flurry/sdk/fm$o;->a(Lcom/flurry/sdk/fm$o;Ljava/lang/String;)Ljava/lang/String;

    .line 670
    invoke-virtual {p0}, Lcom/flurry/sdk/fm$s;->e()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 671
    const-string v0, "doc"

    invoke-virtual {p0}, Lcom/flurry/sdk/fm$s;->e()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v0, v2}, Lcom/flurry/sdk/hp;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 672
    :cond_1
    const-string v0, "fields"

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/hp;->a(Ljava/lang/String;)V

    .line 673
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/fm$s;->b(Lcom/flurry/sdk/fm$o;Lcom/flurry/sdk/hp;)V

    .line 674
    iget-object v0, p0, Lcom/flurry/sdk/fm$s;->c:Lcom/flurry/sdk/fm$r;

    invoke-virtual {v0, p2}, Lcom/flurry/sdk/fm$r;->a(Lcom/flurry/sdk/hp;)V

    .line 675
    invoke-virtual {p0, p2}, Lcom/flurry/sdk/fm$s;->a(Lcom/flurry/sdk/hp;)V

    .line 676
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->e()V

    .line 677
    invoke-static {p1, v1}, Lcom/flurry/sdk/fm$o;->a(Lcom/flurry/sdk/fm$o;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0

    .line 667
    :cond_2
    const-string v0, "record"

    goto :goto_1
.end method

.method public b(Ljava/lang/String;)Lcom/flurry/sdk/fm$f;
    .locals 2

    .prologue
    .line 604
    iget-object v0, p0, Lcom/flurry/sdk/fm$s;->j:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 605
    new-instance v0, Lcom/flurry/sdk/fk;

    const-string v1, "Schema fields not set yet"

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/String;)V

    throw v0

    .line 606
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/fm$s;->j:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm$f;

    return-object v0
.end method

.method public b()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/sdk/fm$f;",
            ">;"
        }
    .end annotation

    .prologue
    .line 611
    iget-object v0, p0, Lcom/flurry/sdk/fm$s;->i:Ljava/util/List;

    if-nez v0, :cond_0

    .line 612
    new-instance v0, Lcom/flurry/sdk/fk;

    const-string v1, "Schema fields not set yet"

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/String;)V

    throw v0

    .line 613
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/fm$s;->i:Ljava/util/List;

    return-object v0
.end method

.method b(Lcom/flurry/sdk/fm$o;Lcom/flurry/sdk/hp;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 681
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->b()V

    .line 682
    iget-object v0, p0, Lcom/flurry/sdk/fm$s;->i:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm$f;

    .line 683
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->d()V

    .line 684
    const-string v1, "name"

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->a()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v1, v3}, Lcom/flurry/sdk/hp;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 685
    const-string v1, "type"

    invoke-virtual {p2, v1}, Lcom/flurry/sdk/hp;->a(Ljava/lang/String;)V

    .line 686
    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->c()Lcom/flurry/sdk/fm;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Lcom/flurry/sdk/fm;->a(Lcom/flurry/sdk/fm$o;Lcom/flurry/sdk/hp;)V

    .line 687
    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->d()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 688
    const-string v1, "doc"

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->d()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v1, v3}, Lcom/flurry/sdk/hp;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 689
    :cond_0
    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->e()Lcom/flurry/sdk/hr;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 690
    const-string v1, "default"

    invoke-virtual {p2, v1}, Lcom/flurry/sdk/hp;->a(Ljava/lang/String;)V

    .line 691
    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->e()Lcom/flurry/sdk/hr;

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/flurry/sdk/hp;->a(Lcom/flurry/sdk/hr;)V

    .line 693
    :cond_1
    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->f()Lcom/flurry/sdk/fm$f$a;

    move-result-object v1

    sget-object v3, Lcom/flurry/sdk/fm$f$a;->a:Lcom/flurry/sdk/fm$f$a;

    if-eq v1, v3, :cond_2

    .line 694
    const-string v1, "order"

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->f()Lcom/flurry/sdk/fm$f$a;

    move-result-object v3

    invoke-static {v3}, Lcom/flurry/sdk/fm$f$a;->a(Lcom/flurry/sdk/fm$f$a;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v1, v3}, Lcom/flurry/sdk/hp;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 695
    :cond_2
    invoke-static {v0}, Lcom/flurry/sdk/fm$f;->b(Lcom/flurry/sdk/fm$f;)Ljava/util/Set;

    move-result-object v1

    if-eqz v1, :cond_4

    invoke-static {v0}, Lcom/flurry/sdk/fm$f;->b(Lcom/flurry/sdk/fm$f;)Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    if-eqz v1, :cond_4

    .line 696
    const-string v1, "aliases"

    invoke-virtual {p2, v1}, Lcom/flurry/sdk/hp;->a(Ljava/lang/String;)V

    .line 697
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->b()V

    .line 698
    invoke-static {v0}, Lcom/flurry/sdk/fm$f;->b(Lcom/flurry/sdk/fm$f;)Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 699
    invoke-virtual {p2, v1}, Lcom/flurry/sdk/hp;->b(Ljava/lang/String;)V

    goto :goto_1

    .line 700
    :cond_3
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->c()V

    .line 702
    :cond_4
    invoke-static {v0}, Lcom/flurry/sdk/fm$f;->c(Lcom/flurry/sdk/fm$f;)Lcom/flurry/sdk/fm$r;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/flurry/sdk/fm$r;->a(Lcom/flurry/sdk/hp;)V

    .line 703
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->e()V

    goto/16 :goto_0

    .line 705
    :cond_5
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->c()V

    .line 706
    return-void
.end method

.method public b(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/sdk/fm$f;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 618
    iget-object v0, p0, Lcom/flurry/sdk/fm$s;->i:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 619
    new-instance v0, Lcom/flurry/sdk/fk;

    const-string v1, "Fields are already set"

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/String;)V

    throw v0

    .line 621
    :cond_0
    const/4 v0, 0x0

    .line 622
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/flurry/sdk/fm$s;->j:Ljava/util/Map;

    .line 623
    new-instance v3, Lcom/flurry/sdk/fm$j;

    invoke-direct {v3}, Lcom/flurry/sdk/fm$j;-><init>()V

    .line 624
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move v1, v0

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm$f;

    .line 625
    invoke-static {v0}, Lcom/flurry/sdk/fm$f;->a(Lcom/flurry/sdk/fm$f;)I

    move-result v2

    const/4 v5, -0x1

    if-eq v2, v5, :cond_1

    .line 626
    new-instance v1, Lcom/flurry/sdk/fk;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Field already used: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/String;)V

    throw v1

    .line 627
    :cond_1
    add-int/lit8 v2, v1, 0x1

    invoke-static {v0, v1}, Lcom/flurry/sdk/fm$f;->a(Lcom/flurry/sdk/fm$f;I)I

    .line 628
    iget-object v1, p0, Lcom/flurry/sdk/fm$s;->j:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->a()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 629
    invoke-virtual {v3, v0}, Lcom/flurry/sdk/fm$j;->add(Ljava/lang/Object;)Z

    move v1, v2

    goto :goto_0

    .line 631
    :cond_2
    invoke-virtual {v3}, Lcom/flurry/sdk/fm$j;->a()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/fm$s;->i:Ljava/util/List;

    .line 632
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/flurry/sdk/fm$s;->d:I

    .line 633
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 635
    if-ne p1, p0, :cond_0

    move v0, v1

    .line 649
    :goto_0
    return v0

    .line 636
    :cond_0
    instance-of v0, p1, Lcom/flurry/sdk/fm$s;

    if-nez v0, :cond_1

    move v0, v2

    goto :goto_0

    :cond_1
    move-object v0, p1

    .line 637
    check-cast v0, Lcom/flurry/sdk/fm$s;

    .line 638
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/fm$s;->c(Lcom/flurry/sdk/fm;)Z

    move-result v3

    if-nez v3, :cond_2

    move v0, v2

    goto :goto_0

    .line 639
    :cond_2
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/fm$s;->a(Lcom/flurry/sdk/fm$n;)Z

    move-result v3

    if-nez v3, :cond_3

    move v0, v2

    goto :goto_0

    .line 640
    :cond_3
    iget-object v3, p0, Lcom/flurry/sdk/fm$s;->c:Lcom/flurry/sdk/fm$r;

    iget-object v0, v0, Lcom/flurry/sdk/fm$s;->c:Lcom/flurry/sdk/fm$r;

    invoke-virtual {v3, v0}, Lcom/flurry/sdk/fm$r;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    move v0, v2

    goto :goto_0

    .line 641
    :cond_4
    invoke-static {}, Lcom/flurry/sdk/fm;->o()Ljava/lang/ThreadLocal;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 642
    new-instance v2, Lcom/flurry/sdk/fm$t;

    const/4 v3, 0x0

    invoke-direct {v2, p0, p1, v3}, Lcom/flurry/sdk/fm$t;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/flurry/sdk/fm$1;)V

    .line 643
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    move v0, v1

    goto :goto_0

    .line 644
    :cond_5
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    .line 646
    :try_start_0
    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 647
    iget-object v1, p0, Lcom/flurry/sdk/fm$s;->i:Ljava/util/List;

    check-cast p1, Lcom/flurry/sdk/fm$s;

    iget-object v2, p1, Lcom/flurry/sdk/fm$s;->i:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 649
    if-eqz v3, :cond_6

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    :cond_6
    move v0, v1

    goto :goto_0

    :catchall_0
    move-exception v1

    if-eqz v3, :cond_7

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    :cond_7
    throw v1
.end method

.method public h()Z
    .locals 1

    .prologue
    .line 600
    iget-boolean v0, p0, Lcom/flurry/sdk/fm$s;->k:Z

    return v0
.end method

.method m()I
    .locals 4

    .prologue
    .line 653
    invoke-static {}, Lcom/flurry/sdk/fm;->p()Ljava/lang/ThreadLocal;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 654
    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    .line 660
    :goto_0
    return v0

    .line 655
    :cond_0
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    .line 657
    :try_start_0
    invoke-interface {v0, p0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 658
    invoke-super {p0}, Lcom/flurry/sdk/fm$n;->m()I

    move-result v1

    iget-object v3, p0, Lcom/flurry/sdk/fm$s;->i:Ljava/util/List;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    add-int/2addr v1, v3

    .line 660
    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    :cond_1
    move v0, v1

    goto :goto_0

    :catchall_0
    move-exception v1

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    :cond_2
    throw v1
.end method
