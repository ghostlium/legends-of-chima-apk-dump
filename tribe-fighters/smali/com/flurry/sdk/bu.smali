.class public final Lcom/flurry/sdk/bu;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Ljava/util/List;)Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/sdk/e;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkAdLog;",
            ">;"
        }
    .end annotation

    .prologue
    .line 17
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 18
    if-nez p0, :cond_0

    move-object v0, v2

    .line 51
    :goto_0
    return-object v0

    .line 22
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/e;

    .line 23
    new-instance v4, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkAdLog;

    invoke-direct {v4}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkAdLog;-><init>()V

    .line 24
    invoke-virtual {v0}, Lcom/flurry/sdk/e;->c()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v4, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkAdLog;->a(Ljava/lang/Long;)V

    .line 25
    invoke-virtual {v0}, Lcom/flurry/sdk/e;->b()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_2

    const-string v1, ""

    :goto_2
    invoke-virtual {v4, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkAdLog;->a(Ljava/lang/CharSequence;)V

    .line 26
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 30
    monitor-enter v0

    .line 31
    :try_start_0
    invoke-virtual {v0}, Lcom/flurry/sdk/e;->d()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_1
    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flurry/sdk/b;

    .line 32
    invoke-virtual {v1}, Lcom/flurry/sdk/b;->b()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 33
    new-instance v7, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkAdEvent;

    invoke-direct {v7}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkAdEvent;-><init>()V

    .line 34
    invoke-virtual {v1}, Lcom/flurry/sdk/b;->a()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkAdEvent;->a(Ljava/lang/CharSequence;)V

    .line 35
    invoke-virtual {v1}, Lcom/flurry/sdk/b;->c()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkAdEvent;->a(Ljava/lang/Long;)V

    .line 36
    invoke-virtual {v1}, Lcom/flurry/sdk/b;->d()Ljava/util/Map;

    move-result-object v1

    .line 37
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 38
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_4
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 39
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v8, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .line 45
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 25
    :cond_2
    invoke-virtual {v0}, Lcom/flurry/sdk/e;->b()Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    .line 41
    :cond_3
    :try_start_1
    invoke-virtual {v7, v8}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkAdEvent;->a(Ljava/util/Map;)V

    .line 42
    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 45
    :cond_4
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    invoke-virtual {v4, v5}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkAdLog;->a(Ljava/util/List;)V

    .line 48
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :cond_5
    move-object v0, v2

    .line 51
    goto/16 :goto_0
.end method
