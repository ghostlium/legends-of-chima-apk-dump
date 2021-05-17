.class public Lcom/amazon/ags/html5/javascript/BackgroundTaskHandler;
.super Lcom/amazon/ags/html5/javascript/CallHandlerBase;
.source "BackgroundTaskHandler.java"


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
.field private final serviceHelper:Lcom/amazon/ags/html5/service/ServiceHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 24
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "backgroundTask"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/amazon/ags/html5/javascript/BackgroundTaskHandler;->supportedCalls:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Lcom/amazon/ags/html5/service/ServiceHelper;Landroid/os/Handler;)V
    .locals 1
    .param p1, "serviceHelper"    # Lcom/amazon/ags/html5/service/ServiceHelper;
    .param p2, "uiThreadHandler"    # Landroid/os/Handler;

    .prologue
    .line 29
    sget-object v0, Lcom/amazon/ags/html5/javascript/BackgroundTaskHandler;->supportedCalls:Ljava/util/Set;

    invoke-direct {p0, p2, v0}, Lcom/amazon/ags/html5/javascript/CallHandlerBase;-><init>(Landroid/os/Handler;Ljava/util/Set;)V

    .line 30
    iput-object p1, p0, Lcom/amazon/ags/html5/javascript/BackgroundTaskHandler;->serviceHelper:Lcom/amazon/ags/html5/service/ServiceHelper;

    .line 31
    return-void
.end method


# virtual methods
.method protected handleMessage(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 2
    .param p1, "rid"    # Ljava/lang/String;
    .param p2, "nativeCallType"    # Ljava/lang/String;
    .param p3, "request"    # Lorg/json/JSONObject;

    .prologue
    .line 35
    const-string v1, "backgroundTask"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 36
    const/4 v1, 0x0

    .line 55
    :goto_0
    return v1

    .line 39
    :cond_0
    new-instance v0, Lcom/amazon/ags/html5/javascript/BackgroundTaskHandler$1;

    invoke-direct {v0, p0, p3}, Lcom/amazon/ags/html5/javascript/BackgroundTaskHandler$1;-><init>(Lcom/amazon/ags/html5/javascript/BackgroundTaskHandler;Lorg/json/JSONObject;)V

    .line 54
    .local v0, "jsonRequest":Lcom/amazon/ags/client/JSONRequest;
    iget-object v1, p0, Lcom/amazon/ags/html5/javascript/BackgroundTaskHandler;->serviceHelper:Lcom/amazon/ags/html5/service/ServiceHelper;

    invoke-interface {v1, v0}, Lcom/amazon/ags/html5/service/ServiceHelper;->handleRequestAsync(Lcom/amazon/ags/client/JSONRequest;)V

    .line 55
    const/4 v1, 0x1

    goto :goto_0
.end method
