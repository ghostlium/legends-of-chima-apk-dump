.class public Lcom/jayway/jsonpath/internal/filter/ScanFilter;
.super Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;
.source "ScanFilter.java"


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

.method private scan(Ljava/lang/Object;Ljava/util/List;Lcom/jayway/jsonpath/spi/JsonProvider;)V
    .locals 3
    .param p1, "container"    # Ljava/lang/Object;
    .param p3, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/jayway/jsonpath/spi/JsonProvider;",
            ")V"
        }
    .end annotation

    .prologue
    .line 52
    .local p2, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-interface {p3, p1}, Lcom/jayway/jsonpath/spi/JsonProvider;->isMap(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 53
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    invoke-interface {p3, p1}, Lcom/jayway/jsonpath/spi/JsonProvider;->toMap(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 56
    .local v1, "value":Ljava/lang/Object;
    invoke-interface {p3, v1}, Lcom/jayway/jsonpath/spi/JsonProvider;->isContainer(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 57
    invoke-direct {p0, v1, p2, p3}, Lcom/jayway/jsonpath/internal/filter/ScanFilter;->scan(Ljava/lang/Object;Ljava/util/List;Lcom/jayway/jsonpath/spi/JsonProvider;)V

    goto :goto_0

    .line 60
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "value":Ljava/lang/Object;
    :cond_1
    invoke-interface {p3, p1}, Lcom/jayway/jsonpath/spi/JsonProvider;->isList(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 62
    invoke-interface {p3, p1}, Lcom/jayway/jsonpath/spi/JsonProvider;->toList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 63
    .restart local v1    # "value":Ljava/lang/Object;
    invoke-interface {p3, v1}, Lcom/jayway/jsonpath/spi/JsonProvider;->isContainer(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 64
    invoke-direct {p0, v1, p2, p3}, Lcom/jayway/jsonpath/internal/filter/ScanFilter;->scan(Ljava/lang/Object;Ljava/util/List;Lcom/jayway/jsonpath/spi/JsonProvider;)V

    goto :goto_1

    .line 68
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "value":Ljava/lang/Object;
    :cond_3
    return-void
.end method


# virtual methods
.method public filter(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)Ljava/lang/Object;
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;

    .prologue
    .line 33
    invoke-interface {p2}, Lcom/jayway/jsonpath/spi/JsonProvider;->createList()Ljava/util/List;

    move-result-object v0

    .line 34
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-direct {p0, p1, v0, p2}, Lcom/jayway/jsonpath/internal/filter/ScanFilter;->scan(Ljava/lang/Object;Ljava/util/List;Lcom/jayway/jsonpath/spi/JsonProvider;)V

    .line 36
    return-object v0
.end method

.method public getRef(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)Ljava/lang/Object;
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;

    .prologue
    .line 46
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public isArrayFilter()Z
    .locals 1

    .prologue
    .line 41
    const/4 v0, 0x1

    return v0
.end method
