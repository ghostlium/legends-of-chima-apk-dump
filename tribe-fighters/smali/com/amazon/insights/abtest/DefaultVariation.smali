.class public Lcom/amazon/insights/abtest/DefaultVariation;
.super Ljava/lang/Object;
.source "DefaultVariation.java"

# interfaces
.implements Lcom/amazon/insights/Variation;
.implements Lcom/amazon/insights/core/util/JSONSerializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/insights/abtest/DefaultVariation$Builder;,
        Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;
    }
.end annotation


# static fields
.field static final DEFAULT_VARIATION_NAME:Ljava/lang/String; = "DEFAULT"

.field public static final NULL_VARIATION:Lcom/amazon/insights/abtest/DefaultVariation;

.field private static final logger:Lcom/amazon/insights/core/log/Logger;


# instance fields
.field private applicationKey:Ljava/lang/String;

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
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const-class v0, Lcom/amazon/insights/abtest/DefaultVariation;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/abtest/DefaultVariation;->logger:Lcom/amazon/insights/core/log/Logger;

    .line 25
    new-instance v0, Lcom/amazon/insights/abtest/DefaultVariation;

    invoke-direct {v0}, Lcom/amazon/insights/abtest/DefaultVariation;-><init>()V

    sput-object v0, Lcom/amazon/insights/abtest/DefaultVariation;->NULL_VARIATION:Lcom/amazon/insights/abtest/DefaultVariation;

    return-void
.end method

.method constructor <init>()V
    .locals 2

    .prologue
    .line 54
    new-instance v0, Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    invoke-direct {v0}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;-><init>()V

    const-string v1, "DEFAULT"

    invoke-virtual {v0, v1}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->setVariationName(Ljava/lang/String;)Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/amazon/insights/abtest/DefaultVariation;-><init>(Lcom/amazon/insights/abtest/DefaultVariation$Builder;)V

    .line 55
    return-void
.end method

.method constructor <init>(Lcom/amazon/insights/abtest/DefaultVariation$Builder;)V
    .locals 2
    .param p1, "builder"    # Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    invoke-static {}, Lcom/amazon/insights/core/idresolver/Id;->getEmptyId()Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation;->uniqueId:Lcom/amazon/insights/core/idresolver/Id;

    .line 58
    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->getUniqueId()Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation;->uniqueId:Lcom/amazon/insights/core/idresolver/Id;

    .line 59
    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->getApplicationKey()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation;->applicationKey:Ljava/lang/String;

    .line 60
    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->getExperimentId()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/amazon/insights/abtest/DefaultVariation;->experimentId:J

    .line 61
    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->getProjectName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation;->projectName:Ljava/lang/String;

    .line 62
    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->getVariationId()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variationId:J

    .line 63
    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->getVariationName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variationName:Ljava/lang/String;

    .line 64
    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->getExpirationDate()Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation;->expirationDate:Ljava/util/Date;

    .line 65
    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->getVariables()Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variables:Ljava/util/Map;

    .line 66
    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->getAllocationSource()Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation;->source:Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    .line 67
    return-void
.end method

.method public static newVariation(Lcom/amazon/insights/abtest/DefaultVariation$Builder;)Lcom/amazon/insights/abtest/DefaultVariation;
    .locals 1
    .param p0, "builder"    # Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    .prologue
    .line 45
    if-nez p0, :cond_0

    .line 46
    sget-object v0, Lcom/amazon/insights/abtest/DefaultVariation;->NULL_VARIATION:Lcom/amazon/insights/abtest/DefaultVariation;

    .line 50
    :goto_0
    return-object v0

    .line 49
    :cond_0
    new-instance v0, Lcom/amazon/insights/abtest/DefaultVariation;

    invoke-direct {v0, p0}, Lcom/amazon/insights/abtest/DefaultVariation;-><init>(Lcom/amazon/insights/abtest/DefaultVariation$Builder;)V

    .line 50
    .local v0, "variation":Lcom/amazon/insights/abtest/DefaultVariation;
    goto :goto_0
.end method


# virtual methods
.method public containsVariable(Ljava/lang/String;)Z
    .locals 1
    .param p1, "variableName"    # Ljava/lang/String;

    .prologue
    .line 293
    iget-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variables:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getAllocationSource()Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation;->source:Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    return-object v0
.end method

.method public getApplicationKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation;->applicationKey:Ljava/lang/String;

    return-object v0
.end method

.method public getExperimentId()J
    .locals 2

    .prologue
    .line 134
    iget-wide v0, p0, Lcom/amazon/insights/abtest/DefaultVariation;->experimentId:J

    return-wide v0
.end method

.method public getExpirationDate()Ljava/util/Date;
    .locals 3

    .prologue
    .line 78
    new-instance v0, Ljava/util/Date;

    iget-object v1, p0, Lcom/amazon/insights/abtest/DefaultVariation;->expirationDate:Ljava/util/Date;

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variationName:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 116
    const-string v0, "DEFAULT"

    .line 118
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variationName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getProjectName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation;->projectName:Ljava/lang/String;

    return-object v0
.end method

.method public getUniqueId()Lcom/amazon/insights/core/idresolver/Id;
    .locals 1

    .prologue
    .line 126
    iget-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation;->uniqueId:Lcom/amazon/insights/core/idresolver/Id;

    return-object v0
.end method

.method public getVariableAsBoolean(Ljava/lang/String;Z)Z
    .locals 5
    .param p1, "variable"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Z

    .prologue
    .line 255
    move v1, p2

    .line 257
    .local v1, "value":Z
    :try_start_0
    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variables:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 258
    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variables:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v1

    .line 266
    :goto_0
    return v1

    .line 260
    :cond_0
    sget-object v2, Lcom/amazon/insights/abtest/DefaultVariation;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Variable \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' does not exist in the variation. Returning default value"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 262
    :catch_0
    move-exception v0

    .line 263
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v3, Lcom/amazon/insights/abtest/DefaultVariation;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Variable \'"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "\' can not be translated to a boolean. value is: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variables:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    .line 264
    sget-object v2, Lcom/amazon/insights/abtest/DefaultVariation;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v3, "Variable could not be translated to a boolean"

    invoke-virtual {v2, v3, v0}, Lcom/amazon/insights/core/log/Logger;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getVariableAsDouble(Ljava/lang/String;D)D
    .locals 6
    .param p1, "variable"    # Ljava/lang/String;
    .param p2, "defaultValue"    # D

    .prologue
    .line 211
    move-wide v1, p2

    .line 213
    .local v1, "value":D
    :try_start_0
    iget-object v3, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variables:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 214
    iget-object v3, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variables:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v1

    .line 222
    :goto_0
    return-wide v1

    .line 216
    :cond_0
    sget-object v3, Lcom/amazon/insights/abtest/DefaultVariation;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Variable \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\' does not exist in the variation. Returning default value"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 218
    :catch_0
    move-exception v0

    .line 219
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v4, Lcom/amazon/insights/abtest/DefaultVariation;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Variable \'"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "\' can not be translated to a double. value is: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v3, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variables:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    .line 220
    sget-object v3, Lcom/amazon/insights/abtest/DefaultVariation;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v4, "Variable could not be translated to a double"

    invoke-virtual {v3, v4, v0}, Lcom/amazon/insights/core/log/Logger;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getVariableAsFloat(Ljava/lang/String;F)F
    .locals 5
    .param p1, "variable"    # Ljava/lang/String;
    .param p2, "defaultValue"    # F

    .prologue
    .line 233
    move v1, p2

    .line 235
    .local v1, "value":F
    :try_start_0
    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variables:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 236
    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variables:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    .line 244
    :goto_0
    return v1

    .line 238
    :cond_0
    sget-object v2, Lcom/amazon/insights/abtest/DefaultVariation;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Variable \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' does not exist in the variation. Returning default value"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 240
    :catch_0
    move-exception v0

    .line 241
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v3, Lcom/amazon/insights/abtest/DefaultVariation;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Variable \'"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "\' can not be translated to a float. value is: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variables:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    .line 242
    sget-object v2, Lcom/amazon/insights/abtest/DefaultVariation;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v3, "Variable could not be translated to a float"

    invoke-virtual {v2, v3, v0}, Lcom/amazon/insights/core/log/Logger;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getVariableAsInt(Ljava/lang/String;I)I
    .locals 5
    .param p1, "variable"    # Ljava/lang/String;
    .param p2, "defaultValue"    # I

    .prologue
    .line 145
    move v1, p2

    .line 147
    .local v1, "value":I
    :try_start_0
    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variables:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 148
    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variables:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 156
    :goto_0
    return v1

    .line 150
    :cond_0
    sget-object v2, Lcom/amazon/insights/abtest/DefaultVariation;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Variable \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' does not exist in the variation. Returning default value"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 152
    :catch_0
    move-exception v0

    .line 153
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v3, Lcom/amazon/insights/abtest/DefaultVariation;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Variable \'"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "\' can not be translated to an int. value is: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variables:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    .line 154
    sget-object v2, Lcom/amazon/insights/abtest/DefaultVariation;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v3, "variable could not be translated to an int"

    invoke-virtual {v2, v3, v0}, Lcom/amazon/insights/core/log/Logger;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getVariableAsLong(Ljava/lang/String;J)J
    .locals 6
    .param p1, "variable"    # Ljava/lang/String;
    .param p2, "defaultValue"    # J

    .prologue
    .line 167
    move-wide v1, p2

    .line 169
    .local v1, "value":J
    :try_start_0
    iget-object v3, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variables:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 170
    iget-object v3, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variables:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Long;->decode(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    .line 178
    :goto_0
    return-wide v1

    .line 172
    :cond_0
    sget-object v3, Lcom/amazon/insights/abtest/DefaultVariation;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Variable \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\' does not exist in the variation. Returning default value"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 174
    :catch_0
    move-exception v0

    .line 175
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v4, Lcom/amazon/insights/abtest/DefaultVariation;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Variable \'"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "\' can not be translated to a long. value is: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v3, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variables:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    .line 176
    sget-object v3, Lcom/amazon/insights/abtest/DefaultVariation;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v4, "Variable could not be translated to a long"

    invoke-virtual {v3, v4, v0}, Lcom/amazon/insights/core/log/Logger;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getVariableAsShort(Ljava/lang/String;S)S
    .locals 5
    .param p1, "variable"    # Ljava/lang/String;
    .param p2, "defaultValue"    # S

    .prologue
    .line 189
    move v1, p2

    .line 191
    .local v1, "value":S
    :try_start_0
    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variables:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 192
    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variables:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Short;->decode(Ljava/lang/String;)Ljava/lang/Short;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Short;->shortValue()S

    move-result v1

    .line 200
    :goto_0
    return v1

    .line 194
    :cond_0
    sget-object v2, Lcom/amazon/insights/abtest/DefaultVariation;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Variable \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' does not exist in the variation. Returning default value"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 196
    :catch_0
    move-exception v0

    .line 197
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v3, Lcom/amazon/insights/abtest/DefaultVariation;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Variable \'"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "\' can not be translated to a short. value is: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v2, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variables:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    .line 198
    sget-object v2, Lcom/amazon/insights/abtest/DefaultVariation;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v3, "Variable could not be translated to a short"

    invoke-virtual {v2, v3, v0}, Lcom/amazon/insights/core/log/Logger;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getVariableAsString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "variable"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 277
    move-object v0, p2

    .line 278
    .local v0, "value":Ljava/lang/String;
    iget-object v1, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variables:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 279
    iget-object v1, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variables:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "value":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .line 283
    .restart local v0    # "value":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 281
    :cond_0
    sget-object v1, Lcom/amazon/insights/abtest/DefaultVariation;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Variable \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' does not exist in the variation. Returning default value"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public getVariationId()J
    .locals 2

    .prologue
    .line 74
    iget-wide v0, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variationId:J

    return-wide v0
.end method

.method public isDefault()Z
    .locals 2

    .prologue
    .line 86
    iget-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variationName:Ljava/lang/String;

    const-string v1, "DEFAULT"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 87
    const/4 v0, 0x1

    .line 89
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isExpired()Z
    .locals 4

    .prologue
    .line 82
    iget-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation;->expirationDate:Ljava/util/Date;

    new-instance v1, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v0

    return v0
.end method

.method public toJSONObject()Lorg/json/JSONObject;
    .locals 9

    .prologue
    .line 321
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 323
    .local v2, "json":Lorg/json/JSONObject;
    :try_start_0
    const-string v6, "applicationKey"

    invoke-virtual {p0}, Lcom/amazon/insights/abtest/DefaultVariation;->getApplicationKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 324
    const-string v6, "variationId"

    invoke-virtual {p0}, Lcom/amazon/insights/abtest/DefaultVariation;->getVariationId()J

    move-result-wide v7

    invoke-virtual {v2, v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 325
    const-string v6, "experimentId"

    invoke-virtual {p0}, Lcom/amazon/insights/abtest/DefaultVariation;->getExperimentId()J

    move-result-wide v7

    invoke-virtual {v2, v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 326
    const-string v6, "projectName"

    invoke-virtual {p0}, Lcom/amazon/insights/abtest/DefaultVariation;->getProjectName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 327
    const-string v6, "uniqueId"

    invoke-virtual {p0}, Lcom/amazon/insights/abtest/DefaultVariation;->getUniqueId()Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v7

    invoke-virtual {v7}, Lcom/amazon/insights/core/idresolver/Id;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 328
    const-string v6, "expirationDate"

    iget-object v7, p0, Lcom/amazon/insights/abtest/DefaultVariation;->expirationDate:Ljava/util/Date;

    invoke-virtual {v7}, Ljava/util/Date;->getTime()J

    move-result-wide v7

    invoke-virtual {v2, v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 329
    const-string v6, "variationName"

    invoke-virtual {p0}, Lcom/amazon/insights/abtest/DefaultVariation;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 330
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    .line 331
    .local v5, "variablesJson":Lorg/json/JSONArray;
    iget-object v6, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variables:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 332
    .local v3, "kvp":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 333
    .local v4, "variable":Lorg/json/JSONObject;
    const-string v6, "name"

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 334
    const-string v6, "value"

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 335
    invoke-virtual {v5, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 338
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v3    # "kvp":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v4    # "variable":Lorg/json/JSONObject;
    .end local v5    # "variablesJson":Lorg/json/JSONArray;
    :catch_0
    move-exception v0

    .line 339
    .local v0, "ex":Lorg/json/JSONException;
    sget-object v6, Lcom/amazon/insights/abtest/DefaultVariation;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v7, "Failed to translate the variation to json"

    invoke-virtual {v6, v7, v0}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 340
    const/4 v2, 0x0

    .line 342
    .end local v0    # "ex":Lorg/json/JSONException;
    :goto_1
    return-object v2

    .line 337
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v5    # "variablesJson":Lorg/json/JSONArray;
    :cond_0
    :try_start_1
    const-string v6, "variables"

    invoke-virtual {v2, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 307
    invoke-virtual {p0}, Lcom/amazon/insights/abtest/DefaultVariation;->toJSONObject()Lorg/json/JSONObject;

    move-result-object v1

    .line 309
    .local v1, "json":Lorg/json/JSONObject;
    if-eqz v1, :cond_0

    .line 310
    const/4 v2, 0x4

    :try_start_0
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v2

    .line 315
    :goto_0
    return-object v2

    .line 312
    :cond_0
    const-string v2, "Failed to convert Variation to String"
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 314
    :catch_0
    move-exception v0

    .line 315
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public variablesIterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 302
    iget-object v0, p0, Lcom/amazon/insights/abtest/DefaultVariation;->variables:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method
