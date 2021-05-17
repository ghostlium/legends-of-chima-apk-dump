.class Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$3;
.super Ljava/lang/Object;
.source "JavascriptInterface.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->showAlert(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

.field final synthetic val$json:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 155
    iput-object p1, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$3;->this$0:Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    iput-object p2, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$3;->val$json:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 157
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$3;->this$0:Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    invoke-static {v0}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->access$200(Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;)Lcom/amazon/ags/html5/overlay/OverlayManager;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$3;->val$json:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/amazon/ags/html5/overlay/OverlayManager;->showAlert(Ljava/lang/String;)V

    .line 158
    return-void
.end method
