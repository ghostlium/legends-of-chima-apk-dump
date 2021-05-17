.class Lcom/flurry/sdk/g$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flurry/sdk/g;->a(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/g;


# direct methods
.method constructor <init>(Lcom/flurry/sdk/g;)V
    .locals 0

    .prologue
    .line 1365
    iput-object p1, p0, Lcom/flurry/sdk/g$4;->a:Lcom/flurry/sdk/g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 3

    .prologue
    .line 1368
    const/4 v0, 0x3

    iget-object v1, p0, Lcom/flurry/sdk/g$4;->a:Lcom/flurry/sdk/g;

    invoke-static {v1}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/g;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "extendedWebViewDialog.onDismiss()"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 1369
    iget-object v0, p0, Lcom/flurry/sdk/g$4;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->b(Lcom/flurry/sdk/g;)Landroid/webkit/WebView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1371
    iget-object v0, p0, Lcom/flurry/sdk/g$4;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->b(Lcom/flurry/sdk/g;)Landroid/webkit/WebView;

    move-result-object v0

    const-string v1, "javascript:if(window.mraid){window.mraid.close();};"

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 1373
    :cond_0
    return-void
.end method
