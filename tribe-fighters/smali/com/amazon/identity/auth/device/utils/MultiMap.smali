.class public Lcom/amazon/identity/auth/device/utils/MultiMap;
.super Ljava/lang/Object;
.source "MultiMap.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final _multiMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Set",
            "<TV;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 41
    .local p0, "this":Lcom/amazon/identity/auth/device/utils/MultiMap;, "Lcom/amazon/identity/auth/device/utils/MultiMap<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/amazon/identity/auth/device/utils/MultiMap;->_multiMap:Ljava/util/Map;

    .line 42
    return-void
.end method


# virtual methods
.method public addAll(Ljava/lang/Object;Ljava/util/Set;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/util/Set",
            "<TV;>;)Z"
        }
    .end annotation

    .prologue
    .line 119
    .local p0, "this":Lcom/amazon/identity/auth/device/utils/MultiMap;, "Lcom/amazon/identity/auth/device/utils/MultiMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "valueSet":Ljava/util/Set;, "Ljava/util/Set<TV;>;"
    iget-object v1, p0, Lcom/amazon/identity/auth/device/utils/MultiMap;->_multiMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 120
    .local v0, "values":Ljava/util/Set;, "Ljava/util/Set<TV;>;"
    if-nez v0, :cond_0

    .line 121
    new-instance v0, Ljava/util/HashSet;

    .end local v0    # "values":Ljava/util/Set;, "Ljava/util/Set<TV;>;"
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 122
    .restart local v0    # "values":Ljava/util/Set;, "Ljava/util/Set<TV;>;"
    iget-object v1, p0, Lcom/amazon/identity/auth/device/utils/MultiMap;->_multiMap:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    :cond_0
    invoke-interface {v0, p2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    move-result v1

    return v1
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 94
    .local p0, "this":Lcom/amazon/identity/auth/device/utils/MultiMap;, "Lcom/amazon/identity/auth/device/utils/MultiMap<TK;TV;>;"
    iget-object v0, p0, Lcom/amazon/identity/auth/device/utils/MultiMap;->_multiMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 95
    return-void
.end method

.method public getKeys()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 70
    .local p0, "this":Lcom/amazon/identity/auth/device/utils/MultiMap;, "Lcom/amazon/identity/auth/device/utils/MultiMap<TK;TV;>;"
    iget-object v0, p0, Lcom/amazon/identity/auth/device/utils/MultiMap;->_multiMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getValues(Ljava/lang/Object;)Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ljava/util/Set",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 82
    .local p0, "this":Lcom/amazon/identity/auth/device/utils/MultiMap;, "Lcom/amazon/identity/auth/device/utils/MultiMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    iget-object v1, p0, Lcom/amazon/identity/auth/device/utils/MultiMap;->_multiMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 83
    .local v0, "values":Ljava/util/Set;, "Ljava/util/Set<TV;>;"
    if-nez v0, :cond_0

    .line 85
    new-instance v0, Ljava/util/HashSet;

    .end local v0    # "values":Ljava/util/Set;, "Ljava/util/Set<TV;>;"
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 87
    .restart local v0    # "values":Ljava/util/Set;, "Ljava/util/Set<TV;>;"
    :cond_0
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    return-object v1
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)Z"
        }
    .end annotation

    .prologue
    .line 54
    .local p0, "this":Lcom/amazon/identity/auth/device/utils/MultiMap;, "Lcom/amazon/identity/auth/device/utils/MultiMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    iget-object v1, p0, Lcom/amazon/identity/auth/device/utils/MultiMap;->_multiMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 55
    .local v0, "values":Ljava/util/Set;, "Ljava/util/Set<TV;>;"
    if-nez v0, :cond_0

    .line 56
    new-instance v0, Ljava/util/HashSet;

    .end local v0    # "values":Ljava/util/Set;, "Ljava/util/Set<TV;>;"
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 57
    .restart local v0    # "values":Ljava/util/Set;, "Ljava/util/Set<TV;>;"
    iget-object v1, p0, Lcom/amazon/identity/auth/device/utils/MultiMap;->_multiMap:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    :cond_0
    invoke-interface {v0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public size()I
    .locals 5

    .prologue
    .line 103
    .local p0, "this":Lcom/amazon/identity/auth/device/utils/MultiMap;, "Lcom/amazon/identity/auth/device/utils/MultiMap<TK;TV;>;"
    const/4 v3, 0x0

    .line 104
    .local v3, "size":I
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/utils/MultiMap;->getKeys()Ljava/util/Set;

    move-result-object v2

    .line 105
    .local v2, "keys":Ljava/util/Set;, "Ljava/util/Set<TK;>;"
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 106
    .local v1, "key":Ljava/lang/Object;, "TK;"
    invoke-virtual {p0, v1}, Lcom/amazon/identity/auth/device/utils/MultiMap;->getValues(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v4

    add-int/2addr v3, v4

    goto :goto_0

    .line 108
    .end local v1    # "key":Ljava/lang/Object;, "TK;"
    :cond_0
    return v3
.end method
