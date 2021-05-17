.class public Lcom/amazon/insights/abtest/DefaultVariation$Builder;
.super Ljava/lang/Object;
.source "DefaultVariation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/insights/abtest/DefaultVariation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private applicationKey:Ljava/lang/String;

.field private appliedDate:Ljava/util/Date;

.field private experimentId:J

.field private expirationDate:Ljava/util/Date;

.field private projectName:Ljava/lang/String;

.field private source:Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

.field private uniqueId:Lcom/amazon/insights/core/idresolver/Id;

.field private variables:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private variationId:J

.field private variationName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const-wide/16 v1, 0x0

    .line 345
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 346
    const-string v0, ""

    iput-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->projectName:Ljava/lang/String;

    .line 347
    const-string v0, ""

    iput-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->applicationKey:Ljava/lang/String;

    .line 348
    iput-wide v1, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->experimentId:J

    .line 349
    iput-wide v1, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->variationId:J

    .line 350
    const-string v0, "DEFAULT"

    iput-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->variationName:Ljava/lang/String;

    .line 351
    invoke-static {}, Lcom/amazon/insights/core/idresolver/Id;->getEmptyId()Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->uniqueId:Lcom/amazon/insights/core/idresolver/Id;

    .line 352
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->variables:Ljava/util/Map;

    .line 353
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    iput-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->expirationDate:Ljava/util/Date;

    .line 354
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    iput-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->appliedDate:Ljava/util/Date;

    .line 355
    sget-object v0, Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;->DEFAULT:Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    iput-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->source:Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    return-void
.end method


# virtual methods
.method public build()Lcom/amazon/insights/abtest/DefaultVariation;
    .locals 1

    .prologue
    .line 461
    new-instance v0, Lcom/amazon/insights/abtest/DefaultVariation;

    invoke-direct {v0, p0}, Lcom/amazon/insights/abtest/DefaultVariation;-><init>(Lcom/amazon/insights/abtest/DefaultVariation$Builder;)V

    return-object v0
.end method

.method public getAllocationSource()Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;
    .locals 1

    .prologue
    .line 373
    iget-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->source:Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    return-object v0
.end method

.method public getApplicationKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 358
    iget-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->applicationKey:Ljava/lang/String;

    return-object v0
.end method

.method public getAppliedDate()Ljava/util/Date;
    .locals 3

    .prologue
    .line 450
    new-instance v0, Ljava/util/Date;

    iget-object v1, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->appliedDate:Ljava/util/Date;

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public getExperimentId()J
    .locals 2

    .prologue
    .line 388
    iget-wide v0, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->experimentId:J

    return-wide v0
.end method

.method public getExpirationDate()Ljava/util/Date;
    .locals 3

    .prologue
    .line 439
    new-instance v0, Ljava/util/Date;

    iget-object v1, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->expirationDate:Ljava/util/Date;

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public getProjectName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 377
    iget-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->projectName:Ljava/lang/String;

    return-object v0
.end method

.method public getUniqueId()Lcom/amazon/insights/core/idresolver/Id;
    .locals 1

    .prologue
    .line 417
    iget-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->uniqueId:Lcom/amazon/insights/core/idresolver/Id;

    return-object v0
.end method

.method public getVariables()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 428
    iget-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->variables:Ljava/util/Map;

    return-object v0
.end method

.method public getVariationId()J
    .locals 2

    .prologue
    .line 397
    iget-wide v0, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->variationId:J

    return-wide v0
.end method

.method public getVariationName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 406
    iget-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->variationName:Ljava/lang/String;

    return-object v0
.end method

.method public setAllocationSource(Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;)V
    .locals 0
    .param p1, "source"    # Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    .prologue
    .line 369
    iput-object p1, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->source:Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    .line 370
    return-void
.end method

.method public setApplicationKey(Ljava/lang/String;)Lcom/amazon/insights/abtest/DefaultVariation$Builder;
    .locals 0
    .param p1, "applicationKey"    # Ljava/lang/String;

    .prologue
    .line 362
    if-eqz p1, :cond_0

    .line 363
    iput-object p1, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->applicationKey:Ljava/lang/String;

    .line 365
    :cond_0
    return-object p0
.end method

.method public setAppliedDate(Ljava/util/Date;)Lcom/amazon/insights/abtest/DefaultVariation$Builder;
    .locals 3
    .param p1, "appliedDate"    # Ljava/util/Date;

    .prologue
    .line 454
    if-eqz p1, :cond_0

    .line 455
    new-instance v0, Ljava/util/Date;

    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    iput-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->appliedDate:Ljava/util/Date;

    .line 457
    :cond_0
    return-object p0
.end method

.method public setExperimentId(J)Lcom/amazon/insights/abtest/DefaultVariation$Builder;
    .locals 0
    .param p1, "experimentId"    # J

    .prologue
    .line 392
    iput-wide p1, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->experimentId:J

    .line 393
    return-object p0
.end method

.method public setExpirationDate(Ljava/util/Date;)Lcom/amazon/insights/abtest/DefaultVariation$Builder;
    .locals 3
    .param p1, "expirationDate"    # Ljava/util/Date;

    .prologue
    .line 443
    if-eqz p1, :cond_0

    .line 444
    new-instance v0, Ljava/util/Date;

    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    iput-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->expirationDate:Ljava/util/Date;

    .line 446
    :cond_0
    return-object p0
.end method

.method public setProjectName(Ljava/lang/String;)Lcom/amazon/insights/abtest/DefaultVariation$Builder;
    .locals 0
    .param p1, "projectName"    # Ljava/lang/String;

    .prologue
    .line 381
    if-eqz p1, :cond_0

    .line 382
    iput-object p1, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->projectName:Ljava/lang/String;

    .line 384
    :cond_0
    return-object p0
.end method

.method public setUniqueId(Lcom/amazon/insights/core/idresolver/Id;)Lcom/amazon/insights/abtest/DefaultVariation$Builder;
    .locals 0
    .param p1, "uniqueId"    # Lcom/amazon/insights/core/idresolver/Id;

    .prologue
    .line 421
    if-eqz p1, :cond_0

    .line 422
    iput-object p1, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->uniqueId:Lcom/amazon/insights/core/idresolver/Id;

    .line 424
    :cond_0
    return-object p0
.end method

.method public setVariables(Ljava/util/Map;)Lcom/amazon/insights/abtest/DefaultVariation$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/amazon/insights/abtest/DefaultVariation$Builder;"
        }
    .end annotation

    .prologue
    .line 432
    .local p1, "variables":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p1, :cond_0

    .line 433
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->variables:Ljava/util/Map;

    .line 435
    :cond_0
    return-object p0
.end method

.method public setVariationId(J)Lcom/amazon/insights/abtest/DefaultVariation$Builder;
    .locals 0
    .param p1, "variationId"    # J

    .prologue
    .line 401
    iput-wide p1, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->variationId:J

    .line 402
    return-object p0
.end method

.method public setVariationName(Ljava/lang/String;)Lcom/amazon/insights/abtest/DefaultVariation$Builder;
    .locals 0
    .param p1, "variationName"    # Ljava/lang/String;

    .prologue
    .line 410
    if-eqz p1, :cond_0

    .line 411
    iput-object p1, p0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->variationName:Ljava/lang/String;

    .line 413
    :cond_0
    return-object p0
.end method
