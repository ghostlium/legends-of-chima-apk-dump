.class public Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;
.super Ljava/lang/Object;
.source "JavascriptInterface.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final closeAlertListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/html5/javascript/domain/CloseAlertListener;",
            ">;"
        }
    .end annotation
.end field

.field private final closeOverlayListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/html5/javascript/domain/CloseOverlayListener;",
            ">;"
        }
    .end annotation
.end field

.field private final executorService:Ljava/util/concurrent/ExecutorService;

.field private final id:Ljava/lang/String;

.field private isJavascriptReadyToHandleMessages:Z

.field private final nativeCallHandlers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/html5/javascript/CallHandlerBase;",
            ">;"
        }
    .end annotation
.end field

.field private final notifyOnReadyListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/html5/javascript/domain/MessageHandlerReadyListener;",
            ">;"
        }
    .end annotation
.end field

.field private final overlayLauncher:Lcom/amazon/ags/html5/overlay/OverlayManager;

.field private final replyMessenger:Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;

.field private final webView:Landroid/webkit/WebView;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;Lcom/amazon/ags/html5/overlay/OverlayManager;Ljava/util/List;Ljava/util/concurrent/ExecutorService;Landroid/webkit/WebView;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "replyMessenger"    # Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;
    .param p3, "overlayLauncher"    # Lcom/amazon/ags/html5/overlay/OverlayManager;
    .param p5, "executorService"    # Ljava/util/concurrent/ExecutorService;
    .param p6, "webView"    # Landroid/webkit/WebView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;",
            "Lcom/amazon/ags/html5/overlay/OverlayManager;",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/html5/javascript/CallHandlerBase;",
            ">;",
            "Ljava/util/concurrent/ExecutorService;",
            "Landroid/webkit/WebView;",
            ")V"
        }
    .end annotation

    .prologue
    .line 46
    .local p4, "nativeCallHandlers":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/html5/javascript/CallHandlerBase;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->notifyOnReadyListeners:Ljava/util/List;

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->closeOverlayListeners:Ljava/util/List;

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->closeAlertListeners:Ljava/util/List;

    .line 47
    iput-object p1, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->id:Ljava/lang/String;

    .line 48
    iput-object p2, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->replyMessenger:Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;

    .line 49
    iput-object p3, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->overlayLauncher:Lcom/amazon/ags/html5/overlay/OverlayManager;

    .line 50
    iput-object p4, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->nativeCallHandlers:Ljava/util/List;

    .line 51
    iput-object p5, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 52
    iput-object p6, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->webView:Landroid/webkit/WebView;

    .line 54
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->isJavascriptReadyToHandleMessages:Z

    .line 55
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    sget-object v0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;)Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->replyMessenger:Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;

    return-object v0
.end method

.method static synthetic access$200(Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;)Lcom/amazon/ags/html5/overlay/OverlayManager;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->overlayLauncher:Lcom/amazon/ags/html5/overlay/OverlayManager;

    return-object v0
.end method

.method static synthetic access$300(Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->notifyOnReadyListeners:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$400(Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->closeOverlayListeners:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$500(Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->closeAlertListeners:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$600(Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->nativeCallHandlers:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public addCloseAlertListener(Lcom/amazon/ags/html5/javascript/domain/CloseAlertListener;)V
    .locals 1
    .param p1, "closeAlertListener"    # Lcom/amazon/ags/html5/javascript/domain/CloseAlertListener;

    .prologue
    .line 72
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->closeAlertListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    return-void
.end method

.method public addCloseOverlayListener(Lcom/amazon/ags/html5/javascript/domain/CloseOverlayListener;)V
    .locals 1
    .param p1, "closeOverlayListener"    # Lcom/amazon/ags/html5/javascript/domain/CloseOverlayListener;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->closeOverlayListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    return-void
.end method

.method public addMessageHandlerReadyListener(Lcom/amazon/ags/html5/javascript/domain/MessageHandlerReadyListener;)V
    .locals 1
    .param p1, "messageHandlerReadyListener"    # Lcom/amazon/ags/html5/javascript/domain/MessageHandlerReadyListener;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->notifyOnReadyListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    return-void
.end method

.method public closeAlert()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 216
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$7;

    invoke-direct {v1, p0}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$7;-><init>(Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 223
    return-void
.end method

.method public closeOverlay()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 204
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$6;

    invoke-direct {v1, p0}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$6;-><init>(Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 211
    return-void
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->id:Ljava/lang/String;

    return-object v0
.end method

.method public handleMessage(Ljava/lang/String;)V
    .locals 2
    .param p1, "json"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 230
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$8;

    invoke-direct {v1, p0, p1}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$8;-><init>(Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 247
    return-void
.end method

.method public isReady()Z
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 186
    iget-boolean v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->isJavascriptReadyToHandleMessages:Z

    return v0
.end method

.method public logMessage(Ljava/lang/String;)V
    .locals 3
    .param p1, "logMessage"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 165
    invoke-static {}, Lcom/amazon/ags/html5/factory/ServiceFactory;->isDebugLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 166
    sget-object v0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "JS Log: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    :cond_0
    return-void
.end method

.method public sendJSReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "rid"    # Ljava/lang/String;
    .param p2, "resultJson"    # Ljava/lang/String;
    .param p3, "resultCode"    # Ljava/lang/String;
    .param p4, "httpResponseCode"    # Ljava/lang/String;

    .prologue
    .line 82
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 84
    .local v1, "root":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "__requestId"

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 85
    const-string v2, "resultCode"

    invoke-virtual {v1, v2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 86
    const-string v2, "httpResponseCode"

    invoke-virtual {v1, v2, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 89
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v2

    if-eqz v2, :cond_0

    .line 94
    :try_start_1
    const-string v2, "params"

    new-instance v3, Lorg/json/JSONTokener;

    invoke-direct {v3, p2}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 102
    :cond_0
    :goto_0
    :try_start_2
    iget-object v2, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->webView:Landroid/webkit/WebView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "javascript:receiveReply("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ");"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 108
    :goto_1
    return-void

    .line 95
    :catch_0
    move-exception v0

    .line 96
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to construct response for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 105
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v0

    .line 106
    .restart local v0    # "e":Ljava/lang/Exception;
    sget-object v2, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to convey response for rid ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method public sendReply(Ljava/lang/String;)V
    .locals 2
    .param p1, "json"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 128
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$1;

    invoke-direct {v1, p0, p1}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$1;-><init>(Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 140
    return-void
.end method

.method public setReadyForMessages()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 191
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->isJavascriptReadyToHandleMessages:Z

    .line 192
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$5;

    invoke-direct {v1, p0}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$5;-><init>(Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 199
    return-void
.end method

.method public showAlert(Ljava/lang/String;)V
    .locals 2
    .param p1, "json"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 155
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$3;

    invoke-direct {v1, p0, p1}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$3;-><init>(Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 160
    return-void
.end method

.method public showOverlay(Ljava/lang/String;)V
    .locals 2
    .param p1, "json"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 145
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$2;

    invoke-direct {v1, p0, p1}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$2;-><init>(Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 150
    return-void
.end method

.method public showToast(Ljava/lang/String;)V
    .locals 2
    .param p1, "json"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 173
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$4;

    invoke-direct {v1, p0, p1}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$4;-><init>(Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 178
    return-void
.end method
