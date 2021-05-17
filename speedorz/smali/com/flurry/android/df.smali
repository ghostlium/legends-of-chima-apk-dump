.class final Lcom/flurry/android/df;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field private synthetic fc:Lcom/flurry/android/cd;


# direct methods
.method constructor <init>(Lcom/flurry/android/cd;)V
    .locals 0

    .prologue
    .line 346
    iput-object p1, p0, Lcom/flurry/android/df;->fc:Lcom/flurry/android/cd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .prologue
    .line 349
    iget-object v0, p0, Lcom/flurry/android/df;->fc:Lcom/flurry/android/cd;

    iget-object v0, v0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->l(Lcom/flurry/android/eu;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/android/df;->fc:Lcom/flurry/android/cd;

    iget-object v0, v0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->m(Lcom/flurry/android/eu;)Landroid/webkit/WebChromeClient;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 352
    iget-object v0, p0, Lcom/flurry/android/df;->fc:Lcom/flurry/android/cd;

    iget-object v0, v0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->m(Lcom/flurry/android/eu;)Landroid/webkit/WebChromeClient;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebChromeClient;->onHideCustomView()V

    .line 354
    :cond_0
    return-void
.end method
