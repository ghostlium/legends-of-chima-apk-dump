.class Lcom/prime31/EtceteraPlugin$27;
.super Ljava/lang/Object;
.source "EtceteraPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/prime31/EtceteraPlugin;->inlineWebViewSetFrame(IIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/prime31/EtceteraPlugin;

.field private final synthetic val$height:I

.field private final synthetic val$width:I

.field private final synthetic val$x:I

.field private final synthetic val$y:I


# direct methods
.method constructor <init>(Lcom/prime31/EtceteraPlugin;IIII)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/prime31/EtceteraPlugin$27;->this$0:Lcom/prime31/EtceteraPlugin;

    iput p2, p0, Lcom/prime31/EtceteraPlugin$27;->val$x:I

    iput p3, p0, Lcom/prime31/EtceteraPlugin$27;->val$y:I

    iput p4, p0, Lcom/prime31/EtceteraPlugin$27;->val$width:I

    iput p5, p0, Lcom/prime31/EtceteraPlugin$27;->val$height:I

    .line 1348
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 1352
    iget-object v2, p0, Lcom/prime31/EtceteraPlugin$27;->this$0:Lcom/prime31/EtceteraPlugin;

    invoke-virtual {v2}, Lcom/prime31/EtceteraPlugin;->getScreenDensity()I

    move-result v0

    .line 1353
    .local v0, "density":I
    const/4 v1, 0x0

    .line 1354
    .local v1, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    iget-object v2, p0, Lcom/prime31/EtceteraPlugin$27;->this$0:Lcom/prime31/EtceteraPlugin;

    invoke-static {v2}, Lcom/prime31/EtceteraPlugin;->access$8(Lcom/prime31/EtceteraPlugin;)Landroid/webkit/WebView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/webkit/WebView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .end local v1    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    check-cast v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 1356
    .restart local v1    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    iget v2, p0, Lcom/prime31/EtceteraPlugin$27;->val$x:I

    mul-int/2addr v2, v0

    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 1357
    iget v2, p0, Lcom/prime31/EtceteraPlugin$27;->val$y:I

    mul-int/2addr v2, v0

    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 1358
    iget v2, p0, Lcom/prime31/EtceteraPlugin$27;->val$width:I

    mul-int/2addr v2, v0

    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 1359
    iget v2, p0, Lcom/prime31/EtceteraPlugin$27;->val$height:I

    mul-int/2addr v2, v0

    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 1361
    iget-object v2, p0, Lcom/prime31/EtceteraPlugin$27;->this$0:Lcom/prime31/EtceteraPlugin;

    invoke-static {v2}, Lcom/prime31/EtceteraPlugin;->access$8(Lcom/prime31/EtceteraPlugin;)Landroid/webkit/WebView;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1362
    return-void
.end method
