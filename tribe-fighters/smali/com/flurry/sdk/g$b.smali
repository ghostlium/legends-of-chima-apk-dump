.class Lcom/flurry/sdk/g$b;
.super Landroid/webkit/WebViewClient;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/g;


# direct methods
.method private constructor <init>(Lcom/flurry/sdk/g;)V
    .locals 0

    .prologue
    .line 139
    iput-object p1, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/sdk/g;Lcom/flurry/sdk/g$1;)V
    .locals 0

    .prologue
    .line 139
    invoke-direct {p0, p1}, Lcom/flurry/sdk/g$b;-><init>(Lcom/flurry/sdk/g;)V

    return-void
.end method


# virtual methods
.method public onLoadResource(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 143
    const/4 v0, 0x3

    iget-object v1, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onLoadResource: url = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 144
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onLoadResource(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 146
    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->b(Lcom/flurry/sdk/g;)Landroid/webkit/WebView;

    move-result-object v0

    if-eq p1, v0, :cond_1

    .line 180
    :cond_0
    :goto_0
    return-void

    .line 162
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->b(Lcom/flurry/sdk/g;)Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 163
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->c(Lcom/flurry/sdk/g;)V

    .line 166
    :cond_2
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->d(Lcom/flurry/sdk/g;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 167
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v0

    .line 168
    if-eqz v0, :cond_0

    const-string v1, "mraid.js"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 169
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;Z)Z

    .line 171
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->e(Lcom/flurry/sdk/g;)V

    .line 173
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->f(Lcom/flurry/sdk/g;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 174
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->g(Lcom/flurry/sdk/g;)V

    .line 175
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->h(Lcom/flurry/sdk/g;)V

    .line 176
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->i(Lcom/flurry/sdk/g;)V

    goto :goto_0
.end method

.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 5

    .prologue
    const/4 v4, 0x3

    const/4 v3, 0x1

    .line 204
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPageFinished: url = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 205
    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->b(Lcom/flurry/sdk/g;)Landroid/webkit/WebView;

    move-result-object v0

    if-eq p1, v0, :cond_1

    .line 236
    :cond_0
    :goto_0
    return-void

    .line 212
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->c(Lcom/flurry/sdk/g;)V

    .line 215
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->l(Lcom/flurry/sdk/g;)V

    .line 218
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->m(Lcom/flurry/sdk/g;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->m(Lcom/flurry/sdk/g;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 220
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->m(Lcom/flurry/sdk/g;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 223
    :cond_2
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    iget-object v1, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->b(Lcom/flurry/sdk/g;)Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/g;->a(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v0}, Lcom/flurry/sdk/g;->getCurrentBinding()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_3

    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v0}, Lcom/flurry/sdk/g;->getCurrentBinding()I

    move-result v0

    if-ne v0, v3, :cond_4

    .line 225
    :cond_3
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "adding WebView to AdUnityView"

    invoke-static {v4, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 226
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    iget-object v1, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->b(Lcom/flurry/sdk/g;)Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/g;->addView(Landroid/view/View;)V

    .line 229
    :cond_4
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0, v3}, Lcom/flurry/sdk/g;->b(Lcom/flurry/sdk/g;Z)Z

    .line 231
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->d(Lcom/flurry/sdk/g;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 232
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->g(Lcom/flurry/sdk/g;)V

    .line 233
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->h(Lcom/flurry/sdk/g;)V

    .line 234
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->i(Lcom/flurry/sdk/g;)V

    goto :goto_0
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 185
    const/4 v0, 0x3

    iget-object v1, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onPageStarted: url = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 186
    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->b(Lcom/flurry/sdk/g;)Landroid/webkit/WebView;

    move-result-object v0

    if-eq p1, v0, :cond_1

    .line 198
    :cond_0
    :goto_0
    return-void

    .line 193
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->j(Lcom/flurry/sdk/g;)V

    .line 194
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->k(Lcom/flurry/sdk/g;)V

    .line 196
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0, v4}, Lcom/flurry/sdk/g;->b(Lcom/flurry/sdk/g;Z)Z

    .line 197
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0, v4}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;Z)Z

    goto :goto_0
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 7

    .prologue
    .line 305
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->m(Lcom/flurry/sdk/g;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->m(Lcom/flurry/sdk/g;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 306
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->m(Lcom/flurry/sdk/g;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 310
    :cond_0
    invoke-static {p4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 311
    invoke-static {}, Lcom/flurry/sdk/g;->f()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 313
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 314
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 315
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 319
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->o(Lcom/flurry/sdk/g;)V

    .line 324
    :goto_0
    return-void

    .line 321
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    const-string v1, "renderFailed"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    iget-object v3, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v3}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v3

    iget-object v4, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v4}, Lcom/flurry/sdk/g;->getAdLog()Lcom/flurry/sdk/e;

    move-result-object v4

    iget-object v5, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v5}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v5

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V

    goto :goto_0
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 7

    .prologue
    .line 242
    const/4 v0, 0x3

    iget-object v1, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "shouldOverrideUrlLoading: url = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 243
    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->b(Lcom/flurry/sdk/g;)Landroid/webkit/WebView;

    move-result-object v0

    if-eq p1, v0, :cond_1

    .line 244
    :cond_0
    const/4 v0, 0x0

    .line 297
    :goto_0
    return v0

    .line 251
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->b(Lcom/flurry/sdk/g;)Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v0

    .line 252
    invoke-static {v0}, Lcom/flurry/sdk/bv;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 253
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 254
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 255
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 256
    invoke-virtual {v1}, Landroid/net/Uri;->isHierarchical()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {v1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 259
    const/4 v1, 0x3

    iget-object v2, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v2}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "shouldOverrideUrlLoading: target url = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    move-object p2, v0

    .line 263
    :cond_2
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 264
    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_5

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    const-string v2, "flurry"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 266
    const-string v1, "event"

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 267
    if-eqz v1, :cond_3

    .line 269
    iget-object v2, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v2}, Lcom/flurry/sdk/g;->n(Lcom/flurry/sdk/g;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 271
    invoke-virtual {v0}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flurry/sdk/fh;->f(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v2

    .line 272
    const-string v0, "guid"

    invoke-interface {v2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 274
    iget-object v3, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    const-string v0, "guid"

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v3, v0}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;Ljava/lang/String;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v3

    .line 275
    iget-object v4, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    const-string v0, "guid"

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v4, v0}, Lcom/flurry/sdk/g;->b(Lcom/flurry/sdk/g;Ljava/lang/String;)Lcom/flurry/sdk/e;

    move-result-object v4

    .line 276
    if-eqz v3, :cond_3

    if-eqz v4, :cond_3

    .line 278
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V

    .line 286
    :cond_3
    :goto_1
    const/4 v0, 0x1

    goto/16 :goto_0

    .line 283
    :cond_4
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    iget-object v3, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v3}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v3

    iget-object v4, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v4}, Lcom/flurry/sdk/g;->getAdLog()Lcom/flurry/sdk/e;

    move-result-object v4

    iget-object v5, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v5}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v5

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V

    goto :goto_1

    .line 290
    :cond_5
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    const-string v1, "clicked"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    iget-object v3, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v3}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v3

    iget-object v4, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v4}, Lcom/flurry/sdk/g;->getAdLog()Lcom/flurry/sdk/e;

    move-result-object v4

    iget-object v5, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v5}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v5

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V

    .line 291
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v0}, Lcom/flurry/sdk/g;->d()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 292
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->b(Lcom/flurry/sdk/g;)Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 297
    :goto_2
    const/4 v0, 0x1

    goto/16 :goto_0

    .line 295
    :cond_6
    iget-object v0, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v0}, Lcom/flurry/sdk/g;->getPlatformModule()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a()Lcom/flurry/sdk/q;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v1}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/flurry/sdk/g$b;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v3}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v3

    invoke-virtual {v0, v1, p2, v2, v3}, Lcom/flurry/sdk/q;->a(Landroid/content/Context;Ljava/lang/String;ZLcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    goto :goto_2
.end method
