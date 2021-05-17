.class public final Lcom/amazon/insights/event/DefaultEvent;
.super Ljava/lang/Object;
.source "DefaultEvent.java"

# interfaces
.implements Lcom/amazon/insights/event/InternalEvent;
.implements Lcom/amazon/insights/core/util/JSONSerializable;


# static fields
.field private static logger:Lcom/amazon/insights/core/log/Logger;


# instance fields
.field private final appDetails:Lcom/amazon/insights/core/system/AppDetails;

.field private final applicationKey:Ljava/lang/String;

.field private final attributes:Ljava/util/Map;
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

.field private final deviceDetails:Lcom/amazon/insights/core/system/DeviceDetails;

.field private final eventType:Ljava/lang/String;

.field private final metrics:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Number;",
            ">;"
        }
    .end annotation
.end field

.field private final sdkName:Ljava/lang/String;

.field private final sdkVersion:Ljava/lang/String;

.field private final timestamp:Ljava/lang/Long;

.field private final uniqueId:Lcom/amazon/insights/core/idresolver/Id;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const-class v0, Lcom/amazon/insights/event/DefaultEvent;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/event/DefaultEvent;->logger:Lcom/amazon/insights/core/log/Logger;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;Lcom/amazon/insights/core/util/SDKInfo;Ljava/lang/Long;Lcom/amazon/insights/core/idresolver/Id;Lcom/amazon/insights/core/system/AppDetails;Lcom/amazon/insights/core/system/DeviceDetails;)V
    .locals 5
    .param p1, "eventType"    # Ljava/lang/String;
    .param p4, "applicationKey"    # Ljava/lang/String;
    .param p5, "sdkInfo"    # Lcom/amazon/insights/core/util/SDKInfo;
    .param p6, "timestamp"    # Ljava/lang/Long;
    .param p7, "uniqueId"    # Lcom/amazon/insights/core/idresolver/Id;
    .param p8, "appDetails"    # Lcom/amazon/insights/core/system/AppDetails;
    .param p9, "deviceDetails"    # Lcom/amazon/insights/core/system/DeviceDetails;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Number;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/amazon/insights/core/util/SDKInfo;",
            "Ljava/lang/Long;",
            "Lcom/amazon/insights/core/idresolver/Id;",
            "Lcom/amazon/insights/core/system/AppDetails;",
            "Lcom/amazon/insights/core/system/DeviceDetails;",
            ")V"
        }
    .end annotation

    .prologue
    .line 56
    .local p2, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p3, "metrics":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Number;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v3, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v3}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v3, p0, Lcom/amazon/insights/event/DefaultEvent;->attributes:Ljava/util/Map;

    .line 38
    new-instance v3, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v3}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v3, p0, Lcom/amazon/insights/event/DefaultEvent;->metrics:Ljava/util/Map;

    .line 57
    iput-object p4, p0, Lcom/amazon/insights/event/DefaultEvent;->applicationKey:Ljava/lang/String;

    .line 58
    invoke-virtual {p5}, Lcom/amazon/insights/core/util/SDKInfo;->getName()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/amazon/insights/event/DefaultEvent;->sdkName:Ljava/lang/String;

    .line 59
    invoke-virtual {p5}, Lcom/amazon/insights/core/util/SDKInfo;->getVersion()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/amazon/insights/event/DefaultEvent;->sdkVersion:Ljava/lang/String;

    .line 60
    iput-object p6, p0, Lcom/amazon/insights/event/DefaultEvent;->timestamp:Ljava/lang/Long;

    .line 61
    iput-object p7, p0, Lcom/amazon/insights/event/DefaultEvent;->uniqueId:Lcom/amazon/insights/core/idresolver/Id;

    .line 62
    iput-object p1, p0, Lcom/amazon/insights/event/DefaultEvent;->eventType:Ljava/lang/String;

    .line 63
    iput-object p8, p0, Lcom/amazon/insights/event/DefaultEvent;->appDetails:Lcom/amazon/insights/core/system/AppDetails;

    .line 64
    iput-object p9, p0, Lcom/amazon/insights/event/DefaultEvent;->deviceDetails:Lcom/amazon/insights/core/system/DeviceDetails;

    .line 65
    if-eqz p2, :cond_0

    .line 66
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 67
    .local v2, "kvp":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {p0, v3, v4}, Lcom/amazon/insights/event/DefaultEvent;->addAttribute(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 70
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v2    # "kvp":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    if-eqz p3, :cond_1

    .line 71
    invoke-interface {p3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .restart local v0    # "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 72
    .local v1, "kvp":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Number;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {p0, v3, v4}, Lcom/amazon/insights/event/DefaultEvent;->addMetric(Ljava/lang/String;Ljava/lang/Number;)V

    goto :goto_1

    .line 75
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "kvp":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Number;>;"
    :cond_1
    return-void
.end method

.method public static createFromEvent(Lcom/amazon/insights/core/InsightsContext;Ljava/lang/Long;Lcom/amazon/insights/Event;)Lcom/amazon/insights/event/DefaultEvent;
    .locals 10
    .param p0, "context"    # Lcom/amazon/insights/core/InsightsContext;
    .param p1, "timestamp"    # Ljava/lang/Long;
    .param p2, "copyEvent"    # Lcom/amazon/insights/Event;

    .prologue
    .line 45
    new-instance v0, Lcom/amazon/insights/event/DefaultEvent;

    invoke-interface {p2}, Lcom/amazon/insights/Event;->getEventType()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2}, Lcom/amazon/insights/Event;->getAllAttributes()Ljava/util/Map;

    move-result-object v2

    invoke-interface {p2}, Lcom/amazon/insights/Event;->getAllMetrics()Ljava/util/Map;

    move-result-object v3

    invoke-interface {p0}, Lcom/amazon/insights/core/InsightsContext;->getCredentials()Lcom/amazon/insights/InsightsCredentials;

    move-result-object v4

    invoke-interface {v4}, Lcom/amazon/insights/InsightsCredentials;->getApplicationKey()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p0}, Lcom/amazon/insights/core/InsightsContext;->getSDKInfo()Lcom/amazon/insights/core/util/SDKInfo;

    move-result-object v5

    invoke-interface {p0}, Lcom/amazon/insights/core/InsightsContext;->getUniqueId()Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v7

    invoke-interface {p0}, Lcom/amazon/insights/core/InsightsContext;->getSystem()Lcom/amazon/insights/core/system/System;

    move-result-object v6

    invoke-interface {v6}, Lcom/amazon/insights/core/system/System;->getAppDetails()Lcom/amazon/insights/core/system/AppDetails;

    move-result-object v8

    invoke-interface {p0}, Lcom/amazon/insights/core/InsightsContext;->getSystem()Lcom/amazon/insights/core/system/System;

    move-result-object v6

    invoke-interface {v6}, Lcom/amazon/insights/core/system/System;->getDeviceDetails()Lcom/amazon/insights/core/system/DeviceDetails;

    move-result-object v9

    move-object v6, p1

    invoke-direct/range {v0 .. v9}, Lcom/amazon/insights/event/DefaultEvent;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;Lcom/amazon/insights/core/util/SDKInfo;Ljava/lang/Long;Lcom/amazon/insights/core/idresolver/Id;Lcom/amazon/insights/core/system/AppDetails;Lcom/amazon/insights/core/system/DeviceDetails;)V

    return-object v0
.end method

.method public static newInstance(Lcom/amazon/insights/core/InsightsContext;Ljava/lang/Long;Ljava/lang/String;)Lcom/amazon/insights/event/DefaultEvent;
    .locals 10
    .param p0, "context"    # Lcom/amazon/insights/core/InsightsContext;
    .param p1, "timestamp"    # Ljava/lang/Long;
    .param p2, "eventType"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 51
    new-instance v0, Lcom/amazon/insights/event/DefaultEvent;

    invoke-interface {p0}, Lcom/amazon/insights/core/InsightsContext;->getCredentials()Lcom/amazon/insights/InsightsCredentials;

    move-result-object v1

    invoke-interface {v1}, Lcom/amazon/insights/InsightsCredentials;->getApplicationKey()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p0}, Lcom/amazon/insights/core/InsightsContext;->getSDKInfo()Lcom/amazon/insights/core/util/SDKInfo;

    move-result-object v5

    invoke-interface {p0}, Lcom/amazon/insights/core/InsightsContext;->getUniqueId()Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v7

    invoke-interface {p0}, Lcom/amazon/insights/core/InsightsContext;->getSystem()Lcom/amazon/insights/core/system/System;

    move-result-object v1

    invoke-interface {v1}, Lcom/amazon/insights/core/system/System;->getAppDetails()Lcom/amazon/insights/core/system/AppDetails;

    move-result-object v8

    invoke-interface {p0}, Lcom/amazon/insights/core/InsightsContext;->getSystem()Lcom/amazon/insights/core/system/System;

    move-result-object v1

    invoke-interface {v1}, Lcom/amazon/insights/core/system/System;->getDeviceDetails()Lcom/amazon/insights/core/system/DeviceDetails;

    move-result-object v9

    move-object v1, p2

    move-object v3, v2

    move-object v6, p1

    invoke-direct/range {v0 .. v9}, Lcom/amazon/insights/event/DefaultEvent;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;Lcom/amazon/insights/core/util/SDKInfo;Ljava/lang/Long;Lcom/amazon/insights/core/idresolver/Id;Lcom/amazon/insights/core/system/AppDetails;Lcom/amazon/insights/core/system/DeviceDetails;)V

    return-object v0
.end method


# virtual methods
.method public addAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 79
    if-nez p1, :cond_0

    .line 88
    :goto_0
    return-void

    .line 83
    :cond_0
    if-eqz p2, :cond_1

    .line 84
    iget-object v0, p0, Lcom/amazon/insights/event/DefaultEvent;->attributes:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 86
    :cond_1
    iget-object v0, p0, Lcom/amazon/insights/event/DefaultEvent;->attributes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public addMetric(Ljava/lang/String;Ljava/lang/Number;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Number;

    .prologue
    .line 100
    if-nez p1, :cond_0

    .line 109
    :goto_0
    return-void

    .line 104
    :cond_0
    if-eqz p2, :cond_1

    .line 105
    iget-object v0, p0, Lcom/amazon/insights/event/DefaultEvent;->metrics:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 107
    :cond_1
    iget-object v0, p0, Lcom/amazon/insights/event/DefaultEvent;->metrics:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public getAllAttributes()Ljava/util/Map;
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
    .line 179
    iget-object v0, p0, Lcom/amazon/insights/event/DefaultEvent;->attributes:Ljava/util/Map;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getAllMetrics()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Number;",
            ">;"
        }
    .end annotation

    .prologue
    .line 184
    iget-object v0, p0, Lcom/amazon/insights/event/DefaultEvent;->metrics:Ljava/util/Map;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getApplicationKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lcom/amazon/insights/event/DefaultEvent;->applicationKey:Ljava/lang/String;

    return-object v0
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 126
    if-nez p1, :cond_0

    .line 127
    const/4 v0, 0x0

    .line 129
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/amazon/insights/event/DefaultEvent;->attributes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0
.end method

.method public getEventTimestamp()Ljava/lang/Long;
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lcom/amazon/insights/event/DefaultEvent;->timestamp:Ljava/lang/Long;

    return-object v0
.end method

.method public getEventType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lcom/amazon/insights/event/DefaultEvent;->eventType:Ljava/lang/String;

    return-object v0
.end method

.method public getMetric(Ljava/lang/String;)Ljava/lang/Number;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 134
    if-nez p1, :cond_0

    .line 135
    const/4 v0, 0x0

    .line 137
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/amazon/insights/event/DefaultEvent;->metrics:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    goto :goto_0
.end method

.method public getSdkName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 157
    iget-object v0, p0, Lcom/amazon/insights/event/DefaultEvent;->sdkName:Ljava/lang/String;

    return-object v0
.end method

.method public getSdkVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lcom/amazon/insights/event/DefaultEvent;->sdkVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getUniqueId()Lcom/amazon/insights/core/idresolver/Id;
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lcom/amazon/insights/event/DefaultEvent;->uniqueId:Lcom/amazon/insights/core/idresolver/Id;

    return-object v0
.end method

.method public hasAttribute(Ljava/lang/String;)Z
    .locals 1
    .param p1, "attributeName"    # Ljava/lang/String;

    .prologue
    .line 92
    if-nez p1, :cond_0

    .line 93
    const/4 v0, 0x0

    .line 95
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/amazon/insights/event/DefaultEvent;->attributes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public hasMetric(Ljava/lang/String;)Z
    .locals 1
    .param p1, "metricName"    # Ljava/lang/String;

    .prologue
    .line 113
    if-nez p1, :cond_0

    .line 114
    const/4 v0, 0x0

    .line 116
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/amazon/insights/event/DefaultEvent;->metrics:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public toJSONObject()Lorg/json/JSONObject;
    .locals 13

    .prologue
    .line 199
    iget-object v10, p0, Lcom/amazon/insights/event/DefaultEvent;->deviceDetails:Lcom/amazon/insights/core/system/DeviceDetails;

    invoke-interface {v10}, Lcom/amazon/insights/core/system/DeviceDetails;->locale()Ljava/util/Locale;

    move-result-object v7

    .line 200
    .local v7, "locale":Ljava/util/Locale;
    if-eqz v7, :cond_0

    invoke-virtual {v7}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v8

    .line 202
    .local v8, "localeString":Ljava/lang/String;
    :goto_0
    new-instance v1, Lcom/amazon/insights/core/util/JSONBuilder;

    invoke-direct {v1, p0}, Lcom/amazon/insights/core/util/JSONBuilder;-><init>(Ljava/lang/Object;)V

    .line 207
    .local v1, "builder":Lcom/amazon/insights/core/util/JSONBuilder;
    const-string v10, "application_key"

    invoke-virtual {p0}, Lcom/amazon/insights/event/DefaultEvent;->getApplicationKey()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v10, v11}, Lcom/amazon/insights/core/util/JSONBuilder;->withAttribute(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/insights/core/util/JSONBuilder;

    .line 208
    const-string v10, "event_type"

    invoke-virtual {p0}, Lcom/amazon/insights/event/DefaultEvent;->getEventType()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v10, v11}, Lcom/amazon/insights/core/util/JSONBuilder;->withAttribute(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/insights/core/util/JSONBuilder;

    .line 209
    const-string v10, "unique_id"

    invoke-virtual {p0}, Lcom/amazon/insights/event/DefaultEvent;->getUniqueId()Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v11

    invoke-virtual {v11}, Lcom/amazon/insights/core/idresolver/Id;->getValue()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v10, v11}, Lcom/amazon/insights/core/util/JSONBuilder;->withAttribute(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/insights/core/util/JSONBuilder;

    .line 210
    const-string v10, "timestamp"

    invoke-virtual {p0}, Lcom/amazon/insights/event/DefaultEvent;->getEventTimestamp()Ljava/lang/Long;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    invoke-static {v11, v12}, Lcom/amazon/insights/core/util/DateUtil;->isoDateFromMillis(J)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v10, v11}, Lcom/amazon/insights/core/util/JSONBuilder;->withAttribute(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/insights/core/util/JSONBuilder;

    .line 215
    const-string v10, "platform"

    iget-object v11, p0, Lcom/amazon/insights/event/DefaultEvent;->deviceDetails:Lcom/amazon/insights/core/system/DeviceDetails;

    invoke-interface {v11}, Lcom/amazon/insights/core/system/DeviceDetails;->platform()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v10, v11}, Lcom/amazon/insights/core/util/JSONBuilder;->withAttribute(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/insights/core/util/JSONBuilder;

    .line 216
    const-string v10, "platform_version"

    iget-object v11, p0, Lcom/amazon/insights/event/DefaultEvent;->deviceDetails:Lcom/amazon/insights/core/system/DeviceDetails;

    invoke-interface {v11}, Lcom/amazon/insights/core/system/DeviceDetails;->platformVersion()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v10, v11}, Lcom/amazon/insights/core/util/JSONBuilder;->withAttribute(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/insights/core/util/JSONBuilder;

    .line 217
    const-string v10, "make"

    iget-object v11, p0, Lcom/amazon/insights/event/DefaultEvent;->deviceDetails:Lcom/amazon/insights/core/system/DeviceDetails;

    invoke-interface {v11}, Lcom/amazon/insights/core/system/DeviceDetails;->manufacturer()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v10, v11}, Lcom/amazon/insights/core/util/JSONBuilder;->withAttribute(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/insights/core/util/JSONBuilder;

    .line 218
    const-string v10, "model"

    iget-object v11, p0, Lcom/amazon/insights/event/DefaultEvent;->deviceDetails:Lcom/amazon/insights/core/system/DeviceDetails;

    invoke-interface {v11}, Lcom/amazon/insights/core/system/DeviceDetails;->model()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v10, v11}, Lcom/amazon/insights/core/util/JSONBuilder;->withAttribute(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/insights/core/util/JSONBuilder;

    .line 219
    const-string v10, "locale"

    invoke-virtual {v1, v10, v8}, Lcom/amazon/insights/core/util/JSONBuilder;->withAttribute(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/insights/core/util/JSONBuilder;

    .line 224
    const-string v10, "sdk_version"

    iget-object v11, p0, Lcom/amazon/insights/event/DefaultEvent;->sdkVersion:Ljava/lang/String;

    invoke-virtual {v1, v10, v11}, Lcom/amazon/insights/core/util/JSONBuilder;->withAttribute(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/insights/core/util/JSONBuilder;

    .line 225
    const-string v10, "sdk_name"

    iget-object v11, p0, Lcom/amazon/insights/event/DefaultEvent;->sdkName:Ljava/lang/String;

    invoke-virtual {v1, v10, v11}, Lcom/amazon/insights/core/util/JSONBuilder;->withAttribute(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/insights/core/util/JSONBuilder;

    .line 230
    const-string v10, "app_version_name"

    iget-object v11, p0, Lcom/amazon/insights/event/DefaultEvent;->appDetails:Lcom/amazon/insights/core/system/AppDetails;

    invoke-interface {v11}, Lcom/amazon/insights/core/system/AppDetails;->versionName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v10, v11}, Lcom/amazon/insights/core/util/JSONBuilder;->withAttribute(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/insights/core/util/JSONBuilder;

    .line 231
    const-string v10, "app_version_code"

    iget-object v11, p0, Lcom/amazon/insights/event/DefaultEvent;->appDetails:Lcom/amazon/insights/core/system/AppDetails;

    invoke-interface {v11}, Lcom/amazon/insights/core/system/AppDetails;->versionCode()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v10, v11}, Lcom/amazon/insights/core/util/JSONBuilder;->withAttribute(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/insights/core/util/JSONBuilder;

    .line 232
    const-string v10, "app_package_name"

    iget-object v11, p0, Lcom/amazon/insights/event/DefaultEvent;->appDetails:Lcom/amazon/insights/core/system/AppDetails;

    invoke-interface {v11}, Lcom/amazon/insights/core/system/AppDetails;->packageName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v10, v11}, Lcom/amazon/insights/core/util/JSONBuilder;->withAttribute(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/insights/core/util/JSONBuilder;

    .line 236
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 237
    .local v0, "attributesJson":Lorg/json/JSONObject;
    invoke-virtual {p0}, Lcom/amazon/insights/event/DefaultEvent;->getAllAttributes()Ljava/util/Map;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 239
    .local v5, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v0, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 240
    :catch_0
    move-exception v10

    goto :goto_1

    .line 200
    .end local v0    # "attributesJson":Lorg/json/JSONObject;
    .end local v1    # "builder":Lcom/amazon/insights/core/util/JSONBuilder;
    .end local v5    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v8    # "localeString":Ljava/lang/String;
    :cond_0
    const-string v8, "UNKNOWN"

    goto/16 :goto_0

    .line 244
    .restart local v0    # "attributesJson":Lorg/json/JSONObject;
    .restart local v1    # "builder":Lcom/amazon/insights/core/util/JSONBuilder;
    .restart local v6    # "i$":Ljava/util/Iterator;
    .restart local v8    # "localeString":Ljava/lang/String;
    :cond_1
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    .line 245
    .local v9, "metricsJson":Lorg/json/JSONObject;
    invoke-virtual {p0}, Lcom/amazon/insights/event/DefaultEvent;->getAllMetrics()Ljava/util/Map;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_2
    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 246
    .local v4, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Number;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Number;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .line 247
    .local v2, "clz":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/Number;>;"
    if-eqz v2, :cond_2

    .line 249
    :try_start_1
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    new-instance v12, Ljava/math/BigDecimal;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Number;

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v12, v11}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v10, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    .line 250
    :catch_1
    move-exception v3

    .line 251
    .local v3, "e":Lorg/json/JSONException;
    sget-object v11, Lcom/amazon/insights/event/DefaultEvent;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "error serializing metric. key:\'"

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v12, "\', value: "

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Number;

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v11, v10, v3}, Lcom/amazon/insights/core/log/Logger;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 258
    .end local v2    # "clz":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/Number;>;"
    .end local v3    # "e":Lorg/json/JSONException;
    .end local v4    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Number;>;"
    :cond_3
    invoke-virtual {v0}, Lorg/json/JSONObject;->length()I

    move-result v10

    if-lez v10, :cond_4

    .line 259
    const-string v10, "attributes"

    invoke-virtual {v1, v10, v0}, Lcom/amazon/insights/core/util/JSONBuilder;->withAttribute(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/insights/core/util/JSONBuilder;

    .line 263
    :cond_4
    invoke-virtual {v9}, Lorg/json/JSONObject;->length()I

    move-result v10

    if-lez v10, :cond_5

    .line 264
    const-string v10, "metrics"

    invoke-virtual {v1, v10, v9}, Lcom/amazon/insights/core/util/JSONBuilder;->withAttribute(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/insights/core/util/JSONBuilder;

    .line 266
    :cond_5
    invoke-virtual {v1}, Lcom/amazon/insights/core/util/JSONBuilder;->toJSONObject()Lorg/json/JSONObject;

    move-result-object v10

    return-object v10
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 189
    invoke-virtual {p0}, Lcom/amazon/insights/event/DefaultEvent;->toJSONObject()Lorg/json/JSONObject;

    move-result-object v1

    .line 191
    .local v1, "json":Lorg/json/JSONObject;
    const/4 v2, 0x4

    :try_start_0
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 193
    :goto_0
    return-object v2

    .line 192
    :catch_0
    move-exception v0

    .line 193
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public bridge synthetic withAttribute(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/Event;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-virtual {p0, p1, p2}, Lcom/amazon/insights/event/DefaultEvent;->withAttribute(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/event/DefaultEvent;

    move-result-object v0

    return-object v0
.end method

.method public withAttribute(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/event/DefaultEvent;
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 167
    invoke-virtual {p0, p1, p2}, Lcom/amazon/insights/event/DefaultEvent;->addAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    return-object p0
.end method

.method public bridge synthetic withMetric(Ljava/lang/String;Ljava/lang/Number;)Lcom/amazon/insights/Event;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/Number;

    .prologue
    .line 29
    invoke-virtual {p0, p1, p2}, Lcom/amazon/insights/event/DefaultEvent;->withMetric(Ljava/lang/String;Ljava/lang/Number;)Lcom/amazon/insights/event/DefaultEvent;

    move-result-object v0

    return-object v0
.end method

.method public withMetric(Ljava/lang/String;Ljava/lang/Number;)Lcom/amazon/insights/event/DefaultEvent;
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Number;

    .prologue
    .line 173
    invoke-virtual {p0, p1, p2}, Lcom/amazon/insights/event/DefaultEvent;->addMetric(Ljava/lang/String;Ljava/lang/Number;)V

    .line 174
    return-object p0
.end method
