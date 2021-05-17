.class Lcom/flurry/sdk/g$a$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flurry/sdk/g$a;->onShowCustomView(Landroid/view/View;ILandroid/webkit/WebChromeClient$CustomViewCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/g$a;


# direct methods
.method constructor <init>(Lcom/flurry/sdk/g$a;)V
    .locals 0

    .prologue
    .line 420
    iput-object p1, p0, Lcom/flurry/sdk/g$a$3;->a:Lcom/flurry/sdk/g$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 3

    .prologue
    .line 423
    const/4 v0, 0x3

    iget-object v1, p0, Lcom/flurry/sdk/g$a$3;->a:Lcom/flurry/sdk/g$a;

    iget-object v1, v1, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "customViewFullScreenDialog.onDismiss()"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 424
    iget-object v0, p0, Lcom/flurry/sdk/g$a$3;->a:Lcom/flurry/sdk/g$a;

    iget-object v0, v0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->p(Lcom/flurry/sdk/g;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/g$a$3;->a:Lcom/flurry/sdk/g$a;

    iget-object v0, v0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->q(Lcom/flurry/sdk/g;)Landroid/webkit/WebChromeClient;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 426
    iget-object v0, p0, Lcom/flurry/sdk/g$a$3;->a:Lcom/flurry/sdk/g$a;

    iget-object v0, v0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->q(Lcom/flurry/sdk/g;)Landroid/webkit/WebChromeClient;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebChromeClient;->onHideCustomView()V

    .line 428
    :cond_0
    return-void
.end method
