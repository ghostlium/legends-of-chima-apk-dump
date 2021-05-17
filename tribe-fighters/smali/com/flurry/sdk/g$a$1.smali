.class Lcom/flurry/sdk/g$a$1;
.super Landroid/app/Dialog;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flurry/sdk/g$a;->onShowCustomView(Landroid/view/View;ILandroid/webkit/WebChromeClient$CustomViewCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/app/Activity;

.field final synthetic b:Lcom/flurry/sdk/g$a;


# direct methods
.method constructor <init>(Lcom/flurry/sdk/g$a;Landroid/content/Context;ILandroid/app/Activity;)V
    .locals 0

    .prologue
    .line 394
    iput-object p1, p0, Lcom/flurry/sdk/g$a$1;->b:Lcom/flurry/sdk/g$a;

    iput-object p4, p0, Lcom/flurry/sdk/g$a$1;->a:Landroid/app/Activity;

    invoke-direct {p0, p2, p3}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .prologue
    .line 398
    iget-object v0, p0, Lcom/flurry/sdk/g$a$1;->a:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public dispatchTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .prologue
    .line 404
    iget-object v0, p0, Lcom/flurry/sdk/g$a$1;->a:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->dispatchTrackballEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method
