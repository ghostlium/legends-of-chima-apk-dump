.class final Lcom/flurry/android/bw;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private dW:Landroid/webkit/WebView;

.field private dX:Landroid/webkit/WebViewClient;

.field private dY:Landroid/webkit/WebChromeClient;

.field private dZ:Z

.field private ea:Landroid/widget/ImageView;

.field private eb:Landroid/widget/ImageView;

.field private ec:Landroid/widget/ImageView;

.field private ed:Lcom/flurry/android/f;

.field private ee:Lcom/flurry/android/dn;

.field private ef:Lcom/flurry/android/al;

.field private eg:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 7

    .prologue
    const/16 v6, 0xb

    const/4 v2, 0x0

    const/4 v5, -0x1

    const/4 v4, 0x1

    const/4 v3, -0x2

    .line 170
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 20
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/bw;->TAG:Ljava/lang/String;

    .line 50
    new-instance v0, Landroid/webkit/WebView;

    invoke-direct {v0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    .line 173
    new-instance v0, Lcom/flurry/android/cp;

    invoke-direct {v0, p0}, Lcom/flurry/android/cp;-><init>(Lcom/flurry/android/bw;)V

    iput-object v0, p0, Lcom/flurry/android/bw;->dX:Landroid/webkit/WebViewClient;

    .line 174
    new-instance v0, Lcom/flurry/android/y;

    invoke-direct {v0, p0}, Lcom/flurry/android/y;-><init>(Lcom/flurry/android/bw;)V

    iput-object v0, p0, Lcom/flurry/android/bw;->dY:Landroid/webkit/WebChromeClient;

    .line 176
    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 177
    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 178
    sget v0, Lcom/flurry/android/k;->SDK_INT:I

    const/4 v1, 0x7

    if-lt v0, v1, :cond_0

    .line 180
    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 182
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 183
    sget v0, Lcom/flurry/android/k;->SDK_INT:I

    if-lt v0, v6, :cond_1

    .line 185
    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setDisplayZoomControls(Z)V

    .line 187
    :cond_1
    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/flurry/android/bw;->dX:Landroid/webkit/WebViewClient;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 188
    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/flurry/android/bw;->dY:Landroid/webkit/WebChromeClient;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 189
    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    invoke-virtual {v0, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 191
    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/flurry/android/bw;->ea:Landroid/widget/ImageView;

    .line 192
    iget-object v0, p0, Lcom/flurry/android/bw;->ea:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setId(I)V

    .line 193
    iget-object v0, p0, Lcom/flurry/android/bw;->ea:Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/flurry/android/bw;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x1080038

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 194
    iget-object v0, p0, Lcom/flurry/android/bw;->ea:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 196
    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/flurry/android/bw;->eb:Landroid/widget/ImageView;

    .line 197
    iget-object v0, p0, Lcom/flurry/android/bw;->eb:Landroid/widget/ImageView;

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setId(I)V

    .line 198
    iget-object v0, p0, Lcom/flurry/android/bw;->eb:Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/flurry/android/bw;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x108004c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 199
    iget-object v0, p0, Lcom/flurry/android/bw;->eb:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 201
    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/flurry/android/bw;->ec:Landroid/widget/ImageView;

    .line 202
    iget-object v0, p0, Lcom/flurry/android/bw;->ec:Landroid/widget/ImageView;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setId(I)V

    .line 203
    iget-object v0, p0, Lcom/flurry/android/bw;->ec:Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/flurry/android/bw;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x108003d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 204
    iget-object v0, p0, Lcom/flurry/android/bw;->ec:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 206
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v0, v5, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 207
    invoke-virtual {p0, v0}, Lcom/flurry/android/bw;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 208
    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    invoke-virtual {p0, v0}, Lcom/flurry/android/bw;->addView(Landroid/view/View;)V

    .line 210
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 211
    const/16 v1, 0xe

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 212
    iget-object v1, p0, Lcom/flurry/android/bw;->ea:Landroid/widget/ImageView;

    invoke-virtual {p0, v1, v0}, Lcom/flurry/android/bw;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 214
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 215
    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 216
    iget-object v1, p0, Lcom/flurry/android/bw;->eb:Landroid/widget/ImageView;

    invoke-virtual {p0, v1, v0}, Lcom/flurry/android/bw;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 218
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 219
    invoke-virtual {v0, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 220
    iget-object v1, p0, Lcom/flurry/android/bw;->ec:Landroid/widget/ImageView;

    invoke-virtual {p0, v1, v0}, Lcom/flurry/android/bw;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 221
    return-void
.end method

.method static synthetic a(Lcom/flurry/android/bw;)Landroid/webkit/WebView;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic a(Lcom/flurry/android/bw;Z)Z
    .locals 0

    .prologue
    .line 18
    iput-boolean p1, p0, Lcom/flurry/android/bw;->eg:Z

    return p1
.end method

.method static synthetic b(Lcom/flurry/android/bw;)Lcom/flurry/android/f;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/flurry/android/bw;->ed:Lcom/flurry/android/f;

    return-object v0
.end method

.method static synthetic b(Lcom/flurry/android/bw;Z)Z
    .locals 0

    .prologue
    .line 18
    iput-boolean p1, p0, Lcom/flurry/android/bw;->dZ:Z

    return p1
.end method

.method static synthetic c(Lcom/flurry/android/bw;)Z
    .locals 1

    .prologue
    .line 18
    iget-boolean v0, p0, Lcom/flurry/android/bw;->eg:Z

    return v0
.end method

.method static synthetic d(Lcom/flurry/android/bw;)Lcom/flurry/android/al;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/flurry/android/bw;->ef:Lcom/flurry/android/al;

    return-object v0
.end method


# virtual methods
.method public final a(Lcom/flurry/android/al;)V
    .locals 0

    .prologue
    .line 76
    iput-object p1, p0, Lcom/flurry/android/bw;->ef:Lcom/flurry/android/al;

    .line 77
    return-void
.end method

.method public final a(Lcom/flurry/android/dn;)V
    .locals 0

    .prologue
    .line 68
    iput-object p1, p0, Lcom/flurry/android/bw;->ee:Lcom/flurry/android/dn;

    .line 69
    return-void
.end method

.method public final a(Lcom/flurry/android/f;)V
    .locals 0

    .prologue
    .line 60
    iput-object p1, p0, Lcom/flurry/android/bw;->ed:Lcom/flurry/android/f;

    .line 61
    return-void
.end method

.method public final canGoBack()Z
    .locals 1

    .prologue
    .line 224
    iget-boolean v0, p0, Lcom/flurry/android/bw;->dZ:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final destroy()V
    .locals 2

    .prologue
    .line 269
    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    if-eqz v0, :cond_1

    .line 271
    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    invoke-virtual {p0, v0}, Lcom/flurry/android/bw;->removeView(Landroid/view/View;)V

    .line 272
    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 273
    sget v0, Lcom/flurry/android/k;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 274
    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->onPause()V

    .line 276
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    .line 277
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    .line 279
    :cond_1
    return-void
.end method

.method public final goBack()V
    .locals 1

    .prologue
    .line 228
    iget-boolean v0, p0, Lcom/flurry/android/bw;->dZ:Z

    if-eqz v0, :cond_1

    .line 229
    iget-object v0, p0, Lcom/flurry/android/bw;->dY:Landroid/webkit/WebChromeClient;

    invoke-virtual {v0}, Landroid/webkit/WebChromeClient;->onHideCustomView()V

    .line 235
    :cond_0
    :goto_0
    return-void

    .line 231
    :cond_1
    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 232
    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    goto :goto_0
.end method

.method public final onClick(Landroid/view/View;)V
    .locals 1

    .prologue
    .line 240
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 266
    :cond_0
    :goto_0
    return-void

    .line 243
    :pswitch_0
    iget-object v0, p0, Lcom/flurry/android/bw;->ee:Lcom/flurry/android/dn;

    if-eqz v0, :cond_0

    .line 244
    iget-object v0, p0, Lcom/flurry/android/bw;->ee:Lcom/flurry/android/dn;

    iget-object v0, v0, Lcom/flurry/android/dn;->q:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->finish()V

    goto :goto_0

    .line 248
    :pswitch_1
    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoForward()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 249
    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goForward()V

    goto :goto_0

    .line 254
    :pswitch_2
    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 255
    iget-object v0, p0, Lcom/flurry/android/bw;->dW:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    goto :goto_0

    .line 257
    :cond_1
    iget-object v0, p0, Lcom/flurry/android/bw;->ee:Lcom/flurry/android/dn;

    if-eqz v0, :cond_0

    .line 258
    iget-object v0, p0, Lcom/flurry/android/bw;->ee:Lcom/flurry/android/dn;

    iget-object v0, v0, Lcom/flurry/android/dn;->q:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->finish()V

    goto :goto_0

    .line 240
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
