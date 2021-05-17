.class public Lcom/cobra/zufflin/ZufflinSurface;
.super Landroid/view/SurfaceView;
.source "ZufflinSurface.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;
.implements Landroid/view/View$OnKeyListener;
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cobra/zufflin/ZufflinSurface$ZufflinMain;
    }
.end annotation


# instance fields
.field private bSurfaceIsReady:Z

.field private gameThread:Ljava/lang/Thread;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    .line 30
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 26
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cobra/zufflin/ZufflinSurface;->bSurfaceIsReady:Z

    .line 169
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cobra/zufflin/ZufflinSurface;->gameThread:Ljava/lang/Thread;

    .line 32
    invoke-virtual {p0}, Lcom/cobra/zufflin/ZufflinSurface;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    const/4 v1, -0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setFormat(I)V

    .line 34
    invoke-virtual {p0}, Lcom/cobra/zufflin/ZufflinSurface;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 35
    invoke-virtual {p0, v2}, Lcom/cobra/zufflin/ZufflinSurface;->setFocusable(Z)V

    .line 36
    invoke-virtual {p0, v2}, Lcom/cobra/zufflin/ZufflinSurface;->setFocusableInTouchMode(Z)V

    .line 37
    invoke-virtual {p0}, Lcom/cobra/zufflin/ZufflinSurface;->requestFocus()Z

    .line 38
    invoke-virtual {p0, p0}, Lcom/cobra/zufflin/ZufflinSurface;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 39
    invoke-virtual {p0, p0}, Lcom/cobra/zufflin/ZufflinSurface;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 40
    return-void
.end method

.method static synthetic access$0(Lcom/cobra/zufflin/ZufflinSurface;)Ljava/lang/Thread;
    .locals 1

    .prologue
    .line 169
    iget-object v0, p0, Lcom/cobra/zufflin/ZufflinSurface;->gameThread:Ljava/lang/Thread;

    return-object v0
.end method


# virtual methods
.method public getNativeSurface()Landroid/view/Surface;
    .locals 1

    .prologue
    .line 166
    invoke-virtual {p0}, Lcom/cobra/zufflin/ZufflinSurface;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v0

    return-object v0
.end method

.method public isGameSurfaceReady()Z
    .locals 1

    .prologue
    .line 238
    iget-boolean v0, p0, Lcom/cobra/zufflin/ZufflinSurface;->bSurfaceIsReady:Z

    return v0
.end method

.method public onGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 10
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 141
    const/4 v9, 0x0

    .line 143
    .local v9, "handled":Z
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v0

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_0

    .line 145
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result v1

    .line 146
    .local v1, "axis_x":F
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result v2

    .line 147
    .local v2, "axis_y":F
    const/16 v0, 0xb

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result v3

    .line 148
    .local v3, "axis_z":F
    const/16 v0, 0xe

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result v4

    .line 149
    .local v4, "axis_rz":F
    const/16 v0, 0x17

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result v5

    .line 150
    .local v5, "axis_brake":F
    const/16 v0, 0x16

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result v6

    .line 151
    .local v6, "axis_gas":F
    const/16 v0, 0xf

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result v7

    .line 152
    .local v7, "axis_hat_x":F
    const/16 v0, 0x10

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result v8

    .line 154
    .local v8, "axis_hat_y":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDeviceId()I

    move-result v0

    invoke-static/range {v0 .. v8}, Lcom/cobra/zufflin/ZufflinNative;->setJoystickAxes(IFFFFFFFF)Z

    move-result v9

    .line 161
    .end local v1    # "axis_x":F
    .end local v2    # "axis_y":F
    .end local v3    # "axis_z":F
    .end local v4    # "axis_rz":F
    .end local v5    # "axis_brake":F
    .end local v6    # "axis_gas":F
    .end local v7    # "axis_hat_x":F
    .end local v8    # "axis_hat_y":F
    :cond_0
    return v9
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 104
    const/4 v0, 0x0

    .line 106
    .local v0, "handled":Z
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 127
    :goto_0
    if-eqz v0, :cond_0

    .line 129
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_1

    .line 130
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getDeviceId()I

    move-result v1

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    invoke-static {v1, v2}, Lcom/cobra/zufflin/ZufflinNative;->keyPressed(II)V

    .line 135
    :cond_0
    :goto_1
    return v0

    .line 123
    :sswitch_0
    const/4 v0, 0x1

    goto :goto_0

    .line 131
    :cond_1
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 132
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getDeviceId()I

    move-result v1

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    invoke-static {v1, v2}, Lcom/cobra/zufflin/ZufflinNative;->keyReleased(II)V

    goto :goto_1

    .line 106
    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_0
        0x13 -> :sswitch_0
        0x14 -> :sswitch_0
        0x15 -> :sswitch_0
        0x16 -> :sswitch_0
        0x17 -> :sswitch_0
        0x52 -> :sswitch_0
        0x60 -> :sswitch_0
        0x61 -> :sswitch_0
        0x63 -> :sswitch_0
        0x64 -> :sswitch_0
        0x66 -> :sswitch_0
        0x67 -> :sswitch_0
        0x6a -> :sswitch_0
        0x6b -> :sswitch_0
    .end sparse-switch
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 9
    .param p1, "v"    # Landroid/view/View;
    .param p2, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 45
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 46
    .local v0, "action":I
    and-int/lit16 v6, v0, 0xff

    packed-switch v6, :pswitch_data_0

    .line 98
    :cond_0
    :goto_0
    :pswitch_0
    const/4 v6, 0x1

    return v6

    .line 51
    :pswitch_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v6

    if-ge v1, v6, :cond_0

    .line 53
    invoke-virtual {p2, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    invoke-virtual {p2, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    float-to-int v7, v7

    invoke-virtual {p2, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v8

    float-to-int v8, v8

    invoke-static {v6, v7, v8}, Lcom/cobra/zufflin/ZufflinNative;->touchBegan(III)V

    .line 51
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 60
    .end local v1    # "i":I
    :pswitch_2
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_2
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v6

    if-ge v1, v6, :cond_0

    .line 62
    invoke-virtual {p2, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    invoke-virtual {p2, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    float-to-int v7, v7

    invoke-virtual {p2, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v8

    float-to-int v8, v8

    invoke-static {v6, v7, v8}, Lcom/cobra/zufflin/ZufflinNative;->touchMoved(III)V

    .line 60
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 70
    .end local v1    # "i":I
    :pswitch_3
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_3
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v6

    if-ge v1, v6, :cond_0

    .line 72
    invoke-virtual {p2, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    invoke-virtual {p2, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    float-to-int v7, v7

    invoke-virtual {p2, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v8

    float-to-int v8, v8

    invoke-static {v6, v7, v8}, Lcom/cobra/zufflin/ZufflinNative;->touchEnded(III)V

    .line 70
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 80
    .end local v1    # "i":I
    :pswitch_4
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v3

    .line 81
    .local v3, "pointerIndex":I
    invoke-virtual {p2, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v2

    .line 82
    .local v2, "pointerId":I
    invoke-virtual {p2, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    float-to-int v4, v6

    .line 83
    .local v4, "x":I
    invoke-virtual {p2, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v6

    float-to-int v5, v6

    .line 84
    .local v5, "y":I
    invoke-static {v2, v4, v5}, Lcom/cobra/zufflin/ZufflinNative;->touchBegan(III)V

    goto :goto_0

    .line 89
    .end local v2    # "pointerId":I
    .end local v3    # "pointerIndex":I
    .end local v4    # "x":I
    .end local v5    # "y":I
    :pswitch_5
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v3

    .line 90
    .restart local v3    # "pointerIndex":I
    invoke-virtual {p2, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v2

    .line 91
    .restart local v2    # "pointerId":I
    invoke-virtual {p2, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    float-to-int v4, v6

    .line 92
    .restart local v4    # "x":I
    invoke-virtual {p2, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v6

    float-to-int v5, v6

    .line 93
    .restart local v5    # "y":I
    invoke-static {v2, v4, v5}, Lcom/cobra/zufflin/ZufflinNative;->touchEnded(III)V

    goto :goto_0

    .line 46
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 3
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 176
    invoke-static {p3, p4}, Lcom/cobra/zufflin/ZufflinNative;->nativeSurfaceResized(II)V

    .line 177
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cobra/zufflin/ZufflinSurface;->bSurfaceIsReady:Z

    .line 178
    invoke-static {}, Lcom/cobra/zufflin/ZufflinNative;->nativeSurfaceChanged()V

    .line 180
    iget-object v0, p0, Lcom/cobra/zufflin/ZufflinSurface;->gameThread:Ljava/lang/Thread;

    if-nez v0, :cond_0

    .line 184
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/cobra/zufflin/ZufflinSurface$ZufflinMain;

    invoke-direct {v1, p0}, Lcom/cobra/zufflin/ZufflinSurface$ZufflinMain;-><init>(Lcom/cobra/zufflin/ZufflinSurface;)V

    const-string v2, "ZufflinThread"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/cobra/zufflin/ZufflinSurface;->gameThread:Ljava/lang/Thread;

    .line 185
    iget-object v0, p0, Lcom/cobra/zufflin/ZufflinSurface;->gameThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 188
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/cobra/zufflin/ZufflinSurface$1;

    invoke-direct {v1, p0}, Lcom/cobra/zufflin/ZufflinSurface$1;-><init>(Lcom/cobra/zufflin/ZufflinSurface;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 206
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 209
    :cond_0
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 215
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 1
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 222
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cobra/zufflin/ZufflinSurface;->bSurfaceIsReady:Z

    .line 223
    invoke-static {}, Lcom/cobra/zufflin/ZufflinNative;->nativeSurfaceDestroyed()V

    .line 224
    return-void
.end method

.method public waitOnGameThreadExit()V
    .locals 1

    .prologue
    .line 245
    :try_start_0
    iget-object v0, p0, Lcom/cobra/zufflin/ZufflinSurface;->gameThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 246
    iget-object v0, p0, Lcom/cobra/zufflin/ZufflinSurface;->gameThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 252
    :cond_0
    :goto_0
    return-void

    .line 249
    :catch_0
    move-exception v0

    goto :goto_0
.end method
