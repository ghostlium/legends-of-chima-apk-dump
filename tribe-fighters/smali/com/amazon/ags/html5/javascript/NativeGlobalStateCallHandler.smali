.class public Lcom/amazon/ags/html5/javascript/NativeGlobalStateCallHandler;
.super Lcom/amazon/ags/html5/javascript/CallHandlerBase;
.source "NativeGlobalStateCallHandler.java"


# static fields
.field private static final supportedCalls:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final globalState:Lcom/amazon/ags/html5/util/GlobalState;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 28
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "batchGetGlobalState"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "batchPutGlobalState"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/amazon/ags/html5/javascript/NativeGlobalStateCallHandler;->supportedCalls:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Landroid/os/Handler;Lcom/amazon/ags/html5/util/GlobalState;)V
    .locals 1
    .param p1, "uiThreadHandler"    # Landroid/os/Handler;
    .param p2, "globalState"    # Lcom/amazon/ags/html5/util/GlobalState;

    .prologue
    .line 35
    sget-object v0, Lcom/amazon/ags/html5/javascript/NativeGlobalStateCallHandler;->supportedCalls:Ljava/util/Set;

    invoke-direct {p0, p1, v0}, Lcom/amazon/ags/html5/javascript/CallHandlerBase;-><init>(Landroid/os/Handler;Ljava/util/Set;)V

    .line 36
    iput-object p2, p0, Lcom/amazon/ags/html5/javascript/NativeGlobalStateCallHandler;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    .line 37
    return-void
.end method

.method private batchGetGlobalState(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "rid"    # Ljava/lang/String;
    .param p2, "request"    # Lorg/json/JSONObject;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/NativeGlobalStateCallHandler;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    invoke-virtual {v0}, Lcom/amazon/ags/html5/util/GlobalState;->toJSON()Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SUCCESS"

    invoke-virtual {p0, p1, v0, v1}, Lcom/amazon/ags/html5/javascript/NativeGlobalStateCallHandler;->sendReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    return-void
.end method

.method private batchPutGlobalState(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 8
    .param p1, "rid"    # Ljava/lang/String;
    .param p2, "request"    # Lorg/json/JSONObject;

    .prologue
    .line 58
    :try_start_0
    const-string v5, "parameters"

    invoke-virtual {p2, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 61
    .local v3, "parameters":Lorg/json/JSONObject;
    invoke-virtual {v3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 63
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 64
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 69
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 70
    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 74
    .local v4, "value":Ljava/lang/String;
    :goto_1
    iget-object v5, p0, Lcom/amazon/ags/html5/javascript/NativeGlobalStateCallHandler;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    invoke-virtual {v5, v2, v4}, Lcom/amazon/ags/html5/util/GlobalState;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 76
    .end local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "parameters":Lorg/json/JSONObject;
    .end local v4    # "value":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 77
    .local v0, "e":Lorg/json/JSONException;
    iget-object v5, p0, Lcom/amazon/ags/html5/javascript/NativeGlobalStateCallHandler;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unable to update global state from request "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 78
    const-string v5, "{}"

    const-string v6, "REQUEST_ERROR"

    invoke-virtual {p0, p1, v5, v6}, Lcom/amazon/ags/html5/javascript/NativeGlobalStateCallHandler;->sendReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .end local v0    # "e":Lorg/json/JSONException;
    :goto_2
    return-void

    .line 72
    .restart local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .restart local v2    # "key":Ljava/lang/String;
    .restart local v3    # "parameters":Lorg/json/JSONObject;
    :cond_0
    const/4 v4, 0x0

    .restart local v4    # "value":Ljava/lang/String;
    goto :goto_1

    .line 81
    .end local v2    # "key":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/String;
    :cond_1
    const-string v5, "{}"

    const-string v6, "SUCCESS"

    invoke-virtual {p0, p1, v5, v6}, Lcom/amazon/ags/html5/javascript/NativeGlobalStateCallHandler;->sendReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2
.end method


# virtual methods
.method protected handleMessage(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 2
    .param p1, "rid"    # Ljava/lang/String;
    .param p2, "nativeCallType"    # Ljava/lang/String;
    .param p3, "request"    # Lorg/json/JSONObject;

    .prologue
    const/4 v0, 0x1

    .line 41
    const-string v1, "batchGetGlobalState"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 42
    invoke-direct {p0, p1, p3}, Lcom/amazon/ags/html5/javascript/NativeGlobalStateCallHandler;->batchGetGlobalState(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 49
    :goto_0
    return v0

    .line 44
    :cond_0
    const-string v1, "batchPutGlobalState"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 45
    invoke-direct {p0, p1, p3}, Lcom/amazon/ags/html5/javascript/NativeGlobalStateCallHandler;->batchPutGlobalState(Ljava/lang/String;Lorg/json/JSONObject;)V

    goto :goto_0

    .line 49
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
