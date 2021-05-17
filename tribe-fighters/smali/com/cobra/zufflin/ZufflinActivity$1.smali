.class Lcom/cobra/zufflin/ZufflinActivity$1;
.super Ljava/lang/Object;
.source "ZufflinActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/ZufflinActivity;->showWebViewFromURL(IIIIIIIILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cobra/zufflin/ZufflinActivity;

.field private final synthetic val$a:I

.field private final synthetic val$b:I

.field private final synthetic val$g:I

.field private final synthetic val$h:I

.field private final synthetic val$r:I

.field private final synthetic val$url:Ljava/lang/String;

.field private final synthetic val$w:I

.field private final synthetic val$x:I

.field private final synthetic val$y:I


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/ZufflinActivity;IIIIIIIILjava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/ZufflinActivity$1;->this$0:Lcom/cobra/zufflin/ZufflinActivity;

    iput p2, p0, Lcom/cobra/zufflin/ZufflinActivity$1;->val$x:I

    iput p3, p0, Lcom/cobra/zufflin/ZufflinActivity$1;->val$y:I

    iput p4, p0, Lcom/cobra/zufflin/ZufflinActivity$1;->val$w:I

    iput p5, p0, Lcom/cobra/zufflin/ZufflinActivity$1;->val$h:I

    iput p6, p0, Lcom/cobra/zufflin/ZufflinActivity$1;->val$r:I

    iput p7, p0, Lcom/cobra/zufflin/ZufflinActivity$1;->val$g:I

    iput p8, p0, Lcom/cobra/zufflin/ZufflinActivity$1;->val$b:I

    iput p9, p0, Lcom/cobra/zufflin/ZufflinActivity$1;->val$a:I

    iput-object p10, p0, Lcom/cobra/zufflin/ZufflinActivity$1;->val$url:Ljava/lang/String;

    .line 424
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    .line 425
    iget-object v0, p0, Lcom/cobra/zufflin/ZufflinActivity$1;->this$0:Lcom/cobra/zufflin/ZufflinActivity;

    iget v1, p0, Lcom/cobra/zufflin/ZufflinActivity$1;->val$x:I

    iget v2, p0, Lcom/cobra/zufflin/ZufflinActivity$1;->val$y:I

    iget v3, p0, Lcom/cobra/zufflin/ZufflinActivity$1;->val$w:I

    iget v4, p0, Lcom/cobra/zufflin/ZufflinActivity$1;->val$h:I

    iget v5, p0, Lcom/cobra/zufflin/ZufflinActivity$1;->val$r:I

    iget v6, p0, Lcom/cobra/zufflin/ZufflinActivity$1;->val$g:I

    iget v7, p0, Lcom/cobra/zufflin/ZufflinActivity$1;->val$b:I

    iget v8, p0, Lcom/cobra/zufflin/ZufflinActivity$1;->val$a:I

    invoke-virtual/range {v0 .. v8}, Lcom/cobra/zufflin/ZufflinActivity;->showWebView(IIIIIIII)V

    .line 426
    sget-object v0, Lcom/cobra/zufflin/ZufflinActivity;->mWebView:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/cobra/zufflin/ZufflinActivity$1;->val$url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 427
    return-void
.end method
