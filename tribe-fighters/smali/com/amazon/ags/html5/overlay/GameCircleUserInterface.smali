.class public Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;
.super Landroid/app/Activity;
.source "GameCircleUserInterface.java"

# interfaces
.implements Lcom/amazon/ags/html5/javascript/domain/CloseOverlayListener;


# static fields
.field private static final TAG:Ljava/lang/String;


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

    const-class v1, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    sget-object v0, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private getStatusBarHeight()I
    .locals 6

    .prologue
    .line 195
    const/4 v1, 0x0

    .line 196
    .local v1, "result":I
    invoke-virtual {p0}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "status_bar_height"

    const-string v4, "dimen"

    const-string v5, "android"

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 197
    .local v0, "resourceId":I
    if-lez v0, :cond_0

    .line 198
    invoke-virtual {p0}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 200
    :cond_0
    return v1
.end method

.method private setViewWithSize(Landroid/view/View;)V
    .locals 19
    .param p1, "webView"    # Landroid/view/View;

    .prologue
    .line 139
    invoke-direct/range {p0 .. p0}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->getStatusBarHeight()I

    move-result v17

    .line 141
    .local v17, "statusBarHeight":I
    const-string v3, "window"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/WindowManager;

    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v8

    .line 142
    .local v8, "display":Landroid/view/Display;
    new-instance v16, Landroid/graphics/Point;

    invoke-virtual {v8}, Landroid/view/Display;->getWidth()I

    move-result v3

    invoke-virtual {v8}, Landroid/view/Display;->getHeight()I

    move-result v4

    move-object/from16 v0, v16

    invoke-direct {v0, v3, v4}, Landroid/graphics/Point;-><init>(II)V

    .line 144
    .local v16, "size":Landroid/graphics/Point;
    invoke-virtual/range {p0 .. p0}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    .line 145
    .local v14, "res":Landroid/content/res/Resources;
    invoke-virtual {v14}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    iget v3, v3, Landroid/content/res/Configuration;->screenLayout:I

    and-int/lit8 v15, v3, 0xf

    .line 146
    .local v15, "screenSize":I
    const/4 v3, 0x3

    if-eq v15, v3, :cond_0

    const/4 v3, 0x4

    if-ne v15, v3, :cond_2

    .line 150
    :cond_0
    move-object/from16 v0, v16

    iget v3, v0, Landroid/graphics/Point;->x:I

    move-object/from16 v0, v16

    iget v4, v0, Landroid/graphics/Point;->y:I

    if-le v3, v4, :cond_1

    .line 152
    const/high16 v18, 0x3f000000    # 0.5f

    .line 153
    .local v18, "wScale":F
    const v9, 0x3f4ccccd    # 0.8f

    .line 160
    .local v9, "hScale":F
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "modal_overlay_container"

    invoke-static {v3, v4}, Lcom/amazon/ags/html5/util/ResourceUtils;->getLayoutId(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->setContentView(I)V

    .line 161
    invoke-virtual/range {p0 .. p0}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "id"

    const-string v5, "modal_overlay_container"

    invoke-static {v3, v4, v5}, Lcom/amazon/ags/html5/util/ResourceUtils;->getIdentifier(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/LinearLayout;

    .line 162
    .local v7, "container":Landroid/widget/LinearLayout;
    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 164
    move-object/from16 v0, v16

    iget v3, v0, Landroid/graphics/Point;->x:I

    int-to-float v3, v3

    mul-float v3, v3, v18

    float-to-int v3, v3

    move-object/from16 v0, v16

    iget v4, v0, Landroid/graphics/Point;->y:I

    int-to-float v4, v4

    mul-float/2addr v4, v9

    float-to-int v4, v4

    move-object/from16 v0, v16

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Point;->set(II)V

    .line 182
    .end local v7    # "container":Landroid/widget/LinearLayout;
    .end local v9    # "hScale":F
    .end local v18    # "wScale":F
    :goto_1
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v11

    .line 183
    .local v11, "params":Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual/range {p0 .. p0}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->getBaseContext()Landroid/content/Context;

    move-result-object v4

    const-string v5, "gc_overlay_spinner"

    invoke-static {v4, v5}, Lcom/amazon/ags/html5/util/ResourceUtils;->getDrawableId(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/AnimationDrawable;

    .line 185
    .local v2, "spinner":Landroid/graphics/drawable/AnimationDrawable;
    new-instance v1, Landroid/graphics/drawable/InsetDrawable;

    move-object/from16 v0, v16

    iget v3, v0, Landroid/graphics/Point;->x:I

    add-int/lit8 v3, v3, -0x20

    div-int/lit8 v3, v3, 0x2

    move-object/from16 v0, v16

    iget v4, v0, Landroid/graphics/Point;->y:I

    add-int/lit8 v4, v4, -0x20

    div-int/lit8 v4, v4, 0x2

    move-object/from16 v0, v16

    iget v5, v0, Landroid/graphics/Point;->x:I

    add-int/lit8 v5, v5, -0x20

    div-int/lit8 v5, v5, 0x2

    move-object/from16 v0, v16

    iget v6, v0, Landroid/graphics/Point;->y:I

    add-int/lit8 v6, v6, -0x20

    div-int/lit8 v6, v6, 0x2

    invoke-direct/range {v1 .. v6}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;IIII)V

    .line 186
    .local v1, "background":Landroid/graphics/drawable/InsetDrawable;
    const/4 v3, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 187
    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 188
    invoke-virtual {v2}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 189
    move-object/from16 v0, v16

    iget v3, v0, Landroid/graphics/Point;->x:I

    iput v3, v11, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 190
    move-object/from16 v0, v16

    iget v3, v0, Landroid/graphics/Point;->y:I

    iput v3, v11, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 191
    sget-object v3, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "View size set to width: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v11, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " height: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v11, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    return-void

    .line 156
    .end local v1    # "background":Landroid/graphics/drawable/InsetDrawable;
    .end local v2    # "spinner":Landroid/graphics/drawable/AnimationDrawable;
    .end local v11    # "params":Landroid/view/ViewGroup$LayoutParams;
    :cond_1
    const v18, 0x3f4ccccd    # 0.8f

    .line 157
    .restart local v18    # "wScale":F
    const v9, 0x3f333333    # 0.7f

    .restart local v9    # "hScale":F
    goto/16 :goto_0

    .line 168
    .end local v9    # "hScale":F
    .end local v18    # "wScale":F
    :cond_2
    new-instance v13, Landroid/widget/RelativeLayout;

    invoke-virtual/range {p0 .. p0}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v13, v3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 170
    .local v13, "relativeLayout":Landroid/widget/RelativeLayout;
    new-instance v10, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x1

    invoke-direct {v10, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 171
    .local v10, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v3, 0xc

    const/4 v4, 0x1

    invoke-virtual {v10, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 172
    move-object/from16 v0, p1

    invoke-virtual {v13, v0, v10}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 173
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->setContentView(Landroid/view/View;)V

    .line 175
    move-object/from16 v0, v16

    iget v3, v0, Landroid/graphics/Point;->x:I

    move-object/from16 v0, v16

    iget v4, v0, Landroid/graphics/Point;->y:I

    sub-int v4, v4, v17

    move-object/from16 v0, v16

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Point;->set(II)V

    .line 177
    invoke-virtual {v13}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    .line 178
    .local v12, "rLayoutParams":Landroid/view/ViewGroup$LayoutParams;
    move-object/from16 v0, v16

    iget v3, v0, Landroid/graphics/Point;->x:I

    iput v3, v12, Landroid/view/ViewGroup$LayoutParams;->width:I

    goto/16 :goto_1
.end method


# virtual methods
.method public closeOverlay()V
    .locals 0

    .prologue
    .line 204
    invoke-virtual {p0}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->finish()V

    .line 205
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 42
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 45
    :try_start_0
    invoke-static {}, Lcom/amazon/ags/html5/factory/ServiceFactory;->getInstance()Lcom/amazon/ags/html5/factory/ServiceFactory;

    move-result-object v4

    .line 47
    .local v4, "serviceFactory":Lcom/amazon/ags/html5/factory/ServiceFactory;
    invoke-virtual {v4}, Lcom/amazon/ags/html5/factory/ServiceFactory;->getWebViewFactory()Lcom/amazon/ags/html5/util/WebViewFactory;

    move-result-object v6

    invoke-virtual {v6, p0}, Lcom/amazon/ags/html5/util/WebViewFactory;->newOverlayWebView(Landroid/app/Activity;)Landroid/webkit/WebView;

    move-result-object v5

    .line 48
    .local v5, "webView":Landroid/webkit/WebView;
    invoke-virtual {v5}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v6

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 49
    invoke-virtual {v5}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v6

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 50
    invoke-virtual {v5}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    .line 51
    invoke-virtual {v5}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 53
    const-string v6, "overlaywebview"

    invoke-virtual {v4, v5, v6}, Lcom/amazon/ags/html5/factory/ServiceFactory;->getJavascriptInterface(Landroid/webkit/WebView;Ljava/lang/String;)Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    move-result-object v2

    .line 54
    .local v2, "javascriptInterface":Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;
    invoke-virtual {v2, p0}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->addCloseOverlayListener(Lcom/amazon/ags/html5/javascript/domain/CloseOverlayListener;)V

    .line 56
    const-string v6, "hostinterface"

    invoke-virtual {v5, v2, v6}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 58
    invoke-virtual {v4}, Lcom/amazon/ags/html5/factory/ServiceFactory;->getJavascriptRepository()Lcom/amazon/ags/html5/javascript/JavascriptRepository;

    move-result-object v3

    .line 59
    .local v3, "javascriptRepository":Lcom/amazon/ags/html5/javascript/JavascriptRepository;
    new-instance v6, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;

    invoke-direct {v6, p0, v4, v5}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;-><init>(Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;Lcom/amazon/ags/html5/factory/ServiceFactory;Landroid/webkit/WebView;)V

    invoke-virtual {v2, v6}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->addMessageHandlerReadyListener(Lcom/amazon/ags/html5/javascript/domain/MessageHandlerReadyListener;)V

    .line 119
    invoke-interface {v3, v5}, Lcom/amazon/ags/html5/javascript/JavascriptRepository;->loadOverlayJavascript(Landroid/webkit/WebView;)V

    .line 121
    invoke-direct {p0, v5}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->setViewWithSize(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessError; {:try_start_0 .. :try_end_0} :catch_1

    .line 129
    .end local v2    # "javascriptInterface":Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;
    .end local v3    # "javascriptRepository":Lcom/amazon/ags/html5/javascript/JavascriptRepository;
    .end local v4    # "serviceFactory":Lcom/amazon/ags/html5/factory/ServiceFactory;
    .end local v5    # "webView":Landroid/webkit/WebView;
    :goto_0
    return-void

    .line 122
    :catch_0
    move-exception v0

    .line 123
    .local v0, "e":Ljava/lang/Exception;
    sget-object v6, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->TAG:Ljava/lang/String;

    const-string v7, "Unexpected error occurred while displaying overlay.  Overlay will close."

    invoke-static {v6, v7, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 124
    invoke-virtual {p0}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->finish()V

    goto :goto_0

    .line 125
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v1

    .line 126
    .local v1, "iae":Ljava/lang/IllegalAccessError;
    sget-object v6, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->TAG:Ljava/lang/String;

    const-string v7, "ServiceFactory isn\'t ready.  Overlay will close."

    invoke-static {v6, v7, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 127
    invoke-virtual {p0}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->finish()V

    goto :goto_0
.end method
