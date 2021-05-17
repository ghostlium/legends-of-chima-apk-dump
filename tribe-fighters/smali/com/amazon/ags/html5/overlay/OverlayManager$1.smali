.class Lcom/amazon/ags/html5/overlay/OverlayManager$1;
.super Ljava/lang/Object;
.source "OverlayManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/html5/overlay/OverlayManager;->processNextToast()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/html5/overlay/OverlayManager;

.field final synthetic val$toast:Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;


# direct methods
.method constructor <init>(Lcom/amazon/ags/html5/overlay/OverlayManager;Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;)V
    .locals 0

    .prologue
    .line 214
    iput-object p1, p0, Lcom/amazon/ags/html5/overlay/OverlayManager$1;->this$0:Lcom/amazon/ags/html5/overlay/OverlayManager;

    iput-object p2, p0, Lcom/amazon/ags/html5/overlay/OverlayManager$1;->val$toast:Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 216
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/OverlayManager$1;->val$toast:Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;

    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/OverlayManager$1;->this$0:Lcom/amazon/ags/html5/overlay/OverlayManager;

    invoke-static {v1}, Lcom/amazon/ags/html5/overlay/OverlayManager;->access$000(Lcom/amazon/ags/html5/overlay/OverlayManager;)Landroid/os/Handler;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;->show(Landroid/os/Handler;)V

    .line 217
    return-void
.end method
