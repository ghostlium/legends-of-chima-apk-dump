.class final Lcom/google/android/gms/internal/gq$d;
.super Lcom/google/android/gms/internal/dk$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/gq;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/dk",
        "<",
        "Lcom/google/android/gms/internal/gp;",
        ">.c<",
        "Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;",
        ">;"
    }
.end annotation


# instance fields
.field private final oi:Ljava/lang/String;

.field final synthetic zA:Lcom/google/android/gms/internal/gq;

.field private final zB:Lcom/google/android/gms/common/ConnectionResult;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/gq;Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;Lcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/common/data/DataHolder;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/gq$d;->zA:Lcom/google/android/gms/internal/gq;

    invoke-direct {p0, p1, p2, p4}, Lcom/google/android/gms/internal/dk$c;-><init>(Lcom/google/android/gms/internal/dk;Ljava/lang/Object;Lcom/google/android/gms/common/data/DataHolder;)V

    iput-object p3, p0, Lcom/google/android/gms/internal/gq$d;->zB:Lcom/google/android/gms/common/ConnectionResult;

    iput-object p5, p0, Lcom/google/android/gms/internal/gq$d;->oi:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected a(Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;Lcom/google/android/gms/common/data/DataHolder;)V
    .locals 3

    iget-object v1, p0, Lcom/google/android/gms/internal/gq$d;->zB:Lcom/google/android/gms/common/ConnectionResult;

    if-eqz p2, :cond_0

    new-instance v0, Lcom/google/android/gms/plus/model/people/PersonBuffer;

    invoke-direct {v0, p2}, Lcom/google/android/gms/plus/model/people/PersonBuffer;-><init>(Lcom/google/android/gms/common/data/DataHolder;)V

    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/internal/gq$d;->oi:Ljava/lang/String;

    invoke-interface {p1, v1, v0, v2}, Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;->onPeopleLoaded(Lcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/plus/model/people/PersonBuffer;Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected bridge synthetic a(Ljava/lang/Object;Lcom/google/android/gms/common/data/DataHolder;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/gq$d;->a(Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;Lcom/google/android/gms/common/data/DataHolder;)V

    return-void
.end method
