.class public Lcom/tapjoy/TJEvent;
.super Ljava/lang/Object;
.source "TJEvent.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "TJEvent"


# instance fields
.field private autoShowContent:Z

.field private callback:Lcom/tapjoy/TJEventCallback;

.field private contentAvailable:Z

.field private context:Landroid/content/Context;

.field private eventData:Lcom/tapjoy/TJEventData;

.field private eventParams:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private urlParams:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/tapjoy/TJEventCallback;)V
    .locals 1
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "eventName"    # Ljava/lang/String;
    .param p3, "cb"    # Lcom/tapjoy/TJEventCallback;

    .prologue
    .line 56
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/tapjoy/TJEvent;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/tapjoy/TJEventCallback;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/tapjoy/TJEventCallback;)V
    .locals 6
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "eventName"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;
    .param p4, "cb"    # Lcom/tapjoy/TJEventCallback;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-boolean v5, p0, Lcom/tapjoy/TJEvent;->contentAvailable:Z

    .line 44
    iput-boolean v4, p0, Lcom/tapjoy/TJEvent;->autoShowContent:Z

    .line 68
    iput-object p1, p0, Lcom/tapjoy/TJEvent;->context:Landroid/content/Context;

    .line 69
    iput-object p4, p0, Lcom/tapjoy/TJEvent;->callback:Lcom/tapjoy/TJEventCallback;

    .line 71
    new-instance v1, Lcom/tapjoy/TJEventData;

    invoke-direct {v1}, Lcom/tapjoy/TJEventData;-><init>()V

    iput-object v1, p0, Lcom/tapjoy/TJEvent;->eventData:Lcom/tapjoy/TJEventData;

    .line 72
    iget-object v1, p0, Lcom/tapjoy/TJEvent;->eventData:Lcom/tapjoy/TJEventData;

    iput-object p2, v1, Lcom/tapjoy/TJEventData;->name:Ljava/lang/String;

    .line 73
    iget-object v1, p0, Lcom/tapjoy/TJEvent;->eventData:Lcom/tapjoy/TJEventData;

    iput-object p3, v1, Lcom/tapjoy/TJEventData;->value:Ljava/lang/String;

    .line 74
    iget-object v1, p0, Lcom/tapjoy/TJEvent;->eventData:Lcom/tapjoy/TJEventData;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/tapjoy/TJEventData;->guid:Ljava/lang/String;

    .line 76
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/tapjoy/TJEvent;->eventParams:Ljava/util/Map;

    .line 77
    iget-object v1, p0, Lcom/tapjoy/TJEvent;->eventParams:Ljava/util/Map;

    const-string v2, "event_name"

    iget-object v3, p0, Lcom/tapjoy/TJEvent;->eventData:Lcom/tapjoy/TJEventData;

    iget-object v3, v3, Lcom/tapjoy/TJEventData;->name:Ljava/lang/String;

    invoke-static {v1, v2, v3, v4}, Lcom/tapjoy/TapjoyUtil;->safePut(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 78
    iget-object v1, p0, Lcom/tapjoy/TJEvent;->eventParams:Ljava/util/Map;

    const-string v2, "event_value"

    iget-object v3, p0, Lcom/tapjoy/TJEvent;->eventData:Lcom/tapjoy/TJEventData;

    iget-object v3, v3, Lcom/tapjoy/TJEventData;->value:Ljava/lang/String;

    invoke-static {v1, v2, v3, v4}, Lcom/tapjoy/TapjoyUtil;->safePut(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 80
    invoke-static {}, Lcom/tapjoy/TapjoyConnectCore;->getGenericURLParams()Ljava/util/Map;

    move-result-object v1

    iput-object v1, p0, Lcom/tapjoy/TJEvent;->urlParams:Ljava/util/Map;

    .line 81
    iget-object v1, p0, Lcom/tapjoy/TJEvent;->urlParams:Ljava/util/Map;

    iget-object v2, p0, Lcom/tapjoy/TJEvent;->eventParams:Ljava/util/Map;

    invoke-interface {v1, v2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 82
    iget-object v1, p0, Lcom/tapjoy/TJEvent;->urlParams:Ljava/util/Map;

    invoke-static {}, Lcom/tapjoy/TapjoyConnectCore;->getTimeStampAndVerifierParams()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 84
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/tapjoy/TapjoyConnectCore;->getEventURL()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "events?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 85
    .local v0, "url":Ljava/lang/String;
    iget-object v1, p0, Lcom/tapjoy/TJEvent;->eventData:Lcom/tapjoy/TJEventData;

    iput-object v0, v1, Lcom/tapjoy/TJEventData;->url:Ljava/lang/String;

    .line 86
    iget-object v1, p0, Lcom/tapjoy/TJEvent;->eventData:Lcom/tapjoy/TJEventData;

    const/16 v2, 0x2f

    const-string v3, "//"

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    const-string v4, "//"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    add-int/2addr v3, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    invoke-virtual {v0, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/tapjoy/TJEventData;->baseURL:Ljava/lang/String;

    .line 89
    :goto_0
    iget-object v1, p0, Lcom/tapjoy/TJEvent;->eventData:Lcom/tapjoy/TJEventData;

    iget-object v1, v1, Lcom/tapjoy/TJEventData;->guid:Ljava/lang/String;

    invoke-static {v1}, Lcom/tapjoy/TJEventManager;->get(Ljava/lang/String;)Lcom/tapjoy/TJEvent;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 91
    iget-object v1, p0, Lcom/tapjoy/TJEvent;->eventData:Lcom/tapjoy/TJEventData;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/tapjoy/TJEventData;->guid:Ljava/lang/String;

    goto :goto_0

    .line 95
    :cond_0
    iget-object v1, p0, Lcom/tapjoy/TJEvent;->eventData:Lcom/tapjoy/TJEventData;

    iget-object v1, v1, Lcom/tapjoy/TJEventData;->guid:Ljava/lang/String;

    invoke-static {v1, p0}, Lcom/tapjoy/TJEventManager;->put(Ljava/lang/String;Lcom/tapjoy/TJEvent;)V

    .line 96
    return-void
.end method

.method static synthetic access$000(Lcom/tapjoy/TJEvent;)Lcom/tapjoy/TJEventData;
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TJEvent;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/tapjoy/TJEvent;->eventData:Lcom/tapjoy/TJEventData;

    return-object v0
.end method

.method static synthetic access$100(Lcom/tapjoy/TJEvent;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TJEvent;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/tapjoy/TJEvent;->urlParams:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$200(Lcom/tapjoy/TJEvent;)Lcom/tapjoy/TJEventCallback;
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TJEvent;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/tapjoy/TJEvent;->callback:Lcom/tapjoy/TJEventCallback;

    return-object v0
.end method

.method static synthetic access$300(Lcom/tapjoy/TJEvent;)Z
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TJEvent;

    .prologue
    .line 28
    iget-boolean v0, p0, Lcom/tapjoy/TJEvent;->contentAvailable:Z

    return v0
.end method

.method static synthetic access$302(Lcom/tapjoy/TJEvent;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/tapjoy/TJEvent;
    .param p1, "x1"    # Z

    .prologue
    .line 28
    iput-boolean p1, p0, Lcom/tapjoy/TJEvent;->contentAvailable:Z

    return p1
.end method

.method static synthetic access$400(Lcom/tapjoy/TJEvent;)Z
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TJEvent;

    .prologue
    .line 28
    iget-boolean v0, p0, Lcom/tapjoy/TJEvent;->autoShowContent:Z

    return v0
.end method


# virtual methods
.method public enableAutoPresent(Z)V
    .locals 0
    .param p1, "autoPresent"    # Z

    .prologue
    .line 117
    iput-boolean p1, p0, Lcom/tapjoy/TJEvent;->autoShowContent:Z

    .line 118
    return-void
.end method

.method public getCallback()Lcom/tapjoy/TJEventCallback;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lcom/tapjoy/TJEvent;->callback:Lcom/tapjoy/TJEventCallback;

    return-object v0
.end method

.method public getGUID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lcom/tapjoy/TJEvent;->eventData:Lcom/tapjoy/TJEventData;

    iget-object v0, v0, Lcom/tapjoy/TJEventData;->guid:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lcom/tapjoy/TJEvent;->eventData:Lcom/tapjoy/TJEventData;

    iget-object v0, v0, Lcom/tapjoy/TJEventData;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getParameters()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 257
    iget-object v0, p0, Lcom/tapjoy/TJEvent;->eventParams:Ljava/util/Map;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lcom/tapjoy/TJEvent;->eventData:Lcom/tapjoy/TJEventData;

    iget-object v0, v0, Lcom/tapjoy/TJEventData;->value:Ljava/lang/String;

    return-object v0
.end method

.method public processSendCallback(Z)V
    .locals 2
    .param p1, "shouldSend"    # Z

    .prologue
    .line 309
    if-eqz p1, :cond_0

    .line 310
    invoke-virtual {p0}, Lcom/tapjoy/TJEvent;->sendRequest()V

    .line 316
    :goto_0
    return-void

    .line 313
    :cond_0
    invoke-virtual {p0}, Lcom/tapjoy/TJEvent;->trackEventForOfflineDelivery()V

    .line 314
    iget-object v0, p0, Lcom/tapjoy/TJEvent;->callback:Lcom/tapjoy/TJEventCallback;

    const/4 v1, 0x0

    invoke-interface {v0, p0, v1}, Lcom/tapjoy/TJEventCallback;->sendEventCompleted(Lcom/tapjoy/TJEvent;Z)V

    goto :goto_0
.end method

.method public send()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 210
    iget-object v0, p0, Lcom/tapjoy/TJEvent;->callback:Lcom/tapjoy/TJEventCallback;

    if-nez v0, :cond_0

    .line 212
    const-string v0, "TJEvent"

    const-string v1, "TJEventSendCallback is null"

    invoke-static {v0, v1}, Lcom/tapjoy/TapjoyLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    :cond_0
    invoke-static {}, Lcom/tapjoy/TapjoyConnectCore;->getInstance()Lcom/tapjoy/TapjoyConnectCore;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/tapjoy/TapjoyConnectCore;->getInstance()Lcom/tapjoy/TapjoyConnectCore;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tapjoy/TapjoyConnectCore;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_3

    .line 218
    :cond_1
    const-string v0, "TJEvent"

    const-string v1, "ERROR -- SDK not initialized -- requestTapjoyConnect must be called first"

    invoke-static {v0, v1}, Lcom/tapjoy/TapjoyLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    iget-object v0, p0, Lcom/tapjoy/TJEvent;->callback:Lcom/tapjoy/TJEventCallback;

    if-eqz v0, :cond_2

    .line 221
    iget-object v0, p0, Lcom/tapjoy/TJEvent;->callback:Lcom/tapjoy/TJEventCallback;

    new-instance v1, Lcom/tapjoy/TJError;

    const-string v2, "SDK not initialized -- requestTapjoyConnect must be called first"

    invoke-direct {v1, v3, v2}, Lcom/tapjoy/TJError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, p0, v1}, Lcom/tapjoy/TJEventCallback;->sendEventFail(Lcom/tapjoy/TJEvent;Lcom/tapjoy/TJError;)V

    .line 244
    :cond_2
    :goto_0
    return-void

    .line 226
    :cond_3
    iget-object v0, p0, Lcom/tapjoy/TJEvent;->context:Landroid/content/Context;

    if-nez v0, :cond_4

    .line 228
    iget-object v0, p0, Lcom/tapjoy/TJEvent;->callback:Lcom/tapjoy/TJEventCallback;

    if-eqz v0, :cond_2

    .line 229
    iget-object v0, p0, Lcom/tapjoy/TJEvent;->callback:Lcom/tapjoy/TJEventCallback;

    new-instance v1, Lcom/tapjoy/TJError;

    const-string v2, "Context is null -- TJEvent requires a valid Context."

    invoke-direct {v1, v3, v2}, Lcom/tapjoy/TJError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, p0, v1}, Lcom/tapjoy/TJEventCallback;->sendEventFail(Lcom/tapjoy/TJEvent;Lcom/tapjoy/TJError;)V

    goto :goto_0

    .line 235
    :cond_4
    iget-object v0, p0, Lcom/tapjoy/TJEvent;->eventData:Lcom/tapjoy/TJEventData;

    iget-object v0, v0, Lcom/tapjoy/TJEventData;->name:Ljava/lang/String;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/tapjoy/TJEvent;->eventData:Lcom/tapjoy/TJEventData;

    iget-object v0, v0, Lcom/tapjoy/TJEventData;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_6

    .line 237
    :cond_5
    iget-object v0, p0, Lcom/tapjoy/TJEvent;->callback:Lcom/tapjoy/TJEventCallback;

    if-eqz v0, :cond_2

    .line 238
    iget-object v0, p0, Lcom/tapjoy/TJEvent;->callback:Lcom/tapjoy/TJEventCallback;

    new-instance v1, Lcom/tapjoy/TJError;

    const-string v2, "Invalid eventName -- TJEvent requires a valid eventName."

    invoke-direct {v1, v3, v2}, Lcom/tapjoy/TJError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, p0, v1}, Lcom/tapjoy/TJEventCallback;->sendEventFail(Lcom/tapjoy/TJEvent;Lcom/tapjoy/TJError;)V

    goto :goto_0

    .line 243
    :cond_6
    invoke-static {}, Lcom/tapjoy/TJEventOptimizer;->getInstance()Lcom/tapjoy/TJEventOptimizer;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/tapjoy/TJEventOptimizer;->checkEvent(Lcom/tapjoy/TJEvent;)V

    goto :goto_0
.end method

.method public sendRequest()V
    .locals 1

    .prologue
    .line 153
    new-instance v0, Lcom/tapjoy/TJEvent$1;

    invoke-direct {v0, p0}, Lcom/tapjoy/TJEvent$1;-><init>(Lcom/tapjoy/TJEvent;)V

    invoke-virtual {v0}, Lcom/tapjoy/TJEvent$1;->start()V

    .line 202
    return-void
.end method

.method public setParameters(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 252
    .local p1, "parameters":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/tapjoy/TJEvent;->eventParams:Ljava/util/Map;

    .line 253
    return-void
.end method

.method public showContent()V
    .locals 4

    .prologue
    .line 266
    const-string v1, "TJEvent"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "showContent() called for event "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/tapjoy/TJEvent;->eventData:Lcom/tapjoy/TJEventData;

    iget-object v3, v3, Lcom/tapjoy/TJEventData;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 269
    iget-boolean v1, p0, Lcom/tapjoy/TJEvent;->contentAvailable:Z

    if-nez v1, :cond_0

    .line 271
    const-string v1, "TJEvent"

    const-string v2, "Cannot show content for non-200 send event"

    invoke-static {v1, v2}, Lcom/tapjoy/TapjoyLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    :goto_0
    return-void

    .line 276
    :cond_0
    iget-object v1, p0, Lcom/tapjoy/TJEvent;->callback:Lcom/tapjoy/TJEventCallback;

    if-nez v1, :cond_1

    .line 278
    const-string v1, "TJEvent"

    const-string v2, "TJEventCallback is null"

    invoke-static {v1, v2}, Lcom/tapjoy/TapjoyLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 282
    :cond_1
    invoke-static {}, Lcom/tapjoy/TapjoyConnectCore;->isViewOpen()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 283
    const-string v1, "TJEvent"

    const-string v2, "Only one view can be presented at a time."

    invoke-static {v1, v2}, Lcom/tapjoy/TapjoyLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 288
    :cond_2
    const/4 v0, 0x0

    .line 291
    .local v0, "intent":Landroid/content/Intent;
    const/4 v1, 0x4

    invoke-static {v1}, Lcom/tapjoy/TapjoyConnectCore;->viewWillOpen(I)V

    .line 292
    new-instance v0, Landroid/content/Intent;

    .end local v0    # "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/tapjoy/TJEvent;->context:Landroid/content/Context;

    const-class v2, Lcom/tapjoy/TJAdUnitView;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 293
    .restart local v0    # "intent":Landroid/content/Intent;
    const-string v1, "view_type"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 294
    const-string v1, "tjevent"

    iget-object v2, p0, Lcom/tapjoy/TJEvent;->eventData:Lcom/tapjoy/TJEventData;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 295
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 296
    iget-object v1, p0, Lcom/tapjoy/TJEvent;->context:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public trackEventForOfflineDelivery()V
    .locals 3

    .prologue
    .line 301
    const-string v0, "TJEvent"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Tracking event "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/tapjoy/TJEvent;->eventData:Lcom/tapjoy/TJEventData;

    iget-object v2, v2, Lcom/tapjoy/TJEventData;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " for offline delivery"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 302
    iget-object v0, p0, Lcom/tapjoy/TJEvent;->urlParams:Ljava/util/Map;

    const-string v1, "timestamp"

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    iget-object v0, p0, Lcom/tapjoy/TJEvent;->urlParams:Ljava/util/Map;

    const-string v1, "verifier"

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/tapjoy/TJEvent;->eventData:Lcom/tapjoy/TJEventData;

    iget-object v1, v1, Lcom/tapjoy/TJEventData;->url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/tapjoy/TJEvent;->urlParams:Ljava/util/Map;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/tapjoy/TapjoyUtil;->convertURLParams(Ljava/util/Map;Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/tapjoy/TapjoyConnectCore;->saveOfflineLog(Ljava/lang/String;)V

    .line 305
    return-void
.end method
