.class public Lcom/jayway/jsonpath/internal/filter/HasFieldFilter;
.super Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;
.source "HasFieldFilter.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "condition"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;-><init>(Ljava/lang/String;)V

    .line 29
    return-void
.end method


# virtual methods
.method public filter(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)Ljava/lang/Object;
    .locals 8
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;

    .prologue
    .line 35
    invoke-interface {p2, p1}, Lcom/jayway/jsonpath/spi/JsonProvider;->toList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    .line 36
    .local v4, "src":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-interface {p2}, Lcom/jayway/jsonpath/spi/JsonProvider;->createList()Ljava/util/List;

    move-result-object v3

    .line 38
    .local v3, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    iget-object v5, p0, Lcom/jayway/jsonpath/internal/filter/HasFieldFilter;->condition:Ljava/lang/String;

    .line 40
    .local v5, "trimmedCondition":Ljava/lang/String;
    iget-object v6, p0, Lcom/jayway/jsonpath/internal/filter/HasFieldFilter;->condition:Ljava/lang/String;

    const-string v7, "[\'"

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 41
    const-string v6, "[\'"

    const-string v7, "."

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    .line 42
    const-string v6, "\']"

    const-string v7, ""

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    .line 45
    :cond_0
    const/4 v6, 0x5

    const/4 v7, 0x2

    invoke-virtual {p0, v5, v6, v7}, Lcom/jayway/jsonpath/internal/filter/HasFieldFilter;->trim(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v5

    .line 47
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 48
    .local v1, "item":Ljava/lang/Object;
    invoke-interface {p2, v1}, Lcom/jayway/jsonpath/spi/JsonProvider;->isMap(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 49
    invoke-interface {p2, v1}, Lcom/jayway/jsonpath/spi/JsonProvider;->toMap(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    .line 50
    .local v2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v2, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 51
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 55
    .end local v1    # "item":Ljava/lang/Object;
    .end local v2    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_2
    return-object v3
.end method

.method public getRef(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)Ljava/lang/Object;
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;

    .prologue
    .line 60
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public isArrayFilter()Z
    .locals 1

    .prologue
    .line 65
    const/4 v0, 0x1

    return v0
.end method
