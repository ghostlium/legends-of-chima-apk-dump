.class Lcom/playhaven/android/req/PlayHavenRequest$1;
.super Ljava/lang/Object;
.source "PlayHavenRequest.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/playhaven/android/req/PlayHavenRequest;->send(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/playhaven/android/req/PlayHavenRequest;

.field private final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/playhaven/android/req/PlayHavenRequest;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/playhaven/android/req/PlayHavenRequest$1;->this$0:Lcom/playhaven/android/req/PlayHavenRequest;

    iput-object p2, p0, Lcom/playhaven/android/req/PlayHavenRequest$1;->val$context:Landroid/content/Context;

    .line 426
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    .prologue
    .line 433
    :try_start_0
    iget-object v10, p0, Lcom/playhaven/android/req/PlayHavenRequest$1;->this$0:Lcom/playhaven/android/req/PlayHavenRequest;

    invoke-virtual {v10}, Lcom/playhaven/android/req/PlayHavenRequest;->getMockJsonResponse()Ljava/lang/String;

    move-result-object v7

    .line 434
    .local v7, "mockJsonResponse":Ljava/lang/String;
    if-eqz v7, :cond_0

    .line 439
    const-string v10, "Mock Response: %s"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object v7, v11, v12

    invoke-static {v10, v11}, Lcom/playhaven/android/PlayHaven;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 440
    iget-object v10, p0, Lcom/playhaven/android/req/PlayHavenRequest$1;->this$0:Lcom/playhaven/android/req/PlayHavenRequest;

    invoke-virtual {v10, v7}, Lcom/playhaven/android/req/PlayHavenRequest;->handleResponse(Ljava/lang/String;)V

    .line 473
    .end local v7    # "mockJsonResponse":Ljava/lang/String;
    :goto_0
    return-void

    .line 447
    .restart local v7    # "mockJsonResponse":Ljava/lang/String;
    :cond_0
    iget-object v10, p0, Lcom/playhaven/android/req/PlayHavenRequest$1;->this$0:Lcom/playhaven/android/req/PlayHavenRequest;

    iget-object v11, p0, Lcom/playhaven/android/req/PlayHavenRequest$1;->val$context:Landroid/content/Context;

    invoke-virtual {v10, v11}, Lcom/playhaven/android/req/PlayHavenRequest;->getUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v9

    .line 448
    .local v9, "url":Ljava/lang/String;
    const-string v10, "Request(%s): %s"

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    iget-object v13, p0, Lcom/playhaven/android/req/PlayHavenRequest$1;->this$0:Lcom/playhaven/android/req/PlayHavenRequest;

    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x1

    aput-object v9, v11, v12

    invoke-static {v10, v11}, Lcom/playhaven/android/PlayHaven;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 450
    iget-object v10, p0, Lcom/playhaven/android/req/PlayHavenRequest$1;->this$0:Lcom/playhaven/android/req/PlayHavenRequest;

    iget-object v10, v10, Lcom/playhaven/android/req/PlayHavenRequest;->rest:Lorg/springframework/web/client/RestTemplate;

    const-class v11, Ljava/lang/String;

    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/Object;

    invoke-virtual {v10, v9, v11, v12}, Lorg/springframework/web/client/RestTemplate;->getForEntity(Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Object;)Lorg/springframework/http/ResponseEntity;

    move-result-object v5

    .line 451
    .local v5, "entity":Lorg/springframework/http/ResponseEntity;, "Lorg/springframework/http/ResponseEntity<Ljava/lang/String;>;"
    invoke-virtual {v5}, Lorg/springframework/http/ResponseEntity;->getBody()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 453
    .local v6, "json":Ljava/lang/String;
    invoke-virtual {v5}, Lorg/springframework/http/ResponseEntity;->getHeaders()Lorg/springframework/http/HttpHeaders;

    move-result-object v10

    const-string v11, "X-PH-DIGEST"

    invoke-virtual {v10, v11}, Lorg/springframework/http/HttpHeaders;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 454
    .local v1, "digests":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v10

    if-nez v10, :cond_2

    :cond_1
    const/4 v0, 0x0

    .line 456
    .local v0, "digest":Ljava/lang/String;
    :goto_1
    iget-object v10, p0, Lcom/playhaven/android/req/PlayHavenRequest$1;->this$0:Lcom/playhaven/android/req/PlayHavenRequest;

    iget-object v11, p0, Lcom/playhaven/android/req/PlayHavenRequest$1;->val$context:Landroid/content/Context;

    invoke-virtual {v10, v11, v0, v6}, Lcom/playhaven/android/req/PlayHavenRequest;->validateSignatures(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 458
    invoke-virtual {v5}, Lorg/springframework/http/ResponseEntity;->getStatusCode()Lorg/springframework/http/HttpStatus;

    move-result-object v8

    .line 459
    .local v8, "statusCode":Lorg/springframework/http/HttpStatus;
    const-string v10, "Response (%s): %s"

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    .line 460
    aput-object v8, v11, v12

    const/4 v12, 0x1

    .line 461
    aput-object v6, v11, v12

    .line 459
    invoke-static {v10, v11}, Lcom/playhaven/android/PlayHaven;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 464
    iget-object v10, p0, Lcom/playhaven/android/req/PlayHavenRequest$1;->this$0:Lcom/playhaven/android/req/PlayHavenRequest;

    iget-object v11, p0, Lcom/playhaven/android/req/PlayHavenRequest$1;->val$context:Landroid/content/Context;

    invoke-virtual {v10, v11}, Lcom/playhaven/android/req/PlayHavenRequest;->serverSuccess(Landroid/content/Context;)V

    .line 465
    iget-object v10, p0, Lcom/playhaven/android/req/PlayHavenRequest$1;->this$0:Lcom/playhaven/android/req/PlayHavenRequest;

    invoke-virtual {v10, v6}, Lcom/playhaven/android/req/PlayHavenRequest;->handleResponse(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/playhaven/android/PlayHavenException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 466
    .end local v0    # "digest":Ljava/lang/String;
    .end local v1    # "digests":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v5    # "entity":Lorg/springframework/http/ResponseEntity;, "Lorg/springframework/http/ResponseEntity<Ljava/lang/String;>;"
    .end local v6    # "json":Ljava/lang/String;
    .end local v7    # "mockJsonResponse":Ljava/lang/String;
    .end local v8    # "statusCode":Lorg/springframework/http/HttpStatus;
    .end local v9    # "url":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 467
    .local v2, "e":Lcom/playhaven/android/PlayHavenException;
    iget-object v10, p0, Lcom/playhaven/android/req/PlayHavenRequest$1;->this$0:Lcom/playhaven/android/req/PlayHavenRequest;

    invoke-virtual {v10, v2}, Lcom/playhaven/android/req/PlayHavenRequest;->handleResponse(Lcom/playhaven/android/PlayHavenException;)V

    goto :goto_0

    .line 454
    .end local v2    # "e":Lcom/playhaven/android/PlayHavenException;
    .restart local v1    # "digests":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v5    # "entity":Lorg/springframework/http/ResponseEntity;, "Lorg/springframework/http/ResponseEntity<Ljava/lang/String;>;"
    .restart local v6    # "json":Ljava/lang/String;
    .restart local v7    # "mockJsonResponse":Ljava/lang/String;
    .restart local v9    # "url":Ljava/lang/String;
    :cond_2
    const/4 v10, 0x0

    :try_start_1
    invoke-interface {v1, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;
    :try_end_1
    .catch Lcom/playhaven/android/PlayHavenException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    move-object v0, v10

    goto :goto_1

    .line 468
    .end local v1    # "digests":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v5    # "entity":Lorg/springframework/http/ResponseEntity;, "Lorg/springframework/http/ResponseEntity<Ljava/lang/String;>;"
    .end local v6    # "json":Ljava/lang/String;
    .end local v7    # "mockJsonResponse":Ljava/lang/String;
    .end local v9    # "url":Ljava/lang/String;
    :catch_1
    move-exception v3

    .line 469
    .local v3, "e2":Ljava/io/IOException;
    iget-object v10, p0, Lcom/playhaven/android/req/PlayHavenRequest$1;->this$0:Lcom/playhaven/android/req/PlayHavenRequest;

    new-instance v11, Lcom/playhaven/android/PlayHavenException;

    invoke-direct {v11, v3}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {v10, v11}, Lcom/playhaven/android/req/PlayHavenRequest;->handleResponse(Lcom/playhaven/android/PlayHavenException;)V

    goto/16 :goto_0

    .line 470
    .end local v3    # "e2":Ljava/io/IOException;
    :catch_2
    move-exception v4

    .line 471
    .local v4, "e3":Ljava/lang/Exception;
    iget-object v10, p0, Lcom/playhaven/android/req/PlayHavenRequest$1;->this$0:Lcom/playhaven/android/req/PlayHavenRequest;

    new-instance v11, Lcom/playhaven/android/PlayHavenException;

    invoke-virtual {v4}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v11}, Lcom/playhaven/android/req/PlayHavenRequest;->handleResponse(Lcom/playhaven/android/PlayHavenException;)V

    goto/16 :goto_0
.end method
