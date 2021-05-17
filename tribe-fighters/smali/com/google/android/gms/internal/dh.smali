.class public final Lcom/google/android/gms/internal/dh;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/dh$a;
    }
.end annotation


# instance fields
.field private final kQ:Landroid/view/View;

.field private final mt:Lcom/google/android/gms/internal/dh$a;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Collection;ILandroid/view/View;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;I",
            "Landroid/view/View;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/dh$a;

    invoke-direct {v0, p1, p2, p3, p5}, Lcom/google/android/gms/internal/dh$a;-><init>(Ljava/lang/String;Ljava/util/Collection;ILjava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/dh;->mt:Lcom/google/android/gms/internal/dh$a;

    iput-object p4, p0, Lcom/google/android/gms/internal/dh;->kQ:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public bt()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/dh;->mt:Lcom/google/android/gms/internal/dh$a;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/dh$a;->bt()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bu()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/dh;->mt:Lcom/google/android/gms/internal/dh$a;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/dh$a;->bu()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
