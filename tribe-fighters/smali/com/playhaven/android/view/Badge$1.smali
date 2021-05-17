.class Lcom/playhaven/android/view/Badge$1;
.super Ljava/lang/Object;
.source "Badge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/playhaven/android/view/Badge;->invalidateOnUiThread()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/playhaven/android/view/Badge;


# direct methods
.method constructor <init>(Lcom/playhaven/android/view/Badge;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/playhaven/android/view/Badge$1;->this$0:Lcom/playhaven/android/view/Badge;

    .line 196
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 199
    iget-object v0, p0, Lcom/playhaven/android/view/Badge$1;->this$0:Lcom/playhaven/android/view/Badge;

    invoke-virtual {v0}, Lcom/playhaven/android/view/Badge;->invalidateSelf()V

    .line 200
    return-void
.end method
