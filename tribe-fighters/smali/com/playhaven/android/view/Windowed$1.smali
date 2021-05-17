.class Lcom/playhaven/android/view/Windowed$1;
.super Landroid/view/OrientationEventListener;
.source "Windowed.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/playhaven/android/view/Windowed;->configure(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/playhaven/android/view/Windowed;


# direct methods
.method constructor <init>(Lcom/playhaven/android/view/Windowed;Landroid/content/Context;)V
    .locals 0
    .param p2, "$anonymous0"    # Landroid/content/Context;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/playhaven/android/view/Windowed$1;->this$0:Lcom/playhaven/android/view/Windowed;

    .line 172
    invoke-direct {p0, p2}, Landroid/view/OrientationEventListener;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public onOrientationChanged(I)V
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 175
    iget-object v0, p0, Lcom/playhaven/android/view/Windowed$1;->this$0:Lcom/playhaven/android/view/Windowed;

    invoke-virtual {v0}, Lcom/playhaven/android/view/Windowed;->configureSize()V

    .line 176
    return-void
.end method
