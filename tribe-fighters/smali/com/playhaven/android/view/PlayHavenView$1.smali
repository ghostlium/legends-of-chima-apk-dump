.class Lcom/playhaven/android/view/PlayHavenView$1;
.super Ljava/lang/Object;
.source "PlayHavenView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/playhaven/android/view/PlayHavenView;->createExitListener()Landroid/view/View$OnClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/playhaven/android/view/PlayHavenView;


# direct methods
.method constructor <init>(Lcom/playhaven/android/view/PlayHavenView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/playhaven/android/view/PlayHavenView$1;->this$0:Lcom/playhaven/android/view/PlayHavenView;

    .line 201
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 204
    iget-object v0, p0, Lcom/playhaven/android/view/PlayHavenView$1;->this$0:Lcom/playhaven/android/view/PlayHavenView;

    sget-object v1, Lcom/playhaven/android/view/PlayHavenView$DismissType;->Emergency:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    invoke-virtual {v0, v1}, Lcom/playhaven/android/view/PlayHavenView;->dismissView(Lcom/playhaven/android/view/PlayHavenView$DismissType;)V

    .line 205
    return-void
.end method
