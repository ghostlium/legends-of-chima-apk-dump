.class public Lcom/amazon/insights/abtest/cache/VariationCaches;
.super Ljava/lang/Object;
.source "VariationCaches.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static tryGetFileVariationCache(Lcom/amazon/insights/core/InsightsContext;)Lcom/amazon/insights/abtest/cache/VariationCache;
    .locals 1
    .param p0, "context"    # Lcom/amazon/insights/core/InsightsContext;

    .prologue
    .line 13
    new-instance v0, Lcom/amazon/insights/abtest/cache/FileVariationCache;

    invoke-direct {v0, p0}, Lcom/amazon/insights/abtest/cache/FileVariationCache;-><init>(Lcom/amazon/insights/core/InsightsContext;)V

    return-object v0
.end method
