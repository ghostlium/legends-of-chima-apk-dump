.class Lcom/amuzo/tech/legoid/LoginActivity$1;
.super Ljava/lang/Object;
.source "LoginActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amuzo/tech/legoid/LoginActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amuzo/tech/legoid/LoginActivity;

.field private final synthetic val$a:Landroid/app/Activity;


# direct methods
.method constructor <init>(Lcom/amuzo/tech/legoid/LoginActivity;Landroid/app/Activity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    iput-object p2, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->val$a:Landroid/app/Activity;

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/amuzo/tech/legoid/LoginActivity$1;)Lcom/amuzo/tech/legoid/LoginActivity;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/4 v7, -0x1

    const/4 v6, 0x1

    .line 72
    iget-object v3, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    new-instance v4, Landroid/widget/RelativeLayout;

    iget-object v5, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->val$a:Landroid/app/Activity;

    invoke-direct {v4, v5}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v4}, Lcom/amuzo/tech/legoid/LoginActivity;->access$0(Lcom/amuzo/tech/legoid/LoginActivity;Landroid/widget/RelativeLayout;)V

    .line 73
    iget-object v3, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    iget-object v4, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v4}, Lcom/amuzo/tech/legoid/LoginActivity;->access$1(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/widget/RelativeLayout;

    move-result-object v4

    new-instance v5, Landroid/view/ViewGroup$LayoutParams;

    .line 74
    invoke-direct {v5, v7, v7}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 73
    invoke-virtual {v3, v4, v5}, Lcom/amuzo/tech/legoid/LoginActivity;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 75
    iget-object v3, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v3}, Lcom/amuzo/tech/legoid/LoginActivity;->access$1(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/widget/RelativeLayout;

    move-result-object v3

    invoke-virtual {v3, v6}, Landroid/widget/RelativeLayout;->setFocusable(Z)V

    .line 76
    iget-object v3, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v3}, Lcom/amuzo/tech/legoid/LoginActivity;->access$1(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/widget/RelativeLayout;

    move-result-object v3

    invoke-virtual {v3, v6}, Landroid/widget/RelativeLayout;->setFocusableInTouchMode(Z)V

    .line 78
    const/4 v0, 0x1

    .line 80
    .local v0, "BACK_BUTTON_ID":I
    iget-object v3, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    new-instance v4, Landroid/widget/Button;

    iget-object v5, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->val$a:Landroid/app/Activity;

    invoke-direct {v4, v5}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v4}, Lcom/amuzo/tech/legoid/LoginActivity;->access$2(Lcom/amuzo/tech/legoid/LoginActivity;Landroid/widget/Button;)V

    .line 81
    iget-object v3, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v3}, Lcom/amuzo/tech/legoid/LoginActivity;->access$3(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/widget/Button;

    move-result-object v3

    const-string v4, "back"

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 82
    iget-object v3, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v3}, Lcom/amuzo/tech/legoid/LoginActivity;->access$3(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/widget/Button;

    move-result-object v3

    new-instance v4, Lcom/amuzo/tech/legoid/LoginActivity$1$1;

    iget-object v5, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->val$a:Landroid/app/Activity;

    invoke-direct {v4, p0, v5}, Lcom/amuzo/tech/legoid/LoginActivity$1$1;-><init>(Lcom/amuzo/tech/legoid/LoginActivity$1;Landroid/app/Activity;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 89
    iget-object v3, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v3}, Lcom/amuzo/tech/legoid/LoginActivity;->access$3(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/widget/Button;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/widget/Button;->setId(I)V

    .line 90
    iget-object v3, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v3}, Lcom/amuzo/tech/legoid/LoginActivity;->access$3(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/widget/Button;

    move-result-object v3

    new-instance v4, Landroid/view/ViewGroup$LayoutParams;

    .line 91
    const/4 v5, -0x2

    invoke-direct {v4, v7, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 90
    invoke-virtual {v3, v4}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 93
    iget-object v3, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v3}, Lcom/amuzo/tech/legoid/LoginActivity;->access$1(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/widget/RelativeLayout;

    move-result-object v3

    iget-object v4, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v4}, Lcom/amuzo/tech/legoid/LoginActivity;->access$3(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/widget/Button;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 95
    iget-object v3, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {}, Lcom/amuzo/tech/legoid/CookieJar;->getInstance()Lcom/amuzo/tech/legoid/CookieJar;

    move-result-object v4

    iget-object v5, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->val$a:Landroid/app/Activity;

    invoke-virtual {v4, v5}, Lcom/amuzo/tech/legoid/CookieJar;->createWebView(Landroid/content/Context;)Landroid/webkit/WebView;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/amuzo/tech/legoid/LoginActivity;->access$4(Lcom/amuzo/tech/legoid/LoginActivity;Landroid/webkit/WebView;)V

    .line 96
    iget-object v3, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v3}, Lcom/amuzo/tech/legoid/LoginActivity;->access$5(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/webkit/WebView;

    move-result-object v3

    invoke-virtual {v3}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v2

    .line 98
    .local v2, "webSettings":Landroid/webkit/WebSettings;
    iget-object v3, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v3}, Lcom/amuzo/tech/legoid/LoginActivity;->access$5(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/webkit/WebView;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 99
    iget-object v3, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v3}, Lcom/amuzo/tech/legoid/LoginActivity;->access$5(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/webkit/WebView;

    move-result-object v3

    invoke-virtual {v3, v6}, Landroid/webkit/WebView;->setInitialScale(I)V

    .line 100
    invoke-virtual {v2, v6}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 101
    invoke-virtual {v2, v6}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 102
    invoke-virtual {v2, v6}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 103
    invoke-virtual {v2, v6}, Landroid/webkit/WebSettings;->setLightTouchEnabled(Z)V

    .line 104
    iget-object v3, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v3}, Lcom/amuzo/tech/legoid/LoginActivity;->access$5(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/webkit/WebView;

    move-result-object v3

    const/high16 v4, 0x2000000

    invoke-virtual {v3, v4}, Landroid/webkit/WebView;->setScrollBarStyle(I)V

    .line 106
    iget-object v3, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v3}, Lcom/amuzo/tech/legoid/LoginActivity;->access$5(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/webkit/WebView;

    move-result-object v3

    new-instance v4, Landroid/view/ViewGroup$LayoutParams;

    .line 107
    invoke-direct {v4, v7, v7}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 106
    invoke-virtual {v3, v4}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 109
    iget-object v3, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v3}, Lcom/amuzo/tech/legoid/LoginActivity;->access$1(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/widget/RelativeLayout;

    move-result-object v3

    iget-object v4, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v4}, Lcom/amuzo/tech/legoid/LoginActivity;->access$5(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/webkit/WebView;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 111
    iget-object v3, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v3}, Lcom/amuzo/tech/legoid/LoginActivity;->access$5(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/webkit/WebView;

    move-result-object v3

    .line 112
    invoke-virtual {v3}, Landroid/webkit/WebView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 111
    check-cast v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 113
    .local v1, "webLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/4 v3, 0x3

    invoke-virtual {v1, v3, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 115
    iget-object v3, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v3}, Lcom/amuzo/tech/legoid/LoginActivity;->access$5(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/webkit/WebView;

    move-result-object v3

    new-instance v4, Landroid/webkit/WebChromeClient;

    invoke-direct {v4}, Landroid/webkit/WebChromeClient;-><init>()V

    invoke-virtual {v3, v4}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 117
    iget-object v3, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v3}, Lcom/amuzo/tech/legoid/LoginActivity;->access$5(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/webkit/WebView;

    move-result-object v3

    new-instance v4, Lcom/amuzo/tech/legoid/LoginActivity$1$2;

    iget-object v5, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->val$a:Landroid/app/Activity;

    invoke-direct {v4, p0, v5}, Lcom/amuzo/tech/legoid/LoginActivity$1$2;-><init>(Lcom/amuzo/tech/legoid/LoginActivity$1;Landroid/app/Activity;)V

    invoke-virtual {v3, v4}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 162
    iget-object v3, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v3}, Lcom/amuzo/tech/legoid/LoginActivity;->access$1(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/widget/RelativeLayout;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/RelativeLayout;->requestFocus()Z

    .line 163
    iget-object v3, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v3}, Lcom/amuzo/tech/legoid/LoginActivity;->access$5(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/webkit/WebView;

    move-result-object v3

    invoke-virtual {v3, v6}, Landroid/webkit/WebView;->setFocusable(Z)V

    .line 164
    iget-object v3, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v3}, Lcom/amuzo/tech/legoid/LoginActivity;->access$5(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/webkit/WebView;

    move-result-object v3

    invoke-virtual {v3, v6}, Landroid/webkit/WebView;->setFocusableInTouchMode(Z)V

    .line 165
    iget-object v3, p0, Lcom/amuzo/tech/legoid/LoginActivity$1;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v3}, Lcom/amuzo/tech/legoid/LoginActivity;->access$5(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/webkit/WebView;

    move-result-object v3

    const/16 v4, 0xa3

    invoke-virtual {v3, v4}, Landroid/webkit/WebView;->requestFocus(I)Z

    .line 167
    return-void
.end method
