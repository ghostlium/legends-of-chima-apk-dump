.class Lcom/amazon/ags/client/KindleFireIPCProxy$3;
.super Landroid/os/Handler;
.source "KindleFireIPCProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/client/KindleFireIPCProxy;->authorize()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/client/KindleFireIPCProxy;


# direct methods
.method constructor <init>(Lcom/amazon/ags/client/KindleFireIPCProxy;)V
    .locals 0

    .prologue
    .line 400
    iput-object p1, p0, Lcom/amazon/ags/client/KindleFireIPCProxy$3;->this$0:Lcom/amazon/ags/client/KindleFireIPCProxy;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 403
    const-string v2, "KindleFireIPCProxy"

    const-string v3, "Handling authorize callback"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 404
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v1

    .line 407
    .local v1, "bundle":Landroid/os/Bundle;
    if-nez v1, :cond_1

    .line 408
    const-string v2, "KindleFireIPCProxy"

    const-string v3, "No bundle in authorize result."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 409
    iget-object v2, p0, Lcom/amazon/ags/client/KindleFireIPCProxy$3;->this$0:Lcom/amazon/ags/client/KindleFireIPCProxy;

    sget-object v3, Lcom/amazon/ags/client/KindleFireStatus;->CANNOT_AUTHORIZE:Lcom/amazon/ags/client/KindleFireStatus;

    invoke-static {v2, v3}, Lcom/amazon/ags/client/KindleFireIPCProxy;->access$300(Lcom/amazon/ags/client/KindleFireIPCProxy;Lcom/amazon/ags/client/KindleFireStatus;)V

    .line 424
    :cond_0
    :goto_0
    return-void

    .line 413
    :cond_1
    const-string v2, "AUTH_RESULT"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 414
    .local v0, "authResult":Ljava/lang/String;
    const-string v2, "KindleFireIPCProxy"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "authResult: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 415
    const-string v2, "AUTHORIZED"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 416
    iget-object v2, p0, Lcom/amazon/ags/client/KindleFireIPCProxy$3;->this$0:Lcom/amazon/ags/client/KindleFireIPCProxy;

    invoke-static {v2}, Lcom/amazon/ags/client/KindleFireIPCProxy;->access$400(Lcom/amazon/ags/client/KindleFireIPCProxy;)V

    goto :goto_0

    .line 417
    :cond_2
    const-string v2, "INVALID_SESSION"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 418
    iget-object v2, p0, Lcom/amazon/ags/client/KindleFireIPCProxy$3;->this$0:Lcom/amazon/ags/client/KindleFireIPCProxy;

    sget-object v3, Lcom/amazon/ags/client/KindleFireStatus;->NOT_AUTHORIZED:Lcom/amazon/ags/client/KindleFireStatus;

    invoke-static {v2, v3}, Lcom/amazon/ags/client/KindleFireIPCProxy;->access$300(Lcom/amazon/ags/client/KindleFireIPCProxy;Lcom/amazon/ags/client/KindleFireStatus;)V

    goto :goto_0

    .line 419
    :cond_3
    const-string v2, "CANNOT_AUTHORIZE"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 420
    iget-object v2, p0, Lcom/amazon/ags/client/KindleFireIPCProxy$3;->this$0:Lcom/amazon/ags/client/KindleFireIPCProxy;

    sget-object v3, Lcom/amazon/ags/client/KindleFireStatus;->CANNOT_AUTHORIZE:Lcom/amazon/ags/client/KindleFireStatus;

    invoke-static {v2, v3}, Lcom/amazon/ags/client/KindleFireIPCProxy;->access$300(Lcom/amazon/ags/client/KindleFireIPCProxy;Lcom/amazon/ags/client/KindleFireStatus;)V

    goto :goto_0

    .line 421
    :cond_4
    const-string v2, "NOT_AUTHORIZED"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 422
    iget-object v2, p0, Lcom/amazon/ags/client/KindleFireIPCProxy$3;->this$0:Lcom/amazon/ags/client/KindleFireIPCProxy;

    sget-object v3, Lcom/amazon/ags/client/KindleFireStatus;->NOT_AUTHORIZED:Lcom/amazon/ags/client/KindleFireStatus;

    invoke-static {v2, v3}, Lcom/amazon/ags/client/KindleFireIPCProxy;->access$300(Lcom/amazon/ags/client/KindleFireIPCProxy;Lcom/amazon/ags/client/KindleFireStatus;)V

    goto :goto_0
.end method
