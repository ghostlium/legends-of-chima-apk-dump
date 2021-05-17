.class Lcom/amazon/insights/abtest/DefaultABTestClient$1;
.super Ljava/lang/Object;
.source "DefaultABTestClient.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/insights/abtest/DefaultABTestClient;->allocateVariations(Ljava/util/Set;Lcom/amazon/insights/core/DefaultInsightsHandler;)Lcom/amazon/insights/core/DefaultInsightsHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/insights/abtest/DefaultABTestClient;

.field final synthetic val$dimensions:Ljava/util/concurrent/atomic/AtomicReference;

.field final synthetic val$getVariationHandler:Lcom/amazon/insights/core/DefaultInsightsHandler;

.field final synthetic val$projectNames:Ljava/util/Set;


# direct methods
.method constructor <init>(Lcom/amazon/insights/abtest/DefaultABTestClient;Ljava/util/Set;Ljava/util/concurrent/atomic/AtomicReference;Lcom/amazon/insights/core/DefaultInsightsHandler;)V
    .locals 0

    .prologue
    .line 170
    iput-object p1, p0, Lcom/amazon/insights/abtest/DefaultABTestClient$1;->this$0:Lcom/amazon/insights/abtest/DefaultABTestClient;

    iput-object p2, p0, Lcom/amazon/insights/abtest/DefaultABTestClient$1;->val$projectNames:Ljava/util/Set;

    iput-object p3, p0, Lcom/amazon/insights/abtest/DefaultABTestClient$1;->val$dimensions:Ljava/util/concurrent/atomic/AtomicReference;

    iput-object p4, p0, Lcom/amazon/insights/abtest/DefaultABTestClient$1;->val$getVariationHandler:Lcom/amazon/insights/core/DefaultInsightsHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    .line 174
    :try_start_0
    new-instance v5, Ljava/util/ArrayList;

    iget-object v9, p0, Lcom/amazon/insights/abtest/DefaultABTestClient$1;->val$projectNames:Ljava/util/Set;

    invoke-direct {v5, v9}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 175
    .local v5, "projectNamesList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v9, p0, Lcom/amazon/insights/abtest/DefaultABTestClient$1;->this$0:Lcom/amazon/insights/abtest/DefaultABTestClient;

    invoke-static {v9}, Lcom/amazon/insights/abtest/DefaultABTestClient;->access$000(Lcom/amazon/insights/abtest/DefaultABTestClient;)I

    move-result v4

    .line 176
    .local v4, "maxAllocations":I
    const/4 v0, 0x0

    .line 177
    .local v0, "allocationCounter":I
    new-instance v7, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v7}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 179
    .local v7, "variations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    :goto_0
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v9

    if-ge v0, v9, :cond_1

    .line 180
    new-instance v8, Ljava/util/HashSet;

    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V

    .line 181
    .local v8, "workingProjectNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v4, :cond_0

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v9

    if-ge v0, v9, :cond_0

    .line 182
    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 181
    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 186
    :cond_0
    iget-object v9, p0, Lcom/amazon/insights/abtest/DefaultABTestClient$1;->this$0:Lcom/amazon/insights/abtest/DefaultABTestClient;

    invoke-virtual {v9, v8, v7}, Lcom/amazon/insights/abtest/DefaultABTestClient;->allocateDefaultVariations(Ljava/util/Set;Ljava/util/Map;)Ljava/util/Set;

    move-result-object v8

    .line 187
    iget-object v9, p0, Lcom/amazon/insights/abtest/DefaultABTestClient$1;->this$0:Lcom/amazon/insights/abtest/DefaultABTestClient;

    invoke-virtual {v9, v8, v7}, Lcom/amazon/insights/abtest/DefaultABTestClient;->allocateCachedVariations(Ljava/util/Set;Ljava/util/Map;)Ljava/util/Set;

    move-result-object v8

    .line 188
    iget-object v10, p0, Lcom/amazon/insights/abtest/DefaultABTestClient$1;->this$0:Lcom/amazon/insights/abtest/DefaultABTestClient;

    iget-object v9, p0, Lcom/amazon/insights/abtest/DefaultABTestClient$1;->val$dimensions:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map;

    invoke-virtual {v10, v8, v7, v9}, Lcom/amazon/insights/abtest/DefaultABTestClient;->allocateServerVariations(Ljava/util/Set;Ljava/util/Map;Ljava/util/Map;)Ljava/util/Set;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 247
    .end local v0    # "allocationCounter":I
    .end local v2    # "i":I
    .end local v4    # "maxAllocations":I
    .end local v5    # "projectNamesList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v7    # "variations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    .end local v8    # "workingProjectNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :catch_0
    move-exception v1

    .line 248
    .local v1, "e":Ljava/lang/Exception;
    iget-object v9, p0, Lcom/amazon/insights/abtest/DefaultABTestClient$1;->val$getVariationHandler:Lcom/amazon/insights/core/DefaultInsightsHandler;

    new-instance v10, Lcom/amazon/insights/error/UnexpectedError;

    const-string v11, "An unexpected error occurred. Retrieval of variations could not be completed"

    invoke-direct {v10, v11, v1}, Lcom/amazon/insights/error/UnexpectedError;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    invoke-virtual {v9, v10}, Lcom/amazon/insights/core/DefaultInsightsHandler;->onError(Lcom/amazon/insights/error/InsightsError;)V

    .line 249
    invoke-static {}, Lcom/amazon/insights/abtest/DefaultABTestClient;->access$100()Lcom/amazon/insights/core/log/Logger;

    move-result-object v9

    const-string v10, "An unexpected error occurred attempting to get variations"

    invoke-virtual {v9, v10, v1}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 251
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_2
    return-void

    .line 191
    .restart local v0    # "allocationCounter":I
    .restart local v4    # "maxAllocations":I
    .restart local v5    # "projectNamesList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v7    # "variations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    :cond_1
    :try_start_1
    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 192
    .local v6, "variationEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/amazon/insights/abtest/DefaultVariation;

    invoke-virtual {v9}, Lcom/amazon/insights/abtest/DefaultVariation;->isDefault()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 193
    invoke-static {}, Lcom/amazon/insights/abtest/DefaultABTestClient;->access$100()Lcom/amazon/insights/core/log/Logger;

    move-result-object v10

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Resolved default variation: \'"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/amazon/insights/abtest/DefaultVariation;

    invoke-virtual {v9}, Lcom/amazon/insights/abtest/DefaultVariation;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v11, "\' for project: \'"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v11, "\'"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v10, v9}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    goto :goto_3

    .line 197
    .end local v6    # "variationEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    :cond_3
    iget-object v9, p0, Lcom/amazon/insights/abtest/DefaultABTestClient$1;->val$getVariationHandler:Lcom/amazon/insights/core/DefaultInsightsHandler;

    new-instance v10, Lcom/amazon/insights/abtest/DefaultABTestClient$1$1;

    invoke-direct {v10, p0, v7}, Lcom/amazon/insights/abtest/DefaultABTestClient$1$1;-><init>(Lcom/amazon/insights/abtest/DefaultABTestClient$1;Ljava/util/Map;)V

    invoke-virtual {v9, v10}, Lcom/amazon/insights/core/DefaultInsightsHandler;->onComplete(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method
