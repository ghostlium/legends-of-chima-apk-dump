.class public interface abstract Lcom/amazon/insights/abtest/cache/VariationCache;
.super Ljava/lang/Object;
.source "VariationCache.java"


# virtual methods
.method public abstract contains(Lcom/amazon/insights/abtest/DefaultVariation;)Z
.end method

.method public abstract get(Ljava/util/Set;)Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/amazon/insights/abtest/DefaultVariation;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getAll()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/amazon/insights/abtest/DefaultVariation;",
            ">;"
        }
    .end annotation
.end method

.method public abstract put(Lcom/amazon/insights/abtest/DefaultVariation;)Z
.end method
