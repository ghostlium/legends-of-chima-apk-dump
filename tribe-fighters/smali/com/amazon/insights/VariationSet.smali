.class public interface abstract Lcom/amazon/insights/VariationSet;
.super Ljava/lang/Object;
.source "VariationSet.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Lcom/amazon/insights/Variation;",
        ">;"
    }
.end annotation


# virtual methods
.method public abstract contains(Ljava/lang/String;)Z
.end method

.method public abstract getVariation(Ljava/lang/String;)Lcom/amazon/insights/Variation;
.end method

.method public abstract iterator()Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lcom/amazon/insights/Variation;",
            ">;"
        }
    .end annotation
.end method

.method public abstract size()I
.end method
