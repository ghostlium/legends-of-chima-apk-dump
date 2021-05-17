.class Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$1;
.super Ljava/lang/Object;
.source "JavascriptInterface.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->sendReply(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

.field final synthetic val$json:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 128
    iput-object p1, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$1;->this$0:Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    iput-object p2, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$1;->val$json:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 132
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    iget-object v2, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$1;->val$json:Ljava/lang/String;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 137
    .local v1, "reply":Lorg/json/JSONObject;
    iget-object v2, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$1;->this$0:Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    invoke-static {v2}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->access$100(Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;)Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;->sendReply(Lorg/json/JSONObject;)V

    .line 138
    .end local v1    # "reply":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 133
    :catch_0
    move-exception v0

    .line 134
    .local v0, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->access$000()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to parse request: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$1;->val$json:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
