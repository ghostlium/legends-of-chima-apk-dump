.class Lcom/tapjoy/TJAdUnitView$2$1;
.super Ljava/lang/Object;
.source "TJAdUnitView.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tapjoy/TJAdUnitView$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tapjoy/TJAdUnitView$2;


# direct methods
.method constructor <init>(Lcom/tapjoy/TJAdUnitView$2;)V
    .locals 0

    .prologue
    .line 300
    iput-object p1, p0, Lcom/tapjoy/TJAdUnitView$2$1;->this$1:Lcom/tapjoy/TJAdUnitView$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0
    .param p1, "arg0"    # Landroid/animation/Animator;

    .prologue
    .line 302
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "arg0"    # Landroid/animation/Animator;

    .prologue
    .line 309
    iget-object v0, p0, Lcom/tapjoy/TJAdUnitView$2$1;->this$1:Lcom/tapjoy/TJAdUnitView$2;

    iget-object v0, v0, Lcom/tapjoy/TJAdUnitView$2;->val$closeButton:Landroid/widget/ImageButton;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setClickable(Z)V

    .line 310
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0
    .param p1, "arg0"    # Landroid/animation/Animator;

    .prologue
    .line 304
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0
    .param p1, "arg0"    # Landroid/animation/Animator;

    .prologue
    .line 306
    return-void
.end method
