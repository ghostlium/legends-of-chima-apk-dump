.class Lcom/playhaven/android/view/Windowed$2;
.super Ljava/lang/Object;
.source "Windowed.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/playhaven/android/view/Windowed;->configureSize()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/playhaven/android/view/Windowed;


# direct methods
.method constructor <init>(Lcom/playhaven/android/view/Windowed;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/playhaven/android/view/Windowed$2;->this$0:Lcom/playhaven/android/view/Windowed;

    .line 220
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I
    .param p6, "oldLeft"    # I
    .param p7, "oldTop"    # I
    .param p8, "oldRight"    # I
    .param p9, "oldBottom"    # I

    .prologue
    .line 224
    if-nez p2, :cond_1

    if-nez p3, :cond_1

    .line 232
    :cond_0
    :goto_0
    return-void

    .line 227
    :cond_1
    iget-object v0, p0, Lcom/playhaven/android/view/Windowed$2;->this$0:Lcom/playhaven/android/view/Windowed;

    invoke-static {v0}, Lcom/playhaven/android/view/Windowed;->access$0(Lcom/playhaven/android/view/Windowed;)I

    move-result v0

    if-ne p2, v0, :cond_2

    iget-object v0, p0, Lcom/playhaven/android/view/Windowed$2;->this$0:Lcom/playhaven/android/view/Windowed;

    invoke-static {v0}, Lcom/playhaven/android/view/Windowed;->access$1(Lcom/playhaven/android/view/Windowed;)I

    move-result v0

    if-eq p3, v0, :cond_0

    .line 229
    :cond_2
    iget-object v0, p0, Lcom/playhaven/android/view/Windowed$2;->this$0:Lcom/playhaven/android/view/Windowed;

    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    invoke-virtual {v0, v1, v2}, Lcom/playhaven/android/view/Windowed;->resetWindow(D)V

    .line 230
    iget-object v0, p0, Lcom/playhaven/android/view/Windowed$2;->this$0:Lcom/playhaven/android/view/Windowed;

    invoke-static {v0, p2}, Lcom/playhaven/android/view/Windowed;->access$2(Lcom/playhaven/android/view/Windowed;I)V

    .line 231
    iget-object v0, p0, Lcom/playhaven/android/view/Windowed$2;->this$0:Lcom/playhaven/android/view/Windowed;

    invoke-static {v0, p3}, Lcom/playhaven/android/view/Windowed;->access$3(Lcom/playhaven/android/view/Windowed;I)V

    goto :goto_0
.end method
