.class Lcom/amazon/ags/html5/content/ContentManager$3;
.super Ljava/lang/Object;
.source "ContentManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/html5/content/ContentManager;->loadManagedContentFileIntoWebview(Landroid/webkit/WebView;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/html5/content/ContentManager;

.field final synthetic val$javascriptFile:Ljava/io/File;

.field final synthetic val$webView:Landroid/webkit/WebView;


# direct methods
.method constructor <init>(Lcom/amazon/ags/html5/content/ContentManager;Landroid/webkit/WebView;Ljava/io/File;)V
    .locals 0

    .prologue
    .line 455
    iput-object p1, p0, Lcom/amazon/ags/html5/content/ContentManager$3;->this$0:Lcom/amazon/ags/html5/content/ContentManager;

    iput-object p2, p0, Lcom/amazon/ags/html5/content/ContentManager$3;->val$webView:Landroid/webkit/WebView;

    iput-object p3, p0, Lcom/amazon/ags/html5/content/ContentManager$3;->val$javascriptFile:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 457
    iget-object v0, p0, Lcom/amazon/ags/html5/content/ContentManager$3;->val$webView:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/amazon/ags/html5/content/ContentManager$3;->val$javascriptFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 458
    return-void
.end method
