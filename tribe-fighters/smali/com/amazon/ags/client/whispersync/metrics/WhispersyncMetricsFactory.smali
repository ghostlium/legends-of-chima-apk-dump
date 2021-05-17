.class public Lcom/amazon/ags/client/whispersync/metrics/WhispersyncMetricsFactory;
.super Ljava/lang/Object;
.source "WhispersyncMetricsFactory.java"


# static fields
.field private static final COUNT_FAILURE_METRIC_LABEL:Ljava/lang/String; = "COUNT_FAILURE"

.field private static final COUNT_METRIC_LABEL:Ljava/lang/String; = "COUNT"

.field private static final COUNT_SUCCESS_METRIC_LABEL:Ljava/lang/String; = "COUNT_SUCCESS"

.field private static final TAG:Ljava/lang/String; = "GC_Whispersync_Metrics"

.field private static final TIME_METRIC_LABEL:Ljava/lang/String; = "TIME"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createBooleanCountEvent(Ljava/lang/String;IZ)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    .locals 3
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "countValue"    # I
    .param p2, "succeeded"    # Z

    .prologue
    .line 34
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {p0, v0, v1, v2}, Lcom/amazon/ags/client/whispersync/metrics/WhispersyncMetricsFactory;->createBooleanGenericEvent(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Boolean;)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    move-result-object v0

    return-object v0
.end method

.method public static createBooleanGenericEvent(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Boolean;)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    .locals 7
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "countValue"    # Ljava/lang/Integer;
    .param p2, "timeValue"    # Ljava/lang/Long;
    .param p3, "succeeded"    # Ljava/lang/Boolean;

    .prologue
    .line 46
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 47
    .local v0, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 48
    .local v1, "countMetrics":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 50
    .local v3, "timeMetrics":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    if-eqz p1, :cond_0

    .line 51
    if-eqz p3, :cond_3

    .line 52
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 53
    const-string v4, "COUNT_SUCCESS"

    invoke-interface {v1, v4, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    :cond_0
    :goto_0
    if-eqz p2, :cond_1

    .line 63
    const-string v4, "TIME"

    invoke-interface {v3, v4, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    :cond_1
    :try_start_0
    new-instance v4, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    invoke-direct {v4, p0, v0, v1, v3}, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V
    :try_end_0
    .catch Lcom/amazon/ags/client/metrics/IllegalConstructionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    :goto_1
    return-object v4

    .line 55
    :cond_2
    const-string v4, "COUNT_FAILURE"

    invoke-interface {v1, v4, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 58
    :cond_3
    const-string v4, "COUNT"

    invoke-interface {v1, v4, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 68
    :catch_0
    move-exception v2

    .line 69
    .local v2, "e":Lcom/amazon/ags/client/metrics/IllegalConstructionException;
    const-string v4, "GC_Whispersync_Metrics"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to construct metric ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public static createCountEvent(Ljava/lang/String;I)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "countValue"    # I

    .prologue
    const/4 v1, 0x0

    .line 30
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p0, v0, v1, v1}, Lcom/amazon/ags/client/whispersync/metrics/WhispersyncMetricsFactory;->createBooleanGenericEvent(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Boolean;)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    move-result-object v0

    return-object v0
.end method

.method public static createGenericEvent(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Long;)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "countValue"    # Ljava/lang/Integer;
    .param p2, "timeValue"    # Ljava/lang/Long;

    .prologue
    .line 38
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/amazon/ags/client/whispersync/metrics/WhispersyncMetricsFactory;->createBooleanGenericEvent(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Boolean;)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    move-result-object v0

    return-object v0
.end method

.method public static createSyncableTypeEvent(Ljava/lang/String;Lcom/amazon/ags/client/whispersync/model/SyncableType;)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    .locals 3
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "type"    # Lcom/amazon/ags/client/whispersync/model/SyncableType;

    .prologue
    const/4 v2, 0x0

    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/SyncableType;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1, v2, v2}, Lcom/amazon/ags/client/whispersync/metrics/WhispersyncMetricsFactory;->createBooleanGenericEvent(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Boolean;)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    move-result-object v0

    return-object v0
.end method

.method public static createTimeEvent(Ljava/lang/String;J)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "timeValue"    # J

    .prologue
    const/4 v1, 0x0

    .line 26
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p0, v1, v0, v1}, Lcom/amazon/ags/client/whispersync/metrics/WhispersyncMetricsFactory;->createBooleanGenericEvent(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Boolean;)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    move-result-object v0

    return-object v0
.end method
