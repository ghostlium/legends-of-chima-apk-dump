.class Lcom/playhaven/android/view/PlayHavenView$5;
.super Landroid/view/OrientationEventListener;
.source "PlayHavenView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/playhaven/android/view/PlayHavenView;->setFrame()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/playhaven/android/view/PlayHavenView;


# direct methods
.method constructor <init>(Lcom/playhaven/android/view/PlayHavenView;Landroid/content/Context;)V
    .locals 0
    .param p2, "$anonymous0"    # Landroid/content/Context;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/playhaven/android/view/PlayHavenView$5;->this$0:Lcom/playhaven/android/view/PlayHavenView;

    .line 551
    invoke-direct {p0, p2}, Landroid/view/OrientationEventListener;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public onOrientationChanged(I)V
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 554
    iget-object v0, p0, Lcom/playhaven/android/view/PlayHavenView$5;->this$0:Lcom/playhaven/android/view/PlayHavenView;

    invoke-virtual {v0}, Lcom/playhaven/android/view/PlayHavenView;->setFrame()V

    .line 555
    return-void
.end method
