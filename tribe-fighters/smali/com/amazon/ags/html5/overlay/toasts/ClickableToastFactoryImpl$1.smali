.class Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl$1;
.super Ljava/lang/Object;
.source "ClickableToastFactoryImpl.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->getClickableWebViewToast(Ljava/lang/String;)Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;

.field touched:Z

.field final synthetic val$jsonData:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 67
    iput-object p1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl$1;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;

    iput-object p2, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl$1;->val$jsonData:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl$1;->touched:Z

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 8
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v7, 0x1

    .line 72
    iget-boolean v5, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl$1;->touched:Z

    if-nez v5, :cond_0

    .line 73
    iput-boolean v7, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl$1;->touched:Z

    .line 74
    iget-object v5, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl$1;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;

    invoke-static {v5}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->access$000(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;)Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;

    move-result-object v5

    invoke-virtual {v5}, Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;->destroy()V

    .line 77
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    iget-object v5, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl$1;->val$jsonData:Ljava/lang/String;

    invoke-direct {v1, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 78
    .local v1, "data":Lorg/json/JSONObject;
    const-string v5, "ACTION_MAPPINGS"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 80
    .local v0, "actions":Lorg/json/JSONArray;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-lez v5, :cond_0

    iget-object v5, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl$1;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;

    invoke-static {v5}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->access$100(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;)Lcom/amazon/ags/html5/service/ServiceHelper;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 81
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 82
    .local v4, "touchedToastData":Lorg/json/JSONObject;
    const-string v5, "TOAST_TOUCH_X"

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 83
    const-string v5, "TOAST_TOUCH_Y"

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 84
    const-string v5, "TOAST_WIDTH"

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 85
    const-string v5, "TOAST_HEIGHT"

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 87
    new-instance v3, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl$1$1;

    invoke-direct {v3, p0, v0, v4}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl$1$1;-><init>(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl$1;Lorg/json/JSONArray;Lorg/json/JSONObject;)V

    .line 105
    .local v3, "jsonRequest":Lcom/amazon/ags/client/JSONRequest;
    iget-object v5, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl$1;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;

    invoke-static {v5}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->access$100(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;)Lcom/amazon/ags/html5/service/ServiceHelper;

    move-result-object v5

    invoke-interface {v5, v3}, Lcom/amazon/ags/html5/service/ServiceHelper;->handleRequestAsync(Lcom/amazon/ags/client/JSONRequest;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 113
    .end local v0    # "actions":Lorg/json/JSONArray;
    .end local v1    # "data":Lorg/json/JSONObject;
    .end local v3    # "jsonRequest":Lcom/amazon/ags/client/JSONRequest;
    .end local v4    # "touchedToastData":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    return v7

    .line 107
    :catch_0
    move-exception v2

    .line 108
    .local v2, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->access$200()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Error carrying out toast touch event due to JSON error"

    invoke-static {v5, v6, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 109
    .end local v2    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v2

    .line 110
    .local v2, "e":Ljava/lang/Exception;
    invoke-static {}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->access$200()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Unexpected error carrying out toast touch event"

    invoke-static {v5, v6, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
