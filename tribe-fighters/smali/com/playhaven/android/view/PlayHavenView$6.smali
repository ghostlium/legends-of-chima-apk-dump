.class Lcom/playhaven/android/view/PlayHavenView$6;
.super Ljava/lang/Object;
.source "PlayHavenView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/playhaven/android/view/PlayHavenView;->contentLoaded(Lcom/playhaven/android/Placement;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/playhaven/android/view/PlayHavenView;

.field private final synthetic val$placement:Lcom/playhaven/android/Placement;


# direct methods
.method constructor <init>(Lcom/playhaven/android/view/PlayHavenView;Lcom/playhaven/android/Placement;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/playhaven/android/view/PlayHavenView$6;->this$0:Lcom/playhaven/android/view/PlayHavenView;

    iput-object p2, p0, Lcom/playhaven/android/view/PlayHavenView$6;->val$placement:Lcom/playhaven/android/Placement;

    .line 582
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v3, 0x2

    .line 587
    iget-object v0, p0, Lcom/playhaven/android/view/PlayHavenView$6;->this$0:Lcom/playhaven/android/view/PlayHavenView;

    invoke-virtual {v0}, Lcom/playhaven/android/view/PlayHavenView;->setFrame()V

    .line 599
    iget-object v0, p0, Lcom/playhaven/android/view/PlayHavenView$6;->this$0:Lcom/playhaven/android/view/PlayHavenView;

    new-instance v1, Lcom/playhaven/android/view/HTMLView;

    iget-object v2, p0, Lcom/playhaven/android/view/PlayHavenView$6;->this$0:Lcom/playhaven/android/view/PlayHavenView;

    invoke-virtual {v2}, Lcom/playhaven/android/view/PlayHavenView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/playhaven/android/view/HTMLView;-><init>(Landroid/content/Context;)V

    invoke-static {v0, v1}, Lcom/playhaven/android/view/PlayHavenView;->access$0(Lcom/playhaven/android/view/PlayHavenView;Lcom/playhaven/android/view/ChildView;)V

    .line 600
    iget-object v0, p0, Lcom/playhaven/android/view/PlayHavenView$6;->this$0:Lcom/playhaven/android/view/PlayHavenView;

    invoke-static {v0}, Lcom/playhaven/android/view/PlayHavenView;->access$1(Lcom/playhaven/android/view/PlayHavenView;)Lcom/playhaven/android/view/ChildView;

    move-result-object v0

    iget-object v1, p0, Lcom/playhaven/android/view/PlayHavenView$6;->val$placement:Lcom/playhaven/android/Placement;

    invoke-interface {v0, v1}, Lcom/playhaven/android/view/ChildView;->setPlacement(Lcom/playhaven/android/Placement;)V

    .line 608
    iget-object v0, p0, Lcom/playhaven/android/view/PlayHavenView$6;->this$0:Lcom/playhaven/android/view/PlayHavenView;

    const/4 v1, 0x1

    invoke-virtual {v0, v3, v1}, Lcom/playhaven/android/view/PlayHavenView;->removeViews(II)V

    .line 610
    iget-object v0, p0, Lcom/playhaven/android/view/PlayHavenView$6;->this$0:Lcom/playhaven/android/view/PlayHavenView;

    invoke-static {v0}, Lcom/playhaven/android/view/PlayHavenView;->access$1(Lcom/playhaven/android/view/PlayHavenView;)Lcom/playhaven/android/view/ChildView;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 611
    iget-object v1, p0, Lcom/playhaven/android/view/PlayHavenView$6;->this$0:Lcom/playhaven/android/view/PlayHavenView;

    iget-object v0, p0, Lcom/playhaven/android/view/PlayHavenView$6;->this$0:Lcom/playhaven/android/view/PlayHavenView;

    invoke-static {v0}, Lcom/playhaven/android/view/PlayHavenView;->access$1(Lcom/playhaven/android/view/PlayHavenView;)Lcom/playhaven/android/view/ChildView;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v1, v0, v3}, Lcom/playhaven/android/view/PlayHavenView;->addView(Landroid/view/View;I)V

    .line 612
    return-void
.end method
