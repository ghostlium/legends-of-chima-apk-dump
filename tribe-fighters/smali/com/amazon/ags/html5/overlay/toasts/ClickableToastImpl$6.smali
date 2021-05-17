.class Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$6;
.super Ljava/lang/Object;
.source "ClickableToastImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->hide()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;


# direct methods
.method constructor <init>(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;)V
    .locals 0

    .prologue
    .line 372
    iput-object p1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$6;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 376
    invoke-static {}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->access$600()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Entering runnable for hide()"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 377
    iget-object v3, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$6;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    invoke-static {v3}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->access$000(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;)Landroid/view/View;

    move-result-object v3

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 379
    :try_start_0
    iget-object v3, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$6;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    invoke-static {v3}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->access$700(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;)Landroid/view/WindowManager;

    move-result-object v3

    iget-object v4, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$6;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    invoke-interface {v3, v4}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 383
    :goto_0
    iget-object v3, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$6;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->access$300(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;Z)V

    .line 384
    iget-object v3, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$6;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    invoke-static {v3}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->access$800(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;)Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastObserver;

    .line 385
    .local v2, "observer":Lcom/amazon/ags/html5/overlay/toasts/ClickableToastObserver;
    invoke-interface {v2}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastObserver;->notifyToastDestroyed()V

    goto :goto_1

    .line 380
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v2    # "observer":Lcom/amazon/ags/html5/overlay/toasts/ClickableToastObserver;
    :catch_0
    move-exception v1

    .line 381
    .local v1, "iae":Ljava/lang/IllegalArgumentException;
    invoke-static {}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->access$600()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Error removing view from window: "

    invoke-static {v3, v4, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 387
    .end local v1    # "iae":Ljava/lang/IllegalArgumentException;
    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_0
    return-void
.end method
