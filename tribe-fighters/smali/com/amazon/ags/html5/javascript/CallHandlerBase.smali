.class public abstract Lcom/amazon/ags/html5/javascript/CallHandlerBase;
.super Ljava/lang/Object;
.source "CallHandlerBase.java"


# instance fields
.field protected final TAG:Ljava/lang/String;

.field private final replyMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;",
            ">;"
        }
    .end annotation
.end field

.field private final supportedMessageTypes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final uiThreadHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/os/Handler;Ljava/util/Set;)V
    .locals 2
    .param p1, "uiThreadHandler"    # Landroid/os/Handler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Handler;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p2, "supportedMessageTypes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/html5/javascript/CallHandlerBase;->TAG:Ljava/lang/String;

    .line 32
    iput-object p1, p0, Lcom/amazon/ags/html5/javascript/CallHandlerBase;->uiThreadHandler:Landroid/os/Handler;

    .line 33
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/html5/javascript/CallHandlerBase;->replyMap:Ljava/util/Map;

    .line 34
    iput-object p2, p0, Lcom/amazon/ags/html5/javascript/CallHandlerBase;->supportedMessageTypes:Ljava/util/Set;

    .line 35
    return-void
.end method


# virtual methods
.method public getSupportedMessages()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 38
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/CallHandlerBase;->supportedMessageTypes:Ljava/util/Set;

    return-object v0
.end method

.method public handleMessage(Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;Lorg/json/JSONObject;)Z
    .locals 7
    .param p1, "caller"    # Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;
    .param p2, "request"    # Lorg/json/JSONObject;

    .prologue
    const/4 v3, 0x1

    .line 45
    :try_start_0
    const-string v4, "rid"

    invoke-virtual {p2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 53
    .local v2, "requestRID":Ljava/lang/String;
    :try_start_1
    const-string v4, "nativeCall"

    invoke-virtual {p2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v1

    .line 60
    .local v1, "nativeCallType":Ljava/lang/String;
    iget-object v3, p0, Lcom/amazon/ags/html5/javascript/CallHandlerBase;->replyMap:Ljava/util/Map;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "-"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v1, p2}, Lcom/amazon/ags/html5/javascript/CallHandlerBase;->handleMessage(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z

    move-result v3

    .end local v1    # "nativeCallType":Ljava/lang/String;
    .end local v2    # "requestRID":Ljava/lang/String;
    :goto_0
    return v3

    .line 46
    :catch_0
    move-exception v0

    .line 47
    .local v0, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/amazon/ags/html5/javascript/CallHandlerBase;->TAG:Ljava/lang/String;

    const-string v5, "Unable to handle request with no RID to report back to."

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 54
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "requestRID":Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 55
    .local v0, "e":Lorg/json/JSONException;
    iget-object v4, p0, Lcom/amazon/ags/html5/javascript/CallHandlerBase;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unable to get nativeCall from request "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 56
    const-string v4, "{}"

    const-string v5, "REQUEST_ERROR"

    invoke-virtual {p0, v2, v4, v5}, Lcom/amazon/ags/html5/javascript/CallHandlerBase;->sendReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected abstract handleMessage(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
.end method

.method protected sendReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "rid"    # Ljava/lang/String;
    .param p2, "resultJson"    # Ljava/lang/String;
    .param p3, "resultCode"    # Ljava/lang/String;

    .prologue
    .line 70
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/amazon/ags/html5/javascript/CallHandlerBase;->sendReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    return-void
.end method

.method protected sendReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .param p1, "rid"    # Ljava/lang/String;
    .param p2, "resultJson"    # Ljava/lang/String;
    .param p3, "resultCode"    # Ljava/lang/String;
    .param p4, "httpResponseCode"    # Ljava/lang/String;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/CallHandlerBase;->replyMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    .line 76
    .local v2, "originalCaller":Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;
    if-eqz v2, :cond_0

    .line 78
    :try_start_0
    const-string v0, "-"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 79
    .local v8, "ridComponents":[Ljava/lang/String;
    const/4 v0, 0x1

    aget-object v3, v8, v0

    .line 81
    .local v3, "originalRid":Ljava/lang/String;
    iget-object v9, p0, Lcom/amazon/ags/html5/javascript/CallHandlerBase;->uiThreadHandler:Landroid/os/Handler;

    new-instance v0, Lcom/amazon/ags/html5/javascript/CallHandlerBase$1;

    move-object v1, p0

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/amazon/ags/html5/javascript/CallHandlerBase$1;-><init>(Lcom/amazon/ags/html5/javascript/CallHandlerBase;Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v9, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    .end local v3    # "originalRid":Ljava/lang/String;
    .end local v8    # "ridComponents":[Ljava/lang/String;
    :goto_0
    return-void

    .line 86
    :catch_0
    move-exception v7

    .line 87
    .local v7, "e":Ljava/lang/Exception;
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/CallHandlerBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to route reply back to caller for rid ["

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "]"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 90
    .end local v7    # "e":Ljava/lang/Exception;
    :cond_0
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/CallHandlerBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "No receiver for reply associated with rid: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
