.class public Lcom/jayway/jsonpath/internal/filter/ArrayQueryFilter;
.super Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;
.source "ArrayQueryFilter.java"


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "condition"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;-><init>(Ljava/lang/String;)V

    .line 30
    return-void
.end method


# virtual methods
.method public filter(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)Ljava/lang/Object;
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;

    .prologue
    .line 43
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public filter(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;Ljava/util/LinkedList;Z)Ljava/lang/Object;
    .locals 2
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
    .line 35
    .local p3, "filters":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/jayway/jsonpath/Filter;>;"
    invoke-virtual {p3}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jayway/jsonpath/Filter;

    .line 37
    .local v0, "filter":Lcom/jayway/jsonpath/Filter;
    check-cast p1, Ljava/util/List;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {v0, p1}, Lcom/jayway/jsonpath/Filter;->doFilter(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public getRef(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)Ljava/lang/Object;
    .locals 2
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;

    .prologue
    .line 48
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isArrayFilter()Z
    .locals 1

    .prologue
    .line 53
    const/4 v0, 0x1

    return v0
.end method
