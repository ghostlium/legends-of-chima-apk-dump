.class final Lcom/google/android/gms/internal/db$e;
.super Lcom/google/android/gms/internal/da;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/db;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "e"
.end annotation


# instance fields
.field private final jN:Lcom/google/android/gms/common/api/a$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/appstate/b$e;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic jO:Lcom/google/android/gms/internal/db;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/db;Lcom/google/android/gms/common/api/a$c;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/appstate/b$e;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/gms/internal/db$e;->jO:Lcom/google/android/gms/internal/db;

    invoke-direct {p0}, Lcom/google/android/gms/internal/da;-><init>()V

    const-string v0, "Result holder must not be null"

    invoke-static {p2, v0}, Lcom/google/android/gms/internal/du;->c(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/a$c;

    iput-object v0, p0, Lcom/google/android/gms/internal/db$e;->jN:Lcom/google/android/gms/common/api/a$c;

    return-void
.end method


# virtual methods
.method public a(ILcom/google/android/gms/common/data/DataHolder;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/db$e;->jO:Lcom/google/android/gms/internal/db;

    new-instance v1, Lcom/google/android/gms/internal/db$f;

    iget-object v2, p0, Lcom/google/android/gms/internal/db$e;->jO:Lcom/google/android/gms/internal/db;

    iget-object v3, p0, Lcom/google/android/gms/internal/db$e;->jN:Lcom/google/android/gms/common/api/a$c;

    invoke-direct {v1, v2, v3, p1, p2}, Lcom/google/android/gms/internal/db$f;-><init>(Lcom/google/android/gms/internal/db;Lcom/google/android/gms/common/api/a$c;ILcom/google/android/gms/common/data/DataHolder;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/db;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method
