.class final Lcom/flurry/android/bc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field private synthetic de:Lcom/flurry/android/eu;


# direct methods
.method constructor <init>(Lcom/flurry/android/eu;)V
    .locals 0

    .prologue
    .line 1047
    iput-object p1, p0, Lcom/flurry/android/bc;->de:Lcom/flurry/android/eu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 2

    .prologue
    .line 1050
    iget-object v0, p0, Lcom/flurry/android/bc;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->b(Lcom/flurry/android/eu;)Landroid/webkit/WebView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1053
    iget-object v0, p0, Lcom/flurry/android/bc;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->b(Lcom/flurry/android/eu;)Landroid/webkit/WebView;

    move-result-object v0

    const-string v1, "javascript:if(window.mraid){window.mraid.close();};"

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 1055
    :cond_0
    return-void
.end method
