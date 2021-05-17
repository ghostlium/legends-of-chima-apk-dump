.class public Lcom/flurry/sdk/my;
.super Lcom/flurry/sdk/ir;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/flurry/sdk/ir;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/mq;)Lcom/flurry/sdk/ir$a;
    .locals 1

    .prologue
    .line 139
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonManagedReference;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mq;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonManagedReference;

    .line 140
    if-eqz v0, :cond_0

    .line 141
    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonManagedReference;->value()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flurry/sdk/ir$a;->a(Ljava/lang/String;)Lcom/flurry/sdk/ir$a;

    move-result-object v0

    .line 147
    :goto_0
    return-object v0

    .line 143
    :cond_0
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonBackReference;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mq;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonBackReference;

    .line 144
    if-eqz v0, :cond_1

    .line 145
    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonBackReference;->value()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flurry/sdk/ir$a;->b(Ljava/lang/String;)Lcom/flurry/sdk/ir$a;

    move-result-object v0

    goto :goto_0

    .line 147
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public a(Lcom/flurry/sdk/mm;Lcom/flurry/sdk/kg$a;)Lcom/flurry/sdk/kg$a;
    .locals 1

    .prologue
    .line 343
    const-class v0, Lcom/flurry/sdk/kg;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mm;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/kg;

    .line 344
    if-eqz v0, :cond_0

    .line 345
    invoke-interface {v0}, Lcom/flurry/sdk/kg;->h()Lcom/flurry/sdk/kg$a;

    move-result-object v0

    .line 355
    :goto_0
    return-object v0

    .line 350
    :cond_0
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonWriteNullProperties;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mm;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonWriteNullProperties;

    .line 351
    if-eqz v0, :cond_2

    .line 352
    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonWriteNullProperties;->value()Z

    move-result v0

    .line 353
    if-eqz v0, :cond_1

    sget-object v0, Lcom/flurry/sdk/kg$a;->a:Lcom/flurry/sdk/kg$a;

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/flurry/sdk/kg$a;->b:Lcom/flurry/sdk/kg$a;

    goto :goto_0

    :cond_2
    move-object v0, p2

    .line 355
    goto :goto_0
.end method

.method public a(Lcom/flurry/sdk/mn;Lcom/flurry/sdk/ne;)Lcom/flurry/sdk/ne;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mn;",
            "Lcom/flurry/sdk/ne",
            "<*>;)",
            "Lcom/flurry/sdk/ne",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 125
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mn;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect;

    .line 126
    if-nez v0, :cond_0

    :goto_0
    return-object p2

    :cond_0
    invoke-interface {p2, v0}, Lcom/flurry/sdk/ne;->a(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect;)Lcom/flurry/sdk/ne;

    move-result-object p2

    goto :goto_0
.end method

.method protected a(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/mm;Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/ni;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/jo",
            "<*>;",
            "Lcom/flurry/sdk/mm;",
            "Lcom/flurry/sdk/rx;",
            ")",
            "Lcom/flurry/sdk/ni",
            "<*>;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 744
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo;

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/mm;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo;

    .line 745
    const-class v1, Lcom/flurry/sdk/ki;

    invoke-virtual {p2, v1}, Lcom/flurry/sdk/mm;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lcom/flurry/sdk/ki;

    .line 746
    if-eqz v1, :cond_3

    .line 750
    if-nez v0, :cond_0

    move-object v0, v3

    .line 790
    :goto_0
    return-object v0

    .line 757
    :cond_0
    invoke-interface {v1}, Lcom/flurry/sdk/ki;->a()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Lcom/flurry/sdk/jo;->d(Lcom/flurry/sdk/mm;Ljava/lang/Class;)Lcom/flurry/sdk/ni;

    move-result-object v1

    move-object v2, v1

    .line 769
    :goto_1
    const-class v1, Lcom/flurry/sdk/kh;

    invoke-virtual {p2, v1}, Lcom/flurry/sdk/mm;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lcom/flurry/sdk/kh;

    .line 770
    if-nez v1, :cond_6

    .line 772
    :goto_2
    if-eqz v3, :cond_1

    .line 773
    invoke-interface {v3, p3}, Lcom/flurry/sdk/nh;->a(Lcom/flurry/sdk/rx;)V

    .line 775
    :cond_1
    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo;->use()Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo$Id;

    move-result-object v1

    invoke-interface {v2, v1, v3}, Lcom/flurry/sdk/ni;->a(Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo$Id;Lcom/flurry/sdk/nh;)Lcom/flurry/sdk/ni;

    move-result-object v2

    .line 780
    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo;->include()Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo$As;

    move-result-object v1

    .line 781
    sget-object v3, Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo$As;->EXTERNAL_PROPERTY:Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo$As;

    if-ne v1, v3, :cond_2

    instance-of v3, p2, Lcom/flurry/sdk/mn;

    if-eqz v3, :cond_2

    .line 782
    sget-object v1, Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo$As;->PROPERTY:Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo$As;

    .line 784
    :cond_2
    invoke-interface {v2, v1}, Lcom/flurry/sdk/ni;->a(Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo$As;)Lcom/flurry/sdk/ni;

    move-result-object v1

    .line 785
    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo;->property()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/flurry/sdk/ni;->a(Ljava/lang/String;)Lcom/flurry/sdk/ni;

    move-result-object v1

    .line 786
    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo;->defaultImpl()Ljava/lang/Class;

    move-result-object v0

    .line 787
    const-class v2, Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo$None;

    if-eq v0, v2, :cond_7

    .line 788
    invoke-interface {v1, v0}, Lcom/flurry/sdk/ni;->a(Ljava/lang/Class;)Lcom/flurry/sdk/ni;

    move-result-object v0

    goto :goto_0

    .line 759
    :cond_3
    if-nez v0, :cond_4

    move-object v0, v3

    .line 760
    goto :goto_0

    .line 763
    :cond_4
    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo;->use()Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo$Id;

    move-result-object v1

    sget-object v2, Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo$Id;->NONE:Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo$Id;

    if-ne v1, v2, :cond_5

    .line 764
    invoke-virtual {p0}, Lcom/flurry/sdk/my;->c()Lcom/flurry/sdk/nu;

    move-result-object v0

    goto :goto_0

    .line 766
    :cond_5
    invoke-virtual {p0}, Lcom/flurry/sdk/my;->b()Lcom/flurry/sdk/nu;

    move-result-object v1

    move-object v2, v1

    goto :goto_1

    .line 770
    :cond_6
    invoke-interface {v1}, Lcom/flurry/sdk/kh;->a()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Lcom/flurry/sdk/jo;->e(Lcom/flurry/sdk/mm;Ljava/lang/Class;)Lcom/flurry/sdk/nh;

    move-result-object v3

    goto :goto_2

    :cond_7
    move-object v0, v1

    goto :goto_0
.end method

.method public a(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/mn;Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/ni;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/jo",
            "<*>;",
            "Lcom/flurry/sdk/mn;",
            "Lcom/flurry/sdk/rx;",
            ")",
            "Lcom/flurry/sdk/ni",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 199
    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/my;->a(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/mm;Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/ni;

    move-result-object v0

    return-object v0
.end method

.method public a(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/mq;Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/ni;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/jo",
            "<*>;",
            "Lcom/flurry/sdk/mq;",
            "Lcom/flurry/sdk/rx;",
            ")",
            "Lcom/flurry/sdk/ni",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 212
    invoke-virtual {p3}, Lcom/flurry/sdk/rx;->f()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 214
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/my;->a(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/mm;Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/ni;

    move-result-object v0

    goto :goto_0
.end method

.method public a(Lcom/flurry/sdk/mn;)Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 69
    const-class v0, Lcom/flurry/sdk/kc;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mn;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/kc;

    .line 70
    if-nez v0, :cond_0

    .line 71
    const/4 v0, 0x0

    .line 73
    :goto_0
    return-object v0

    :cond_0
    invoke-interface {v0}, Lcom/flurry/sdk/kc;->a()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public a(Lcom/flurry/sdk/mm;Lcom/flurry/sdk/rx;)Ljava/lang/Class;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mm;",
            "Lcom/flurry/sdk/rx;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 374
    const-class v0, Lcom/flurry/sdk/kg;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mm;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/kg;

    .line 375
    if-eqz v0, :cond_0

    .line 376
    invoke-interface {v0}, Lcom/flurry/sdk/kg;->e()Ljava/lang/Class;

    move-result-object v0

    .line 377
    const-class v1, Lcom/flurry/sdk/kl;

    if-eq v0, v1, :cond_0

    .line 381
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public a(Lcom/flurry/sdk/mm;Lcom/flurry/sdk/rx;Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mm;",
            "Lcom/flurry/sdk/rx;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 546
    const-class v0, Lcom/flurry/sdk/kd;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mm;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/kd;

    .line 547
    if-eqz v0, :cond_0

    .line 548
    invoke-interface {v0}, Lcom/flurry/sdk/kd;->d()Ljava/lang/Class;

    move-result-object v0

    .line 549
    const-class v1, Lcom/flurry/sdk/kl;

    if-eq v0, v1, :cond_0

    .line 556
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public a(Lcom/flurry/sdk/mt;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 710
    if-eqz p1, :cond_0

    .line 711
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonProperty;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mt;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonProperty;

    .line 712
    if-eqz v0, :cond_0

    .line 713
    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonProperty;->value()Ljava/lang/String;

    move-result-object v0

    .line 720
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public a(Ljava/lang/Enum;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Enum",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 57
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public a(Lcom/flurry/sdk/mm;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mm;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/sdk/nf;",
            ">;"
        }
    .end annotation

    .prologue
    .line 236
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonSubTypes;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mm;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonSubTypes;

    .line 237
    if-nez v0, :cond_1

    const/4 v0, 0x0

    .line 243
    :cond_0
    return-object v0

    .line 238
    :cond_1
    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonSubTypes;->value()[Lcom/flurry/org/codehaus/jackson/annotate/JsonSubTypes$Type;

    move-result-object v2

    .line 239
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, v2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 240
    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_0

    aget-object v4, v2, v1

    .line 241
    new-instance v5, Lcom/flurry/sdk/nf;

    invoke-interface {v4}, Lcom/flurry/org/codehaus/jackson/annotate/JsonSubTypes$Type;->value()Ljava/lang/Class;

    move-result-object v6

    invoke-interface {v4}, Lcom/flurry/org/codehaus/jackson/annotate/JsonSubTypes$Type;->name()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v5, v6, v4}, Lcom/flurry/sdk/nf;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 240
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public a(Lcom/flurry/sdk/mo;)Z
    .locals 1

    .prologue
    .line 266
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/my;->m(Lcom/flurry/sdk/mm;)Z

    move-result v0

    return v0
.end method

.method public a(Lcom/flurry/sdk/mp;)Z
    .locals 1

    .prologue
    .line 277
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/my;->m(Lcom/flurry/sdk/mm;)Z

    move-result v0

    return v0
.end method

.method public a(Lcom/flurry/sdk/mr;)Z
    .locals 1

    .prologue
    .line 261
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/my;->m(Lcom/flurry/sdk/mm;)Z

    move-result v0

    return v0
.end method

.method public a(Ljava/lang/annotation/Annotation;)Z
    .locals 2

    .prologue
    .line 35
    invoke-interface {p1}, Ljava/lang/annotation/Annotation;->annotationType()Ljava/lang/Class;

    move-result-object v0

    .line 45
    const-class v1, Lcom/flurry/org/codehaus/jackson/annotate/JacksonAnnotation;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public b(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/mq;Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/ni;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/jo",
            "<*>;",
            "Lcom/flurry/sdk/mq;",
            "Lcom/flurry/sdk/rx;",
            ")",
            "Lcom/flurry/sdk/ni",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 227
    invoke-virtual {p3}, Lcom/flurry/sdk/rx;->f()Z

    move-result v0

    if-nez v0, :cond_0

    .line 228
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Must call method with a container type (got "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 230
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/my;->a(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/mm;Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/ni;

    move-result-object v0

    return-object v0
.end method

.method protected b()Lcom/flurry/sdk/nu;
    .locals 1

    .prologue
    .line 801
    new-instance v0, Lcom/flurry/sdk/nu;

    invoke-direct {v0}, Lcom/flurry/sdk/nu;-><init>()V

    return-object v0
.end method

.method public b(Lcom/flurry/sdk/mq;)Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 153
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonUnwrapped;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mq;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonUnwrapped;

    .line 156
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonUnwrapped;->enabled()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public b(Lcom/flurry/sdk/mm;Lcom/flurry/sdk/rx;)Ljava/lang/Class;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mm;",
            "Lcom/flurry/sdk/rx;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 387
    const-class v0, Lcom/flurry/sdk/kg;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mm;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/kg;

    .line 388
    if-eqz v0, :cond_0

    .line 389
    invoke-interface {v0}, Lcom/flurry/sdk/kg;->f()Ljava/lang/Class;

    move-result-object v0

    .line 390
    const-class v1, Lcom/flurry/sdk/kl;

    if-eq v0, v1, :cond_0

    .line 394
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public b(Lcom/flurry/sdk/mm;Lcom/flurry/sdk/rx;Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mm;",
            "Lcom/flurry/sdk/rx;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 564
    const-class v0, Lcom/flurry/sdk/kd;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mm;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/kd;

    .line 565
    if-eqz v0, :cond_0

    .line 566
    invoke-interface {v0}, Lcom/flurry/sdk/kd;->e()Ljava/lang/Class;

    move-result-object v0

    .line 567
    const-class v1, Lcom/flurry/sdk/kl;

    if-eq v0, v1, :cond_0

    .line 574
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public b(Lcom/flurry/sdk/mm;)Ljava/lang/Object;
    .locals 2

    .prologue
    .line 292
    const-class v0, Lcom/flurry/sdk/kg;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mm;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/kg;

    .line 293
    if-eqz v0, :cond_0

    .line 294
    invoke-interface {v0}, Lcom/flurry/sdk/kg;->a()Ljava/lang/Class;

    move-result-object v0

    .line 295
    const-class v1, Lcom/flurry/sdk/jl$a;

    if-eq v0, v1, :cond_0

    .line 310
    :goto_0
    return-object v0

    .line 304
    :cond_0
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonRawValue;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mm;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonRawValue;

    .line 305
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonRawValue;->value()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 307
    invoke-virtual {p1}, Lcom/flurry/sdk/mm;->d()Ljava/lang/Class;

    move-result-object v1

    .line 308
    new-instance v0, Lcom/flurry/sdk/pm;

    invoke-direct {v0, v1}, Lcom/flurry/sdk/pm;-><init>(Ljava/lang/Class;)V

    goto :goto_0

    .line 310
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public b(Lcom/flurry/sdk/mn;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    const-class v0, Lcom/flurry/sdk/kf;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mn;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/kf;

    .line 80
    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-interface {v0}, Lcom/flurry/sdk/kf;->a()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public b(Lcom/flurry/sdk/mp;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 480
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonProperty;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mp;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonProperty;

    .line 481
    if-eqz v0, :cond_0

    .line 482
    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonProperty;->value()Ljava/lang/String;

    move-result-object v0

    .line 489
    :goto_0
    return-object v0

    .line 486
    :cond_0
    const-class v0, Lcom/flurry/sdk/kg;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mp;->b(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_1

    const-class v0, Lcom/flurry/sdk/kk;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mp;->b(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 487
    :cond_1
    const-string v0, ""

    goto :goto_0

    .line 489
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public b(Lcom/flurry/sdk/mr;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 442
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonProperty;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mr;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonProperty;

    .line 443
    if-eqz v0, :cond_0

    .line 444
    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonProperty;->value()Ljava/lang/String;

    move-result-object v0

    .line 460
    :goto_0
    return-object v0

    .line 449
    :cond_0
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonGetter;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mr;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonGetter;

    .line 450
    if-eqz v0, :cond_1

    .line 451
    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonGetter;->value()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 457
    :cond_1
    const-class v0, Lcom/flurry/sdk/kg;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mr;->b(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_2

    const-class v0, Lcom/flurry/sdk/kk;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mr;->b(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 458
    :cond_2
    const-string v0, ""

    goto :goto_0

    .line 460
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected c()Lcom/flurry/sdk/nu;
    .locals 1

    .prologue
    .line 811
    invoke-static {}, Lcom/flurry/sdk/nu;->b()Lcom/flurry/sdk/nu;

    move-result-object v0

    return-object v0
.end method

.method public c(Lcom/flurry/sdk/mm;)Ljava/lang/Class;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mm;",
            ")",
            "Ljava/lang/Class",
            "<+",
            "Lcom/flurry/sdk/jl",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 316
    const-class v0, Lcom/flurry/sdk/kg;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mm;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/kg;

    .line 317
    if-eqz v0, :cond_0

    .line 318
    invoke-interface {v0}, Lcom/flurry/sdk/kg;->c()Ljava/lang/Class;

    move-result-object v0

    .line 319
    const-class v1, Lcom/flurry/sdk/jl$a;

    if-eq v0, v1, :cond_0

    .line 323
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public c(Lcom/flurry/sdk/mm;Lcom/flurry/sdk/rx;Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mm;",
            "Lcom/flurry/sdk/rx;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 582
    const-class v0, Lcom/flurry/sdk/kd;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mm;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/kd;

    .line 583
    if-eqz v0, :cond_0

    .line 584
    invoke-interface {v0}, Lcom/flurry/sdk/kd;->f()Ljava/lang/Class;

    move-result-object v0

    .line 585
    const-class v1, Lcom/flurry/sdk/kl;

    if-eq v0, v1, :cond_0

    .line 592
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public c(Lcom/flurry/sdk/mp;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 685
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonProperty;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mp;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonProperty;

    .line 686
    if-eqz v0, :cond_0

    .line 687
    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonProperty;->value()Ljava/lang/String;

    move-result-object v0

    .line 698
    :goto_0
    return-object v0

    .line 691
    :cond_0
    const-class v0, Lcom/flurry/sdk/kd;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mp;->b(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_1

    const-class v0, Lcom/flurry/sdk/kk;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mp;->b(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_1

    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonBackReference;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mp;->b(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_1

    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonManagedReference;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mp;->b(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 696
    :cond_1
    const-string v0, ""

    goto :goto_0

    .line 698
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public c(Lcom/flurry/sdk/mq;)Z
    .locals 1

    .prologue
    .line 161
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/my;->m(Lcom/flurry/sdk/mm;)Z

    move-result v0

    return v0
.end method

.method public c(Lcom/flurry/sdk/mr;)Z
    .locals 1

    .prologue
    .line 466
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonValue;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mr;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonValue;

    .line 468
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonValue;->value()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public c(Lcom/flurry/sdk/mn;)[Ljava/lang/String;
    .locals 1

    .prologue
    .line 85
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonIgnoreProperties;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mn;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonIgnoreProperties;

    .line 86
    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonIgnoreProperties;->value()[Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public d(Lcom/flurry/sdk/mn;)Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 91
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonIgnoreProperties;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mn;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonIgnoreProperties;

    .line 92
    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonIgnoreProperties;->ignoreUnknown()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method public d(Lcom/flurry/sdk/mm;)Ljava/lang/Class;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mm;",
            ")",
            "Ljava/lang/Class",
            "<+",
            "Lcom/flurry/sdk/jl",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 329
    const-class v0, Lcom/flurry/sdk/kg;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mm;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/kg;

    .line 330
    if-eqz v0, :cond_0

    .line 331
    invoke-interface {v0}, Lcom/flurry/sdk/kg;->b()Ljava/lang/Class;

    move-result-object v0

    .line 332
    const-class v1, Lcom/flurry/sdk/jl$a;

    if-eq v0, v1, :cond_0

    .line 336
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public d(Lcom/flurry/sdk/mq;)Ljava/lang/Object;
    .locals 2

    .prologue
    .line 167
    const-class v0, Lcom/flurry/sdk/ka;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mq;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/ka;

    .line 168
    if-nez v0, :cond_1

    .line 169
    const/4 v0, 0x0

    .line 186
    :cond_0
    :goto_0
    return-object v0

    .line 174
    :cond_1
    invoke-interface {v0}, Lcom/flurry/sdk/ka;->a()Ljava/lang/String;

    move-result-object v0

    .line 175
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    .line 177
    instance-of v0, p1, Lcom/flurry/sdk/mr;

    if-nez v0, :cond_2

    .line 178
    invoke-virtual {p1}, Lcom/flurry/sdk/mq;->d()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 180
    check-cast v0, Lcom/flurry/sdk/mr;

    .line 181
    invoke-virtual {v0}, Lcom/flurry/sdk/mr;->f()I

    move-result v1

    if-nez v1, :cond_3

    .line 182
    invoke-virtual {p1}, Lcom/flurry/sdk/mq;->d()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 184
    :cond_3
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/mr;->a(I)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public d(Lcom/flurry/sdk/mr;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 624
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonProperty;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mr;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonProperty;

    .line 625
    if-eqz v0, :cond_0

    .line 626
    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonProperty;->value()Ljava/lang/String;

    move-result-object v0

    .line 644
    :goto_0
    return-object v0

    .line 628
    :cond_0
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonSetter;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mr;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonSetter;

    .line 629
    if-eqz v0, :cond_1

    .line 630
    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonSetter;->value()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 637
    :cond_1
    const-class v0, Lcom/flurry/sdk/kd;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mr;->b(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_2

    const-class v0, Lcom/flurry/sdk/kk;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mr;->b(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_2

    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonBackReference;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mr;->b(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_2

    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonManagedReference;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mr;->b(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 642
    :cond_2
    const-string v0, ""

    goto :goto_0

    .line 644
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public e(Lcom/flurry/sdk/mn;)Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 97
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonIgnoreType;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mn;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonIgnoreType;

    .line 98
    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonIgnoreType;->value()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method public e(Lcom/flurry/sdk/mm;)Ljava/lang/Class;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mm;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 361
    const-class v0, Lcom/flurry/sdk/kg;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mm;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/kg;

    .line 362
    if-eqz v0, :cond_0

    .line 363
    invoke-interface {v0}, Lcom/flurry/sdk/kg;->d()Ljava/lang/Class;

    move-result-object v0

    .line 364
    const-class v1, Lcom/flurry/sdk/kl;

    if-eq v0, v1, :cond_0

    .line 368
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public e(Lcom/flurry/sdk/mr;)Z
    .locals 1

    .prologue
    .line 654
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonAnySetter;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mr;->b(Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method public f(Lcom/flurry/sdk/mm;)Lcom/flurry/sdk/kg$b;
    .locals 1

    .prologue
    .line 400
    const-class v0, Lcom/flurry/sdk/kg;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mm;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/kg;

    .line 401
    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-interface {v0}, Lcom/flurry/sdk/kg;->g()Lcom/flurry/sdk/kg$b;

    move-result-object v0

    goto :goto_0
.end method

.method public f(Lcom/flurry/sdk/mn;)Ljava/lang/Object;
    .locals 2

    .prologue
    .line 104
    const-class v0, Lcom/flurry/sdk/ke;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mn;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/ke;

    .line 105
    if-eqz v0, :cond_0

    .line 106
    invoke-interface {v0}, Lcom/flurry/sdk/ke;->a()Ljava/lang/String;

    move-result-object v0

    .line 108
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 112
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public f(Lcom/flurry/sdk/mr;)Z
    .locals 1

    .prologue
    .line 663
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonAnyGetter;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mr;->b(Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method public g(Lcom/flurry/sdk/mn;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 249
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeName;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mn;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeName;

    .line 250
    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeName;->value()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public g(Lcom/flurry/sdk/mm;)[Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mm;",
            ")[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 407
    const-class v0, Lcom/flurry/sdk/kk;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mm;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/kk;

    .line 408
    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-interface {v0}, Lcom/flurry/sdk/kk;->a()[Ljava/lang/Class;

    move-result-object v0

    goto :goto_0
.end method

.method public synthetic h(Lcom/flurry/sdk/mm;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 21
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/my;->l(Lcom/flurry/sdk/mm;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public h(Lcom/flurry/sdk/mn;)[Ljava/lang/String;
    .locals 1

    .prologue
    .line 419
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonPropertyOrder;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mn;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonPropertyOrder;

    .line 420
    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonPropertyOrder;->value()[Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public i(Lcom/flurry/sdk/mn;)Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 425
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonPropertyOrder;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mn;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonPropertyOrder;

    .line 426
    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonPropertyOrder;->alphabetic()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method public i(Lcom/flurry/sdk/mm;)Ljava/lang/Class;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mm;",
            ")",
            "Ljava/lang/Class",
            "<+",
            "Lcom/flurry/sdk/jm;",
            ">;"
        }
    .end annotation

    .prologue
    .line 518
    const-class v0, Lcom/flurry/sdk/kd;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mm;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/kd;

    .line 519
    if-eqz v0, :cond_0

    .line 520
    invoke-interface {v0}, Lcom/flurry/sdk/kd;->c()Ljava/lang/Class;

    move-result-object v0

    .line 521
    const-class v1, Lcom/flurry/sdk/jm$a;

    if-eq v0, v1, :cond_0

    .line 525
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public j(Lcom/flurry/sdk/mm;)Ljava/lang/Class;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mm;",
            ")",
            "Ljava/lang/Class",
            "<+",
            "Lcom/flurry/sdk/jh",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 531
    const-class v0, Lcom/flurry/sdk/kd;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mm;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/kd;

    .line 532
    if-eqz v0, :cond_0

    .line 533
    invoke-interface {v0}, Lcom/flurry/sdk/kd;->b()Ljava/lang/Class;

    move-result-object v0

    .line 534
    const-class v1, Lcom/flurry/sdk/jh$a;

    if-eq v0, v1, :cond_0

    .line 538
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public j(Lcom/flurry/sdk/mn;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 604
    const-class v0, Lcom/flurry/sdk/kj;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mn;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/kj;

    .line 606
    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-interface {v0}, Lcom/flurry/sdk/kj;->a()Ljava/lang/Class;

    move-result-object v0

    goto :goto_0
.end method

.method public k(Lcom/flurry/sdk/mm;)Z
    .locals 1

    .prologue
    .line 673
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonCreator;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mm;->b(Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method public l(Lcom/flurry/sdk/mm;)Ljava/lang/Class;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/mm;",
            ")",
            "Ljava/lang/Class",
            "<+",
            "Lcom/flurry/sdk/jh",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 504
    const-class v0, Lcom/flurry/sdk/kd;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mm;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/kd;

    .line 505
    if-eqz v0, :cond_0

    .line 506
    invoke-interface {v0}, Lcom/flurry/sdk/kd;->a()Ljava/lang/Class;

    move-result-object v0

    .line 507
    const-class v1, Lcom/flurry/sdk/jh$a;

    if-eq v0, v1, :cond_0

    .line 512
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected m(Lcom/flurry/sdk/mm;)Z
    .locals 1

    .prologue
    .line 731
    const-class v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonIgnore;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/mm;->a(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonIgnore;

    .line 732
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/flurry/org/codehaus/jackson/annotate/JsonIgnore;->value()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
