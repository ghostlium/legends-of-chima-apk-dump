.class public Lcom/amazon/ags/html5/service/WebViewServiceHelper;
.super Ljava/lang/Object;
.source "WebViewServiceHelper.java"

# interfaces
.implements Lcom/amazon/ags/html5/service/ServiceHelper;
.implements Lcom/amazon/ags/html5/javascript/domain/MessageHandlerReadyListener;


# instance fields
.field private final context:Landroid/content/Context;

.field private final javascriptInterface:Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

.field private final messageQueue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private final replyMessenger:Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;

.field private final uiThreadHandler:Landroid/os/Handler;

.field final webView:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/amazon/ags/html5/javascript/JavascriptRepository;Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;Landroid/webkit/WebView;Landroid/os/Handler;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "javascriptRepository"    # Lcom/amazon/ags/html5/javascript/JavascriptRepository;
    .param p3, "javascriptInterface"    # Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;
    .param p4, "replyMessenger"    # Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;
    .param p5, "webView"    # Landroid/webkit/WebView;
    .param p6, "uiThreadHandler"    # Landroid/os/Handler;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/amazon/ags/html5/service/WebViewServiceHelper;->messageQueue:Ljava/util/List;

    .line 44
    iput-object p3, p0, Lcom/amazon/ags/html5/service/WebViewServiceHelper;->javascriptInterface:Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    .line 45
    iget-object v0, p0, Lcom/amazon/ags/html5/service/WebViewServiceHelper;->javascriptInterface:Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    invoke-virtual {v0, p0}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->addMessageHandlerReadyListener(Lcom/amazon/ags/html5/javascript/domain/MessageHandlerReadyListener;)V

    .line 47
    iput-object p1, p0, Lcom/amazon/ags/html5/service/WebViewServiceHelper;->context:Landroid/content/Context;

    .line 48
    iput-object p5, p0, Lcom/amazon/ags/html5/service/WebViewServiceHelper;->webView:Landroid/webkit/WebView;

    .line 49
    iput-object p4, p0, Lcom/amazon/ags/html5/service/WebViewServiceHelper;->replyMessenger:Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;

    .line 50
    iput-object p6, p0, Lcom/amazon/ags/html5/service/WebViewServiceHelper;->uiThreadHandler:Landroid/os/Handler;

    .line 51
    return-void
.end method

.method private deliverMessageToJavascript(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "msg"    # Lorg/json/JSONObject;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/amazon/ags/html5/service/WebViewServiceHelper;->uiThreadHandler:Landroid/os/Handler;

    new-instance v1, Lcom/amazon/ags/html5/service/WebViewServiceHelper$1;

    invoke-direct {v1, p0, p1}, Lcom/amazon/ags/html5/service/WebViewServiceHelper$1;-><init>(Lcom/amazon/ags/html5/service/WebViewServiceHelper;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 84
    return-void
.end method

.method private deliverOrQueueMessage(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "msg"    # Lorg/json/JSONObject;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/amazon/ags/html5/service/WebViewServiceHelper;->javascriptInterface:Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    invoke-virtual {v0}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->isReady()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 64
    invoke-direct {p0, p1}, Lcom/amazon/ags/html5/service/WebViewServiceHelper;->deliverMessageToJavascript(Lorg/json/JSONObject;)V

    .line 76
    :goto_0
    return-void

    .line 68
    :cond_0
    iget-object v1, p0, Lcom/amazon/ags/html5/service/WebViewServiceHelper;->messageQueue:Ljava/util/List;

    monitor-enter v1

    .line 70
    :try_start_0
    iget-object v0, p0, Lcom/amazon/ags/html5/service/WebViewServiceHelper;->javascriptInterface:Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    invoke-virtual {v0}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->isReady()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 71
    invoke-direct {p0, p1}, Lcom/amazon/ags/html5/service/WebViewServiceHelper;->deliverMessageToJavascript(Lorg/json/JSONObject;)V

    .line 75
    :goto_1
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 73
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/amazon/ags/html5/service/WebViewServiceHelper;->messageQueue:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1
.end method


# virtual methods
.method public handleRequestAsync(Lcom/amazon/ags/client/JSONRequest;)V
    .locals 1
    .param p1, "asyncRequest"    # Lcom/amazon/ags/client/JSONRequest;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/amazon/ags/html5/service/WebViewServiceHelper;->replyMessenger:Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;

    invoke-virtual {v0, p1}, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;->addAsyncRequest(Lcom/amazon/ags/client/JSONRequest;)V

    .line 55
    invoke-interface {p1}, Lcom/amazon/ags/client/JSONRequest;->getRequest()Lorg/json/JSONObject;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/amazon/ags/html5/service/WebViewServiceHelper;->deliverOrQueueMessage(Lorg/json/JSONObject;)V

    .line 56
    return-void
.end method

.method public messageHandlerReady()V
    .locals 4

    .prologue
    .line 87
    iget-object v3, p0, Lcom/amazon/ags/html5/service/WebViewServiceHelper;->messageQueue:Ljava/util/List;

    monitor-enter v3

    .line 88
    :try_start_0
    iget-object v2, p0, Lcom/amazon/ags/html5/service/WebViewServiceHelper;->messageQueue:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    .line 89
    .local v1, "msg":Lorg/json/JSONObject;
    invoke-direct {p0, v1}, Lcom/amazon/ags/html5/service/WebViewServiceHelper;->deliverMessageToJavascript(Lorg/json/JSONObject;)V

    goto :goto_0

    .line 91
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "msg":Lorg/json/JSONObject;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_0
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 92
    return-void
.end method
