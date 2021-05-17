.class Lcom/amazon/ags/html5/javascript/CallHandlerBase$1;
.super Ljava/lang/Object;
.source "CallHandlerBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/html5/javascript/CallHandlerBase;->sendReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/html5/javascript/CallHandlerBase;

.field final synthetic val$httpResponseCode:Ljava/lang/String;

.field final synthetic val$originalCaller:Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

.field final synthetic val$originalRid:Ljava/lang/String;

.field final synthetic val$resultCode:Ljava/lang/String;

.field final synthetic val$resultJson:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/amazon/ags/html5/javascript/CallHandlerBase;Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 81
    iput-object p1, p0, Lcom/amazon/ags/html5/javascript/CallHandlerBase$1;->this$0:Lcom/amazon/ags/html5/javascript/CallHandlerBase;

    iput-object p2, p0, Lcom/amazon/ags/html5/javascript/CallHandlerBase$1;->val$originalCaller:Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    iput-object p3, p0, Lcom/amazon/ags/html5/javascript/CallHandlerBase$1;->val$originalRid:Ljava/lang/String;

    iput-object p4, p0, Lcom/amazon/ags/html5/javascript/CallHandlerBase$1;->val$resultJson:Ljava/lang/String;

    iput-object p5, p0, Lcom/amazon/ags/html5/javascript/CallHandlerBase$1;->val$resultCode:Ljava/lang/String;

    iput-object p6, p0, Lcom/amazon/ags/html5/javascript/CallHandlerBase$1;->val$httpResponseCode:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 83
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/CallHandlerBase$1;->val$originalCaller:Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    iget-object v1, p0, Lcom/amazon/ags/html5/javascript/CallHandlerBase$1;->val$originalRid:Ljava/lang/String;

    iget-object v2, p0, Lcom/amazon/ags/html5/javascript/CallHandlerBase$1;->val$resultJson:Ljava/lang/String;

    iget-object v3, p0, Lcom/amazon/ags/html5/javascript/CallHandlerBase$1;->val$resultCode:Ljava/lang/String;

    iget-object v4, p0, Lcom/amazon/ags/html5/javascript/CallHandlerBase$1;->val$httpResponseCode:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->sendJSReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    return-void
.end method
