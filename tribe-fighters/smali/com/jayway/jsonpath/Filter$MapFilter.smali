.class Lcom/jayway/jsonpath/Filter$MapFilter;
.super Lcom/jayway/jsonpath/Filter$FilterAdapter;
.source "Filter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jayway/jsonpath/Filter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MapFilter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/jayway/jsonpath/Filter$FilterAdapter",
        "<",
        "Ljava/util/Map",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;>;"
    }
.end annotation


# instance fields
.field private criteria:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/jayway/jsonpath/Criteria;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/jayway/jsonpath/Criteria;)V
    .locals 1
    .param p1, "criteria"    # Lcom/jayway/jsonpath/Criteria;

    .prologue
    .line 99
    invoke-direct {p0}, Lcom/jayway/jsonpath/Filter$FilterAdapter;-><init>()V

    .line 97
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/jayway/jsonpath/Filter$MapFilter;->criteria:Ljava/util/HashMap;

    .line 100
    invoke-virtual {p0, p1}, Lcom/jayway/jsonpath/Filter$MapFilter;->addCriteria(Lcom/jayway/jsonpath/Criteria;)Lcom/jayway/jsonpath/Filter$MapFilter;

    .line 101
    return-void
.end method


# virtual methods
.method public bridge synthetic accept(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 95
    check-cast p1, Ljava/util/Map;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/jayway/jsonpath/Filter$MapFilter;->accept(Ljava/util/Map;)Z

    move-result v0

    return v0
.end method

.method public accept(Ljava/util/Map;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 116
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v2, p0, Lcom/jayway/jsonpath/Filter$MapFilter;->criteria:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jayway/jsonpath/Criteria;

    .line 117
    .local v0, "criterion":Lcom/jayway/jsonpath/Criteria;
    invoke-virtual {v0, p1}, Lcom/jayway/jsonpath/Criteria;->matches(Ljava/util/Map;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 118
    const/4 v2, 0x0

    .line 121
    .end local v0    # "criterion":Lcom/jayway/jsonpath/Criteria;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public addCriteria(Lcom/jayway/jsonpath/Criteria;)Lcom/jayway/jsonpath/Filter$MapFilter;
    .locals 4
    .param p1, "criteria"    # Lcom/jayway/jsonpath/Criteria;

    .prologue
    .line 104
    iget-object v2, p0, Lcom/jayway/jsonpath/Filter$MapFilter;->criteria:Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/jayway/jsonpath/Criteria;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jayway/jsonpath/Criteria;

    .line 105
    .local v0, "existing":Lcom/jayway/jsonpath/Criteria;
    invoke-virtual {p1}, Lcom/jayway/jsonpath/Criteria;->getKey()Ljava/lang/String;

    move-result-object v1

    .line 106
    .local v1, "key":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 107
    iget-object v2, p0, Lcom/jayway/jsonpath/Filter$MapFilter;->criteria:Ljava/util/HashMap;

    invoke-virtual {v2, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    :goto_0
    return-object p0

    .line 109
    :cond_0
    const/4 v2, 0x1

    new-array v2, v2, [Lcom/jayway/jsonpath/Criteria;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-virtual {v0, v2}, Lcom/jayway/jsonpath/Criteria;->andOperator([Lcom/jayway/jsonpath/Criteria;)Lcom/jayway/jsonpath/Criteria;

    goto :goto_0
.end method

.method public bridge synthetic addCriteria(Lcom/jayway/jsonpath/Criteria;)Lcom/jayway/jsonpath/Filter;
    .locals 1
    .param p1, "x0"    # Lcom/jayway/jsonpath/Criteria;

    .prologue
    .line 95
    invoke-virtual {p0, p1}, Lcom/jayway/jsonpath/Filter$MapFilter;->addCriteria(Lcom/jayway/jsonpath/Criteria;)Lcom/jayway/jsonpath/Filter$MapFilter;

    move-result-object v0

    return-object v0
.end method
