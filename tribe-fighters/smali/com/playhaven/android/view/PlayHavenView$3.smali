.class Lcom/playhaven/android/view/PlayHavenView$3;
.super Ljava/lang/Object;
.source "PlayHavenView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/playhaven/android/view/PlayHavenView;->setAnimationVisible(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/playhaven/android/view/PlayHavenView;

.field private final synthetic val$animation:Landroid/view/View;

.field private final synthetic val$visible:Z


# direct methods
.method constructor <init>(Lcom/playhaven/android/view/PlayHavenView;Landroid/view/View;Z)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/playhaven/android/view/PlayHavenView$3;->this$0:Lcom/playhaven/android/view/PlayHavenView;

    iput-object p2, p0, Lcom/playhaven/android/view/PlayHavenView$3;->val$animation:Landroid/view/View;

    iput-boolean p3, p0, Lcom/playhaven/android/view/PlayHavenView$3;->val$visible:Z

    .line 440
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 443
    iget-object v1, p0, Lcom/playhaven/android/view/PlayHavenView$3;->val$animation:Landroid/view/View;

    iget-boolean v0, p0, Lcom/playhaven/android/view/PlayHavenView$3;->val$visible:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 444
    return-void

    .line 443
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method