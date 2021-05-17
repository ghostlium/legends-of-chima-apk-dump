.class final Lcom/google/android/gms/internal/ex$ak;
.super Lcom/google/android/gms/internal/ew;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/ex;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "ak"
.end annotation


# instance fields
.field private final jN:Lcom/google/android/gms/common/api/a$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/f$a;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic qW:Lcom/google/android/gms/internal/ex;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/f$a;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/gms/internal/ex$ak;->qW:Lcom/google/android/gms/internal/ex;

    invoke-direct {p0}, Lcom/google/android/gms/internal/ew;-><init>()V

    const-string v0, "Holder must not be null"

    invoke-static {p2, v0}, Lcom/google/android/gms/internal/du;->c(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/a$c;

    iput-object v0, p0, Lcom/google/android/gms/internal/ex$ak;->jN:Lcom/google/android/gms/common/api/a$c;

    return-void
.end method


# virtual methods
.method public e(Lcom/google/android/gms/common/data/DataHolder;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/ex$ak;->qW:Lcom/google/android/gms/internal/ex;

    new-instance v1, Lcom/google/android/gms/internal/ex$al;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex$ak;->qW:Lcom/google/android/gms/internal/ex;

    iget-object v3, p0, Lcom/google/android/gms/internal/ex$ak;->jN:Lcom/google/android/gms/common/api/a$c;

    invoke-direct {v1, v2, v3, p1}, Lcom/google/android/gms/internal/ex$al;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;Lcom/google/android/gms/common/data/DataHolder;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ex;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method
