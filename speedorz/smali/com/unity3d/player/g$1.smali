.class final Lcom/unity3d/player/g$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnSystemUiVisibilityChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/unity3d/player/g;->a(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/view/View;

.field final synthetic b:Lcom/unity3d/player/g;


# direct methods
.method constructor <init>(Lcom/unity3d/player/g;Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/player/g$1;->b:Lcom/unity3d/player/g;

    iput-object p2, p0, Lcom/unity3d/player/g$1;->a:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onSystemUiVisibilityChange(I)V
    .locals 2

    iget-object v0, p0, Lcom/unity3d/player/g$1;->b:Lcom/unity3d/player/g;

    iget-object v1, p0, Lcom/unity3d/player/g$1;->a:Landroid/view/View;

    invoke-static {v0, v1}, Lcom/unity3d/player/g;->a(Lcom/unity3d/player/g;Landroid/view/View;)V

    return-void
.end method