.class final Lcom/unity3d/player/UnityPlayer$11;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/unity3d/player/UnityPlayer;->init(IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Z

.field final synthetic c:Lcom/unity3d/player/UnityPlayer;


# direct methods
.method constructor <init>(Lcom/unity3d/player/UnityPlayer;IZ)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/player/UnityPlayer$11;->c:Lcom/unity3d/player/UnityPlayer;

    iput p2, p0, Lcom/unity3d/player/UnityPlayer$11;->a:I

    iput-boolean p3, p0, Lcom/unity3d/player/UnityPlayer$11;->b:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    iget-object v0, p0, Lcom/unity3d/player/UnityPlayer$11;->c:Lcom/unity3d/player/UnityPlayer;

    iget v1, p0, Lcom/unity3d/player/UnityPlayer$11;->a:I

    iget-boolean v2, p0, Lcom/unity3d/player/UnityPlayer$11;->b:Z

    invoke-static {v0, v1, v2}, Lcom/unity3d/player/UnityPlayer;->a(Lcom/unity3d/player/UnityPlayer;IZ)V

    return-void
.end method
