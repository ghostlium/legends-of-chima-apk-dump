.class final Lcom/flurry/android/dg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field private synthetic fc:Lcom/flurry/android/cd;


# direct methods
.method constructor <init>(Lcom/flurry/android/cd;)V
    .locals 0

    .prologue
    .line 336
    iput-object p1, p0, Lcom/flurry/android/dg;->fc:Lcom/flurry/android/cd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 1

    .prologue
    .line 339
    iget-object v0, p0, Lcom/flurry/android/dg;->fc:Lcom/flurry/android/cd;

    iget-object v0, v0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->p(Lcom/flurry/android/eu;)Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 341
    iget-object v0, p0, Lcom/flurry/android/dg;->fc:Lcom/flurry/android/cd;

    iget-object v0, v0, Lcom/flurry/android/cd;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->p(Lcom/flurry/android/eu;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->hide()V

    .line 343
    :cond_0
    return-void
.end method
