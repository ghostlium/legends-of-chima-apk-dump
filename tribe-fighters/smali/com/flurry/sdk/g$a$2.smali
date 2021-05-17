.class Lcom/flurry/sdk/g$a$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


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
    .line 410
    iput-object p1, p0, Lcom/flurry/sdk/g$a$2;->a:Lcom/flurry/sdk/g$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onShow(Landroid/content/DialogInterface;)V
    .locals 1

    .prologue
    .line 413
    iget-object v0, p0, Lcom/flurry/sdk/g$a$2;->a:Lcom/flurry/sdk/g$a;

    iget-object v0, v0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->t(Lcom/flurry/sdk/g;)Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 415
    iget-object v0, p0, Lcom/flurry/sdk/g$a$2;->a:Lcom/flurry/sdk/g$a;

    iget-object v0, v0, Lcom/flurry/sdk/g$a;->a:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->t(Lcom/flurry/sdk/g;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->hide()V

    .line 417
    :cond_0
    return-void
.end method
