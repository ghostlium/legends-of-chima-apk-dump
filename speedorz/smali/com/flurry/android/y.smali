.class final Lcom/flurry/android/y;
.super Landroid/webkit/WebChromeClient;
.source "SourceFile"


# instance fields
.field private synthetic bR:Lcom/flurry/android/bw;


# direct methods
.method synthetic constructor <init>(Lcom/flurry/android/bw;)V
    .locals 1

    .prologue
    .line 134
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/flurry/android/y;-><init>(Lcom/flurry/android/bw;B)V

    return-void
.end method

.method private constructor <init>(Lcom/flurry/android/bw;B)V
    .locals 0

    .prologue
    .line 134
    iput-object p1, p0, Lcom/flurry/android/y;->bR:Lcom/flurry/android/bw;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method


# virtual methods
.method public final onHideCustomView()V
    .locals 2

    .prologue
    .line 160
    iget-object v0, p0, Lcom/flurry/android/y;->bR:Lcom/flurry/android/bw;

    invoke-static {v0}, Lcom/flurry/android/bw;->d(Lcom/flurry/android/bw;)Lcom/flurry/android/al;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 162
    iget-object v0, p0, Lcom/flurry/android/y;->bR:Lcom/flurry/android/bw;

    invoke-static {v0}, Lcom/flurry/android/bw;->d(Lcom/flurry/android/bw;)Lcom/flurry/android/al;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/al;->O()V

    .line 164
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/y;->bR:Lcom/flurry/android/bw;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/flurry/android/bw;->b(Lcom/flurry/android/bw;Z)Z

    .line 165
    return-void
.end method

.method public final onShowCustomView(Landroid/view/View;ILandroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 3

    .prologue
    .line 150
    iget-object v0, p0, Lcom/flurry/android/y;->bR:Lcom/flurry/android/bw;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/flurry/android/bw;->b(Lcom/flurry/android/bw;Z)Z

    .line 152
    iget-object v0, p0, Lcom/flurry/android/y;->bR:Lcom/flurry/android/bw;

    invoke-static {v0}, Lcom/flurry/android/bw;->d(Lcom/flurry/android/bw;)Lcom/flurry/android/al;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 153
    iget-object v0, p0, Lcom/flurry/android/y;->bR:Lcom/flurry/android/bw;

    invoke-static {v0}, Lcom/flurry/android/bw;->d(Lcom/flurry/android/bw;)Lcom/flurry/android/al;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/y;->bR:Lcom/flurry/android/bw;

    new-instance v2, Lcom/flurry/android/bh;

    invoke-direct {v2, p3}, Lcom/flurry/android/bh;-><init>(Landroid/webkit/WebChromeClient$CustomViewCallback;)V

    invoke-virtual {v0, v1, p1, p2, v2}, Lcom/flurry/android/al;->a(Lcom/flurry/android/bw;Landroid/view/View;ILcom/flurry/android/BasicWebView$BasicWebViewFullScreenTransitionHandler$BasicWebViewFullScreenTransitionCallback;)V

    .line 156
    :cond_0
    return-void
.end method

.method public final onShowCustomView(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 4

    .prologue
    .line 138
    iget-object v0, p0, Lcom/flurry/android/y;->bR:Lcom/flurry/android/bw;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/flurry/android/bw;->b(Lcom/flurry/android/bw;Z)Z

    .line 140
    iget-object v0, p0, Lcom/flurry/android/y;->bR:Lcom/flurry/android/bw;

    invoke-static {v0}, Lcom/flurry/android/bw;->d(Lcom/flurry/android/bw;)Lcom/flurry/android/al;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 141
    iget-object v0, p0, Lcom/flurry/android/y;->bR:Lcom/flurry/android/bw;

    invoke-static {v0}, Lcom/flurry/android/bw;->d(Lcom/flurry/android/bw;)Lcom/flurry/android/al;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/y;->bR:Lcom/flurry/android/bw;

    new-instance v2, Lcom/flurry/android/bh;

    invoke-direct {v2, p2}, Lcom/flurry/android/bh;-><init>(Landroid/webkit/WebChromeClient$CustomViewCallback;)V

    iget-object v3, v0, Lcom/flurry/android/al;->q:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-virtual {v3}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->getRequestedOrientation()I

    move-result v3

    invoke-virtual {v0, v1, p1, v3, v2}, Lcom/flurry/android/al;->a(Lcom/flurry/android/bw;Landroid/view/View;ILcom/flurry/android/BasicWebView$BasicWebViewFullScreenTransitionHandler$BasicWebViewFullScreenTransitionCallback;)V

    .line 144
    :cond_0
    return-void
.end method
