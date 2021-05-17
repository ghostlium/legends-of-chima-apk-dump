.class Lcom/playhaven/android/view/HTMLView$2;
.super Landroid/webkit/WebViewClient;
.source "HTMLView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/playhaven/android/view/HTMLView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/playhaven/android/view/HTMLView;


# direct methods
.method constructor <init>(Lcom/playhaven/android/view/HTMLView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/playhaven/android/view/HTMLView$2;->this$0:Lcom/playhaven/android/view/HTMLView;

    .line 140
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoadResource(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 143
    const-string v0, "ph://"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 144
    iget-object v0, p0, Lcom/playhaven/android/view/HTMLView$2;->this$0:Lcom/playhaven/android/view/HTMLView;

    invoke-static {v0, p2}, Lcom/playhaven/android/view/HTMLView;->access$0(Lcom/playhaven/android/view/HTMLView;Ljava/lang/String;)V

    .line 146
    :cond_0
    return-void
.end method

.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 150
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 151
    iget-object v0, p0, Lcom/playhaven/android/view/HTMLView$2;->this$0:Lcom/playhaven/android/view/HTMLView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/playhaven/android/view/HTMLView;->setVisibility(I)V

    .line 152
    return-void
.end method

.method public shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 10
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 157
    iget-object v4, p0, Lcom/playhaven/android/view/HTMLView$2;->this$0:Lcom/playhaven/android/view/HTMLView;

    invoke-static {v4}, Lcom/playhaven/android/view/HTMLView;->access$1(Lcom/playhaven/android/view/HTMLView;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/playhaven/android/view/HTMLView$2;->this$0:Lcom/playhaven/android/view/HTMLView;

    invoke-static {v4}, Lcom/playhaven/android/view/HTMLView;->access$2(Lcom/playhaven/android/view/HTMLView;)Lcom/playhaven/android/Placement;

    move-result-object v4

    invoke-virtual {v4}, Lcom/playhaven/android/Placement;->getModel()Ljava/lang/String;

    move-result-object v4

    const-string v5, "$.response.url"

    invoke-static {v4, v5}, Lcom/playhaven/android/util/JsonUtil;->getPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 161
    :cond_0
    :try_start_0
    const-string v4, " "

    const-string v5, "%20"

    invoke-virtual {p2, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    .line 162
    new-instance v0, Lcom/playhaven/android/cache/Cache;

    iget-object v4, p0, Lcom/playhaven/android/view/HTMLView$2;->this$0:Lcom/playhaven/android/view/HTMLView;

    invoke-virtual {v4}, Lcom/playhaven/android/view/HTMLView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v0, v4}, Lcom/playhaven/android/cache/Cache;-><init>(Landroid/content/Context;)V

    .line 163
    .local v0, "cache":Lcom/playhaven/android/cache/Cache;
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Lcom/playhaven/android/cache/Cache;->getFile(Ljava/net/URL;)Ljava/io/File;

    move-result-object v2

    .line 164
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v0}, Lcom/playhaven/android/cache/Cache;->close()V

    .line 165
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 166
    const-string v4, "Loading from cache: %s."

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Lcom/playhaven/android/PlayHaven;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 167
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 168
    .local v3, "inputStream":Ljava/io/InputStream;
    new-instance v4, Landroid/webkit/WebResourceResponse;

    const-string v5, ""

    const-string v6, "UTF-8"

    invoke-direct {v4, v5, v6, v3}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 175
    .end local v0    # "cache":Lcom/playhaven/android/cache/Cache;
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "inputStream":Ljava/io/InputStream;
    :goto_0
    return-object v4

    .line 170
    :catch_0
    move-exception v1

    .line 171
    .local v1, "e":Ljava/lang/Exception;
    const-string v4, "Could not load from cache: %s."

    new-array v5, v9, [Ljava/lang/Object;

    aput-object p2, v5, v8

    invoke-static {v4, v5}, Lcom/playhaven/android/PlayHaven;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 172
    invoke-static {v1}, Lcom/playhaven/android/PlayHaven;->e(Ljava/lang/Throwable;)V

    .line 175
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 180
    const-string v0, "ph://"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 181
    iget-object v0, p0, Lcom/playhaven/android/view/HTMLView$2;->this$0:Lcom/playhaven/android/view/HTMLView;

    invoke-static {v0, p2}, Lcom/playhaven/android/view/HTMLView;->access$0(Lcom/playhaven/android/view/HTMLView;Ljava/lang/String;)V

    .line 182
    const/4 v0, 0x1

    .line 184
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method
