.class final Lcom/unity3d/player/UnityPlayer$17;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/unity3d/player/UnityPlayer;->onCameraFrame(Lcom/unity3d/player/a;[B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:[B

.field final synthetic c:Landroid/hardware/Camera$Size;

.field final synthetic d:Lcom/unity3d/player/a;

.field final synthetic e:Lcom/unity3d/player/UnityPlayer;


# direct methods
.method constructor <init>(Lcom/unity3d/player/UnityPlayer;I[BLandroid/hardware/Camera$Size;Lcom/unity3d/player/a;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/player/UnityPlayer$17;->e:Lcom/unity3d/player/UnityPlayer;

    iput p2, p0, Lcom/unity3d/player/UnityPlayer$17;->a:I

    iput-object p3, p0, Lcom/unity3d/player/UnityPlayer$17;->b:[B

    iput-object p4, p0, Lcom/unity3d/player/UnityPlayer$17;->c:Landroid/hardware/Camera$Size;

    iput-object p5, p0, Lcom/unity3d/player/UnityPlayer$17;->d:Lcom/unity3d/player/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    iget-object v0, p0, Lcom/unity3d/player/UnityPlayer$17;->e:Lcom/unity3d/player/UnityPlayer;

    iget v1, p0, Lcom/unity3d/player/UnityPlayer$17;->a:I

    iget-object v2, p0, Lcom/unity3d/player/UnityPlayer$17;->b:[B

    iget-object v3, p0, Lcom/unity3d/player/UnityPlayer$17;->c:Landroid/hardware/Camera$Size;

    iget v3, v3, Landroid/hardware/Camera$Size;->width:I

    iget-object v4, p0, Lcom/unity3d/player/UnityPlayer$17;->c:Landroid/hardware/Camera$Size;

    iget v4, v4, Landroid/hardware/Camera$Size;->height:I

    invoke-static {v0, v1, v2, v3, v4}, Lcom/unity3d/player/UnityPlayer;->a(Lcom/unity3d/player/UnityPlayer;I[BII)V

    iget-object v0, p0, Lcom/unity3d/player/UnityPlayer$17;->d:Lcom/unity3d/player/a;

    iget-object v1, p0, Lcom/unity3d/player/UnityPlayer$17;->b:[B

    invoke-virtual {v0, v1}, Lcom/unity3d/player/a;->a([B)V

    return-void
.end method
