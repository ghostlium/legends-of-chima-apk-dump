.class public Lcom/amazon/ags/html5/javascript/NativeToastCallHandler;
.super Lcom/amazon/ags/html5/javascript/CallHandlerBase;
.source "NativeToastCallHandler.java"


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
.field private final context:Landroid/content/Context;

.field private final overlayManager:Lcom/amazon/ags/html5/overlay/OverlayManager;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 26
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "showToast"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/amazon/ags/html5/javascript/NativeToastCallHandler;->supportedCalls:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Handler;Lcom/amazon/ags/html5/overlay/OverlayManager;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "uiThreadHandler"    # Landroid/os/Handler;
    .param p3, "overlayManager"    # Lcom/amazon/ags/html5/overlay/OverlayManager;

    .prologue
    .line 32
    sget-object v0, Lcom/amazon/ags/html5/javascript/NativeToastCallHandler;->supportedCalls:Ljava/util/Set;

    invoke-direct {p0, p2, v0}, Lcom/amazon/ags/html5/javascript/CallHandlerBase;-><init>(Landroid/os/Handler;Ljava/util/Set;)V

    .line 33
    iput-object p1, p0, Lcom/amazon/ags/html5/javascript/NativeToastCallHandler;->context:Landroid/content/Context;

    .line 34
    iput-object p3, p0, Lcom/amazon/ags/html5/javascript/NativeToastCallHandler;->overlayManager:Lcom/amazon/ags/html5/overlay/OverlayManager;

    .line 35
    return-void
.end method

.method private showToast(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "rid"    # Ljava/lang/String;
    .param p2, "request"    # Lorg/json/JSONObject;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/NativeToastCallHandler;->overlayManager:Lcom/amazon/ags/html5/overlay/OverlayManager;

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/ags/html5/overlay/OverlayManager;->showToast(Ljava/lang/String;)V

    .line 50
    const-string v0, "{}"

    const-string v1, "SUCCESS"

    invoke-virtual {p0, p1, v0, v1}, Lcom/amazon/ags/html5/javascript/NativeToastCallHandler;->sendReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    return-void
.end method


# virtual methods
.method protected handleMessage(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 1
    .param p1, "rid"    # Ljava/lang/String;
    .param p2, "nativeCallType"    # Ljava/lang/String;
    .param p3, "request"    # Lorg/json/JSONObject;

    .prologue
    .line 39
    const-string v0, "showToast"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 40
    invoke-direct {p0, p1, p3}, Lcom/amazon/ags/html5/javascript/NativeToastCallHandler;->showToast(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 41
    const/4 v0, 0x1

    .line 44
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
