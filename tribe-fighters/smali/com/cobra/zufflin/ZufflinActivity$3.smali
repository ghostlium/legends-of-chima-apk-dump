.class Lcom/cobra/zufflin/ZufflinActivity$3;
.super Ljava/lang/Object;
.source "ZufflinActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/ZufflinActivity;->hideWebView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cobra/zufflin/ZufflinActivity;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/ZufflinActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/ZufflinActivity$3;->this$0:Lcom/cobra/zufflin/ZufflinActivity;

    .line 442
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 443
    sget-object v1, Lcom/cobra/zufflin/ZufflinActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 444
    .local v0, "group":Landroid/view/ViewGroup;
    sget-object v1, Lcom/cobra/zufflin/ZufflinActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 445
    const/4 v1, 0x0

    sput-object v1, Lcom/cobra/zufflin/ZufflinActivity;->mWebView:Landroid/webkit/WebView;

    .line 446
    return-void
.end method
