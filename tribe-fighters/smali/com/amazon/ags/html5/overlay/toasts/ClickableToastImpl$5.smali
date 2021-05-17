.class Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$5;
.super Ljava/lang/Object;
.source "ClickableToastImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->startHideAnimations()V
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
    .line 356
    iput-object p1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$5;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 360
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$5;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    invoke-virtual {v0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->isShowing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 365
    :goto_0
    return-void

    .line 363
    :cond_0
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$5;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->hideAnimation:Landroid/view/animation/Animation;

    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$5;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    iget-object v1, v1, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->toastParams:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;

    invoke-virtual {v1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->getDuration()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setStartOffset(J)V

    .line 364
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$5;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    invoke-static {v0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->access$000(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$5;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    iget-object v1, v1, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->hideAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0
.end method
