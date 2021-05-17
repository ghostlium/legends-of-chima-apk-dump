.class Lcom/amazon/insights/core/configuration/HttpCachingConfiguration$1;
.super Ljava/lang/Object;
.source "HttpCachingConfiguration.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->syncConfiguration()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;


# direct methods
.method constructor <init>(Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;)V
    .locals 0

    .prologue
    .line 288
    iput-object p1, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration$1;->this$0:Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    .line 294
    const/4 v0, 0x0

    .line 296
    .local v0, "configJson":Lorg/json/JSONObject;
    :try_start_0
    iget-object v12, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration$1;->this$0:Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;

    invoke-static {v12}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->access$000(Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;)Lcom/amazon/insights/core/InsightsContext;

    move-result-object v12

    invoke-interface {v12}, Lcom/amazon/insights/core/InsightsContext;->getSystem()Lcom/amazon/insights/core/system/System;

    move-result-object v12

    invoke-interface {v12}, Lcom/amazon/insights/core/system/System;->getConnectivity()Lcom/amazon/insights/core/system/Connectivity;

    move-result-object v12

    invoke-interface {v12}, Lcom/amazon/insights/core/system/Connectivity;->isConnected()Z

    move-result v12

    if-eqz v12, :cond_5

    .line 298
    iget-object v12, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration$1;->this$0:Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;

    invoke-virtual {v12}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->createHttpRequest()Lcom/amazon/insights/core/http/HttpClient$Request;

    move-result-object v5

    .line 301
    .local v5, "httpRequest":Lcom/amazon/insights/core/http/HttpClient$Request;
    if-eqz v5, :cond_1

    .line 306
    const/4 v12, 0x1

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    .line 307
    .local v10, "retries":Ljava/lang/Integer;
    iget-object v12, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration$1;->this$0:Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;

    invoke-static {v12}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->access$100(Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;)Ljava/util/Map;

    move-result-object v12

    const-string v13, "configRequestRetries"

    invoke-interface {v12, v13}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 308
    iget-object v12, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration$1;->this$0:Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;

    invoke-static {v12}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->access$100(Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;)Ljava/util/Map;

    move-result-object v12

    const-string v13, "configRequestRetries"

    invoke-interface {v12, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 309
    .local v11, "retryValue":Ljava/lang/String;
    if-eqz v11, :cond_0

    .line 311
    :try_start_1
    invoke-static {v11}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v10

    .line 318
    .end local v11    # "retryValue":Ljava/lang/String;
    :cond_0
    :goto_0
    :try_start_2
    iget-object v12, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration$1;->this$0:Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;

    invoke-static {v12}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->access$300(Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;)Lcom/amazon/insights/core/InsightsContext;

    move-result-object v12

    invoke-interface {v12}, Lcom/amazon/insights/core/InsightsContext;->getHttpClient()Lcom/amazon/insights/core/http/HttpClient;

    move-result-object v12

    invoke-interface {v12, v5, v10}, Lcom/amazon/insights/core/http/HttpClient;->execute(Lcom/amazon/insights/core/http/HttpClient$Request;Ljava/lang/Integer;)Lcom/amazon/insights/core/http/HttpClient$Response;

    move-result-object v9

    .line 320
    .local v9, "response":Lcom/amazon/insights/core/http/HttpClient$Response;
    invoke-interface {v9}, Lcom/amazon/insights/core/http/HttpClient$Response;->getCode()I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v12

    const/16 v13, 0xc8

    if-ne v12, v13, :cond_4

    .line 322
    :try_start_3
    new-instance v1, Lorg/json/JSONObject;

    invoke-interface {v9}, Lcom/amazon/insights/core/http/HttpClient$Response;->getResponse()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v1, v12}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .end local v0    # "configJson":Lorg/json/JSONObject;
    .local v1, "configJson":Lorg/json/JSONObject;
    move-object v0, v1

    .line 331
    .end local v1    # "configJson":Lorg/json/JSONObject;
    .end local v9    # "response":Lcom/amazon/insights/core/http/HttpClient$Response;
    .end local v10    # "retries":Ljava/lang/Integer;
    .restart local v0    # "configJson":Lorg/json/JSONObject;
    :cond_1
    :goto_1
    if-eqz v0, :cond_3

    .line 333
    :try_start_4
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    .line 334
    .local v2, "configValues":Ljava/lang/String;
    invoke-static {}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->access$200()Lcom/amazon/insights/core/log/Logger;

    move-result-object v12

    sget-object v13, Lcom/amazon/insights/core/log/Logger$LogLevel;->VERBOSE:Lcom/amazon/insights/core/log/Logger$LogLevel;

    invoke-virtual {v12, v13}, Lcom/amazon/insights/core/log/Logger;->isLoggingEnabled(Lcom/amazon/insights/core/log/Logger$LogLevel;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 335
    invoke-static {}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->access$200()Lcom/amazon/insights/core/log/Logger;

    move-result-object v12

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "AppIntelligence config: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Lcom/amazon/insights/core/log/Logger;->v(Ljava/lang/String;)V

    .line 337
    :cond_2
    iget-object v12, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration$1;->this$0:Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;

    invoke-static {v12}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->access$300(Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;)Lcom/amazon/insights/core/InsightsContext;

    move-result-object v12

    invoke-interface {v12}, Lcom/amazon/insights/core/InsightsContext;->getSystem()Lcom/amazon/insights/core/system/System;

    move-result-object v12

    invoke-interface {v12}, Lcom/amazon/insights/core/system/System;->getPreferences()Lcom/amazon/insights/core/system/Preferences;

    move-result-object v8

    .line 338
    .local v8, "preferences":Lcom/amazon/insights/core/system/Preferences;
    const-string v12, "configuration"

    invoke-interface {v8, v12, v2}, Lcom/amazon/insights/core/system/Preferences;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 341
    iget-object v12, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration$1;->this$0:Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;

    invoke-static {v12, v0}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->access$400(Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;Lorg/json/JSONObject;)V

    .line 348
    .end local v2    # "configValues":Ljava/lang/String;
    .end local v5    # "httpRequest":Lcom/amazon/insights/core/http/HttpClient$Request;
    .end local v8    # "preferences":Lcom/amazon/insights/core/system/Preferences;
    :cond_3
    :goto_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 349
    .local v6, "now":J
    iget-object v12, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration$1;->this$0:Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;

    invoke-virtual {v12, v6, v7}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->setLastSync(J)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 355
    iget-object v12, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration$1;->this$0:Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;

    invoke-static {v12}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->access$500(Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 357
    .end local v6    # "now":J
    :goto_3
    return-void

    .line 312
    .restart local v5    # "httpRequest":Lcom/amazon/insights/core/http/HttpClient$Request;
    .restart local v10    # "retries":Ljava/lang/Integer;
    .restart local v11    # "retryValue":Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 313
    .local v4, "ex":Ljava/lang/Exception;
    :try_start_5
    invoke-static {}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->access$200()Lcom/amazon/insights/core/log/Logger;

    move-result-object v12

    const-string v13, "Could not get the http request retry value"

    const/4 v14, 0x0

    new-array v14, v14, [Ljava/lang/Object;

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13, v4}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto/16 :goto_0

    .line 350
    .end local v4    # "ex":Ljava/lang/Exception;
    .end local v5    # "httpRequest":Lcom/amazon/insights/core/http/HttpClient$Request;
    .end local v10    # "retries":Ljava/lang/Integer;
    .end local v11    # "retryValue":Ljava/lang/String;
    :catch_1
    move-exception v3

    .line 352
    .local v3, "e":Ljava/lang/Exception;
    :try_start_6
    invoke-static {}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->access$200()Lcom/amazon/insights/core/log/Logger;

    move-result-object v12

    const-string v13, "There was an error while attempting to sync the configuration"

    invoke-virtual {v12, v13, v3}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 355
    iget-object v12, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration$1;->this$0:Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;

    invoke-static {v12}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->access$500(Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto :goto_3

    .line 323
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v5    # "httpRequest":Lcom/amazon/insights/core/http/HttpClient$Request;
    .restart local v9    # "response":Lcom/amazon/insights/core/http/HttpClient$Response;
    .restart local v10    # "retries":Ljava/lang/Integer;
    :catch_2
    move-exception v3

    .line 324
    .local v3, "e":Lorg/json/JSONException;
    :try_start_7
    invoke-static {}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->access$200()Lcom/amazon/insights/core/log/Logger;

    move-result-object v12

    const-string v13, "error parsing service response"

    invoke-virtual {v12, v13, v3}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto/16 :goto_1

    .line 355
    .end local v3    # "e":Lorg/json/JSONException;
    .end local v5    # "httpRequest":Lcom/amazon/insights/core/http/HttpClient$Request;
    .end local v9    # "response":Lcom/amazon/insights/core/http/HttpClient$Response;
    .end local v10    # "retries":Ljava/lang/Integer;
    :catchall_0
    move-exception v12

    iget-object v13, p0, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration$1;->this$0:Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;

    invoke-static {v13}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->access$500(Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v13

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    throw v12

    .line 327
    .restart local v5    # "httpRequest":Lcom/amazon/insights/core/http/HttpClient$Request;
    .restart local v9    # "response":Lcom/amazon/insights/core/http/HttpClient$Response;
    .restart local v10    # "retries":Ljava/lang/Integer;
    :cond_4
    :try_start_8
    invoke-static {}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->access$200()Lcom/amazon/insights/core/log/Logger;

    move-result-object v12

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "service error: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-interface {v9}, Lcom/amazon/insights/core/http/HttpClient$Response;->getMessage()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "("

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-interface {v9}, Lcom/amazon/insights/core/http/HttpClient$Response;->getCode()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ")"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 344
    .end local v5    # "httpRequest":Lcom/amazon/insights/core/http/HttpClient$Request;
    .end local v9    # "response":Lcom/amazon/insights/core/http/HttpClient$Response;
    .end local v10    # "retries":Ljava/lang/Integer;
    :cond_5
    invoke-static {}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->access$200()Lcom/amazon/insights/core/log/Logger;

    move-result-object v12

    const-string v13, "Device not connected to sync config"

    invoke-virtual {v12, v13}, Lcom/amazon/insights/core/log/Logger;->v(Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto/16 :goto_2
.end method
