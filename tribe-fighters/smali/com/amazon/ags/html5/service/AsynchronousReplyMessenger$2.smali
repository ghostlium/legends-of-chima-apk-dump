.class Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger$2;
.super Ljava/lang/Object;
.source "AsynchronousReplyMessenger.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;->sendReply(Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;

.field final synthetic val$asyncRequest:Lcom/amazon/ags/client/JSONRequest;

.field final synthetic val$reply:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;Lcom/amazon/ags/client/JSONRequest;Lorg/json/JSONObject;)V
    .locals 0

    .prologue
    .line 111
    iput-object p1, p0, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger$2;->this$0:Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;

    iput-object p2, p0, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger$2;->val$asyncRequest:Lcom/amazon/ags/client/JSONRequest;

    iput-object p3, p0, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger$2;->val$reply:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 114
    iget-object v0, p0, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger$2;->val$asyncRequest:Lcom/amazon/ags/client/JSONRequest;

    iget-object v1, p0, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger$2;->val$reply:Lorg/json/JSONObject;

    invoke-interface {v0, v1}, Lcom/amazon/ags/client/JSONRequest;->setResponse(Lorg/json/JSONObject;)V

    .line 115
    return-void
.end method
