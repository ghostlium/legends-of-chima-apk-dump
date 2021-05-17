.class public Lcom/flurry/sdk/rq;
.super Lcom/flurry/sdk/ri;
.source "SourceFile"


# instance fields
.field protected c:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/flurry/sdk/hr;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/rm;)V
    .locals 1

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/flurry/sdk/ri;-><init>(Lcom/flurry/sdk/rm;)V

    .line 17
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/rq;->c:Ljava/util/LinkedHashMap;

    .line 19
    return-void
.end method

.method private final b(Ljava/lang/String;Lcom/flurry/sdk/hr;)Lcom/flurry/sdk/hr;
    .locals 1

    .prologue
    .line 664
    iget-object v0, p0, Lcom/flurry/sdk/rq;->c:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_0

    .line 665
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/rq;->c:Ljava/util/LinkedHashMap;

    .line 667
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/rq;->c:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/hr;

    return-object v0
.end method


# virtual methods
.method public a(Ljava/lang/String;)Lcom/flurry/sdk/hr;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/flurry/sdk/rq;->c:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_0

    .line 50
    iget-object v0, p0, Lcom/flurry/sdk/rq;->c:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/hr;

    .line 52
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public a(Ljava/lang/String;Lcom/flurry/sdk/hr;)Lcom/flurry/sdk/hr;
    .locals 1

    .prologue
    .line 270
    if-nez p2, :cond_0

    .line 271
    invoke-virtual {p0}, Lcom/flurry/sdk/rq;->r()Lcom/flurry/sdk/ro;

    move-result-object p2

    .line 273
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/flurry/sdk/rq;->b(Ljava/lang/String;Lcom/flurry/sdk/hr;)Lcom/flurry/sdk/hr;

    move-result-object v0

    return-object v0
.end method

.method public final a(Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 221
    invoke-virtual {p1}, Lcom/flurry/sdk/hp;->d()V

    .line 222
    iget-object v0, p0, Lcom/flurry/sdk/rq;->c:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_0

    .line 223
    iget-object v0, p0, Lcom/flurry/sdk/rq;->c:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 224
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/flurry/sdk/hp;->a(Ljava/lang/String;)V

    .line 230
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/re;

    invoke-virtual {v0, p1, p2}, Lcom/flurry/sdk/re;->a(Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    goto :goto_0

    .line 233
    :cond_0
    invoke-virtual {p1}, Lcom/flurry/sdk/hp;->e()V

    .line 234
    return-void
.end method

.method public a(Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jz;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 241
    invoke-virtual {p3, p0, p1}, Lcom/flurry/sdk/jz;->b(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V

    .line 242
    iget-object v0, p0, Lcom/flurry/sdk/rq;->c:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_0

    .line 243
    iget-object v0, p0, Lcom/flurry/sdk/rq;->c:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 244
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/flurry/sdk/hp;->a(Ljava/lang/String;)V

    .line 245
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/re;

    invoke-virtual {v0, p1, p2}, Lcom/flurry/sdk/re;->a(Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    goto :goto_0

    .line 248
    :cond_0
    invoke-virtual {p3, p0, p1}, Lcom/flurry/sdk/jz;->e(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V

    .line 249
    return-void
.end method

.method public b()Z
    .locals 1

    .prologue
    .line 30
    const/4 v0, 0x1

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 605
    if-ne p1, p0, :cond_0

    move v0, v2

    .line 626
    :goto_0
    return v0

    .line 606
    :cond_0
    if-nez p1, :cond_1

    move v0, v3

    goto :goto_0

    .line 607
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eq v0, v1, :cond_2

    move v0, v3

    .line 608
    goto :goto_0

    .line 610
    :cond_2
    check-cast p1, Lcom/flurry/sdk/rq;

    .line 611
    invoke-virtual {p1}, Lcom/flurry/sdk/rq;->o()I

    move-result v0

    invoke-virtual {p0}, Lcom/flurry/sdk/rq;->o()I

    move-result v1

    if-eq v0, v1, :cond_3

    move v0, v3

    .line 612
    goto :goto_0

    .line 614
    :cond_3
    iget-object v0, p0, Lcom/flurry/sdk/rq;->c:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_6

    .line 615
    iget-object v0, p0, Lcom/flurry/sdk/rq;->c:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 616
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 617
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/hr;

    .line 619
    invoke-virtual {p1, v1}, Lcom/flurry/sdk/rq;->a(Ljava/lang/String;)Lcom/flurry/sdk/hr;

    move-result-object v1

    .line 621
    if-eqz v1, :cond_5

    invoke-virtual {v1, v0}, Lcom/flurry/sdk/hr;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    :cond_5
    move v0, v3

    .line 622
    goto :goto_0

    :cond_6
    move v0, v2

    .line 626
    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 632
    iget-object v0, p0, Lcom/flurry/sdk/rq;->c:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_0

    const/4 v0, -0x1

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/rq;->c:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->hashCode()I

    move-result v0

    goto :goto_0
.end method

.method public o()I
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/flurry/sdk/rq;->c:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/rq;->c:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->size()I

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
    .line 40
    iget-object v0, p0, Lcom/flurry/sdk/rq;->c:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/flurry/sdk/ri$a;->a()Lcom/flurry/sdk/ri$a;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/rq;->c:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    goto :goto_0
.end method

.method public q()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 58
    iget-object v0, p0, Lcom/flurry/sdk/rq;->c:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/flurry/sdk/ri$b;->a()Lcom/flurry/sdk/ri$b;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/rq;->c:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 638
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/flurry/sdk/rq;->o()I

    move-result v0

    shl-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x20

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 639
    const-string v0, "{"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 640
    iget-object v0, p0, Lcom/flurry/sdk/rq;->c:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_1

    .line 641
    const/4 v0, 0x0

    .line 642
    iget-object v1, p0, Lcom/flurry/sdk/rq;->c:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move v1, v0

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 643
    if-lez v1, :cond_0

    .line 644
    const-string v2, ","

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 646
    :cond_0
    add-int/lit8 v2, v1, 0x1

    .line 647
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v3, v1}, Lcom/flurry/sdk/rs;->a(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 648
    const/16 v1, 0x3a

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 649
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/hr;

    invoke-virtual {v0}, Lcom/flurry/sdk/hr;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v1, v2

    goto :goto_0

    .line 652
    :cond_1
    const-string v0, "}"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 653
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
