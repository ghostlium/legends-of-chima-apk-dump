.class final Lcom/flurry/android/cd;
.super Landroid/webkit/WebChromeClient;
.source "SourceFile"


# instance fields
.field final synthetic de:Lcom/flurry/android/eu;


# direct methods
.method synthetic constructor <init>(Lcom/flurry/android/eu;)V
    .locals 1

    .prologue
    .line 249
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/flurry/android/cd;-><init>(Lcom/flurry/android/eu;B)V

    return-void
.end method

.method private constructor <init>(Lcom/flurry/android/eu;B)V
    .locals 0

    .prologue
    .line 249
    iput-object p1, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method


# virtual methods
.method public final onHideCustomView()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 367
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->k(Lcom/flurry/android/eu;)Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_1

    .line 403
    :cond_0
    :goto_0
    return-void

    .line 373
    :cond_1
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->l(Lcom/flurry/android/eu;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 378
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->p(Lcom/flurry/android/eu;)Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 380
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->p(Lcom/flurry/android/eu;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 383
    :cond_2
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->k(Lcom/flurry/android/eu;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 384
    iget-object v1, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v1}, Lcom/flurry/android/eu;->n(Lcom/flurry/android/eu;)Landroid/widget/FrameLayout;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 385
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->n(Lcom/flurry/android/eu;)Landroid/widget/FrameLayout;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v1}, Lcom/flurry/android/eu;->l(Lcom/flurry/android/eu;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 387
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->o(Lcom/flurry/android/eu;)Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->o(Lcom/flurry/android/eu;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 389
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->o(Lcom/flurry/android/eu;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->hide()V

    .line 390
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->o(Lcom/flurry/android/eu;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 391
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->o(Lcom/flurry/android/eu;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 393
    :cond_3
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0, v2}, Lcom/flurry/android/eu;->a(Lcom/flurry/android/eu;Landroid/app/Dialog;)Landroid/app/Dialog;

    .line 395
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->k(Lcom/flurry/android/eu;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v1}, Lcom/flurry/android/eu;->q(Lcom/flurry/android/eu;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/flurry/android/ei;->a(Landroid/app/Activity;I)V

    .line 396
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->r(Lcom/flurry/android/eu;)Landroid/webkit/WebChromeClient$CustomViewCallback;

    move-result-object v0

    invoke-interface {v0}, Landroid/webkit/WebChromeClient$CustomViewCallback;->onCustomViewHidden()V

    .line 398
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0, v2}, Lcom/flurry/android/eu;->a(Lcom/flurry/android/eu;Landroid/webkit/WebChromeClient$CustomViewCallback;)Landroid/webkit/WebChromeClient$CustomViewCallback;

    .line 399
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0, v2}, Lcom/flurry/android/eu;->a(Lcom/flurry/android/eu;Landroid/widget/FrameLayout;)Landroid/widget/FrameLayout;

    .line 400
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0, v2}, Lcom/flurry/android/eu;->a(Lcom/flurry/android/eu;Landroid/view/View;)Landroid/view/View;

    .line 402
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    iget-object v0, v0, Lcom/flurry/android/eu;->L:Lcom/flurry/android/FlurryAds;

    iget-object v1, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    iget-object v1, v1, Lcom/flurry/android/eu;->N:Lcom/flurry/android/AdUnit;

    invoke-virtual {v1}, Lcom/flurry/android/AdUnit;->getAdSpace()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/FlurryAds;->A(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public final onShowCustomView(Landroid/view/View;ILandroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, -0x1

    .line 275
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->k(Lcom/flurry/android/eu;)Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    .line 363
    :goto_0
    return-void

    .line 281
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->l(Lcom/flurry/android/eu;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->m(Lcom/flurry/android/eu;)Landroid/webkit/WebChromeClient;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 283
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->m(Lcom/flurry/android/eu;)Landroid/webkit/WebChromeClient;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebChromeClient;->onHideCustomView()V

    goto :goto_0

    .line 287
    :cond_1
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0, p1}, Lcom/flurry/android/eu;->a(Lcom/flurry/android/eu;Landroid/view/View;)Landroid/view/View;

    .line 288
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    iget-object v1, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v1}, Lcom/flurry/android/eu;->k(Lcom/flurry/android/eu;)Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getRequestedOrientation()I

    move-result v1

    invoke-static {v0, v1}, Lcom/flurry/android/eu;->a(Lcom/flurry/android/eu;I)I

    .line 289
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0, p3}, Lcom/flurry/android/eu;->a(Lcom/flurry/android/eu;Landroid/webkit/WebChromeClient$CustomViewCallback;)Landroid/webkit/WebChromeClient$CustomViewCallback;

    .line 291
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    new-instance v1, Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v2}, Lcom/flurry/android/eu;->j(Lcom/flurry/android/eu;)Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    invoke-static {v0, v1}, Lcom/flurry/android/eu;->a(Lcom/flurry/android/eu;Landroid/widget/FrameLayout;)Landroid/widget/FrameLayout;

    .line 292
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->n(Lcom/flurry/android/eu;)Landroid/widget/FrameLayout;

    move-result-object v0

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 293
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->n(Lcom/flurry/android/eu;)Landroid/widget/FrameLayout;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v1}, Lcom/flurry/android/eu;->l(Lcom/flurry/android/eu;)Landroid/view/View;

    move-result-object v1

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v3, 0x11

    invoke-direct {v2, v4, v4, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 300
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->k(Lcom/flurry/android/eu;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 301
    iget-object v1, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v1}, Lcom/flurry/android/eu;->n(Lcom/flurry/android/eu;)Landroid/widget/FrameLayout;

    move-result-object v1

    invoke-virtual {v0, v1, v4, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 306
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->o(Lcom/flurry/android/eu;)Landroid/app/Dialog;

    move-result-object v0

    if-nez v0, :cond_2

    .line 308
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    new-instance v1, Lcom/flurry/android/dh;

    iget-object v2, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v2}, Lcom/flurry/android/eu;->j(Lcom/flurry/android/eu;)Landroid/content/Context;

    move-result-object v2

    const v3, 0x1030011

    invoke-direct {v1, p0, v2, v3}, Lcom/flurry/android/dh;-><init>(Lcom/flurry/android/cd;Landroid/content/Context;I)V

    invoke-static {v0, v1}, Lcom/flurry/android/eu;->a(Lcom/flurry/android/eu;Landroid/app/Dialog;)Landroid/app/Dialog;

    .line 333
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->o(Lcom/flurry/android/eu;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x3e8

    invoke-virtual {v0, v1}, Landroid/view/Window;->setType(I)V

    .line 335
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->o(Lcom/flurry/android/eu;)Landroid/app/Dialog;

    move-result-object v0

    new-instance v1, Lcom/flurry/android/dg;

    invoke-direct {v1, p0}, Lcom/flurry/android/dg;-><init>(Lcom/flurry/android/cd;)V

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 345
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->o(Lcom/flurry/android/eu;)Landroid/app/Dialog;

    move-result-object v0

    new-instance v1, Lcom/flurry/android/df;

    invoke-direct {v1, p0}, Lcom/flurry/android/df;-><init>(Lcom/flurry/android/cd;)V

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 356
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->o(Lcom/flurry/android/eu;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 357
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->o(Lcom/flurry/android/eu;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 360
    :cond_2
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->k(Lcom/flurry/android/eu;)Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, p2, v5}, Lcom/flurry/android/ei;->a(Landroid/app/Activity;IZ)Z

    .line 362
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    iget-object v0, v0, Lcom/flurry/android/eu;->L:Lcom/flurry/android/FlurryAds;

    iget-object v1, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    iget-object v1, v1, Lcom/flurry/android/eu;->N:Lcom/flurry/android/AdUnit;

    invoke-virtual {v1}, Lcom/flurry/android/AdUnit;->getAdSpace()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/flurry/android/FlurryAds;->b(Ljava/lang/String;Z)V

    goto/16 :goto_0
.end method

.method public final onShowCustomView(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 1

    .prologue
    .line 261
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->k(Lcom/flurry/android/eu;)Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    .line 269
    :goto_0
    return-void

    .line 267
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->k(Lcom/flurry/android/eu;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getRequestedOrientation()I

    move-result v0

    invoke-virtual {p0, p1, v0, p2}, Lcom/flurry/android/cd;->onShowCustomView(Landroid/view/View;ILandroid/webkit/WebChromeClient$CustomViewCallback;)V

    goto :goto_0
.end method
