.class Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast$1;
.super Ljava/lang/Object;
.source "ClickableWebViewToast.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;->update(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;

.field final synthetic val$jsRequest:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 105
    iput-object p1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast$1;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;

    iput-object p2, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast$1;->val$jsRequest:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 107
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast$1;->this$0:Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;

    invoke-static {v0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;->access$000(Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;)Landroid/webkit/WebView;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast$1;->val$jsRequest:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 108
    return-void
.end method
