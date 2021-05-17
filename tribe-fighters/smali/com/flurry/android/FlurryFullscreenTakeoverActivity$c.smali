.class final Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/m$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/android/FlurryFullscreenTakeoverActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "c"
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;


# direct methods
.method private constructor <init>(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;)V
    .locals 0

    .prologue
    .line 429
    iput-object p1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c;->a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;Lcom/flurry/android/FlurryFullscreenTakeoverActivity$1;)V
    .locals 0

    .prologue
    .line 429
    invoke-direct {p0, p1}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c;-><init>(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;)V

    return-void
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/m;Ljava/lang/String;Z)Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    .line 432
    const/4 v1, 0x0

    .line 433
    iget-object v2, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c;->a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-static {v2, p2}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 434
    iget-object v1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c;->a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    new-instance v2, Landroid/widget/VideoView;

    iget-object v3, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c;->a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-direct {v2, v3}, Landroid/widget/VideoView;-><init>(Landroid/content/Context;)V

    invoke-static {v1, v2}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;Landroid/widget/VideoView;)Landroid/widget/VideoView;

    .line 435
    iget-object v1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c;->a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-static {v1}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;)Landroid/widget/VideoView;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/VideoView;->setFocusable(Z)V

    .line 436
    iget-object v1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c;->a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-static {v1}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;)Landroid/widget/VideoView;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/VideoView;->setFocusableInTouchMode(Z)V

    .line 437
    iget-object v1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c;->a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-static {v1, p3}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;Z)Z

    .line 438
    iget-object v1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c;->a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-static {v1, p2}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->b(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;Ljava/lang/String;)V

    .line 462
    :cond_0
    :goto_0
    return v0

    .line 440
    :cond_1
    iget-object v2, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c;->a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-static {v2, p2}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->c(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 442
    if-nez p3, :cond_2

    .line 443
    iget-object v1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c;->a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-virtual {p1}, Lcom/flurry/sdk/m;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, p2, v2}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p3

    .line 446
    :cond_2
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v1

    .line 447
    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a()Lcom/flurry/sdk/q;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c;->a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    iget-object v3, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c;->a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-static {v3}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->b(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, p2, v3}, Lcom/flurry/sdk/q;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 448
    if-eqz p3, :cond_0

    .line 449
    new-instance v1, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c$1;

    invoke-direct {v1, p0, p1}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c$1;-><init>(Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c;Lcom/flurry/sdk/m;)V

    invoke-virtual {p1, v1}, Lcom/flurry/sdk/m;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_3
    move v0, v1

    goto :goto_0
.end method
