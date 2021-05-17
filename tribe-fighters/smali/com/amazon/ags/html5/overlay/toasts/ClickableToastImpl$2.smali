.class Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$2;
.super Ljava/lang/Object;
.source "ClickableToastImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->show(Landroid/os/Handler;)V
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
    .line 88
    iput-object p1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$2;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 92
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$2;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    invoke-virtual {v0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 102
    :goto_0
    return-void

    .line 95
    :cond_0
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$2;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$2;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    invoke-virtual {v1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->initView()Landroid/view/View;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->access$002(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;Landroid/view/View;)Landroid/view/View;

    .line 96
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$2;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    invoke-static {v0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->access$000(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$2;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    invoke-static {v1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->access$100(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;)Landroid/view/View$OnTouchListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 97
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$2;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    invoke-static {v0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->access$200(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;)V

    .line 98
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$2;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    invoke-virtual {v0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->initAnimations()V

    .line 99
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$2;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    invoke-static {v0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->access$000(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$2;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    iget-object v1, v1, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->showAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 100
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$2;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    invoke-static {v0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->access$000(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 101
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$2;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->access$300(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;Z)V

    goto :goto_0
.end method
