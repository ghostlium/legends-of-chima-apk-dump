.class final Lcom/google/android/gms/internal/ex$bj;
.super Lcom/google/android/gms/internal/ew;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/ex;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "bj"
.end annotation


# instance fields
.field final synthetic qW:Lcom/google/android/gms/internal/ex;

.field private final rC:Lcom/google/android/gms/common/api/a$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/multiplayer/turnbased/b$e;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/multiplayer/turnbased/b$e;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/gms/internal/ex$bj;->qW:Lcom/google/android/gms/internal/ex;

    invoke-direct {p0}, Lcom/google/android/gms/internal/ew;-><init>()V

    const-string v0, "Holder must not be null"

    invoke-static {p2, v0}, Lcom/google/android/gms/internal/du;->c(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/a$c;

    iput-object v0, p0, Lcom/google/android/gms/internal/ex$bj;->rC:Lcom/google/android/gms/common/api/a$c;

    return-void
.end method


# virtual methods
.method public a(ILandroid/os/Bundle;)V
    .locals 5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    new-instance v0, Lcom/google/android/gms/common/api/Status;

    invoke-direct {v0, p1}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/ex$bj;->qW:Lcom/google/android/gms/internal/ex;

    new-instance v2, Lcom/google/android/gms/internal/ex$bk;

    iget-object v3, p0, Lcom/google/android/gms/internal/ex$bj;->qW:Lcom/google/android/gms/internal/ex;

    iget-object v4, p0, Lcom/google/android/gms/internal/ex$bj;->rC:Lcom/google/android/gms/common/api/a$c;

    invoke-direct {v2, v3, v4, v0, p2}, Lcom/google/android/gms/internal/ex$bk;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;Lcom/google/android/gms/common/api/Status;Landroid/os/Bundle;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/ex;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method
