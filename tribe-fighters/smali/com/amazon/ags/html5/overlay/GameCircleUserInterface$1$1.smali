.class Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1$1;
.super Ljava/lang/Object;
.source "GameCircleUserInterface.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;->messageHandlerReady()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;

.field final synthetic val$overlayInputData:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 102
    iput-object p1, p0, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1$1;->this$1:Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;

    iput-object p2, p0, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1$1;->val$overlayInputData:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 105
    :try_start_0
    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1$1;->this$1:Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;

    iget-object v1, v1, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;->val$webView:Landroid/webkit/WebView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "javascript:handleOverlayData("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1$1;->val$overlayInputData:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ");"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    :goto_0
    return-void

    .line 106
    :catch_0
    move-exception v0

    .line 107
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->access$000()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Unexpected error occurred while loading data into overlay.  Overlay will close."

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 108
    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1$1;->this$1:Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;

    iget-object v1, v1, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;->this$0:Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;

    invoke-virtual {v1}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->finish()V

    goto :goto_0
.end method
