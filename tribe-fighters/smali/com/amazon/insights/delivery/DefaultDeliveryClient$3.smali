.class Lcom/amazon/insights/delivery/DefaultDeliveryClient$3;
.super Ljava/lang/Object;
.source "DefaultDeliveryClient.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/insights/delivery/DefaultDeliveryClient;->attemptDelivery(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/insights/delivery/DefaultDeliveryClient;

.field final synthetic val$policies:Ljava/util/List;

.field final synthetic val$submitWaitLatch:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method constructor <init>(Lcom/amazon/insights/delivery/DefaultDeliveryClient;Ljava/util/List;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .prologue
    .line 161
    iput-object p1, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$3;->this$0:Lcom/amazon/insights/delivery/DefaultDeliveryClient;

    iput-object p2, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$3;->val$policies:Ljava/util/List;

    iput-object p3, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$3;->val$submitWaitLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 25

    .prologue
    .line 165
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v15

    .line 166
    .local v15, "start":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$3;->val$policies:Ljava/util/List;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_1

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/amazon/insights/delivery/policy/DeliveryPolicy;

    .line 167
    .local v14, "policy":Lcom/amazon/insights/delivery/policy/DeliveryPolicy;
    invoke-interface {v14}, Lcom/amazon/insights/delivery/policy/DeliveryPolicy;->isAllowed()Z

    move-result v19

    if-nez v19, :cond_0

    .line 216
    .end local v14    # "policy":Lcom/amazon/insights/delivery/policy/DeliveryPolicy;
    :goto_0
    return-void

    .line 173
    :cond_1
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$3;->val$submitWaitLatch:Ljava/util/concurrent/CountDownLatch;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$3;->this$0:Lcom/amazon/insights/delivery/DefaultDeliveryClient;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->access$400(Lcom/amazon/insights/delivery/DefaultDeliveryClient;)J

    move-result-wide v20

    sget-object v22, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v19 .. v22}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1

    .line 177
    :goto_1
    const/16 v18, 0x1

    .line 178
    .local v18, "successful":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$3;->this$0:Lcom/amazon/insights/delivery/DefaultDeliveryClient;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->access$500(Lcom/amazon/insights/delivery/DefaultDeliveryClient;)Lcom/amazon/insights/core/InsightsContext;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Lcom/amazon/insights/core/InsightsContext;->getConfiguration()Lcom/amazon/insights/core/configuration/Configuration;

    move-result-object v19

    const-string v20, "maxSubmissionSize"

    const-wide/32 v21, 0x19000

    invoke-static/range {v21 .. v22}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v21

    invoke-interface/range {v19 .. v21}, Lcom/amazon/insights/core/configuration/Configuration;->optLong(Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    .line 181
    .local v12, "maxRequestSize":J
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    .line 182
    .local v5, "eventArray":Lorg/json/JSONArray;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$3;->this$0:Lcom/amazon/insights/delivery/DefaultDeliveryClient;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->access$100(Lcom/amazon/insights/delivery/DefaultDeliveryClient;)Lcom/amazon/insights/delivery/EventStore;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Lcom/amazon/insights/delivery/EventStore;->iterator()Lcom/amazon/insights/delivery/EventStore$EventIterator;

    move-result-object v10

    .line 183
    .local v10, "iter":Lcom/amazon/insights/delivery/EventStore$EventIterator;
    const-wide/16 v2, 0x0

    .line 185
    .local v2, "currentRequestLength":J
    const/16 v17, 0x0

    .line 186
    .local v17, "submissions":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$3;->this$0:Lcom/amazon/insights/delivery/DefaultDeliveryClient;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->access$500(Lcom/amazon/insights/delivery/DefaultDeliveryClient;)Lcom/amazon/insights/core/InsightsContext;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Lcom/amazon/insights/core/InsightsContext;->getConfiguration()Lcom/amazon/insights/core/configuration/Configuration;

    move-result-object v19

    const-string v20, "maxSubmissionAllowed"

    const/16 v21, 0x3

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    invoke-interface/range {v19 .. v21}, Lcom/amazon/insights/core/configuration/Configuration;->optInt(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v11

    .line 187
    .local v11, "maxAllowedSubmissions":I
    :goto_2
    invoke-interface {v10}, Lcom/amazon/insights/delivery/EventStore$EventIterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_4

    move/from16 v0, v17

    if-ge v0, v11, :cond_4

    .line 189
    :try_start_1
    invoke-interface {v10}, Lcom/amazon/insights/delivery/EventStore$EventIterator;->peek()Ljava/lang/String;

    move-result-object v19

    if-eqz v19, :cond_2

    invoke-interface {v10}, Lcom/amazon/insights/delivery/EventStore$EventIterator;->peek()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v19

    move/from16 v0, v19

    int-to-long v7, v0

    .line 190
    .local v7, "eventLength":J
    :goto_3
    add-long v19, v2, v7

    cmp-long v19, v19, v12

    if-gtz v19, :cond_3

    .line 191
    add-long/2addr v2, v7

    .line 192
    new-instance v20, Lorg/json/JSONObject;

    invoke-interface {v10}, Lcom/amazon/insights/delivery/EventStore$EventIterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 204
    .end local v7    # "eventLength":J
    :catch_0
    move-exception v4

    .line 205
    .local v4, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->access$200()Lcom/amazon/insights/core/log/Logger;

    move-result-object v19

    const-string v20, "Could not convert stored event into json"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v0, v1, v4}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 189
    .end local v4    # "e":Lorg/json/JSONException;
    :cond_2
    const-wide/16 v7, 0x0

    goto :goto_3

    .line 194
    .restart local v7    # "eventLength":J
    :cond_3
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$3;->this$0:Lcom/amazon/insights/delivery/DefaultDeliveryClient;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$3;->val$policies:Ljava/util/List;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-static {v0, v5, v1}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->access$600(Lcom/amazon/insights/delivery/DefaultDeliveryClient;Lorg/json/JSONArray;Ljava/util/List;)Z

    move-result v18

    .line 195
    if-eqz v18, :cond_4

    .line 196
    add-int/lit8 v17, v17, 0x1

    .line 197
    invoke-interface {v10}, Lcom/amazon/insights/delivery/EventStore$EventIterator;->removeReadEvents()V

    .line 198
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    .line 199
    .end local v5    # "eventArray":Lorg/json/JSONArray;
    .local v6, "eventArray":Lorg/json/JSONArray;
    const-wide/16 v2, 0x0

    move-object v5, v6

    .end local v6    # "eventArray":Lorg/json/JSONArray;
    .restart local v5    # "eventArray":Lorg/json/JSONArray;
    goto :goto_2

    .line 210
    .end local v7    # "eventLength":J
    :cond_4
    if-eqz v18, :cond_5

    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v19

    if-lez v19, :cond_5

    .line 211
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$3;->this$0:Lcom/amazon/insights/delivery/DefaultDeliveryClient;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$3;->val$policies:Ljava/util/List;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-static {v0, v5, v1}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->access$600(Lcom/amazon/insights/delivery/DefaultDeliveryClient;Lorg/json/JSONArray;Ljava/util/List;)Z

    move-result v19

    if-eqz v19, :cond_5

    .line 212
    invoke-interface {v10}, Lcom/amazon/insights/delivery/EventStore$EventIterator;->removeReadEvents()V

    .line 215
    :cond_5
    invoke-static {}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->access$200()Lcom/amazon/insights/core/log/Logger;

    move-result-object v19

    const-string v20, "Time of attemptDelivery: %d"

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v23

    sub-long v23, v23, v15

    invoke-static/range {v23 .. v24}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v20 .. v21}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Lcom/amazon/insights/core/log/Logger;->v(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 174
    .end local v2    # "currentRequestLength":J
    .end local v5    # "eventArray":Lorg/json/JSONArray;
    .end local v10    # "iter":Lcom/amazon/insights/delivery/EventStore$EventIterator;
    .end local v11    # "maxAllowedSubmissions":I
    .end local v12    # "maxRequestSize":J
    .end local v17    # "submissions":I
    .end local v18    # "successful":Z
    :catch_1
    move-exception v19

    goto/16 :goto_1
.end method
