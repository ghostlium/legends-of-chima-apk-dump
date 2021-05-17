.class final Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/m$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/android/FlurryFullscreenTakeoverActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

.field private b:Landroid/view/View;

.field private c:I

.field private d:Lcom/flurry/sdk/m$d$a;

.field private e:Landroid/widget/FrameLayout;


# direct methods
.method private constructor <init>(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;)V
    .locals 0

    .prologue
    .line 474
    iput-object p1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;Lcom/flurry/android/FlurryFullscreenTakeoverActivity$1;)V
    .locals 0

    .prologue
    .line 474
    invoke-direct {p0, p1}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;-><init>(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;)V

    return-void
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/m;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 515
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->b:Landroid/view/View;

    if-nez v0, :cond_0

    .line 532
    :goto_0
    return-void

    .line 519
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 520
    iget-object v1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 521
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->e:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->b:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 523
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->d:Lcom/flurry/sdk/m$d$a;

    if-eqz v0, :cond_1

    .line 524
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->d:Lcom/flurry/sdk/m$d$a;

    invoke-interface {v0}, Lcom/flurry/sdk/m$d$a;->a()V

    .line 527
    :cond_1
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    iget v1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->c:I

    invoke-virtual {v0, v1}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->setRequestedOrientation(I)V

    .line 529
    iput-object v2, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->d:Lcom/flurry/sdk/m$d$a;

    .line 530
    iput-object v2, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->e:Landroid/widget/FrameLayout;

    .line 531
    iput-object v2, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->b:Landroid/view/View;

    goto :goto_0
.end method

.method public a(Lcom/flurry/sdk/m;Landroid/view/View;ILcom/flurry/sdk/m$d$a;)V
    .locals 5

    .prologue
    const/4 v4, -0x1

    .line 492
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->b:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 493
    invoke-virtual {p0, p1}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->a(Lcom/flurry/sdk/m;)V

    .line 496
    :cond_0
    iput-object p2, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->b:Landroid/view/View;

    .line 497
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->getRequestedOrientation()I

    move-result v0

    iput v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->c:I

    .line 498
    iput-object p4, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->d:Lcom/flurry/sdk/m$d$a;

    .line 500
    new-instance v0, Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->e:Landroid/widget/FrameLayout;

    .line 501
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->e:Landroid/widget/FrameLayout;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 502
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->e:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->b:Landroid/view/View;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v3, 0x11

    invoke-direct {v2, v4, v4, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 506
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 507
    iget-object v1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1, v4, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 510
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-virtual {v0, p3}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->setRequestedOrientation(I)V

    .line 511
    return-void
.end method

.method public a(Lcom/flurry/sdk/m;Landroid/view/View;Lcom/flurry/sdk/m$d$a;)V
    .locals 1

    .prologue
    .line 484
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->getRequestedOrientation()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$b;->a(Lcom/flurry/sdk/m;Landroid/view/View;ILcom/flurry/sdk/m$d$a;)V

    .line 486
    return-void
.end method
