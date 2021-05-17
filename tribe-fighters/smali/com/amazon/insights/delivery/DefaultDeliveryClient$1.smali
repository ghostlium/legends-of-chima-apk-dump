.class Lcom/amazon/insights/delivery/DefaultDeliveryClient$1;
.super Ljava/lang/Object;
.source "DefaultDeliveryClient.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/insights/delivery/DefaultDeliveryClient;->enqueueEventForDelivery(Lcom/amazon/insights/event/InternalEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/insights/delivery/DefaultDeliveryClient;

.field final synthetic val$event:Lcom/amazon/insights/event/InternalEvent;

.field final synthetic val$origEventsProcessed:J

.field final synthetic val$startEnqueueTimeMillis:J


# direct methods
.method constructor <init>(Lcom/amazon/insights/delivery/DefaultDeliveryClient;Lcom/amazon/insights/event/InternalEvent;JJ)V
    .locals 0

    .prologue
    .line 102
    iput-object p1, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$1;->this$0:Lcom/amazon/insights/delivery/DefaultDeliveryClient;

    iput-object p2, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$1;->val$event:Lcom/amazon/insights/event/InternalEvent;

    iput-wide p3, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$1;->val$origEventsProcessed:J

    iput-wide p5, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$1;->val$startEnqueueTimeMillis:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    .line 105
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 107
    .local v2, "start":J
    :try_start_0
    iget-object v4, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$1;->this$0:Lcom/amazon/insights/delivery/DefaultDeliveryClient;

    invoke-static {v4}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->access$100(Lcom/amazon/insights/delivery/DefaultDeliveryClient;)Lcom/amazon/insights/delivery/EventStore;

    move-result-object v5

    iget-object v4, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$1;->this$0:Lcom/amazon/insights/delivery/DefaultDeliveryClient;

    invoke-static {v4}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->access$000(Lcom/amazon/insights/delivery/DefaultDeliveryClient;)Lcom/amazon/insights/event/adapter/EventAdapter;

    move-result-object v4

    iget-object v6, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$1;->val$event:Lcom/amazon/insights/event/InternalEvent;

    invoke-interface {v4, v6}, Lcom/amazon/insights/event/adapter/EventAdapter;->translateFromEvent(Lcom/amazon/insights/event/InternalEvent;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/json/JSONObject;

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v5, v4}, Lcom/amazon/insights/delivery/EventStore;->put(Ljava/lang/String;)Z

    move-result v1

    .line 109
    .local v1, "eventStored":Z
    if-eqz v1, :cond_0

    .line 110
    invoke-static {}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->access$200()Lcom/amazon/insights/core/log/Logger;

    move-result-object v4

    const-string v5, "Event: \'%s\' recorded to local filestore"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$1;->val$event:Lcom/amazon/insights/event/InternalEvent;

    invoke-interface {v8}, Lcom/amazon/insights/event/InternalEvent;->getEventType()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x5

    const/4 v10, 0x1

    invoke-static {v8, v9, v10}, Lcom/amazon/insights/core/util/StringUtil;->clipString(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/amazon/insights/core/log/Logger;->devi(Ljava/lang/String;)V

    .line 111
    invoke-static {}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->access$200()Lcom/amazon/insights/core/log/Logger;

    move-result-object v4

    const-string v5, "Time of enqueueEventForDelivery: %d"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v8, v2

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/amazon/insights/core/log/Logger;->v(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/amazon/insights/delivery/EventStoreException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 118
    :goto_0
    iget-object v4, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$1;->this$0:Lcom/amazon/insights/delivery/DefaultDeliveryClient;

    iget-wide v5, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$1;->val$origEventsProcessed:J

    iget-wide v7, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$1;->val$startEnqueueTimeMillis:J

    invoke-static {v4, v5, v6, v7, v8}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->access$300(Lcom/amazon/insights/delivery/DefaultDeliveryClient;JJ)V

    .line 120
    .end local v1    # "eventStored":Z
    :goto_1
    return-void

    .line 113
    .restart local v1    # "eventStored":Z
    :cond_0
    :try_start_1
    invoke-static {}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->access$200()Lcom/amazon/insights/core/log/Logger;

    move-result-object v4

    const-string v5, "Event: \'%s\' failed to record to local filestore"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$1;->val$event:Lcom/amazon/insights/event/InternalEvent;

    invoke-interface {v8}, Lcom/amazon/insights/event/InternalEvent;->getEventType()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x5

    const/4 v10, 0x1

    invoke-static {v8, v9, v10}, Lcom/amazon/insights/core/util/StringUtil;->clipString(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V
    :try_end_1
    .catch Lcom/amazon/insights/delivery/EventStoreException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 115
    .end local v1    # "eventStored":Z
    :catch_0
    move-exception v0

    .line 116
    .local v0, "e":Lcom/amazon/insights/delivery/EventStoreException;
    :try_start_2
    invoke-static {}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->access$200()Lcom/amazon/insights/core/log/Logger;

    move-result-object v4

    const-string v5, "Event: \'%s\' failed to record to local filestore"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$1;->val$event:Lcom/amazon/insights/event/InternalEvent;

    invoke-interface {v8}, Lcom/amazon/insights/event/InternalEvent;->getEventType()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x5

    const/4 v10, 0x1

    invoke-static {v8, v9, v10}, Lcom/amazon/insights/core/util/StringUtil;->clipString(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 118
    iget-object v4, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$1;->this$0:Lcom/amazon/insights/delivery/DefaultDeliveryClient;

    iget-wide v5, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$1;->val$origEventsProcessed:J

    iget-wide v7, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$1;->val$startEnqueueTimeMillis:J

    invoke-static {v4, v5, v6, v7, v8}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->access$300(Lcom/amazon/insights/delivery/DefaultDeliveryClient;JJ)V

    goto :goto_1

    .end local v0    # "e":Lcom/amazon/insights/delivery/EventStoreException;
    :catchall_0
    move-exception v4

    iget-object v5, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$1;->this$0:Lcom/amazon/insights/delivery/DefaultDeliveryClient;

    iget-wide v6, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$1;->val$origEventsProcessed:J

    iget-wide v8, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$1;->val$startEnqueueTimeMillis:J

    invoke-static {v5, v6, v7, v8, v9}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->access$300(Lcom/amazon/insights/delivery/DefaultDeliveryClient;JJ)V

    throw v4
.end method
