.class public Lcom/jayway/jsonpath/internal/filter/FieldFilter;
.super Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;
.source "FieldFilter.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "condition"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;-><init>(Ljava/lang/String;)V

    .line 32
    return-void
.end method


# virtual methods
.method public filter(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)Ljava/lang/Object;
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;

    .prologue
    .line 68
    invoke-interface {p2, p1}, Lcom/jayway/jsonpath/spi/JsonProvider;->isList(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 71
    .end local p1    # "obj":Ljava/lang/Object;
    :goto_0
    return-object p1

    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_0
    iget-object v0, p0, Lcom/jayway/jsonpath/internal/filter/FieldFilter;->condition:Ljava/lang/String;

    invoke-interface {p2, p1, v0}, Lcom/jayway/jsonpath/spi/JsonProvider;->getMapValue(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    goto :goto_0
.end method

.method public filter(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;Ljava/util/LinkedList;Z)Ljava/lang/Object;
    .locals 7
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;
    .param p4, "inArrayContext"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lcom/jayway/jsonpath/spi/JsonProvider;",
            "Ljava/util/LinkedList",
            "<",
            "Lcom/jayway/jsonpath/Filter;",
            ">;Z)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 36
    .local p3, "filters":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/jayway/jsonpath/Filter;>;"
    invoke-interface {p2, p1}, Lcom/jayway/jsonpath/spi/JsonProvider;->isList(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 37
    if-nez p4, :cond_1

    .line 38
    const/4 v4, 0x0

    .line 61
    :cond_0
    :goto_0
    return-object v4

    .line 40
    :cond_1
    invoke-interface {p2}, Lcom/jayway/jsonpath/spi/JsonProvider;->createList()Ljava/util/List;

    move-result-object v4

    .line 41
    .local v4, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-interface {p2, p1}, Lcom/jayway/jsonpath/spi/JsonProvider;->toList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 42
    .local v0, "current":Ljava/lang/Object;
    invoke-interface {p2, v0}, Lcom/jayway/jsonpath/spi/JsonProvider;->isMap(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 43
    invoke-interface {p2, v0}, Lcom/jayway/jsonpath/spi/JsonProvider;->toMap(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    .line 44
    .local v2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v5, p0, Lcom/jayway/jsonpath/internal/filter/FieldFilter;->condition:Ljava/lang/String;

    invoke-interface {v2, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 45
    iget-object v5, p0, Lcom/jayway/jsonpath/internal/filter/FieldFilter;->condition:Ljava/lang/String;

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 46
    .local v3, "o":Ljava/lang/Object;
    invoke-interface {p2, v3}, Lcom/jayway/jsonpath/spi/JsonProvider;->isList(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 47
    invoke-interface {p2, v3}, Lcom/jayway/jsonpath/spi/JsonProvider;->toList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    .line 49
    :cond_3
    iget-object v5, p0, Lcom/jayway/jsonpath/internal/filter/FieldFilter;->condition:Ljava/lang/String;

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 57
    .end local v0    # "current":Ljava/lang/Object;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v3    # "o":Ljava/lang/Object;
    .end local v4    # "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :cond_4
    invoke-interface {p2, p1}, Lcom/jayway/jsonpath/spi/JsonProvider;->toMap(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    .line 58
    .restart local v2    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v5, p0, Lcom/jayway/jsonpath/internal/filter/FieldFilter;->condition:Ljava/lang/String;

    invoke-interface {v2, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 59
    new-instance v5, Lcom/jayway/jsonpath/InvalidPathException;

    const-string v6, "invalid path"

    invoke-direct {v5, v6}, Lcom/jayway/jsonpath/InvalidPathException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 61
    :cond_5
    iget-object v5, p0, Lcom/jayway/jsonpath/internal/filter/FieldFilter;->condition:Ljava/lang/String;

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto :goto_0
.end method

.method public getRef(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)Ljava/lang/Object;
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;

    .prologue
    .line 77
    invoke-virtual {p0, p1, p2}, Lcom/jayway/jsonpath/internal/filter/FieldFilter;->filter(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public isArrayFilter()Z
    .locals 1

    .prologue
    .line 82
    const/4 v0, 0x0

    return v0
.end method
