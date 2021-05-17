.class final Lcom/unity3d/player/UnityPlayer$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/unity3d/player/UnityPlayer;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/unity3d/player/ac;

.field final synthetic b:Lcom/unity3d/player/UnityPlayer;


# direct methods
.method constructor <init>(Lcom/unity3d/player/UnityPlayer;Lcom/unity3d/player/ac;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/player/UnityPlayer$2;->b:Lcom/unity3d/player/UnityPlayer;

    iput-object p2, p0, Lcom/unity3d/player/UnityPlayer$2;->a:Lcom/unity3d/player/ac;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    sget-boolean v0, Lcom/unity3d/player/u;->d:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/unity3d/player/u;->k:Lcom/unity3d/player/l;

    iget-object v1, p0, Lcom/unity3d/player/UnityPlayer$2;->a:Lcom/unity3d/player/ac;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/unity3d/player/l;->a(Landroid/opengl/GLSurfaceView;Z)V

    :cond_0
    iget-object v0, p0, Lcom/unity3d/player/UnityPlayer$2;->a:Lcom/unity3d/player/ac;

    invoke-virtual {v0}, Lcom/unity3d/player/ac;->onPause()V

    iget-object v0, p0, Lcom/unity3d/player/UnityPlayer$2;->b:Lcom/unity3d/player/UnityPlayer;

    invoke-static {v0}, Lcom/unity3d/player/UnityPlayer;->f(Lcom/unity3d/player/UnityPlayer;)Lcom/unity3d/player/y;

    move-result-object v0

    iget-object v1, p0, Lcom/unity3d/player/UnityPlayer$2;->a:Lcom/unity3d/player/ac;

    invoke-virtual {v0, v1}, Lcom/unity3d/player/y;->e(Landroid/view/View;)V

    iget-object v0, p0, Lcom/unity3d/player/UnityPlayer$2;->a:Lcom/unity3d/player/ac;

    invoke-virtual {v0}, Lcom/unity3d/player/ac;->a()V

    iget-object v0, p0, Lcom/unity3d/player/UnityPlayer$2;->b:Lcom/unity3d/player/UnityPlayer;

    invoke-static {v0}, Lcom/unity3d/player/UnityPlayer;->f(Lcom/unity3d/player/UnityPlayer;)Lcom/unity3d/player/y;

    move-result-object v0

    iget-object v1, p0, Lcom/unity3d/player/UnityPlayer$2;->a:Lcom/unity3d/player/ac;

    invoke-virtual {v0, v1}, Lcom/unity3d/player/y;->d(Landroid/view/View;)V

    iget-object v0, p0, Lcom/unity3d/player/UnityPlayer$2;->a:Lcom/unity3d/player/ac;

    invoke-virtual {v0}, Lcom/unity3d/player/ac;->onResume()V

    sget-boolean v0, Lcom/unity3d/player/u;->d:Z

    if-eqz v0, :cond_1

    sget-object v0, Lcom/unity3d/player/u;->k:Lcom/unity3d/player/l;

    iget-object v1, p0, Lcom/unity3d/player/UnityPlayer$2;->a:Lcom/unity3d/player/ac;

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lcom/unity3d/player/l;->a(Landroid/opengl/GLSurfaceView;Z)V

    :cond_1
    return-void
.end method
