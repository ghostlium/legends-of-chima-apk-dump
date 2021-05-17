.class public Lcom/amazon/ags/client/whispersync/model/NumberElement;
.super Lcom/amazon/ags/client/whispersync/model/Element;
.source "NumberElement.java"

# interfaces
.implements Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;


# static fields
.field private static final TAG:Ljava/lang/String; = "GC_Whispersync"


# instance fields
.field protected value:Ljava/math/BigDecimal;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/amazon/ags/client/whispersync/model/Element;-><init>()V

    .line 31
    sget-object v0, Ljava/math/BigDecimal;->ZERO:Ljava/math/BigDecimal;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/model/NumberElement;->value:Ljava/math/BigDecimal;

    .line 32
    return-void
.end method

.method public constructor <init>(Lcom/amazon/ags/client/whispersync/model/NumberElement;)V
    .locals 5
    .param p1, "copy"    # Lcom/amazon/ags/client/whispersync/model/NumberElement;

    .prologue
    .line 54
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iget-wide v3, p1, Lcom/amazon/ags/client/whispersync/model/NumberElement;->timestamp:J

    invoke-direct {p0, v2, v3, v4}, Lcom/amazon/ags/client/whispersync/model/Element;-><init>(Ljava/util/Map;J)V

    .line 55
    iget-object v2, p1, Lcom/amazon/ags/client/whispersync/model/NumberElement;->metadata:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 56
    .local v1, "key":Ljava/lang/String;
    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/NumberElement;->metadata:Ljava/util/Map;

    iget-object v3, p1, Lcom/amazon/ags/client/whispersync/model/NumberElement;->metadata:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 58
    .end local v1    # "key":Ljava/lang/String;
    :cond_0
    new-instance v2, Ljava/math/BigDecimal;

    iget-object v3, p1, Lcom/amazon/ags/client/whispersync/model/NumberElement;->value:Ljava/math/BigDecimal;

    invoke-virtual {v3}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v3

    invoke-direct {v2, v3, v4}, Ljava/math/BigDecimal;-><init>(D)V

    iput-object v2, p0, Lcom/amazon/ags/client/whispersync/model/NumberElement;->value:Ljava/math/BigDecimal;

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/math/BigDecimal;)V
    .locals 3
    .param p1, "value"    # Ljava/math/BigDecimal;

    .prologue
    .line 35
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {}, Lcom/amazon/ags/client/whispersync/clock/ClockUtil;->getCurrentTime()J

    move-result-wide v1

    invoke-direct {p0, v0, v1, v2}, Lcom/amazon/ags/client/whispersync/model/Element;-><init>(Ljava/util/Map;J)V

    .line 36
    if-nez p1, :cond_0

    .line 37
    const-string v0, "GC_Whispersync"

    const-string v1, "NumberElement cannot contain a null value"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 40
    :cond_0
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/model/NumberElement;->value:Ljava/math/BigDecimal;

    .line 41
    return-void
.end method

.method public constructor <init>(Ljava/math/BigDecimal;Ljava/util/Map;J)V
    .locals 2
    .param p1, "value"    # Ljava/math/BigDecimal;
    .param p3, "timestamp"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/math/BigDecimal;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;J)V"
        }
    .end annotation

    .prologue
    .line 44
    .local p2, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0, p2, p3, p4}, Lcom/amazon/ags/client/whispersync/model/Element;-><init>(Ljava/util/Map;J)V

    .line 45
    if-nez p1, :cond_0

    .line 46
    const-string v0, "GC_Whispersync"

    const-string v1, "NumberElement cannot contain a null value"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 49
    :cond_0
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/model/NumberElement;->value:Ljava/math/BigDecimal;

    .line 50
    return-void
.end method


# virtual methods
.method public asDecimal()Ljava/math/BigDecimal;
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/NumberElement;->value:Ljava/math/BigDecimal;

    return-object v0
.end method

.method public asDouble()D
    .locals 2

    .prologue
    .line 68
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/NumberElement;->value:Ljava/math/BigDecimal;

    invoke-virtual {v0}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v0

    return-wide v0
.end method

.method public asInt()I
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/NumberElement;->value:Ljava/math/BigDecimal;

    invoke-virtual {v0}, Ljava/math/BigDecimal;->intValue()I

    move-result v0

    return v0
.end method

.method public asLong()J
    .locals 2

    .prologue
    .line 63
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/NumberElement;->value:Ljava/math/BigDecimal;

    invoke-virtual {v0}, Ljava/math/BigDecimal;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public asString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/NumberElement;->value:Ljava/math/BigDecimal;

    invoke-virtual {v0}, Ljava/math/BigDecimal;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected reportEvent(Ljava/lang/String;Lcom/amazon/ags/client/whispersync/model/SyncableType;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "syncableType"    # Lcom/amazon/ags/client/whispersync/model/SyncableType;

    .prologue
    .line 97
    invoke-static {}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->getInstance()Lcom/amazon/ags/client/metrics/EventCollectorClient;

    move-result-object v1

    .line 98
    .local v1, "eventCollectorClient":Lcom/amazon/ags/client/metrics/EventCollectorClient;
    if-eqz v1, :cond_0

    .line 99
    invoke-static {p1, p2}, Lcom/amazon/ags/client/whispersync/metrics/WhispersyncMetricsFactory;->createSyncableTypeEvent(Ljava/lang/String;Lcom/amazon/ags/client/whispersync/model/SyncableType;)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    move-result-object v0

    .line 100
    .local v0, "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    if-eqz v0, :cond_0

    .line 101
    invoke-virtual {v1, v0}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->reportGenericEvent(Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;)V

    .line 104
    .end local v0    # "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 89
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-class v2, Lcom/amazon/ags/client/whispersync/model/NumberElement;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " value="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/NumberElement;->value:Ljava/math/BigDecimal;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " timestamp="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/amazon/ags/client/whispersync/model/NumberElement;->timestamp:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " metadata="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/NumberElement;->metadata:Ljava/util/Map;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
