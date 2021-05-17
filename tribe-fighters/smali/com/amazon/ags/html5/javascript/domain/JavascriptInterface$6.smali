.class Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$6;
.super Ljava/lang/Object;
.source "JavascriptInterface.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->closeOverlay()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;


# direct methods
.method constructor <init>(Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;)V
    .locals 0

    .prologue
    .line 204
    iput-object p1, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$6;->this$0:Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 206
    iget-object v2, p0, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface$6;->this$0:Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    invoke-static {v2}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->access$400(Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/html5/javascript/domain/CloseOverlayListener;

    .line 207
    .local v1, "recipient":Lcom/amazon/ags/html5/javascript/domain/CloseOverlayListener;
    invoke-interface {v1}, Lcom/amazon/ags/html5/javascript/domain/CloseOverlayListener;->closeOverlay()V

    goto :goto_0

    .line 209
    .end local v1    # "recipient":Lcom/amazon/ags/html5/javascript/domain/CloseOverlayListener;
    :cond_0
    return-void
.end method
