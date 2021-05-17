.class Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$8;
.super Ljava/lang/Object;
.source "JavascriptInterface.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->handleMessage(Ljava/lang/String;)V
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
    .line 230
    iput-object p1, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$8;->this$0:Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    iput-object p2, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$8;->val$json:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 233
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    iget-object v5, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$8;->val$json:Ljava/lang/String;

    invoke-direct {v4, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 234
    .local v4, "request":Lorg/json/JSONObject;
    iget-object v5, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$8;->this$0:Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    invoke-static {v5}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->access$600(Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/html5/javascript/CallHandlerBase;

    .line 235
    .local v1, "handler":Lcom/amazon/ags/html5/javascript/CallHandlerBase;
    iget-object v5, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$8;->this$0:Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    invoke-virtual {v1, v5, v4}, Lcom/amazon/ags/html5/javascript/CallHandlerBase;->handleMessage(Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;Lorg/json/JSONObject;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 245
    .end local v1    # "handler":Lcom/amazon/ags/html5/javascript/CallHandlerBase;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v4    # "request":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 239
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v4    # "request":Lorg/json/JSONObject;
    :cond_1
    const-string v5, "nativeCall"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 240
    .local v3, "nativeCall":Ljava/lang/String;
    invoke-static {}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->access$000()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "No handler found for native call type "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 242
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "nativeCall":Ljava/lang/String;
    .end local v4    # "request":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 243
    .local v0, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->access$000()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unable to parse request from javascript: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$8;->val$json:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
