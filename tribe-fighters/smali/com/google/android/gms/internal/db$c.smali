.class final Lcom/google/android/gms/internal/db$c;
.super Lcom/google/android/gms/internal/da;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/db;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "c"
.end annotation


# instance fields
.field private final jN:Lcom/google/android/gms/common/api/a$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/appstate/b$c;",
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
            "Lcom/google/android/gms/appstate/b$c;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/gms/internal/db$c;->jO:Lcom/google/android/gms/internal/db;

    invoke-direct {p0}, Lcom/google/android/gms/internal/da;-><init>()V

    const-string v0, "Result holder must not be null"

    invoke-static {p2, v0}, Lcom/google/android/gms/internal/du;->c(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/a$c;

    iput-object v0, p0, Lcom/google/android/gms/internal/db$c;->jN:Lcom/google/android/gms/common/api/a$c;

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/common/data/DataHolder;)V
    .locals 5

    new-instance v0, Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p1}, Lcom/google/android/gms/common/data/DataHolder;->getStatusCode()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/db$c;->jO:Lcom/google/android/gms/internal/db;

    new-instance v2, Lcom/google/android/gms/internal/db$d;

    iget-object v3, p0, Lcom/google/android/gms/internal/db$c;->jO:Lcom/google/android/gms/internal/db;

    iget-object v4, p0, Lcom/google/android/gms/internal/db$c;->jN:Lcom/google/android/gms/common/api/a$c;

    invoke-direct {v2, v3, v4, v0, p1}, Lcom/google/android/gms/internal/db$d;-><init>(Lcom/google/android/gms/internal/db;Lcom/google/android/gms/common/api/a$c;Lcom/google/android/gms/common/api/Status;Lcom/google/android/gms/common/data/DataHolder;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/db;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method
