.class final Lcom/google/android/gms/internal/db$b;
.super Lcom/google/android/gms/internal/dk$b;

# interfaces
.implements Lcom/google/android/gms/appstate/b$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/db;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/dk",
        "<",
        "Lcom/google/android/gms/internal/dd;",
        ">.b<",
        "Lcom/google/android/gms/common/api/a$c",
        "<",
        "Lcom/google/android/gms/appstate/b$b;",
        ">;>;",
        "Lcom/google/android/gms/appstate/b$b;"
    }
.end annotation


# instance fields
.field final synthetic jO:Lcom/google/android/gms/internal/db;

.field private final jP:Lcom/google/android/gms/common/api/Status;

.field private final jQ:I


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/db;Lcom/google/android/gms/common/api/a$c;Lcom/google/android/gms/common/api/Status;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/appstate/b$b;",
            ">;",
            "Lcom/google/android/gms/common/api/Status;",
            "I)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/gms/internal/db$b;->jO:Lcom/google/android/gms/internal/db;

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/dk$b;-><init>(Lcom/google/android/gms/internal/dk;Ljava/lang/Object;)V

    iput-object p3, p0, Lcom/google/android/gms/internal/db$b;->jP:Lcom/google/android/gms/common/api/Status;

    iput p4, p0, Lcom/google/android/gms/internal/db$b;->jQ:I

    return-void
.end method


# virtual methods
.method public aK()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/db$b;->jQ:I

    return v0
.end method

.method protected aQ()V
    .locals 0

    return-void
.end method

.method public synthetic b(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/common/api/a$c;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/db$b;->c(Lcom/google/android/gms/common/api/a$c;)V

    return-void
.end method

.method public c(Lcom/google/android/gms/common/api/a$c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/appstate/b$b;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1, p0}, Lcom/google/android/gms/common/api/a$c;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public getStatus()Lcom/google/android/gms/common/api/Status;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/db$b;->jP:Lcom/google/android/gms/common/api/Status;

    return-object v0
.end method
