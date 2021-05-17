.class Lcom/prime31/WebViewActivity$P31WebViewClient;
.super Landroid/webkit/WebViewClient;
.source "WebViewActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/prime31/WebViewActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "P31WebViewClient"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/prime31/WebViewActivity;


# direct methods
.method private constructor <init>(Lcom/prime31/WebViewActivity;)V
    .locals 0

    .prologue
    .line 169
    iput-object p1, p0, Lcom/prime31/WebViewActivity$P31WebViewClient;->this$0:Lcom/prime31/WebViewActivity;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/prime31/WebViewActivity;Lcom/prime31/WebViewActivity$P31WebViewClient;)V
    .locals 0

    .prologue
    .line 169
    invoke-direct {p0, p1}, Lcom/prime31/WebViewActivity$P31WebViewClient;-><init>(Lcom/prime31/WebViewActivity;)V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 212
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 213
    iget-object v0, p0, Lcom/prime31/WebViewActivity$P31WebViewClient;->this$0:Lcom/prime31/WebViewActivity;

    invoke-static {v0}, Lcom/prime31/WebViewActivity;->access$0(Lcom/prime31/WebViewActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 214
    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "favicon"    # Landroid/graphics/Bitmap;

    .prologue
    .line 204
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 205
    iget-object v0, p0, Lcom/prime31/WebViewActivity$P31WebViewClient;->this$0:Lcom/prime31/WebViewActivity;

    invoke-static {v0}, Lcom/prime31/WebViewActivity;->access$0(Lcom/prime31/WebViewActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 206
    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "errorCode"    # I
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "failingUrl"    # Ljava/lang/String;

    .prologue
    .line 190
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 191
    iget-object v0, p0, Lcom/prime31/WebViewActivity$P31WebViewClient;->this$0:Lcom/prime31/WebViewActivity;

    invoke-static {v0}, Lcom/prime31/WebViewActivity;->access$0(Lcom/prime31/WebViewActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 193
    iget-object v0, p0, Lcom/prime31/WebViewActivity$P31WebViewClient;->this$0:Lcom/prime31/WebViewActivity;

    invoke-static {v0}, Lcom/prime31/WebViewActivity;->access$1(Lcom/prime31/WebViewActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 195
    const-string v0, "Prime31-WVA"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "received error with the back button disabled. Closing web view: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    iget-object v0, p0, Lcom/prime31/WebViewActivity$P31WebViewClient;->this$0:Lcom/prime31/WebViewActivity;

    invoke-virtual {v0}, Lcom/prime31/WebViewActivity;->finish()V

    .line 198
    :cond_0
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 176
    const-string v0, "close://"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 178
    const-string v0, "Prime31-WVA"

    const-string v1, "found close:// link. getting out of here and dismissing web view"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    iget-object v0, p0, Lcom/prime31/WebViewActivity$P31WebViewClient;->this$0:Lcom/prime31/WebViewActivity;

    invoke-virtual {v0}, Lcom/prime31/WebViewActivity;->finish()V

    .line 180
    const/4 v0, 0x1

    .line 183
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
