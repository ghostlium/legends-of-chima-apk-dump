.class Lcom/amazon/ags/html5/util/WebViewFactory$2;
.super Landroid/webkit/WebChromeClient;
.source "WebViewFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/html5/util/WebViewFactory;->newWebView(Landroid/content/Context;)Landroid/webkit/WebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/html5/util/WebViewFactory;


# direct methods
.method constructor <init>(Lcom/amazon/ags/html5/util/WebViewFactory;)V
    .locals 0

    .prologue
    .line 66
    iput-object p1, p0, Lcom/amazon/ags/html5/util/WebViewFactory$2;->this$0:Lcom/amazon/ags/html5/util/WebViewFactory;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onConsoleMessage(Landroid/webkit/ConsoleMessage;)Z
    .locals 1
    .param p1, "consoleMessage"    # Landroid/webkit/ConsoleMessage;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/amazon/ags/html5/util/WebViewFactory$2;->this$0:Lcom/amazon/ags/html5/util/WebViewFactory;

    invoke-static {v0, p1}, Lcom/amazon/ags/html5/util/WebViewFactory;->access$100(Lcom/amazon/ags/html5/util/WebViewFactory;Landroid/webkit/ConsoleMessage;)V

    .line 70
    const/4 v0, 0x1

    return v0
.end method
