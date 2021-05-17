.class final Lcom/flurry/sdk/g$a;
.super Landroid/webkit/WebChromeClient;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/g;


# direct methods
.method private constructor <init>(Lcom/flurry/sdk/g;)V
    .locals 0

    .prologue
    .line 327
    iput-object p1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/sdk/g;Lcom/flurry/sdk/g$1;)V
    .locals 0

    .prologue
    .line 327
    invoke-direct {p0, p1}, Lcom/flurry/sdk/g$a;-><init>(Lcom/flurry/sdk/g;)V

    return-void
.end method


# virtual methods
.method public onHideCustomView()V
    .locals 4

    .prologue
    const/4 v2, 0x3

    const/4 v3, 0x0

    .line 441
    iget-object v0, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "onHideCustomView()"

    invoke-static {v2, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 442
    iget-object v0, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v0

    instance-of v0, v0, Landroid/app/Activity;

    if-nez v0, :cond_1

    .line 444
    iget-object v0, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "no activity present"

    invoke-static {v2, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 480
    :cond_0
    :goto_0
    return-void

    .line 448
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 450
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->p(Lcom/flurry/sdk/g;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 455
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->t(Lcom/flurry/sdk/g;)Landroid/app/Dialog;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 457
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->t(Lcom/flurry/sdk/g;)Landroid/app/Dialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    .line 460
    :cond_2
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 461
    iget-object v2, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v2}, Lcom/flurry/sdk/g;->r(Lcom/flurry/sdk/g;)Landroid/widget/FrameLayout;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 462
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->r(Lcom/flurry/sdk/g;)Landroid/widget/FrameLayout;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v2}, Lcom/flurry/sdk/g;->p(Lcom/flurry/sdk/g;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 464
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->s(Lcom/flurry/sdk/g;)Landroid/app/Dialog;

    move-result-object v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->s(Lcom/flurry/sdk/g;)Landroid/app/Dialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Dialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 466
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->s(Lcom/flurry/sdk/g;)Landroid/app/Dialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Dialog;->hide()V

    .line 467
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->s(Lcom/flurry/sdk/g;)Landroid/app/Dialog;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 468
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->s(Lcom/flurry/sdk/g;)Landroid/app/Dialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Dialog;->dismiss()V

    .line 470
    :cond_3
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1, v3}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;Landroid/app/Dialog;)Landroid/app/Dialog;

    .line 472
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->u(Lcom/flurry/sdk/g;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/flurry/sdk/bs;->a(Landroid/app/Activity;I)V

    .line 473
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->v(Lcom/flurry/sdk/g;)Landroid/webkit/WebChromeClient$CustomViewCallback;

    move-result-object v1

    invoke-interface {v1}, Landroid/webkit/WebChromeClient$CustomViewCallback;->onCustomViewHidden()V

    .line 475
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1, v3}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;Landroid/webkit/WebChromeClient$CustomViewCallback;)Landroid/webkit/WebChromeClient$CustomViewCallback;

    .line 476
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1, v3}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;Landroid/widget/FrameLayout;)Landroid/widget/FrameLayout;

    .line 477
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1, v3}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;Landroid/view/View;)Landroid/view/View;

    .line 479
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v1}, Lcom/flurry/sdk/g;->getPlatformModule()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v2}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->b()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public onShowCustomView(Landroid/view/View;ILandroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 7

    .prologue
    const/4 v2, 0x3

    const/4 v6, 0x1

    const/4 v5, -0x1

    .line 356
    iget-object v0, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "onShowCustomView(14)"

    invoke-static {v2, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 357
    iget-object v0, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v0

    instance-of v0, v0, Landroid/app/Activity;

    if-nez v0, :cond_0

    .line 359
    iget-object v0, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "no activity present"

    invoke-static {v2, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 437
    :goto_0
    return-void

    .line 363
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 365
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->p(Lcom/flurry/sdk/g;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->q(Lcom/flurry/sdk/g;)Landroid/webkit/WebChromeClient;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 367
    iget-object v0, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->q(Lcom/flurry/sdk/g;)Landroid/webkit/WebChromeClient;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebChromeClient;->onHideCustomView()V

    goto :goto_0

    .line 371
    :cond_1
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1, p1}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;Landroid/view/View;)Landroid/view/View;

    .line 372
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v0}, Landroid/app/Activity;->getRequestedOrientation()I

    move-result v2

    invoke-static {v1, v2}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;I)I

    .line 373
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1, p3}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;Landroid/webkit/WebChromeClient$CustomViewCallback;)Landroid/webkit/WebChromeClient$CustomViewCallback;

    .line 375
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    invoke-static {v1, v2}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;Landroid/widget/FrameLayout;)Landroid/widget/FrameLayout;

    .line 376
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->r(Lcom/flurry/sdk/g;)Landroid/widget/FrameLayout;

    move-result-object v1

    const/high16 v2, -0x1000000

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 377
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->r(Lcom/flurry/sdk/g;)Landroid/widget/FrameLayout;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v2}, Lcom/flurry/sdk/g;->p(Lcom/flurry/sdk/g;)Landroid/view/View;

    move-result-object v2

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v4, 0x11

    invoke-direct {v3, v5, v5, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 384
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 385
    iget-object v2, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v2}, Lcom/flurry/sdk/g;->r(Lcom/flurry/sdk/g;)Landroid/widget/FrameLayout;

    move-result-object v2

    invoke-virtual {v1, v2, v5, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 390
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->s(Lcom/flurry/sdk/g;)Landroid/app/Dialog;

    move-result-object v1

    if-nez v1, :cond_2

    .line 392
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    new-instance v2, Lcom/flurry/sdk/g$a$1;

    const v3, 0x1030011

    invoke-direct {v2, p0, v0, v3, v0}, Lcom/flurry/sdk/g$a$1;-><init>(Lcom/flurry/sdk/g$a;Landroid/content/Context;ILandroid/app/Activity;)V

    invoke-static {v1, v2}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;Landroid/app/Dialog;)Landroid/app/Dialog;

    .line 407
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->s(Lcom/flurry/sdk/g;)Landroid/app/Dialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v2, 0x3e8

    invoke-virtual {v1, v2}, Landroid/view/Window;->setType(I)V

    .line 409
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->s(Lcom/flurry/sdk/g;)Landroid/app/Dialog;

    move-result-object v1

    new-instance v2, Lcom/flurry/sdk/g$a$2;

    invoke-direct {v2, p0}, Lcom/flurry/sdk/g$a$2;-><init>(Lcom/flurry/sdk/g$a;)V

    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 419
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->s(Lcom/flurry/sdk/g;)Landroid/app/Dialog;

    move-result-object v1

    new-instance v2, Lcom/flurry/sdk/g$a$3;

    invoke-direct {v2, p0}, Lcom/flurry/sdk/g$a$3;-><init>(Lcom/flurry/sdk/g$a;)V

    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 430
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->s(Lcom/flurry/sdk/g;)Landroid/app/Dialog;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 431
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->s(Lcom/flurry/sdk/g;)Landroid/app/Dialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    .line 434
    :cond_2
    invoke-static {v0, p2, v6}, Lcom/flurry/sdk/bs;->a(Landroid/app/Activity;IZ)Z

    .line 436
    iget-object v1, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v1}, Lcom/flurry/sdk/g;->getPlatformModule()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v2}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->b()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public onShowCustomView(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 3

    .prologue
    const/4 v2, 0x3

    .line 339
    iget-object v0, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "onShowCustomView(7)"

    invoke-static {v2, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 340
    iget-object v0, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v0

    instance-of v0, v0, Landroid/app/Activity;

    if-nez v0, :cond_0

    .line 342
    iget-object v0, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "no activity present"

    invoke-static {v2, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 350
    :goto_0
    return-void

    .line 346
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-virtual {v0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 348
    invoke-virtual {v0}, Landroid/app/Activity;->getRequestedOrientation()I

    move-result v0

    invoke-virtual {p0, p1, v0, p2}, Lcom/flurry/sdk/g$a;->onShowCustomView(Landroid/view/View;ILandroid/webkit/WebChromeClient$CustomViewCallback;)V

    goto :goto_0
.end method
