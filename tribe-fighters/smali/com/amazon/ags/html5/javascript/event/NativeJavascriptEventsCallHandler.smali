.class public Lcom/amazon/ags/html5/javascript/event/NativeJavascriptEventsCallHandler;
.super Lcom/amazon/ags/html5/javascript/CallHandlerBase;
.source "NativeJavascriptEventsCallHandler.java"


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
.field private final javascriptEventsManager:Lcom/amazon/ags/html5/javascript/event/JavascriptEventsManager;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 24
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "notifyNative"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/amazon/ags/html5/javascript/event/NativeJavascriptEventsCallHandler;->supportedCalls:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Landroid/os/Handler;Lcom/amazon/ags/html5/javascript/event/JavascriptEventsManager;)V
    .locals 1
    .param p1, "uiThreadHandler"    # Landroid/os/Handler;
    .param p2, "javascriptEventsManager"    # Lcom/amazon/ags/html5/javascript/event/JavascriptEventsManager;

    .prologue
    .line 29
    sget-object v0, Lcom/amazon/ags/html5/javascript/event/NativeJavascriptEventsCallHandler;->supportedCalls:Ljava/util/Set;

    invoke-direct {p0, p1, v0}, Lcom/amazon/ags/html5/javascript/CallHandlerBase;-><init>(Landroid/os/Handler;Ljava/util/Set;)V

    .line 30
    iput-object p2, p0, Lcom/amazon/ags/html5/javascript/event/NativeJavascriptEventsCallHandler;->javascriptEventsManager:Lcom/amazon/ags/html5/javascript/event/JavascriptEventsManager;

    .line 31
    return-void
.end method


# virtual methods
.method protected handleMessage(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 7
    .param p1, "rid"    # Ljava/lang/String;
    .param p2, "nativeCallType"    # Ljava/lang/String;
    .param p3, "request"    # Lorg/json/JSONObject;

    .prologue
    .line 35
    iget-object v4, p0, Lcom/amazon/ags/html5/javascript/event/NativeJavascriptEventsCallHandler;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Processing request ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "] for call type ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    const/4 v2, 0x0

    .line 39
    .local v2, "jsonReply":Ljava/lang/String;
    const-string v4, "notifyNative"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 41
    :try_start_0
    const-string v4, "parameters"

    invoke-virtual {p3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 42
    .local v3, "parameters":Lorg/json/JSONObject;
    const-string v4, "javascriptEventType"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 43
    .local v1, "eventType":Ljava/lang/String;
    iget-object v4, p0, Lcom/amazon/ags/html5/javascript/event/NativeJavascriptEventsCallHandler;->javascriptEventsManager:Lcom/amazon/ags/html5/javascript/event/JavascriptEventsManager;

    invoke-virtual {v4, v1}, Lcom/amazon/ags/html5/javascript/event/JavascriptEventsManager;->notifyListeners(Ljava/lang/String;)V

    .line 44
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 50
    .end local v1    # "eventType":Ljava/lang/String;
    .end local v3    # "parameters":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    iget-object v4, p0, Lcom/amazon/ags/html5/javascript/event/NativeJavascriptEventsCallHandler;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Returning reply ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "] for request ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    if-eqz v2, :cond_1

    .line 53
    invoke-virtual {v2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "SUCCESS"

    invoke-virtual {p0, p1, v4, v5}, Lcom/amazon/ags/html5/javascript/event/NativeJavascriptEventsCallHandler;->sendReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    const/4 v4, 0x1

    .line 56
    :goto_1
    return v4

    .line 45
    :catch_0
    move-exception v0

    .line 46
    .local v0, "e":Lorg/json/JSONException;
    iget-object v4, p0, Lcom/amazon/ags/html5/javascript/event/NativeJavascriptEventsCallHandler;->TAG:Ljava/lang/String;

    const-string v5, "Unable to get value for key [javascriptEventType]"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 56
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method
