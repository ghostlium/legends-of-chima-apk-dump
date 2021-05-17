.class Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast$2;
.super Ljava/lang/Object;
.source "ClickableWebViewToast.java"

# interfaces
.implements Lcom/amazon/ags/client/JSONRequest;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;->show(Landroid/os/Handler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;


# direct methods
.method constructor <init>(Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;)V
    .locals 0

    .prologue
    .line 131
    iput-object p1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast$2;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getRequest()Lorg/json/JSONObject;
    .locals 5

    .prologue
    .line 136
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 138
    .local v2, "request":Lorg/json/JSONObject;
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    iget-object v3, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast$2;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;

    invoke-static {v3}, Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;->access$100(Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 139
    .local v1, "originalToastRequest":Lorg/json/JSONObject;
    const-string v3, "ACTION_CODE"

    const-string v4, "HANDLE_TOAST_DISPLAY_METRIC"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 140
    const-string v3, "REQUEST_ID"

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 141
    const-string v3, "toastRequestDisplayed"

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    .end local v1    # "originalToastRequest":Lorg/json/JSONObject;
    :goto_0
    return-object v2

    .line 142
    :catch_0
    move-exception v0

    .line 144
    .local v0, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;->access$200()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Error building toast metric request"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public setResponse(Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 134
    return-void
.end method
