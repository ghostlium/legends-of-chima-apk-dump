.class public final Lcom/flurry/sdk/kt$c;
.super Lcom/flurry/sdk/kt;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/kt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation


# instance fields
.field protected final i:Ljava/lang/String;

.field protected final j:Z

.field protected final k:Lcom/flurry/sdk/kt;

.field protected final l:Lcom/flurry/sdk/kt;


# direct methods
.method protected constructor <init>(Lcom/flurry/sdk/kt$c;Lcom/flurry/sdk/jh;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/kt$c;",
            "Lcom/flurry/sdk/jh",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 631
    invoke-direct {p0, p1, p2}, Lcom/flurry/sdk/kt;-><init>(Lcom/flurry/sdk/kt;Lcom/flurry/sdk/jh;)V

    .line 632
    iget-object v0, p1, Lcom/flurry/sdk/kt$c;->i:Ljava/lang/String;

    iput-object v0, p0, Lcom/flurry/sdk/kt$c;->i:Ljava/lang/String;

    .line 633
    iget-boolean v0, p1, Lcom/flurry/sdk/kt$c;->j:Z

    iput-boolean v0, p0, Lcom/flurry/sdk/kt$c;->j:Z

    .line 634
    iget-object v0, p1, Lcom/flurry/sdk/kt$c;->k:Lcom/flurry/sdk/kt;

    iput-object v0, p0, Lcom/flurry/sdk/kt$c;->k:Lcom/flurry/sdk/kt;

    .line 635
    iget-object v0, p1, Lcom/flurry/sdk/kt$c;->l:Lcom/flurry/sdk/kt;

    iput-object v0, p0, Lcom/flurry/sdk/kt$c;->l:Lcom/flurry/sdk/kt;

    .line 636
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/flurry/sdk/kt;Lcom/flurry/sdk/kt;Lcom/flurry/sdk/qp;Z)V
    .locals 3

    .prologue
    .line 621
    invoke-virtual {p2}, Lcom/flurry/sdk/kt;->c()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/flurry/sdk/kt;->a()Lcom/flurry/sdk/rx;

    move-result-object v1

    iget-object v2, p2, Lcom/flurry/sdk/kt;->e:Lcom/flurry/sdk/jy;

    invoke-direct {p0, v0, v1, v2, p4}, Lcom/flurry/sdk/kt;-><init>(Ljava/lang/String;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/jy;Lcom/flurry/sdk/qp;)V

    .line 623
    iput-object p1, p0, Lcom/flurry/sdk/kt$c;->i:Ljava/lang/String;

    .line 624
    iput-object p2, p0, Lcom/flurry/sdk/kt$c;->k:Lcom/flurry/sdk/kt;

    .line 625
    iput-object p3, p0, Lcom/flurry/sdk/kt$c;->l:Lcom/flurry/sdk/kt;

    .line 626
    iput-boolean p5, p0, Lcom/flurry/sdk/kt$c;->j:Z

    .line 627
    return-void
.end method


# virtual methods
.method public synthetic a(Lcom/flurry/sdk/jh;)Lcom/flurry/sdk/kt;
    .locals 1

    .prologue
    .line 601
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/kt$c;->b(Lcom/flurry/sdk/jh;)Lcom/flurry/sdk/kt$c;

    move-result-object v0

    return-object v0
.end method

.method public a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 667
    iget-object v0, p0, Lcom/flurry/sdk/kt$c;->k:Lcom/flurry/sdk/kt;

    invoke-virtual {v0, p1, p2}, Lcom/flurry/sdk/kt;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, p3, v0}, Lcom/flurry/sdk/kt$c;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 668
    return-void
.end method

.method public final a(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 674
    iget-object v0, p0, Lcom/flurry/sdk/kt$c;->k:Lcom/flurry/sdk/kt;

    invoke-virtual {v0, p1, p2}, Lcom/flurry/sdk/kt;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 678
    if-eqz p2, :cond_7

    .line 679
    iget-boolean v0, p0, Lcom/flurry/sdk/kt$c;->j:Z

    if-eqz v0, :cond_6

    .line 680
    instance-of v0, p2, [Ljava/lang/Object;

    if-eqz v0, :cond_1

    .line 681
    check-cast p2, [Ljava/lang/Object;

    check-cast p2, [Ljava/lang/Object;

    array-length v1, p2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_7

    aget-object v2, p2, v0

    .line 682
    if-eqz v2, :cond_0

    .line 683
    iget-object v3, p0, Lcom/flurry/sdk/kt$c;->l:Lcom/flurry/sdk/kt;

    invoke-virtual {v3, v2, p1}, Lcom/flurry/sdk/kt;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 681
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 686
    :cond_1
    instance-of v0, p2, Ljava/util/Collection;

    if-eqz v0, :cond_3

    .line 687
    check-cast p2, Ljava/util/Collection;

    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 688
    if-eqz v1, :cond_2

    .line 689
    iget-object v2, p0, Lcom/flurry/sdk/kt$c;->l:Lcom/flurry/sdk/kt;

    invoke-virtual {v2, v1, p1}, Lcom/flurry/sdk/kt;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_1

    .line 692
    :cond_3
    instance-of v0, p2, Ljava/util/Map;

    if-eqz v0, :cond_5

    .line 693
    check-cast p2, Ljava/util/Map;

    invoke-interface {p2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 694
    if-eqz v1, :cond_4

    .line 695
    iget-object v2, p0, Lcom/flurry/sdk/kt$c;->l:Lcom/flurry/sdk/kt;

    invoke-virtual {v2, v1, p1}, Lcom/flurry/sdk/kt;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_2

    .line 699
    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported container type ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") when resolving reference \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/sdk/kt$c;->i:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 703
    :cond_6
    iget-object v0, p0, Lcom/flurry/sdk/kt$c;->l:Lcom/flurry/sdk/kt;

    invoke-virtual {v0, p2, p1}, Lcom/flurry/sdk/kt;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 706
    :cond_7
    return-void
.end method

.method public b(Lcom/flurry/sdk/jh;)Lcom/flurry/sdk/kt$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/jh",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/flurry/sdk/kt$c;"
        }
    .end annotation

    .prologue
    .line 640
    new-instance v0, Lcom/flurry/sdk/kt$c;

    invoke-direct {v0, p0, p1}, Lcom/flurry/sdk/kt$c;-><init>(Lcom/flurry/sdk/kt$c;Lcom/flurry/sdk/jh;)V

    return-object v0
.end method

.method public b()Lcom/flurry/sdk/mq;
    .locals 1

    .prologue
    .line 654
    iget-object v0, p0, Lcom/flurry/sdk/kt$c;->k:Lcom/flurry/sdk/kt;

    invoke-virtual {v0}, Lcom/flurry/sdk/kt;->b()Lcom/flurry/sdk/mq;

    move-result-object v0

    return-object v0
.end method
