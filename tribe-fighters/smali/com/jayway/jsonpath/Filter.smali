.class public abstract Lcom/jayway/jsonpath/Filter;
.super Ljava/lang/Object;
.source "Filter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jayway/jsonpath/Filter$MapFilter;,
        Lcom/jayway/jsonpath/Filter$FilterAdapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    .local p0, "this":Lcom/jayway/jsonpath/Filter;, "Lcom/jayway/jsonpath/Filter<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    return-void
.end method

.method public static filter(Lcom/jayway/jsonpath/Criteria;)Lcom/jayway/jsonpath/Filter;
    .locals 1
    .param p0, "criteria"    # Lcom/jayway/jsonpath/Criteria;

    .prologue
    .line 42
    new-instance v0, Lcom/jayway/jsonpath/Filter$MapFilter;

    invoke-direct {v0, p0}, Lcom/jayway/jsonpath/Filter$MapFilter;-><init>(Lcom/jayway/jsonpath/Criteria;)V

    return-object v0
.end method


# virtual methods
.method public abstract accept(Ljava/lang/Object;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation
.end method

.method public abstract addCriteria(Lcom/jayway/jsonpath/Criteria;)Lcom/jayway/jsonpath/Filter;
.end method

.method public doFilter(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lcom/jayway/jsonpath/Filter;, "Lcom/jayway/jsonpath/Filter<TT;>;"
    .local p1, "filterItems":Ljava/util/List;, "Ljava/util/List<TT;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .local v2, "result":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 53
    .local v0, "filterItem":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, v0}, Lcom/jayway/jsonpath/Filter;->accept(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 54
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 57
    .end local v0    # "filterItem":Ljava/lang/Object;, "TT;"
    :cond_1
    return-object v2
.end method
