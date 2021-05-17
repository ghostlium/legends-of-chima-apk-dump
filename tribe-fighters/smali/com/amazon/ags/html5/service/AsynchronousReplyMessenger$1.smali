.class Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger$1;
.super Ljava/lang/Object;
.source "AsynchronousReplyMessenger.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;->scheduleTimeoutTask(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;

.field final synthetic val$requestId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 66
    iput-object p1, p0, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger$1;->this$0:Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;

    iput-object p2, p0, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger$1;->val$requestId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 68
    iget-object v3, p0, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger$1;->this$0:Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;

    invoke-static {v3}, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;->access$000(Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;)Ljava/util/Map;

    move-result-object v3

    iget-object v4, p0, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger$1;->val$requestId:Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/client/JSONRequest;

    .line 69
    .local v1, "request":Lcom/amazon/ags/client/JSONRequest;
    if-nez v1, :cond_0

    .line 86
    :goto_0
    return-void

    .line 75
    :cond_0
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 76
    .local v2, "timedOutResponse":Lorg/json/JSONObject;
    const-string v3, "RESPONSE_CODE"

    const/16 v4, 0x18

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 78
    const-string v3, "REQUEST_ID"

    iget-object v4, p0, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger$1;->val$requestId:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 79
    invoke-interface {v1, v2}, Lcom/amazon/ags/client/JSONRequest;->setResponse(Lorg/json/JSONObject;)V

    .line 80
    invoke-static {}, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;->access$100()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Request "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger$1;->val$requestId:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " timed out."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 81
    .end local v2    # "timedOutResponse":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 83
    .local v0, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;->access$100()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to generate a timeout response for request "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger$1;->val$requestId:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".  The callback won\'t be called."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
