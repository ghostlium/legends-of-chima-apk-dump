.class final Lcom/flurry/android/cp;
.super Landroid/webkit/WebViewClient;
.source "SourceFile"


# instance fields
.field private synthetic bR:Lcom/flurry/android/bw;


# direct methods
.method synthetic constructor <init>(Lcom/flurry/android/bw;)V
    .locals 1

    .prologue
    .line 83
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/flurry/android/cp;-><init>(Lcom/flurry/android/bw;B)V

    return-void
.end method

.method private constructor <init>(Lcom/flurry/android/bw;B)V
    .locals 0

    .prologue
    .line 83
    iput-object p1, p0, Lcom/flurry/android/cp;->bR:Lcom/flurry/android/bw;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public final onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 125
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onPageFinished: url = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/flurry/android/cp;->bR:Lcom/flurry/android/bw;

    invoke-static {v0}, Lcom/flurry/android/bw;->a(Lcom/flurry/android/bw;)Landroid/webkit/WebView;

    move-result-object v0

    if-eq p1, v0, :cond_1

    .line 131
    :cond_0
    :goto_0
    return-void

    .line 130
    :cond_1
    iget-object v0, p0, Lcom/flurry/android/cp;->bR:Lcom/flurry/android/bw;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/flurry/android/bw;->a(Lcom/flurry/android/bw;Z)Z

    goto :goto_0
.end method

.method public final onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 2

    .prologue
    .line 103
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onPageStarted: url = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/flurry/android/cp;->bR:Lcom/flurry/android/bw;

    invoke-static {v0}, Lcom/flurry/android/bw;->a(Lcom/flurry/android/bw;)Landroid/webkit/WebView;

    move-result-object v0

    if-eq p1, v0, :cond_1

    .line 122
    :cond_0
    :goto_0
    return-void

    .line 109
    :cond_1
    iget-object v0, p0, Lcom/flurry/android/cp;->bR:Lcom/flurry/android/bw;

    invoke-static {v0}, Lcom/flurry/android/bw;->c(Lcom/flurry/android/bw;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 110
    const/4 v0, 0x0

    .line 111
    iget-object v1, p0, Lcom/flurry/android/cp;->bR:Lcom/flurry/android/bw;

    invoke-static {v1}, Lcom/flurry/android/bw;->b(Lcom/flurry/android/bw;)Lcom/flurry/android/f;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 112
    iget-object v0, p0, Lcom/flurry/android/cp;->bR:Lcom/flurry/android/bw;

    invoke-static {v0}, Lcom/flurry/android/bw;->b(Lcom/flurry/android/bw;)Lcom/flurry/android/f;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/cp;->bR:Lcom/flurry/android/bw;

    invoke-static {v1}, Lcom/flurry/android/bw;->c(Lcom/flurry/android/bw;)Z

    move-result v1

    invoke-virtual {v0, p2, v1}, Lcom/flurry/android/f;->a(Ljava/lang/String;Z)Z

    move-result v0

    .line 116
    :cond_2
    if-eqz v0, :cond_3

    .line 117
    invoke-virtual {p1}, Landroid/webkit/WebView;->stopLoading()V

    .line 121
    :cond_3
    iget-object v0, p0, Lcom/flurry/android/cp;->bR:Lcom/flurry/android/bw;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/flurry/android/bw;->a(Lcom/flurry/android/bw;Z)Z

    goto :goto_0
.end method

.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 86
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "shouldOverrideUrlLoading: url = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/flurry/android/cp;->bR:Lcom/flurry/android/bw;

    invoke-static {v0}, Lcom/flurry/android/bw;->a(Lcom/flurry/android/bw;)Landroid/webkit/WebView;

    move-result-object v0

    if-eq p1, v0, :cond_1

    :cond_0
    move v0, v1

    .line 99
    :goto_0
    return v0

    .line 93
    :cond_1
    iget-object v0, p0, Lcom/flurry/android/cp;->bR:Lcom/flurry/android/bw;

    invoke-static {v0}, Lcom/flurry/android/bw;->b(Lcom/flurry/android/bw;)Lcom/flurry/android/f;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 94
    iget-object v0, p0, Lcom/flurry/android/cp;->bR:Lcom/flurry/android/bw;

    invoke-static {v0}, Lcom/flurry/android/bw;->b(Lcom/flurry/android/bw;)Lcom/flurry/android/f;

    move-result-object v0

    iget-object v2, p0, Lcom/flurry/android/cp;->bR:Lcom/flurry/android/bw;

    invoke-static {v2}, Lcom/flurry/android/bw;->c(Lcom/flurry/android/bw;)Z

    move-result v2

    invoke-virtual {v0, p2, v2}, Lcom/flurry/android/f;->a(Ljava/lang/String;Z)Z

    move-result v0

    .line 98
    :goto_1
    iget-object v2, p0, Lcom/flurry/android/cp;->bR:Lcom/flurry/android/bw;

    invoke-static {v2, v1}, Lcom/flurry/android/bw;->a(Lcom/flurry/android/bw;Z)Z

    goto :goto_0

    :cond_2
    move v0, v1

    goto :goto_1
.end method
