.class Lcom/amazon/ags/html5/service/WebViewServiceHelper$1;
.super Ljava/lang/Object;
.source "WebViewServiceHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/html5/service/WebViewServiceHelper;->deliverMessageToJavascript(Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/html5/service/WebViewServiceHelper;

.field final synthetic val$msg:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Lcom/amazon/ags/html5/service/WebViewServiceHelper;Lorg/json/JSONObject;)V
    .locals 0

    .prologue
    .line 79
    iput-object p1, p0, Lcom/amazon/ags/html5/service/WebViewServiceHelper$1;->this$0:Lcom/amazon/ags/html5/service/WebViewServiceHelper;

    iput-object p2, p0, Lcom/amazon/ags/html5/service/WebViewServiceHelper$1;->val$msg:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 81
    iget-object v0, p0, Lcom/amazon/ags/html5/service/WebViewServiceHelper$1;->this$0:Lcom/amazon/ags/html5/service/WebViewServiceHelper;

    iget-object v0, v0, Lcom/amazon/ags/html5/service/WebViewServiceHelper;->webView:Landroid/webkit/WebView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "javascript:handleMessage("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/html5/service/WebViewServiceHelper$1;->val$msg:Lorg/json/JSONObject;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 82
    return-void
.end method
