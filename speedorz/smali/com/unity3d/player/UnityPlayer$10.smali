.class final Lcom/unity3d/player/UnityPlayer$10;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/unity3d/player/UnityPlayer;->b(Landroid/view/MotionEvent;I)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:[Lcom/unity3d/player/k$a;

.field final synthetic b:Lcom/unity3d/player/UnityPlayer;


# direct methods
.method constructor <init>(Lcom/unity3d/player/UnityPlayer;[Lcom/unity3d/player/k$a;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/player/UnityPlayer$10;->b:Lcom/unity3d/player/UnityPlayer;

    iput-object p2, p0, Lcom/unity3d/player/UnityPlayer$10;->a:[Lcom/unity3d/player/k$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    const/4 v1, 0x0

    iget-object v3, p0, Lcom/unity3d/player/UnityPlayer$10;->a:[Lcom/unity3d/player/k$a;

    array-length v4, v3

    move v2, v1

    :goto_0
    if-ge v2, v4, :cond_1

    aget-object v5, v3, v2

    iget v0, v5, Lcom/unity3d/player/k$a;->a:I

    add-int/lit8 v6, v0, 0x1

    move v0, v1

    :goto_1
    iget-object v7, v5, Lcom/unity3d/player/k$a;->b:[F

    array-length v7, v7

    if-ge v0, v7, :cond_0

    iget-object v7, p0, Lcom/unity3d/player/UnityPlayer$10;->b:Lcom/unity3d/player/UnityPlayer;

    iget-object v8, v5, Lcom/unity3d/player/k$a;->b:[F

    aget v8, v8, v0

    invoke-static {v7, v6, v0, v8}, Lcom/unity3d/player/UnityPlayer;->a(Lcom/unity3d/player/UnityPlayer;IIF)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_1
    return-void
.end method
