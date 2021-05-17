.class public final Lcom/flurry/sdk/rd;
.super Lcom/flurry/sdk/ri;
.source "SourceFile"


# instance fields
.field protected c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/flurry/sdk/hr;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/rm;)V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/flurry/sdk/ri;-><init>(Lcom/flurry/sdk/rm;)V

    return-void
.end method

.method private a(Ljava/util/ArrayList;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/flurry/sdk/hr;",
            ">;)Z"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 747
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 748
    invoke-virtual {p0}, Lcom/flurry/sdk/rd;->o()I

    move-result v0

    if-eq v0, v3, :cond_0

    move v0, v1

    .line 756
    :goto_0
    return v0

    :cond_0
    move v2, v1

    .line 751
    :goto_1
    if-ge v2, v3, :cond_2

    .line 752
    iget-object v0, p0, Lcom/flurry/sdk/rd;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/hr;

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/flurry/sdk/hr;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    move v0, v1

    .line 753
    goto :goto_0

    .line 751
    :cond_1
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_1

    .line 756
    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private b(Lcom/flurry/sdk/hr;)V
    .locals 1

    .prologue
    .line 719
    iget-object v0, p0, Lcom/flurry/sdk/rd;->c:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 720
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/rd;->c:Ljava/util/ArrayList;

    .line 722
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/rd;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 723
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)Lcom/flurry/sdk/hr;
    .locals 1

    .prologue
    .line 54
    const/4 v0, 0x0

    return-object v0
.end method

.method public final a(Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 78
    invoke-virtual {p1}, Lcom/flurry/sdk/hp;->b()V

    .line 79
    iget-object v0, p0, Lcom/flurry/sdk/rd;->c:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 80
    iget-object v0, p0, Lcom/flurry/sdk/rd;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/hr;

    .line 86
    check-cast v0, Lcom/flurry/sdk/re;

    invoke-virtual {v0, p1, p2}, Lcom/flurry/sdk/re;->a(Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    goto :goto_0

    .line 89
    :cond_0
    invoke-virtual {p1}, Lcom/flurry/sdk/hp;->c()V

    .line 90
    return-void
.end method

.method public a(Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jz;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 97
    invoke-virtual {p3, p0, p1}, Lcom/flurry/sdk/jz;->c(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V

    .line 98
    iget-object v0, p0, Lcom/flurry/sdk/rd;->c:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 99
    iget-object v0, p0, Lcom/flurry/sdk/rd;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/hr;

    .line 100
    check-cast v0, Lcom/flurry/sdk/re;

    invoke-virtual {v0, p1, p2}, Lcom/flurry/sdk/re;->a(Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    goto :goto_0

    .line 103
    :cond_0
    invoke-virtual {p3, p0, p1}, Lcom/flurry/sdk/jz;->f(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V

    .line 104
    return-void
.end method

.method public a(Lcom/flurry/sdk/hr;)V
    .locals 0

    .prologue
    .line 200
    if-nez p1, :cond_0

    .line 201
    invoke-virtual {p0}, Lcom/flurry/sdk/rd;->r()Lcom/flurry/sdk/ro;

    move-result-object p1

    .line 203
    :cond_0
    invoke-direct {p0, p1}, Lcom/flurry/sdk/rd;->b(Lcom/flurry/sdk/hr;)V

    .line 204
    return-void
.end method

.method public a()Z
    .locals 1

    .prologue
    .line 30
    const/4 v0, 0x1

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 656
    if-ne p1, p0, :cond_1

    .line 665
    :cond_0
    :goto_0
    return v0

    .line 657
    :cond_1
    if-nez p1, :cond_2

    move v0, v1

    goto :goto_0

    .line 658
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_3

    move v0, v1

    .line 659
    goto :goto_0

    .line 661
    :cond_3
    check-cast p1, Lcom/flurry/sdk/rd;

    .line 662
    iget-object v2, p0, Lcom/flurry/sdk/rd;->c:Ljava/util/ArrayList;

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/flurry/sdk/rd;->c:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_5

    .line 663
    :cond_4
    invoke-virtual {p1}, Lcom/flurry/sdk/rd;->o()I

    move-result v2

    if-eqz v2, :cond_0

    move v0, v1

    goto :goto_0

    .line 665
    :cond_5
    iget-object v0, p0, Lcom/flurry/sdk/rd;->c:Ljava/util/ArrayList;

    invoke-direct {p1, v0}, Lcom/flurry/sdk/rd;->a(Ljava/util/ArrayList;)Z

    move-result v0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 672
    iget-object v0, p0, Lcom/flurry/sdk/rd;->c:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    .line 673
    const/4 v1, 0x1

    .line 682
    :cond_0
    return v1

    .line 675
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/rd;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 676
    iget-object v1, p0, Lcom/flurry/sdk/rd;->c:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/hr;

    .line 677
    if-eqz v0, :cond_2

    .line 678
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    xor-int/2addr v0, v1

    :goto_1
    move v1, v0

    goto :goto_0

    :cond_2
    move v0, v1

    goto :goto_1
.end method

.method public o()I
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/flurry/sdk/rd;->c:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/rd;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_0
.end method

.method public p()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lcom/flurry/sdk/hr;",
            ">;"
        }
    .end annotation

    .prologue
    .line 41
    iget-object v0, p0, Lcom/flurry/sdk/rd;->c:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/flurry/sdk/ri$a;->a()Lcom/flurry/sdk/ri$a;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/rd;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 689
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/flurry/sdk/rd;->o()I

    move-result v0

    shl-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x10

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 690
    const/16 v0, 0x5b

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 691
    iget-object v0, p0, Lcom/flurry/sdk/rd;->c:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    .line 692
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/flurry/sdk/rd;->c:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v1, v0

    :goto_0
    if-ge v1, v3, :cond_1

    .line 693
    if-lez v1, :cond_0

    .line 694
    const/16 v0, 0x2c

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 696
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/rd;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/hr;

    invoke-virtual {v0}, Lcom/flurry/sdk/hr;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 692
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    .line 699
    :cond_1
    const/16 v0, 0x5d

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 700
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
