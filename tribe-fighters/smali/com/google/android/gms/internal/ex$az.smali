.class final Lcom/google/android/gms/internal/ex$az;
.super Lcom/google/android/gms/internal/ew;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/ex;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "az"
.end annotation


# instance fields
.field final synthetic qW:Lcom/google/android/gms/internal/ex;

.field private final rw:Lcom/google/android/gms/common/api/a$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/multiplayer/turnbased/b$a;",
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
            "Lcom/google/android/gms/games/multiplayer/turnbased/b$a;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/gms/internal/ex$az;->qW:Lcom/google/android/gms/internal/ex;

    invoke-direct {p0}, Lcom/google/android/gms/internal/ew;-><init>()V

    const-string v0, "Holder must not be null"

    invoke-static {p2, v0}, Lcom/google/android/gms/internal/du;->c(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/a$c;

    iput-object v0, p0, Lcom/google/android/gms/internal/ex$az;->rw:Lcom/google/android/gms/common/api/a$c;

    return-void
.end method


# virtual methods
.method public onTurnBasedMatchCanceled(ILjava/lang/String;)V
    .locals 5
    .param p1, "statusCode"    # I
    .param p2, "matchId"    # Ljava/lang/String;

    .prologue
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    invoke-direct {v0, p1}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/ex$az;->qW:Lcom/google/android/gms/internal/ex;

    new-instance v2, Lcom/google/android/gms/internal/ex$ba;

    iget-object v3, p0, Lcom/google/android/gms/internal/ex$az;->qW:Lcom/google/android/gms/internal/ex;

    iget-object v4, p0, Lcom/google/android/gms/internal/ex$az;->rw:Lcom/google/android/gms/common/api/a$c;

    invoke-direct {v2, v3, v4, v0, p2}, Lcom/google/android/gms/internal/ex$ba;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;Lcom/google/android/gms/common/api/Status;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/ex;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method
