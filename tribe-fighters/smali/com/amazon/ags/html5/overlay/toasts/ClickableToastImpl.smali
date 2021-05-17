.class public abstract Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;
.super Landroid/widget/LinearLayout;
.source "ClickableToastImpl.java"

# interfaces
.implements Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$7;,
        Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private _isShowing:Z

.field protected hideAnimation:Landroid/view/animation/Animation;

.field private rootView:Landroid/view/View;

.field protected showAnimation:Landroid/view/animation/Animation;

.field private toastObservers:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/amazon/ags/html5/overlay/toasts/ClickableToastObserver;",
            ">;"
        }
    .end annotation
.end field

.field protected final toastParams:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;

.field private touchListener:Landroid/view/View$OnTouchListener;

.field private final windowManager:Landroid/view/WindowManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 57
    new-instance v0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;

    invoke-direct {v0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;-><init>(Landroid/app/Activity;Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;)V

    .line 58
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;

    .prologue
    .line 61
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 40
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->_isShowing:Z

    .line 63
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->toastObservers:Ljava/util/Set;

    .line 64
    iput-object p2, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->toastParams:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;

    .line 65
    invoke-virtual {p1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->windowManager:Landroid/view/WindowManager;

    .line 66
    new-instance v0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$1;

    invoke-direct {v0, p0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$1;-><init>(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;)V

    iput-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->touchListener:Landroid/view/View$OnTouchListener;

    .line 72
    return-void
.end method

.method static synthetic access$000(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->rootView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$002(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;Landroid/view/View;)Landroid/view/View;
    .locals 0
    .param p0, "x0"    # Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->rootView:Landroid/view/View;

    return-object p1
.end method

.method static synthetic access$100(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;)Landroid/view/View$OnTouchListener;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->touchListener:Landroid/view/View$OnTouchListener;

    return-object v0
.end method

.method static synthetic access$200(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;)V
    .locals 0
    .param p0, "x0"    # Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->addToWindow()V

    return-void
.end method

.method static synthetic access$300(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;
    .param p1, "x1"    # Z

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->setIsShowing(Z)V

    return-void
.end method

.method static synthetic access$400(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;)V
    .locals 0
    .param p0, "x0"    # Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->hide()V

    return-void
.end method

.method static synthetic access$500(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;)V
    .locals 0
    .param p0, "x0"    # Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->startHideAnimations()V

    return-void
.end method

.method static synthetic access$600()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    sget-object v0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$700(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;)Landroid/view/WindowManager;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->windowManager:Landroid/view/WindowManager;

    return-object v0
.end method

.method static synthetic access$800(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->toastObservers:Ljava/util/Set;

    return-object v0
.end method

.method private addToWindow()V
    .locals 3

    .prologue
    .line 275
    sget-object v1, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->TAG:Ljava/lang/String;

    const-string v2, "Entering addToWindow..."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 277
    :try_start_0
    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->windowManager:Landroid/view/WindowManager;

    invoke-virtual {p0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->getWindowManagerParams()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    invoke-interface {v1, p0, v2}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 281
    :goto_0
    return-void

    .line 278
    :catch_0
    move-exception v0

    .line 279
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Attempted to show a toast after the associated activity was closed"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private getGravity()I
    .locals 2

    .prologue
    .line 261
    sget-object v0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$7;->$SwitchMap$com$amazon$ags$api$overlay$PopUpLocation:[I

    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->toastParams:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;

    invoke-virtual {v1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->getPopUpLocation()Lcom/amazon/ags/api/overlay/PopUpLocation;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazon/ags/api/overlay/PopUpLocation;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 270
    const/16 v0, 0x51

    :goto_0
    return v0

    .line 265
    :pswitch_0
    const/16 v0, 0x31

    goto :goto_0

    .line 261
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private final hide()V
    .locals 2

    .prologue
    .line 372
    new-instance v0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$6;

    invoke-direct {v0, p0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$6;-><init>(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;)V

    .line 390
    .local v0, "hide":Ljava/lang/Runnable;
    invoke-virtual {p0, v0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->post(Ljava/lang/Runnable;)Z

    .line 391
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 392
    return-void
.end method

.method private setIsShowing(Z)V
    .locals 0
    .param p1, "showing"    # Z

    .prologue
    .line 304
    iput-boolean p1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->_isShowing:Z

    .line 305
    return-void
.end method

.method private setupHideAnimationCallback()V
    .locals 2

    .prologue
    .line 318
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->hideAnimation:Landroid/view/animation/Animation;

    new-instance v1, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$3;

    invoke-direct {v1, p0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$3;-><init>(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 334
    return-void
.end method

.method private setupShowAnimationCallback()V
    .locals 2

    .prologue
    .line 337
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->showAnimation:Landroid/view/animation/Animation;

    new-instance v1, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$4;

    invoke-direct {v1, p0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$4;-><init>(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 353
    return-void
.end method

.method private final startHideAnimations()V
    .locals 1

    .prologue
    .line 356
    new-instance v0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$5;

    invoke-direct {v0, p0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$5;-><init>(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;)V

    .line 368
    .local v0, "startHideAnimations":Ljava/lang/Runnable;
    invoke-virtual {p0, v0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->post(Ljava/lang/Runnable;)Z

    .line 369
    return-void
.end method


# virtual methods
.method public addClickableToastObserver(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastObserver;)V
    .locals 2
    .param p1, "observer"    # Lcom/amazon/ags/html5/overlay/toasts/ClickableToastObserver;

    .prologue
    .line 396
    if-nez p1, :cond_0

    .line 397
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Observer cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 399
    :cond_0
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->toastObservers:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 400
    return-void
.end method

.method public destroy()V
    .locals 0

    .prologue
    .line 295
    invoke-direct {p0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->hide()V

    .line 296
    return-void
.end method

.method public dismiss()V
    .locals 3

    .prologue
    .line 284
    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->windowManager:Landroid/view/WindowManager;

    if-eqz v1, :cond_0

    .line 286
    :try_start_0
    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->windowManager:Landroid/view/WindowManager;

    invoke-interface {v1, p0}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 291
    :cond_0
    :goto_0
    return-void

    .line 287
    :catch_0
    move-exception v0

    .line 288
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    sget-object v1, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->TAG:Ljava/lang/String;

    const-string v2, "Tried to remove toast but none was attached."

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected getWindowManagerParams()Landroid/view/WindowManager$LayoutParams;
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, -0x2

    .line 120
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v0}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    .line 121
    .local v0, "params":Landroid/view/WindowManager$LayoutParams;
    const/16 v1, 0x28

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 122
    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->format:I

    .line 123
    invoke-direct {p0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->getGravity()I

    move-result v1

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 124
    invoke-virtual {p0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget v1, v1, Landroid/content/res/Configuration;->orientation:I

    if-ne v1, v3, :cond_0

    .line 125
    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->toastParams:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;

    invoke-virtual {v1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->getVerticalMarginPortrait()F

    move-result v1

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->verticalMargin:F

    .line 126
    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->toastParams:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;

    invoke-virtual {v1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->getHorizontalMarginPortrait()F

    move-result v1

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->horizontalMargin:F

    .line 132
    :goto_0
    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 133
    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 134
    return-object v0

    .line 128
    :cond_0
    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->toastParams:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;

    invoke-virtual {v1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->getVerticalMarginLandscape()F

    move-result v1

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->verticalMargin:F

    .line 129
    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->toastParams:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;

    invoke-virtual {v1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->getHorizontalMarginLandscape()F

    move-result v1

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->horizontalMargin:F

    goto :goto_0
.end method

.method protected initAnimations()V
    .locals 3

    .prologue
    .line 308
    invoke-virtual {p0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->toastParams:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;

    invoke-virtual {v1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->getShowAnimationResource()I

    move-result v1

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->showAnimation:Landroid/view/animation/Animation;

    .line 309
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->showAnimation:Landroid/view/animation/Animation;

    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->toastParams:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;

    invoke-virtual {v1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->getFadeInDuration()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 311
    invoke-virtual {p0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->toastParams:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;

    invoke-virtual {v1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->getHideAnimationResource()I

    move-result v1

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->hideAnimation:Landroid/view/animation/Animation;

    .line 312
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->hideAnimation:Landroid/view/animation/Animation;

    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->toastParams:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;

    invoke-virtual {v1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->getFadeOutDuration()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 313
    invoke-direct {p0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->setupHideAnimationCallback()V

    .line 314
    invoke-direct {p0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->setupShowAnimationCallback()V

    .line 315
    return-void
.end method

.method protected abstract initView()Landroid/view/View;
.end method

.method public isShowing()Z
    .locals 1

    .prologue
    .line 300
    iget-boolean v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->_isShowing:Z

    return v0
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 76
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 77
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->_isShowing:Z

    .line 78
    return-void
.end method

.method public setToastOnTouchListener(Landroid/view/View$OnTouchListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/view/View$OnTouchListener;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;->touchListener:Landroid/view/View$OnTouchListener;

    .line 83
    return-void
.end method

.method public show(Landroid/os/Handler;)V
    .locals 1
    .param p1, "handler"    # Landroid/os/Handler;

    .prologue
    .line 88
    new-instance v0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$2;

    invoke-direct {v0, p0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$2;-><init>(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;)V

    .line 105
    .local v0, "show":Ljava/lang/Runnable;
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 106
    return-void
.end method

.method public abstract update(Ljava/lang/String;I)V
.end method
