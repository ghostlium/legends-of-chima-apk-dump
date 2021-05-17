.class final Lcom/unity3d/player/UnityPlayer$24;
.super Lcom/unity3d/player/ac;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/unity3d/player/UnityPlayer;->a(IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic b:Landroid/view/View;

.field final synthetic c:Lcom/unity3d/player/UnityPlayer;


# direct methods
.method constructor <init>(Lcom/unity3d/player/UnityPlayer;Landroid/content/Context;IZZZIIILandroid/view/View;)V
    .locals 10

    iput-object p1, p0, Lcom/unity3d/player/UnityPlayer$24;->c:Lcom/unity3d/player/UnityPlayer;

    move-object/from16 v0, p10

    iput-object v0, p0, Lcom/unity3d/player/UnityPlayer$24;->b:Landroid/view/View;

    move-object v1, p0

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    invoke-direct/range {v1 .. v9}, Lcom/unity3d/player/ac;-><init>(Landroid/content/Context;IZZZIII)V

    return-void
.end method


# virtual methods
.method protected final onDetachedFromWindow()V
    .locals 1

    iget-object v0, p0, Lcom/unity3d/player/UnityPlayer$24;->c:Lcom/unity3d/player/UnityPlayer;

    invoke-virtual {v0}, Lcom/unity3d/player/UnityPlayer;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-super {p0}, Lcom/unity3d/player/ac;->onDetachedFromWindow()V

    :cond_0
    return-void
.end method

.method public final onGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    iget-object v0, p0, Lcom/unity3d/player/UnityPlayer$24;->b:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public final onKeyPreIme(ILandroid/view/KeyEvent;)Z
    .locals 1

    iget-object v0, p0, Lcom/unity3d/player/UnityPlayer$24;->b:Landroid/view/View;

    invoke-virtual {v0, p1, p2}, Landroid/view/View;->onKeyPreIme(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2}, Lcom/unity3d/player/ac;->onKeyPreIme(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
