.class Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;
.super Landroid/app/Dialog;
.source "MAPAuthzDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;,
        Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$MAPAuthzWebViewClient;
    }
.end annotation


# static fields
.field private static final AT_MAIN_COOKIE_NAME:Ljava/lang/String; = "at-main"

.field private static final DEFAULT_THEME:I = 0x1030007

.field private static final LOG_TAG:Ljava/lang/String;

.field private static final LOG_TAG_CLIENT:Ljava/lang/String;

.field private static final REDIRECT_SCHEME:Ljava/lang/String; = "amzn://"

.field private static final US_DOMAIN:Ljava/lang/String; = ".amazon.com"


# instance fields
.field private final authorizationListener:Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

.field private isDetachedFromWindow:Z

.field private mAuthzDialogViewContainer:Landroid/widget/RelativeLayout;

.field private mProgressBar:Landroid/widget/ProgressBar;

.field private mProgressBarContainer:Landroid/widget/RelativeLayout;

.field private final mRequestId:Ljava/util/UUID;

.field private final mRequestedScopes:[Ljava/lang/String;

.field private mShowProgressBar:Z

.field private final mUrl:Ljava/lang/String;

.field private mWebView:Landroid/webkit/WebView;

.field private mWebViewContainer:Landroid/widget/LinearLayout;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 42
    const-class v0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->LOG_TAG:Ljava/lang/String;

    .line 172
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-class v1, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".Client"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->LOG_TAG_CLIENT:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;Ljava/util/UUID;[Ljava/lang/String;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;
    .param p4, "requestId"    # Ljava/util/UUID;
    .param p5, "scopes"    # [Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 66
    const v0, 0x1030007

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 59
    iput-boolean v1, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->isDetachedFromWindow:Z

    .line 60
    iput-boolean v1, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mShowProgressBar:Z

    .line 67
    iput-object p3, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->authorizationListener:Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    .line 68
    iput-object p2, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mUrl:Ljava/lang/String;

    .line 69
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Starting MAP Authz Dialog"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "url="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mUrl:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    iput-object p4, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mRequestId:Ljava/util/UUID;

    .line 71
    iput-object p5, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mRequestedScopes:[Ljava/lang/String;

    .line 72
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 40
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->LOG_TAG_CLIENT:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;)Z
    .locals 1
    .param p0, "x0"    # Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;

    .prologue
    .line 40
    iget-boolean v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->isDetachedFromWindow:Z

    return v0
.end method

.method static synthetic access$200(Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;
    .param p1, "x1"    # Z

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->showProgressBar(Z)V

    return-void
.end method

.method static synthetic access$300()Ljava/lang/String;
    .locals 1

    .prologue
    .line 40
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->LOG_TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;)Ljava/util/UUID;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mRequestId:Ljava/util/UUID;

    return-object v0
.end method

.method static synthetic access$500(Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;)[Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mRequestedScopes:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;)Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->authorizationListener:Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    return-object v0
.end method

.method private setUpWebView()V
    .locals 13
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetJavaScriptEnabled"
        }
    .end annotation

    .prologue
    const/4 v12, 0x1

    const v11, 0x3f19999a    # 0.6f

    const/4 v10, 0x0

    const/4 v9, -0x1

    .line 92
    sget-object v7, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->LOG_TAG:Ljava/lang/String;

    const-string v8, "Setting up webview"

    invoke-static {v7, v8}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    new-instance v7, Landroid/widget/RelativeLayout;

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v7, v8}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mAuthzDialogViewContainer:Landroid/widget/RelativeLayout;

    .line 98
    new-instance v7, Landroid/widget/RelativeLayout;

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v7, v8}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mProgressBarContainer:Landroid/widget/RelativeLayout;

    .line 102
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    iget v3, v7, Landroid/util/DisplayMetrics;->density:F

    .line 104
    .local v3, "pixelDensity":F
    const/16 v1, 0x1e

    .line 106
    .local v1, "dpHeight":I
    int-to-float v7, v1

    mul-float/2addr v7, v3

    float-to-int v4, v7

    .line 108
    .local v4, "pixelHeight":I
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v9, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 109
    .local v2, "myParams":Landroid/widget/RelativeLayout$LayoutParams;
    iget-object v7, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mProgressBarContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v7, v2}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 110
    iget-object v7, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mProgressBarContainer:Landroid/widget/RelativeLayout;

    const/16 v8, 0x8

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 113
    new-instance v5, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v7, 0xc8

    const/4 v8, -0x2

    invoke-direct {v5, v7, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 114
    .local v5, "progressBarParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v7, 0xd

    invoke-virtual {v5, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 115
    iget-object v7, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v7, v5}, Landroid/widget/ProgressBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 116
    iget-object v7, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mProgressBarContainer:Landroid/widget/RelativeLayout;

    iget-object v8, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 119
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    invoke-direct {v0, v11, v11}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 120
    .local v0, "alphaUp":Landroid/view/animation/AlphaAnimation;
    invoke-virtual {v0, v12}, Landroid/view/animation/AlphaAnimation;->setFillAfter(Z)V

    .line 121
    iget-object v7, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v7, v0}, Landroid/widget/ProgressBar;->startAnimation(Landroid/view/animation/Animation;)V

    .line 124
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v7, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mWebViewContainer:Landroid/widget/LinearLayout;

    .line 125
    new-instance v6, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v6, v9, v9}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 126
    .local v6, "webViewParams":Landroid/view/ViewGroup$LayoutParams;
    iget-object v7, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mWebViewContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v6}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 129
    new-instance v7, Landroid/webkit/WebView;

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v7, v8}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mWebView:Landroid/webkit/WebView;

    .line 130
    iget-object v7, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v7, v10}, Landroid/webkit/WebView;->setVerticalScrollBarEnabled(Z)V

    .line 131
    iget-object v7, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v7, v10}, Landroid/webkit/WebView;->setHorizontalScrollBarEnabled(Z)V

    .line 132
    iget-object v7, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mWebView:Landroid/webkit/WebView;

    new-instance v8, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$MAPAuthzWebViewClient;

    invoke-direct {v8, p0}, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$MAPAuthzWebViewClient;-><init>(Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;)V

    invoke-virtual {v7, v8}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 133
    iget-object v7, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v7}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v7

    invoke-virtual {v7, v12}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 134
    iget-object v7, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mWebView:Landroid/webkit/WebView;

    iget-object v8, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mUrl:Ljava/lang/String;

    invoke-virtual {v7, v8}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 135
    iget-object v7, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mWebView:Landroid/webkit/WebView;

    new-instance v8, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v8, v9, v9}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v8}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 137
    iget-object v7, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v7, v10}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 138
    iget-object v7, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v7}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v7

    invoke-virtual {v7, v10}, Landroid/webkit/WebSettings;->setSavePassword(Z)V

    .line 139
    iget-object v7, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mWebViewContainer:Landroid/widget/LinearLayout;

    iget-object v8, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 143
    iget-object v7, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mAuthzDialogViewContainer:Landroid/widget/RelativeLayout;

    iget-object v8, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mWebViewContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 144
    iget-object v7, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mAuthzDialogViewContainer:Landroid/widget/RelativeLayout;

    iget-object v8, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mProgressBarContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 145
    iget-object v7, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mAuthzDialogViewContainer:Landroid/widget/RelativeLayout;

    new-instance v8, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v8, v9, v9}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v7, v8}, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 146
    return-void
.end method

.method private showProgressBar(Z)V
    .locals 2
    .param p1, "showProgressBar"    # Z

    .prologue
    .line 352
    iget-boolean v1, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mShowProgressBar:Z

    if-eq v1, p1, :cond_0

    .line 353
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;

    iget-object v1, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mProgressBarContainer:Landroid/widget/RelativeLayout;

    invoke-direct {v0, p0, v1, p1}, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;-><init>(Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;Landroid/view/View;Z)V

    .line 354
    .local v0, "peekingViewAnimation":Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;
    iget-object v1, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mAuthzDialogViewContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v0}, Landroid/widget/RelativeLayout;->startAnimation(Landroid/view/animation/Animation;)V

    .line 355
    iput-boolean p1, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mShowProgressBar:Z

    .line 357
    .end local v0    # "peekingViewAnimation":Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;
    :cond_0
    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mWebView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 153
    :cond_0
    iget-boolean v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->isDetachedFromWindow:Z

    if-nez v0, :cond_1

    .line 155
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->showProgressBar(Z)V

    .line 156
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 158
    :cond_1
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 1

    .prologue
    .line 168
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->isDetachedFromWindow:Z

    .line 169
    invoke-super {p0}, Landroid/app/Dialog;->onAttachedToWindow()V

    .line 170
    return-void
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 335
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Spinner in webview cancelled"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 337
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mWebView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-nez v0, :cond_1

    .line 339
    :cond_0
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Dismissing Dialog"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 340
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->authorizationListener:Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mRequestedScopes:[Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/amazon/identity/auth/device/service/MAPServiceResult;->getOnCancelBundle(I[Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;->onCancel(Landroid/os/Bundle;)V

    .line 341
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->dismiss()V

    .line 349
    :goto_0
    return-void

    .line 346
    :cond_1
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    .line 347
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Stop Loading"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x1

    .line 77
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 78
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->LOG_TAG:Ljava/lang/String;

    const-string v1, "OnCreate Oauth Dialog"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    new-instance v0, Landroid/widget/ProgressBar;

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    const v3, 0x1010078

    invoke-direct {v0, v1, v2, v3}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mProgressBar:Landroid/widget/ProgressBar;

    .line 81
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v4}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 82
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/16 v1, 0x96

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 84
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 85
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->LOG_TAG:Ljava/lang/String;

    const-string v1, "ONCreate MAP Authz Dialog"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    invoke-virtual {p0, v4}, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->requestWindowFeature(I)Z

    .line 87
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->setUpWebView()V

    .line 88
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 162
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->isDetachedFromWindow:Z

    .line 163
    invoke-super {p0}, Landroid/app/Dialog;->onDetachedFromWindow()V

    .line 164
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v2, 0x0

    .line 300
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->LOG_TAG:Ljava/lang/String;

    const-string v1, "OnKeyDown"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 301
    const/4 v0, 0x4

    if-ne p1, v0, :cond_2

    .line 303
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->LOG_TAG:Ljava/lang/String;

    const-string v1, "KeyEvent.KEYCODE_BACK"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 307
    iget-boolean v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->isDetachedFromWindow:Z

    if-nez v0, :cond_0

    .line 308
    invoke-direct {p0, v2}, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->showProgressBar(Z)V

    .line 310
    :cond_0
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mWebView:Landroid/webkit/WebView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 312
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Going back in webview"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 313
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    .line 314
    const/4 v0, 0x1

    .line 323
    :goto_0
    return v0

    .line 318
    :cond_1
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->LOG_TAG:Ljava/lang/String;

    const-string v1, "onKeyDown Dismissing webview"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 319
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->authorizationListener:Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    iget-object v1, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->mRequestedScopes:[Ljava/lang/String;

    invoke-static {v2, v1}, Lcom/amazon/identity/auth/device/service/MAPServiceResult;->getOnCancelBundle(I[Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;->onCancel(Landroid/os/Bundle;)V

    .line 320
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;->dismiss()V

    .line 323
    :cond_2
    invoke-super {p0, p1, p2}, Landroid/app/Dialog;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method
