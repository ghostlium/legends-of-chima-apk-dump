.class public Lcom/amazon/insights/abtest/DefaultABTestClient;
.super Ljava/lang/Object;
.source "DefaultABTestClient.java"

# interfaces
.implements Lcom/amazon/insights/ABTestClient;


# static fields
.field protected static final ALLOW_OPERATION_AFTER_HEADER:Ljava/lang/String; = "x-amzn-Allow-Operation-After"

.field static final DEFAULT_ABTEST_ENABLEMENT:Z = true

.field static final DEFAULT_ALLOCATION_REQUEST_RETRIES:I = 0x1

.field static final DEFAULT_ENDPOINT:Ljava/lang/String; = "https://applab-sdk.amazon.com/1.0"

.field static final DEFAULT_MAX_ALLOCATIONS:I = 0xa

.field private static final ENDPOINT_PATH:Ljava/lang/String; = "%s/applications/%s/treatments"

.field static final KEY_ABTEST_ENABLED:Ljava/lang/String; = "isABTestEnabled"

.field static final KEY_ALLOCATION_REQUEST_RETRIES:Ljava/lang/String; = "allocationRequestRetries"

.field static final KEY_ENDPOINT:Ljava/lang/String; = "projectEndpoint"

.field static final KEY_MAX_ALLOCATIONS:Ljava/lang/String; = "maxAllocations"

.field static final KEY_VARIATION_IDS:Ljava/lang/String; = "_treatment_ids"

.field private static final logger:Lcom/amazon/insights/core/log/Logger;


# instance fields
.field private final appliedVariationIds:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final context:Lcom/amazon/insights/core/InsightsContext;

.field private final eventClient:Lcom/amazon/insights/event/InternalEventClient;

.field private final executor:Ljava/util/concurrent/ExecutorService;

.field private final variationCache:Lcom/amazon/insights/abtest/cache/VariationCache;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 51
    const-class v0, Lcom/amazon/insights/abtest/DefaultABTestClient;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/abtest/DefaultABTestClient;->logger:Lcom/amazon/insights/core/log/Logger;

    return-void
.end method

.method constructor <init>(Lcom/amazon/insights/core/InsightsContext;Ljava/util/concurrent/ExecutorService;Lcom/amazon/insights/event/InternalEventClient;Lcom/amazon/insights/abtest/cache/VariationCache;)V
    .locals 1
    .param p1, "context"    # Lcom/amazon/insights/core/InsightsContext;
    .param p2, "executor"    # Ljava/util/concurrent/ExecutorService;
    .param p3, "eventClient"    # Lcom/amazon/insights/event/InternalEventClient;
    .param p4, "variationCache"    # Lcom/amazon/insights/abtest/cache/VariationCache;

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    const-string v0, "A valid context wrapper must be provided"

    invoke-static {p1, v0}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    const-string v0, "A valid ExecutorService must be provided"

    invoke-static {p2, v0}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    iput-object p2, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->executor:Ljava/util/concurrent/ExecutorService;

    .line 83
    iput-object p1, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->context:Lcom/amazon/insights/core/InsightsContext;

    .line 84
    iput-object p3, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    .line 85
    iput-object p4, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->variationCache:Lcom/amazon/insights/abtest/cache/VariationCache;

    .line 86
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->appliedVariationIds:Ljava/util/Map;

    .line 87
    invoke-interface {p4}, Lcom/amazon/insights/abtest/cache/VariationCache;->getAll()Ljava/util/Map;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/amazon/insights/abtest/DefaultABTestClient;->setAppliedVariationIdsAsGlobalAttribute(Ljava/util/Map;)V

    .line 88
    return-void
.end method

.method static synthetic access$000(Lcom/amazon/insights/abtest/DefaultABTestClient;)I
    .locals 1
    .param p0, "x0"    # Lcom/amazon/insights/abtest/DefaultABTestClient;

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/amazon/insights/abtest/DefaultABTestClient;->getMaxAllocations()I

    move-result v0

    return v0
.end method

.method static synthetic access$100()Lcom/amazon/insights/core/log/Logger;
    .locals 1

    .prologue
    .line 50
    sget-object v0, Lcom/amazon/insights/abtest/DefaultABTestClient;->logger:Lcom/amazon/insights/core/log/Logger;

    return-object v0
.end method

.method static synthetic access$200(Lcom/amazon/insights/abtest/DefaultABTestClient;)Lcom/amazon/insights/core/InsightsContext;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/insights/abtest/DefaultABTestClient;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->context:Lcom/amazon/insights/core/InsightsContext;

    return-object v0
.end method

.method private allocateVariations(Ljava/util/Set;Lcom/amazon/insights/core/DefaultInsightsHandler;)Lcom/amazon/insights/core/DefaultInsightsHandler;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/amazon/insights/core/DefaultInsightsHandler",
            "<",
            "Lcom/amazon/insights/VariationSet;",
            ">;)",
            "Lcom/amazon/insights/core/DefaultInsightsHandler",
            "<",
            "Lcom/amazon/insights/VariationSet;",
            ">;"
        }
    .end annotation

    .prologue
    .line 166
    .local p1, "projectNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .local p2, "getVariationHandler":Lcom/amazon/insights/core/DefaultInsightsHandler;, "Lcom/amazon/insights/core/DefaultInsightsHandler<Lcom/amazon/insights/VariationSet;>;"
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 167
    .local v0, "dimensions":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    iget-object v1, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v1}, Lcom/amazon/insights/core/InsightsContext;->getUserProfile()Lcom/amazon/insights/UserProfile;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v1}, Lcom/amazon/insights/core/InsightsContext;->getUserProfile()Lcom/amazon/insights/UserProfile;

    move-result-object v1

    invoke-interface {v1}, Lcom/amazon/insights/UserProfile;->getDimensions()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 168
    new-instance v1, Ljava/util/HashMap;

    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v2}, Lcom/amazon/insights/core/InsightsContext;->getUserProfile()Lcom/amazon/insights/UserProfile;

    move-result-object v2

    invoke-interface {v2}, Lcom/amazon/insights/UserProfile;->getDimensions()Ljava/util/Map;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 170
    :cond_0
    iget-object v1, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/amazon/insights/abtest/DefaultABTestClient$1;

    invoke-direct {v2, p0, p1, v0, p2}, Lcom/amazon/insights/abtest/DefaultABTestClient$1;-><init>(Lcom/amazon/insights/abtest/DefaultABTestClient;Ljava/util/Set;Ljava/util/concurrent/atomic/AtomicReference;Lcom/amazon/insights/core/DefaultInsightsHandler;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 253
    return-object p2
.end method

.method private getEndpointUrl()Ljava/lang/String;
    .locals 3

    .prologue
    .line 551
    iget-object v0, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v0}, Lcom/amazon/insights/core/InsightsContext;->getConfiguration()Lcom/amazon/insights/core/configuration/Configuration;

    move-result-object v0

    const-string v1, "projectEndpoint"

    const-string v2, "https://applab-sdk.amazon.com/1.0"

    invoke-interface {v0, v1, v2}, Lcom/amazon/insights/core/configuration/Configuration;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getMaxAllocations()I
    .locals 3

    .prologue
    .line 555
    iget-object v0, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v0}, Lcom/amazon/insights/core/InsightsContext;->getConfiguration()Lcom/amazon/insights/core/configuration/Configuration;

    move-result-object v0

    const-string v1, "maxAllocations"

    const/16 v2, 0xa

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/amazon/insights/core/configuration/Configuration;->optInt(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public static newInstance(Lcom/amazon/insights/core/InsightsContext;Lcom/amazon/insights/event/InternalEventClient;)Lcom/amazon/insights/abtest/DefaultABTestClient;
    .locals 3
    .param p0, "context"    # Lcom/amazon/insights/core/InsightsContext;
    .param p1, "eventClient"    # Lcom/amazon/insights/event/InternalEventClient;

    .prologue
    .line 74
    invoke-static {p0}, Lcom/amazon/insights/abtest/cache/VariationCaches;->tryGetFileVariationCache(Lcom/amazon/insights/core/InsightsContext;)Lcom/amazon/insights/abtest/cache/VariationCache;

    move-result-object v0

    .line 75
    .local v0, "variationCache":Lcom/amazon/insights/abtest/cache/VariationCache;
    new-instance v1, Lcom/amazon/insights/abtest/DefaultABTestClient;

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    invoke-direct {v1, p0, v2, p1, v0}, Lcom/amazon/insights/abtest/DefaultABTestClient;-><init>(Lcom/amazon/insights/core/InsightsContext;Ljava/util/concurrent/ExecutorService;Lcom/amazon/insights/event/InternalEventClient;Lcom/amazon/insights/abtest/cache/VariationCache;)V

    return-object v1
.end method

.method private setAppliedVariationIdsAsGlobalAttribute(Ljava/util/Map;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/amazon/insights/abtest/DefaultVariation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "allVariations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 91
    invoke-static {p1}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->appliedVariationIds:Ljava/util/Map;

    if-eqz v2, :cond_0

    move v2, v3

    :goto_0
    invoke-static {v2}, Lcom/amazon/insights/core/util/Preconditions;->checkState(Z)V

    .line 93
    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    if-eqz v2, :cond_1

    :goto_1
    invoke-static {v3}, Lcom/amazon/insights/core/util/Preconditions;->checkState(Z)V

    .line 95
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 96
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    iget-object v3, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->appliedVariationIds:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/amazon/insights/abtest/DefaultVariation;

    invoke-virtual {v2}, Lcom/amazon/insights/abtest/DefaultVariation;->getVariationId()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    move v2, v4

    .line 92
    goto :goto_0

    :cond_1
    move v3, v4

    .line 93
    goto :goto_1

    .line 99
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_2
    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    const-string v3, "_treatment_ids"

    invoke-interface {v2, v3}, Lcom/amazon/insights/event/InternalEventClient;->removeGlobalAttribute(Ljava/lang/String;)V

    .line 100
    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    const-string v3, "_treatment_ids"

    new-instance v4, Lorg/json/JSONArray;

    iget-object v5, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->appliedVariationIds:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v4}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lcom/amazon/insights/event/InternalEventClient;->addGlobalAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    return-void
.end method

.method static variationToHttpRequest(Lcom/amazon/insights/abtest/DefaultVariation;)Lorg/json/JSONObject;
    .locals 5
    .param p0, "variation"    # Lcom/amazon/insights/abtest/DefaultVariation;

    .prologue
    .line 475
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 477
    .local v1, "jsonRequest":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "experimentName"

    invoke-virtual {p0}, Lcom/amazon/insights/abtest/DefaultVariation;->getProjectName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 478
    invoke-virtual {p0}, Lcom/amazon/insights/abtest/DefaultVariation;->isDefault()Z

    move-result v2

    if-nez v2, :cond_0

    .line 479
    const-string v2, "experimentId"

    invoke-virtual {p0}, Lcom/amazon/insights/abtest/DefaultVariation;->getExperimentId()J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 480
    const-string v2, "treatmentId"

    invoke-virtual {p0}, Lcom/amazon/insights/abtest/DefaultVariation;->getVariationId()J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 481
    const-string v2, "treatmentGroup"

    invoke-virtual {p0}, Lcom/amazon/insights/abtest/DefaultVariation;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 482
    const-string v2, "uniqueId"

    invoke-virtual {p0}, Lcom/amazon/insights/abtest/DefaultVariation;->getUniqueId()Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v3

    invoke-virtual {v3}, Lcom/amazon/insights/core/idresolver/Id;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 487
    :cond_0
    :goto_0
    return-object v1

    .line 484
    :catch_0
    move-exception v0

    .line 485
    .local v0, "e":Lorg/json/JSONException;
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method allocateCachedVariations(Ljava/util/Set;Ljava/util/Map;)Ljava/util/Set;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/amazon/insights/abtest/DefaultVariation;",
            ">;)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 277
    .local p1, "projectNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .local p2, "variations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    const-string v3, "The set of project names must not be null"

    invoke-static {p1, v3}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    const-string v3, "The map of variations must not be null"

    invoke-static {p2, v3}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 280
    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v3

    if-nez v3, :cond_1

    .line 293
    :cond_0
    return-object p1

    .line 284
    :cond_1
    iget-object v3, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->variationCache:Lcom/amazon/insights/abtest/cache/VariationCache;

    invoke-interface {v3, p1}, Lcom/amazon/insights/abtest/cache/VariationCache;->get(Ljava/util/Set;)Ljava/util/Map;

    move-result-object v1

    .line 285
    .local v1, "cachedVariations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/abtest/DefaultVariation;

    .line 286
    .local v0, "cachedVariation":Lcom/amazon/insights/abtest/DefaultVariation;
    invoke-virtual {v0}, Lcom/amazon/insights/abtest/DefaultVariation;->isExpired()Z

    move-result v3

    if-nez v3, :cond_2

    .line 287
    invoke-virtual {v0}, Lcom/amazon/insights/abtest/DefaultVariation;->getProjectName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 289
    :cond_2
    invoke-virtual {v0}, Lcom/amazon/insights/abtest/DefaultVariation;->getProjectName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    sget-object v4, Lcom/amazon/insights/abtest/DefaultABTestClient;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Resolved "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lcom/amazon/insights/abtest/DefaultVariation;->isExpired()Z

    move-result v3

    if-eqz v3, :cond_3

    const-string v3, "expired"

    :goto_1
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " variation: \'"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/amazon/insights/abtest/DefaultVariation;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "\' for project: \'"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/amazon/insights/abtest/DefaultVariation;->getProjectName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "\' from cache"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/amazon/insights/core/log/Logger;->devi(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    const-string v3, "unexpired"

    goto :goto_1
.end method

.method allocateDefaultVariations(Ljava/util/Set;Ljava/util/Map;)Ljava/util/Set;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/amazon/insights/abtest/DefaultVariation;",
            ">;)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 257
    .local p1, "projectNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .local p2, "variations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    const-string v3, "The set of project names must not be null"

    invoke-static {p1, v3}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    const-string v3, "The map of variations must not be null"

    invoke-static {p2, v3}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v3

    if-nez v3, :cond_1

    .line 273
    :cond_0
    return-object p1

    .line 264
    :cond_1
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 265
    .local v2, "projectName":Ljava/lang/String;
    new-instance v3, Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    invoke-direct {v3}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;-><init>()V

    invoke-virtual {v3, v2}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->setProjectName(Ljava/lang/String;)Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v4}, Lcom/amazon/insights/core/InsightsContext;->getCredentials()Lcom/amazon/insights/InsightsCredentials;

    move-result-object v4

    invoke-interface {v4}, Lcom/amazon/insights/InsightsCredentials;->getApplicationKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->setApplicationKey(Ljava/lang/String;)Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v4}, Lcom/amazon/insights/core/InsightsContext;->getUniqueId()Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->setUniqueId(Lcom/amazon/insights/core/idresolver/Id;)Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->build()Lcom/amazon/insights/abtest/DefaultVariation;

    move-result-object v0

    .line 270
    .local v0, "defaultVariation":Lcom/amazon/insights/abtest/DefaultVariation;
    invoke-interface {p2, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method allocateServerVariations(Ljava/util/Set;Ljava/util/Map;Ljava/util/Map;)Ljava/util/Set;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/amazon/insights/abtest/DefaultVariation;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .local p1, "projectNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .local p2, "variations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    .local p3, "dimensions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v8, 0x1

    .line 297
    const-string v5, "The set of project names must not be null"

    invoke-static {p1, v5}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    const-string v5, "The map of variations must not be null"

    invoke-static {p2, v5}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 300
    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v5

    if-nez v5, :cond_1

    .line 345
    :cond_0
    :goto_0
    return-object p1

    .line 305
    :cond_1
    iget-object v5, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v5}, Lcom/amazon/insights/core/InsightsContext;->getConfiguration()Lcom/amazon/insights/core/configuration/Configuration;

    move-result-object v5

    const-string v6, "isABTestEnabled"

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Lcom/amazon/insights/core/configuration/Configuration;->optBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 308
    invoke-virtual {p0}, Lcom/amazon/insights/abtest/DefaultABTestClient;->canHandleRequest()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 313
    invoke-virtual {p0, p1, p2, p3}, Lcom/amazon/insights/abtest/DefaultABTestClient;->createHttpRequest(Ljava/util/Set;Ljava/util/Map;Ljava/util/Map;)Lcom/amazon/insights/core/http/HttpClient$Request;

    move-result-object v0

    .line 315
    .local v0, "httpRequest":Lcom/amazon/insights/core/http/HttpClient$Request;
    if-nez v0, :cond_2

    .line 316
    sget-object v5, Lcom/amazon/insights/abtest/DefaultABTestClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v6, "There was an error when building the http request"

    invoke-virtual {v5, v6}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;)V

    goto :goto_0

    .line 320
    :cond_2
    iget-object v5, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v5}, Lcom/amazon/insights/core/InsightsContext;->getHttpClient()Lcom/amazon/insights/core/http/HttpClient;

    move-result-object v5

    iget-object v6, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v6}, Lcom/amazon/insights/core/InsightsContext;->getConfiguration()Lcom/amazon/insights/core/configuration/Configuration;

    move-result-object v6

    const-string v7, "allocationRequestRetries"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Lcom/amazon/insights/core/configuration/Configuration;->optInt(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v0, v6}, Lcom/amazon/insights/core/http/HttpClient;->execute(Lcom/amazon/insights/core/http/HttpClient$Request;Ljava/lang/Integer;)Lcom/amazon/insights/core/http/HttpClient$Response;

    move-result-object v2

    .line 322
    .local v2, "response":Lcom/amazon/insights/core/http/HttpClient$Response;
    if-nez v2, :cond_3

    .line 323
    sget-object v5, Lcom/amazon/insights/abtest/DefaultABTestClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v6, "No variations were retrieved from the server"

    invoke-virtual {v5, v6}, Lcom/amazon/insights/core/log/Logger;->deve(Ljava/lang/String;)V

    .line 324
    sget-object v5, Lcom/amazon/insights/abtest/DefaultABTestClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v6, "The http request returned a null http response"

    invoke-virtual {v5, v6}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;)V

    goto :goto_0

    .line 328
    :cond_3
    invoke-interface {v2}, Lcom/amazon/insights/core/http/HttpClient$Response;->getCode()I

    move-result v5

    const/16 v6, 0xc8

    if-ne v5, v6, :cond_6

    .line 329
    invoke-interface {v2}, Lcom/amazon/insights/core/http/HttpClient$Response;->getResponse()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/amazon/insights/abtest/DefaultABTestClient;->parseVariationResponse(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v3

    .line 331
    .local v3, "serverVariations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 332
    .local v4, "variationEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {p1, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 333
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {p1, v5}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 335
    :cond_4
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-interface {p2, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 339
    .end local v4    # "variationEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    :cond_5
    invoke-virtual {p0, v3}, Lcom/amazon/insights/abtest/DefaultABTestClient;->cacheVariations(Ljava/util/Map;)V

    goto/16 :goto_0

    .line 341
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v3    # "serverVariations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    :cond_6
    sget-object v5, Lcom/amazon/insights/abtest/DefaultABTestClient;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unable to successfully retrieve variations from server. Response code ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v2}, Lcom/amazon/insights/core/http/HttpClient$Response;->getCode()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ") "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v2}, Lcom/amazon/insights/core/http/HttpUtil;->getMessageForResponse(Lcom/amazon/insights/core/http/HttpClient$Response;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    .line 342
    sget-object v5, Lcom/amazon/insights/abtest/DefaultABTestClient;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Recieved a bad response: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/amazon/insights/core/log/Logger;->w(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method buildAllocationRequest(Ljava/util/Set;Ljava/util/Map;)Lorg/json/JSONObject;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/amazon/insights/abtest/DefaultVariation;",
            ">;)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 449
    .local p1, "projectNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .local p2, "variations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 451
    .local v1, "jsonRequest":Lorg/json/JSONObject;
    const-string v6, "uniqueId"

    iget-object v7, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v7}, Lcom/amazon/insights/core/InsightsContext;->getUniqueId()Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v7

    invoke-virtual {v7}, Lcom/amazon/insights/core/idresolver/Id;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 454
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 457
    .local v2, "jsonVariationRequests":Lorg/json/JSONArray;
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 458
    .local v3, "projectName":Ljava/lang/String;
    invoke-interface {p2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/amazon/insights/abtest/DefaultVariation;

    .line 459
    .local v4, "variation":Lcom/amazon/insights/abtest/DefaultVariation;
    invoke-static {v4}, Lcom/amazon/insights/abtest/DefaultABTestClient;->variationToHttpRequest(Lcom/amazon/insights/abtest/DefaultVariation;)Lorg/json/JSONObject;

    move-result-object v5

    .line 460
    .local v5, "variationJson":Lorg/json/JSONObject;
    if-eqz v5, :cond_0

    .line 461
    invoke-virtual {v2, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    .line 467
    .end local v3    # "projectName":Ljava/lang/String;
    .end local v4    # "variation":Lcom/amazon/insights/abtest/DefaultVariation;
    .end local v5    # "variationJson":Lorg/json/JSONObject;
    :cond_1
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lez v6, :cond_2

    .line 468
    const-string v6, "treatmentRequests"

    invoke-virtual {v1, v6, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 470
    :cond_2
    return-object v1
.end method

.method buildRequestBody(Ljava/util/Set;Ljava/util/Map;Ljava/util/Map;)Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/amazon/insights/abtest/DefaultVariation;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .local p1, "projectNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .local p2, "variations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    .local p3, "dimensions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v3, 0x0

    .line 389
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v5

    if-nez v5, :cond_1

    .line 420
    :cond_0
    :goto_0
    return-object v3

    .line 394
    :cond_1
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 396
    .local v2, "jsonRequest":Lorg/json/JSONObject;
    :try_start_0
    invoke-virtual {p0, p3}, Lcom/amazon/insights/abtest/DefaultABTestClient;->buildUserProfile(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object v4

    .line 397
    .local v4, "userProfile":Lorg/json/JSONObject;
    invoke-virtual {p0, p1, p2}, Lcom/amazon/insights/abtest/DefaultABTestClient;->buildAllocationRequest(Ljava/util/Set;Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object v0

    .line 398
    .local v0, "allocationRequest":Lorg/json/JSONObject;
    if-eqz v0, :cond_3

    .line 399
    const-string v5, "treatmentAllocationRequest"

    invoke-virtual {v2, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 405
    if-eqz v4, :cond_2

    .line 406
    const-string v5, "userProfile"

    invoke-virtual {v2, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 414
    .end local v0    # "allocationRequest":Lorg/json/JSONObject;
    .end local v4    # "userProfile":Lorg/json/JSONObject;
    :cond_2
    :goto_1
    if-eqz v2, :cond_4

    .line 415
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    .line 416
    .local v3, "jsonRequestBody":Ljava/lang/String;
    sget-object v5, Lcom/amazon/insights/abtest/DefaultABTestClient;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Request: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/amazon/insights/core/log/Logger;->i(Ljava/lang/String;)V

    goto :goto_0

    .line 401
    .end local v3    # "jsonRequestBody":Ljava/lang/String;
    .restart local v0    # "allocationRequest":Lorg/json/JSONObject;
    .restart local v4    # "userProfile":Lorg/json/JSONObject;
    :cond_3
    :try_start_1
    sget-object v5, Lcom/amazon/insights/abtest/DefaultABTestClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v6, "Request for variations was empty"

    invoke-virtual {v5, v6}, Lcom/amazon/insights/core/log/Logger;->deve(Ljava/lang/String;)V

    .line 402
    sget-object v5, Lcom/amazon/insights/abtest/DefaultABTestClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v6, "Allocation request is null"

    invoke-virtual {v5, v6}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 409
    .end local v0    # "allocationRequest":Lorg/json/JSONObject;
    .end local v4    # "userProfile":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 410
    .local v1, "e":Lorg/json/JSONException;
    const/4 v2, 0x0

    .line 411
    sget-object v5, Lcom/amazon/insights/abtest/DefaultABTestClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v6, "Error building the server request"

    invoke-virtual {v5, v6, v1}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 419
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_4
    sget-object v5, Lcom/amazon/insights/abtest/DefaultABTestClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v6, "Request body is null"

    invoke-virtual {v5, v6}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;)V

    goto :goto_0
.end method

.method buildUserProfile(Ljava/util/Map;)Lorg/json/JSONObject;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 431
    .local p1, "dimensions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v3

    if-nez v3, :cond_2

    .line 432
    :cond_0
    const/4 v1, 0x0

    .line 445
    :cond_1
    return-object v1

    .line 435
    :cond_2
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 436
    .local v1, "dimensionsJson":Lorg/json/JSONObject;
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_3
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 437
    .local v0, "dimension":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    const-class v3, Ljava/lang/Number;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 438
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 439
    :cond_4
    const-class v3, Ljava/lang/Boolean;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 440
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 441
    :cond_5
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-class v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 442
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0
.end method

.method cacheVariations(Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/amazon/insights/abtest/DefaultVariation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 381
    .local p1, "variations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/insights/abtest/DefaultVariation;

    .line 382
    .local v1, "variation":Lcom/amazon/insights/abtest/DefaultVariation;
    invoke-virtual {v1}, Lcom/amazon/insights/abtest/DefaultVariation;->isDefault()Z

    move-result v2

    if-nez v2, :cond_0

    .line 383
    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->variationCache:Lcom/amazon/insights/abtest/cache/VariationCache;

    invoke-interface {v2, v1}, Lcom/amazon/insights/abtest/cache/VariationCache;->put(Lcom/amazon/insights/abtest/DefaultVariation;)Z

    goto :goto_0

    .line 386
    .end local v1    # "variation":Lcom/amazon/insights/abtest/DefaultVariation;
    :cond_1
    return-void
.end method

.method protected canHandleRequest()Z
    .locals 3

    .prologue
    .line 349
    iget-object v1, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v1}, Lcom/amazon/insights/core/InsightsContext;->getSystem()Lcom/amazon/insights/core/system/System;

    move-result-object v1

    invoke-interface {v1}, Lcom/amazon/insights/core/system/System;->getConnectivity()Lcom/amazon/insights/core/system/Connectivity;

    move-result-object v1

    invoke-interface {v1}, Lcom/amazon/insights/core/system/Connectivity;->isConnected()Z

    move-result v0

    .line 350
    .local v0, "deviceConnected":Z
    if-nez v0, :cond_0

    .line 351
    sget-object v1, Lcom/amazon/insights/abtest/DefaultABTestClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Cannot retrieve variations from server due to the device not being connected"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    .line 353
    :cond_0
    return v0
.end method

.method createHttpRequest(Ljava/util/Set;Ljava/util/Map;Ljava/util/Map;)Lcom/amazon/insights/core/http/HttpClient$Request;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/amazon/insights/abtest/DefaultVariation;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/amazon/insights/core/http/HttpClient$Request;"
        }
    .end annotation

    .prologue
    .local p1, "projectNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .local p2, "variations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    .local p3, "dimensions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 359
    const-string v2, "An allocation request must be provided"

    invoke-static {p1, v2}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 360
    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v2

    if-lez v2, :cond_0

    move v2, v3

    :goto_0
    const-string v5, "At least one project must be specified"

    invoke-static {v2, v5}, Lcom/amazon/insights/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 362
    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v2}, Lcom/amazon/insights/core/InsightsContext;->getHttpClient()Lcom/amazon/insights/core/http/HttpClient;

    move-result-object v2

    invoke-interface {v2}, Lcom/amazon/insights/core/http/HttpClient;->newRequest()Lcom/amazon/insights/core/http/HttpClient$Request;

    move-result-object v2

    const-string v5, "%s/applications/%s/treatments"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    invoke-direct {p0}, Lcom/amazon/insights/abtest/DefaultABTestClient;->getEndpointUrl()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v4

    iget-object v4, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v4}, Lcom/amazon/insights/core/InsightsContext;->getCredentials()Lcom/amazon/insights/InsightsCredentials;

    move-result-object v4

    invoke-interface {v4}, Lcom/amazon/insights/InsightsCredentials;->getApplicationKey()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v6, v3

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/amazon/insights/core/http/HttpClient$Request;->setUrl(Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Request;

    move-result-object v2

    sget-object v3, Lcom/amazon/insights/core/http/HttpClient$HttpMethod;->POST:Lcom/amazon/insights/core/http/HttpClient$HttpMethod;

    invoke-interface {v2, v3}, Lcom/amazon/insights/core/http/HttpClient$Request;->setMethod(Lcom/amazon/insights/core/http/HttpClient$HttpMethod;)Lcom/amazon/insights/core/http/HttpClient$Request;

    move-result-object v1

    .line 368
    .local v1, "httpRequest":Lcom/amazon/insights/core/http/HttpClient$Request;
    invoke-virtual {p0, p1, p2, p3}, Lcom/amazon/insights/abtest/DefaultABTestClient;->buildRequestBody(Ljava/util/Set;Ljava/util/Map;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    .line 370
    .local v0, "body":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 371
    const/4 v1, 0x0

    .line 377
    .end local v1    # "httpRequest":Lcom/amazon/insights/core/http/HttpClient$Request;
    :goto_1
    return-object v1

    .end local v0    # "body":Ljava/lang/String;
    :cond_0
    move v2, v4

    .line 360
    goto :goto_0

    .line 375
    .restart local v0    # "body":Ljava/lang/String;
    .restart local v1    # "httpRequest":Lcom/amazon/insights/core/http/HttpClient$Request;
    :cond_1
    invoke-interface {v1, v0}, Lcom/amazon/insights/core/http/HttpClient$Request;->setPostBody(Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Request;

    goto :goto_1
.end method

.method public varargs getVariations([Ljava/lang/String;)Lcom/amazon/insights/InsightsHandler;
    .locals 10
    .param p1, "projectNames"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Lcom/amazon/insights/InsightsHandler",
            "<",
            "Lcom/amazon/insights/VariationSet;",
            ">;"
        }
    .end annotation

    .prologue
    .line 139
    new-instance v1, Lcom/amazon/insights/core/DefaultInsightsHandler;

    invoke-direct {v1}, Lcom/amazon/insights/core/DefaultInsightsHandler;-><init>()V

    .line 140
    .local v1, "getVariationHandler":Lcom/amazon/insights/core/DefaultInsightsHandler;, "Lcom/amazon/insights/core/DefaultInsightsHandler<Lcom/amazon/insights/VariationSet;>;"
    if-eqz p1, :cond_4

    array-length v6, p1

    if-lez v6, :cond_4

    .line 142
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 143
    .local v5, "projectNamesSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v4, v0, v2

    .line 144
    .local v4, "projectName":Ljava/lang/String;
    if-eqz v4, :cond_0

    invoke-interface {v5, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 145
    invoke-interface {v5, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 143
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 149
    .end local v4    # "projectName":Ljava/lang/String;
    :cond_1
    invoke-interface {v5}, Ljava/util/Set;->size()I

    move-result v6

    if-lez v6, :cond_3

    .line 150
    sget-object v6, Lcom/amazon/insights/abtest/DefaultABTestClient;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Attempting to retrieve variation(s) for project(s):"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v5}, Lcom/amazon/insights/core/util/StringUtil;->convertSetToString(Ljava/util/Set;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/amazon/insights/core/log/Logger;->devi(Ljava/lang/String;)V

    .line 151
    invoke-direct {p0, v5, v1}, Lcom/amazon/insights/abtest/DefaultABTestClient;->allocateVariations(Ljava/util/Set;Lcom/amazon/insights/core/DefaultInsightsHandler;)Lcom/amazon/insights/core/DefaultInsightsHandler;

    .line 162
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v5    # "projectNamesSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_2
    :goto_1
    return-object v1

    .line 153
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v2    # "i$":I
    .restart local v3    # "len$":I
    .restart local v5    # "projectNamesSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_3
    new-instance v6, Lcom/amazon/insights/error/InvalidArgumentError;

    const-string v7, "projectNames"

    const-string v8, "getVariation"

    const-string v9, "No project names were provided."

    invoke-direct {v6, v7, v8, v9}, Lcom/amazon/insights/error/InvalidArgumentError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v6}, Lcom/amazon/insights/core/DefaultInsightsHandler;->onError(Lcom/amazon/insights/error/InsightsError;)V

    goto :goto_1

    .line 156
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v5    # "projectNamesSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_4
    if-nez p1, :cond_5

    .line 157
    new-instance v6, Lcom/amazon/insights/error/NullArgumentError;

    const-string v7, "projectNames"

    const-string v8, "getVariation"

    invoke-direct {v6, v7, v8}, Lcom/amazon/insights/error/NullArgumentError;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v6}, Lcom/amazon/insights/core/DefaultInsightsHandler;->onError(Lcom/amazon/insights/error/InsightsError;)V

    goto :goto_1

    .line 158
    :cond_5
    array-length v6, p1

    if-nez v6, :cond_2

    .line 159
    new-instance v6, Lcom/amazon/insights/error/InvalidArgumentError;

    const-string v7, "projectNames"

    const-string v8, "getVariation"

    const-string v9, "No project names were provided."

    invoke-direct {v6, v7, v8, v9}, Lcom/amazon/insights/error/InvalidArgumentError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v6}, Lcom/amazon/insights/core/DefaultInsightsHandler;->onError(Lcom/amazon/insights/error/InsightsError;)V

    goto :goto_1
.end method

.method parseVariationResponse(Ljava/lang/String;)Ljava/util/Map;
    .locals 20
    .param p1, "response"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/amazon/insights/abtest/DefaultVariation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 491
    new-instance v15, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v15}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 492
    .local v15, "variations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    if-eqz p1, :cond_0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v17

    if-nez v17, :cond_1

    .line 547
    :cond_0
    :goto_0
    return-object v15

    .line 497
    :cond_1
    :try_start_0
    new-instance v9, Lorg/json/JSONObject;

    move-object/from16 v0, p1

    invoke-direct {v9, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 498
    .local v9, "json":Lorg/json/JSONObject;
    const-string v17, "applicationKey"

    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 499
    .local v2, "applicationKey":Ljava/lang/String;
    const-string v17, "uniqueId"

    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/amazon/insights/core/idresolver/Id;->valueOf(Ljava/lang/String;)Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v11

    .line 502
    .local v11, "uniqueId":Lcom/amazon/insights/core/idresolver/Id;
    const-string v17, "treatments"

    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v17

    if-nez v17, :cond_0

    .line 503
    const-string v17, "treatments"

    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v16

    .line 505
    .local v16, "variationsJson":Lorg/json/JSONArray;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    :try_start_1
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONArray;->length()I

    move-result v17

    move/from16 v0, v17

    if-ge v7, v0, :cond_0

    .line 506
    new-instance v13, Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    invoke-direct {v13}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;-><init>()V

    .line 507
    .local v13, "variationBuilder":Lcom/amazon/insights/abtest/DefaultVariation$Builder;
    invoke-virtual {v13, v2}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->setApplicationKey(Ljava/lang/String;)Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    .line 508
    invoke-virtual {v13, v11}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->setUniqueId(Lcom/amazon/insights/core/idresolver/Id;)Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    .line 510
    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v14

    .line 511
    .local v14, "variationJson":Lorg/json/JSONObject;
    if-eqz v14, :cond_4

    .line 512
    const-string v17, "experimentId"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v17

    move-wide/from16 v0, v17

    invoke-virtual {v13, v0, v1}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->setExperimentId(J)Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    .line 513
    const-string v17, "treatmentId"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v17

    move-wide/from16 v0, v17

    invoke-virtual {v13, v0, v1}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->setVariationId(J)Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    .line 514
    const-string v17, "experimentName"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->setProjectName(Ljava/lang/String;)Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    .line 515
    const-string v17, "treatmentGroup"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->setVariationName(Ljava/lang/String;)Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    .line 516
    new-instance v17, Ljava/util/Date;

    const-string v18, "expirationDate"

    move-object/from16 v0, v18

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v18

    invoke-direct/range {v17 .. v19}, Ljava/util/Date;-><init>(J)V

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->setExpirationDate(Ljava/util/Date;)Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    .line 517
    sget-object v17, Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;->SERVER:Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->setAllocationSource(Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;)V

    .line 518
    const-string v17, "factors"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v17

    if-nez v17, :cond_4

    .line 519
    const-string v17, "factors"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    .line 520
    .local v5, "factors":Lorg/json/JSONArray;
    if-eqz v5, :cond_4

    .line 521
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 522
    .local v6, "factorsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v8, 0x0

    .local v8, "index":I
    :goto_2
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v17

    move/from16 v0, v17

    if-ge v8, v0, :cond_3

    .line 523
    invoke-virtual {v5, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 524
    .local v4, "factor":Lorg/json/JSONObject;
    if-eqz v4, :cond_2

    .line 525
    const-string v17, "name"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 526
    .local v10, "key":Ljava/lang/String;
    const-string v17, "value"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 527
    .local v12, "value":Ljava/lang/String;
    invoke-interface {v6, v10, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 522
    .end local v10    # "key":Ljava/lang/String;
    .end local v12    # "value":Ljava/lang/String;
    :cond_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 530
    .end local v4    # "factor":Lorg/json/JSONObject;
    :cond_3
    invoke-virtual {v13, v6}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->setVariables(Ljava/util/Map;)Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    .line 534
    .end local v5    # "factors":Lorg/json/JSONArray;
    .end local v6    # "factorsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v8    # "index":I
    :cond_4
    invoke-virtual {v13}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->getProjectName()Ljava/lang/String;

    move-result-object v17

    invoke-virtual {v13}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->build()Lcom/amazon/insights/abtest/DefaultVariation;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-interface {v15, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 535
    sget-object v17, Lcom/amazon/insights/abtest/DefaultABTestClient;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Resolved variation: \'"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual {v13}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->getVariationName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "\' for project: \'"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual {v13}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->getProjectName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "\' from server"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lcom/amazon/insights/core/log/Logger;->devi(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 505
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_1

    .line 537
    .end local v13    # "variationBuilder":Lcom/amazon/insights/abtest/DefaultVariation$Builder;
    .end local v14    # "variationJson":Lorg/json/JSONObject;
    :catch_0
    move-exception v3

    .line 538
    .local v3, "ex":Lorg/json/JSONException;
    :try_start_2
    sget-object v17, Lcom/amazon/insights/abtest/DefaultABTestClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v18, "There was an issue parsing the variation(s) received from the server"

    invoke-virtual/range {v17 .. v18}, Lcom/amazon/insights/core/log/Logger;->deve(Ljava/lang/String;)V

    .line 539
    sget-object v17, Lcom/amazon/insights/abtest/DefaultABTestClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v18, "Error parsing the variation response."

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v0, v1, v3}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_0

    .line 542
    .end local v2    # "applicationKey":Ljava/lang/String;
    .end local v3    # "ex":Lorg/json/JSONException;
    .end local v7    # "i":I
    .end local v9    # "json":Lorg/json/JSONObject;
    .end local v11    # "uniqueId":Lcom/amazon/insights/core/idresolver/Id;
    .end local v16    # "variationsJson":Lorg/json/JSONArray;
    :catch_1
    move-exception v3

    .line 543
    .restart local v3    # "ex":Lorg/json/JSONException;
    sget-object v17, Lcom/amazon/insights/abtest/DefaultABTestClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v18, "There was an issue parsing the variation(s) received from the server"

    invoke-virtual/range {v17 .. v18}, Lcom/amazon/insights/core/log/Logger;->deve(Ljava/lang/String;)V

    .line 544
    sget-object v17, Lcom/amazon/insights/abtest/DefaultABTestClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v18, "Error parsing the server response body."

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v0, v1, v3}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0
.end method

.method public setVariationIdsFromAllocatedVariation(Lcom/amazon/insights/abtest/DefaultVariation;)V
    .locals 7
    .param p1, "variation"    # Lcom/amazon/insights/abtest/DefaultVariation;

    .prologue
    const/4 v3, 0x0

    .line 104
    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    :goto_0
    const-string v4, "An event client must be provided"

    invoke-static {v2, v4}, Lcom/amazon/insights/core/util/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 105
    monitor-enter p0

    .line 109
    :try_start_0
    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->appliedVariationIds:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation;->getProjectName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 110
    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->appliedVariationIds:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation;->getProjectName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 111
    .local v0, "id":Ljava/lang/Long;
    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation;->getVariationId()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 112
    monitor-exit p0

    .line 135
    .end local v0    # "id":Ljava/lang/Long;
    :cond_0
    :goto_1
    return-void

    :cond_1
    move v2, v3

    .line 104
    goto :goto_0

    .line 116
    :cond_2
    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation;->isDefault()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 117
    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->appliedVariationIds:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation;->getProjectName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    :goto_2
    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    const-string v4, "_treatment_ids"

    invoke-interface {v2, v4}, Lcom/amazon/insights/event/InternalEventClient;->removeGlobalAttribute(Ljava/lang/String;)V

    .line 122
    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    const-string v4, "_treatment_ids"

    new-instance v5, Lorg/json/JSONArray;

    iget-object v6, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->appliedVariationIds:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v5}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Lcom/amazon/insights/event/InternalEventClient;->addGlobalAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 125
    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation;->isDefault()Z

    move-result v2

    if-nez v2, :cond_0

    .line 126
    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    const-string v4, "_TreatmentsAllocated"

    invoke-interface {v2, v4}, Lcom/amazon/insights/event/InternalEventClient;->createEvent(Ljava/lang/String;)Lcom/amazon/insights/Event;

    move-result-object v2

    const-string v4, "_treatment_group"

    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Lcom/amazon/insights/Event;->withAttribute(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/Event;

    move-result-object v2

    const-string v4, "_treatment_id"

    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation;->getVariationId()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Lcom/amazon/insights/Event;->withAttribute(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/Event;

    move-result-object v2

    const-string v4, "_experiment_id"

    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation;->getExperimentId()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Lcom/amazon/insights/Event;->withAttribute(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/Event;

    move-result-object v2

    const-string v4, "_application_key"

    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation;->getApplicationKey()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Lcom/amazon/insights/Event;->withAttribute(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/Event;

    move-result-object v2

    const-string v4, "_source"

    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation;->getAllocationSource()Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    move-result-object v5

    invoke-virtual {v5}, Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;->name()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Lcom/amazon/insights/Event;->withAttribute(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/Event;

    move-result-object v2

    const-string v4, "_applied_date"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Lcom/amazon/insights/Event;->withMetric(Ljava/lang/String;Ljava/lang/Number;)Lcom/amazon/insights/Event;

    move-result-object v1

    .line 133
    .local v1, "recordEvent":Lcom/amazon/insights/Event;
    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    invoke-interface {v2, v1, v3}, Lcom/amazon/insights/event/InternalEventClient;->recordEvent(Lcom/amazon/insights/Event;Z)V

    goto/16 :goto_1

    .line 119
    .end local v1    # "recordEvent":Lcom/amazon/insights/Event;
    :cond_3
    :try_start_1
    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultABTestClient;->appliedVariationIds:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation;->getProjectName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation;->getVariationId()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_2

    .line 123
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method
