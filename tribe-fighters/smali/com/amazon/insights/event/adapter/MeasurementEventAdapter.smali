.class public Lcom/amazon/insights/event/adapter/MeasurementEventAdapter;
.super Ljava/lang/Object;
.source "MeasurementEventAdapter.java"

# interfaces
.implements Lcom/amazon/insights/event/adapter/EventAdapter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/amazon/insights/event/adapter/EventAdapter",
        "<",
        "Lcom/amazon/sdk/availability/Measurement;",
        ">;"
    }
.end annotation


# static fields
.field private static final CLIENT_ID:Ljava/lang/String; = "availabilityClientId"

.field private static final VERSION:Ljava/lang/String; = "availabilityClientVersion"

.field private static logger:Lcom/amazon/insights/core/log/Logger;


# instance fields
.field private final configuration:Lcom/amazon/insights/core/configuration/Configuration;

.field private final jsonAdapter:Lcom/amazon/insights/event/adapter/JSONEventAdapter;

.field private lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

.field private readLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const-class v0, Lcom/amazon/insights/event/adapter/MeasurementEventAdapter;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/event/adapter/MeasurementEventAdapter;->logger:Lcom/amazon/insights/core/log/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/amazon/insights/core/configuration/Configuration;)V
    .locals 2
    .param p1, "configuration"    # Lcom/amazon/insights/core/configuration/Configuration;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Lcom/amazon/insights/event/adapter/JSONEventAdapter;

    invoke-direct {v0}, Lcom/amazon/insights/event/adapter/JSONEventAdapter;-><init>()V

    iput-object v0, p0, Lcom/amazon/insights/event/adapter/MeasurementEventAdapter;->jsonAdapter:Lcom/amazon/insights/event/adapter/JSONEventAdapter;

    .line 25
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>(Z)V

    iput-object v0, p0, Lcom/amazon/insights/event/adapter/MeasurementEventAdapter;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 26
    iget-object v0, p0, Lcom/amazon/insights/event/adapter/MeasurementEventAdapter;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/event/adapter/MeasurementEventAdapter;->readLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 30
    iput-object p1, p0, Lcom/amazon/insights/event/adapter/MeasurementEventAdapter;->configuration:Lcom/amazon/insights/core/configuration/Configuration;

    .line 31
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 71
    new-instance v0, Lcom/amazon/insights/core/util/JSONBuilder;

    invoke-direct {v0, p0}, Lcom/amazon/insights/core/util/JSONBuilder;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/amazon/insights/core/util/JSONBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public translateFromEvent(Lcom/amazon/insights/event/InternalEvent;)Lcom/amazon/sdk/availability/Measurement;
    .locals 7
    .param p1, "source"    # Lcom/amazon/insights/event/InternalEvent;

    .prologue
    .line 35
    if-nez p1, :cond_0

    .line 36
    sget-object v4, Lcom/amazon/insights/event/adapter/MeasurementEventAdapter;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v5, "The Event provided was null"

    invoke-virtual {v4, v5}, Lcom/amazon/insights/core/log/Logger;->w(Ljava/lang/String;)V

    .line 37
    const/4 v2, 0x0

    .line 66
    :goto_0
    return-object v2

    .line 41
    :cond_0
    const/4 v2, 0x0

    .line 43
    .local v2, "measurement":Lcom/amazon/sdk/availability/Measurement;
    :try_start_0
    new-instance v3, Lcom/amazon/sdk/availability/Measurement;

    invoke-direct {v3}, Lcom/amazon/sdk/availability/Measurement;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 44
    .end local v2    # "measurement":Lcom/amazon/sdk/availability/Measurement;
    .local v3, "measurement":Lcom/amazon/sdk/availability/Measurement;
    :try_start_1
    iget-object v4, p0, Lcom/amazon/insights/event/adapter/MeasurementEventAdapter;->readLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 46
    :try_start_2
    iget-object v4, p0, Lcom/amazon/insights/event/adapter/MeasurementEventAdapter;->configuration:Lcom/amazon/insights/core/configuration/Configuration;

    const-string v5, "availabilityClientId"

    const-string v6, "gamelab-custom"

    invoke-interface {v4, v5, v6}, Lcom/amazon/insights/core/configuration/Configuration;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/amazon/sdk/availability/Measurement;->setClientId(Ljava/lang/String;)Lcom/amazon/sdk/availability/Measurement;

    .line 47
    iget-object v4, p0, Lcom/amazon/insights/event/adapter/MeasurementEventAdapter;->configuration:Lcom/amazon/insights/core/configuration/Configuration;

    const-string v5, "availabilityClientVersion"

    const-string v6, "1.0"

    invoke-interface {v4, v5, v6}, Lcom/amazon/insights/core/configuration/Configuration;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/amazon/sdk/availability/Measurement;->setClientVersion(Ljava/lang/String;)Lcom/amazon/sdk/availability/Measurement;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 51
    :try_start_3
    iget-object v4, p0, Lcom/amazon/insights/event/adapter/MeasurementEventAdapter;->readLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 53
    :goto_1
    invoke-interface {p1}, Lcom/amazon/insights/event/InternalEvent;->getEventType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/amazon/sdk/availability/Measurement;->setMeasurementName(Ljava/lang/String;)Lcom/amazon/sdk/availability/Measurement;

    .line 54
    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/amazon/sdk/availability/Measurement;->setMeasurementValueNumber(Ljava/lang/Number;)Lcom/amazon/sdk/availability/Measurement;

    .line 56
    iget-object v4, p0, Lcom/amazon/insights/event/adapter/MeasurementEventAdapter;->jsonAdapter:Lcom/amazon/insights/event/adapter/JSONEventAdapter;

    invoke-virtual {v4, p1}, Lcom/amazon/insights/event/adapter/JSONEventAdapter;->translateFromEvent(Lcom/amazon/insights/event/InternalEvent;)Lorg/json/JSONObject;

    move-result-object v1

    .line 57
    .local v1, "json":Lorg/json/JSONObject;
    if-eqz v1, :cond_1

    .line 58
    const-string v4, "event"

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/amazon/sdk/availability/Measurement;->setMetadata(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/sdk/availability/Measurement;

    :goto_2
    move-object v2, v3

    .line 64
    .end local v3    # "measurement":Lcom/amazon/sdk/availability/Measurement;
    .restart local v2    # "measurement":Lcom/amazon/sdk/availability/Measurement;
    goto :goto_0

    .line 48
    .end local v1    # "json":Lorg/json/JSONObject;
    .end local v2    # "measurement":Lcom/amazon/sdk/availability/Measurement;
    .restart local v3    # "measurement":Lcom/amazon/sdk/availability/Measurement;
    :catch_0
    move-exception v4

    .line 51
    iget-object v4, p0, Lcom/amazon/insights/event/adapter/MeasurementEventAdapter;->readLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    .line 62
    :catch_1
    move-exception v0

    move-object v2, v3

    .line 63
    .end local v3    # "measurement":Lcom/amazon/sdk/availability/Measurement;
    .local v0, "ex":Ljava/lang/Exception;
    .restart local v2    # "measurement":Lcom/amazon/sdk/availability/Measurement;
    :goto_3
    sget-object v4, Lcom/amazon/insights/event/adapter/MeasurementEventAdapter;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v5, "Failed to translate Event to a Measurement"

    invoke-virtual {v4, v5}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;)V

    goto :goto_0

    .line 51
    .end local v0    # "ex":Ljava/lang/Exception;
    .end local v2    # "measurement":Lcom/amazon/sdk/availability/Measurement;
    .restart local v3    # "measurement":Lcom/amazon/sdk/availability/Measurement;
    :catchall_0
    move-exception v4

    :try_start_4
    iget-object v5, p0, Lcom/amazon/insights/event/adapter/MeasurementEventAdapter;->readLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    throw v4

    .line 60
    .restart local v1    # "json":Lorg/json/JSONObject;
    :cond_1
    sget-object v4, Lcom/amazon/insights/event/adapter/MeasurementEventAdapter;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v5, "Failed to translate Event to a JSONObject"

    invoke-virtual {v4, v5}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_2

    .line 62
    .end local v1    # "json":Lorg/json/JSONObject;
    .end local v3    # "measurement":Lcom/amazon/sdk/availability/Measurement;
    .restart local v2    # "measurement":Lcom/amazon/sdk/availability/Measurement;
    :catch_2
    move-exception v0

    goto :goto_3
.end method

.method public bridge synthetic translateFromEvent(Lcom/amazon/insights/event/InternalEvent;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Lcom/amazon/insights/event/InternalEvent;

    .prologue
    .line 18
    invoke-virtual {p0, p1}, Lcom/amazon/insights/event/adapter/MeasurementEventAdapter;->translateFromEvent(Lcom/amazon/insights/event/InternalEvent;)Lcom/amazon/sdk/availability/Measurement;

    move-result-object v0

    return-object v0
.end method
