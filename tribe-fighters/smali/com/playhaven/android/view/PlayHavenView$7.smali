.class Lcom/playhaven/android/view/PlayHavenView$7;
.super Ljava/lang/Object;
.source "PlayHavenView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/playhaven/android/view/PlayHavenView;->setFullscreen(Lcom/playhaven/android/Placement;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/playhaven/android/view/PlayHavenView;

.field private final synthetic val$hostActivity:Lcom/playhaven/android/view/FullScreen;


# direct methods
.method constructor <init>(Lcom/playhaven/android/view/PlayHavenView;Lcom/playhaven/android/view/FullScreen;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/playhaven/android/view/PlayHavenView$7;->this$0:Lcom/playhaven/android/view/PlayHavenView;

    iput-object p2, p0, Lcom/playhaven/android/view/PlayHavenView$7;->val$hostActivity:Lcom/playhaven/android/view/FullScreen;

    .line 621
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 624
    iget-object v0, p0, Lcom/playhaven/android/view/PlayHavenView$7;->val$hostActivity:Lcom/playhaven/android/view/FullScreen;

    invoke-virtual {v0}, Lcom/playhaven/android/view/FullScreen;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 625
    const-string v0, "Placement should not be displayed fullscreen, clearing flag."

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/playhaven/android/PlayHaven;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 626
    return-void
.end method
