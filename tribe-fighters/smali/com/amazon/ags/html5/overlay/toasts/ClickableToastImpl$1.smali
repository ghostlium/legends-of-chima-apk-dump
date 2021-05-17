.class Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$1;
.super Ljava/lang/Object;
.source "ClickableToastImpl.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;-><init>(Landroid/app/Activity;Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;)V
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
    .line 66
    iput-object p1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$1;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 69
    const/4 v0, 0x0

    return v0
.end method
