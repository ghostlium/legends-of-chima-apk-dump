.class public final Lcom/google/android/gms/internal/fu;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Lcom/google/android/gms/internal/fv;


# instance fields
.field final kZ:I

.field private final ui:Lcom/google/android/gms/location/LocationRequest;

.field private final uj:Lcom/google/android/gms/internal/fs;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/fv;

    invoke-direct {v0}, Lcom/google/android/gms/internal/fv;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/fu;->CREATOR:Lcom/google/android/gms/internal/fv;

    return-void
.end method

.method public constructor <init>(ILcom/google/android/gms/location/LocationRequest;Lcom/google/android/gms/internal/fs;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/internal/fu;->kZ:I

    iput-object p2, p0, Lcom/google/android/gms/internal/fu;->ui:Lcom/google/android/gms/location/LocationRequest;

    iput-object p3, p0, Lcom/google/android/gms/internal/fu;->uj:Lcom/google/android/gms/internal/fs;

    return-void
.end method


# virtual methods
.method public dA()Lcom/google/android/gms/location/LocationRequest;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/fu;->ui:Lcom/google/android/gms/location/LocationRequest;

    return-object v0
.end method

.method public dB()Lcom/google/android/gms/internal/fs;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/fu;->uj:Lcom/google/android/gms/internal/fs;

    return-object v0
.end method

.method public describeContents()I
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/fu;->CREATOR:Lcom/google/android/gms/internal/fv;

    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p0, p1, :cond_1

    .end local p1    # "object":Ljava/lang/Object;
    :cond_0
    :goto_0
    return v0

    .restart local p1    # "object":Ljava/lang/Object;
    :cond_1
    instance-of v2, p1, Lcom/google/android/gms/internal/fu;

    if-nez v2, :cond_2

    move v0, v1

    goto :goto_0

    :cond_2
    check-cast p1, Lcom/google/android/gms/internal/fu;

    .end local p1    # "object":Ljava/lang/Object;
    iget-object v2, p0, Lcom/google/android/gms/internal/fu;->ui:Lcom/google/android/gms/location/LocationRequest;

    iget-object v3, p1, Lcom/google/android/gms/internal/fu;->ui:Lcom/google/android/gms/location/LocationRequest;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/location/LocationRequest;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/google/android/gms/internal/fu;->uj:Lcom/google/android/gms/internal/fs;

    iget-object v3, p1, Lcom/google/android/gms/internal/fu;->uj:Lcom/google/android/gms/internal/fs;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/fs;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/google/android/gms/internal/fu;->ui:Lcom/google/android/gms/location/LocationRequest;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/google/android/gms/internal/fu;->uj:Lcom/google/android/gms/internal/fs;

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/google/android/gms/internal/ds;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    invoke-static {p0}, Lcom/google/android/gms/internal/ds;->e(Ljava/lang/Object;)Lcom/google/android/gms/internal/ds$a;

    move-result-object v0

    const-string v1, "locationRequest"

    iget-object v2, p0, Lcom/google/android/gms/internal/fu;->ui:Lcom/google/android/gms/location/LocationRequest;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ds$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/internal/ds$a;

    move-result-object v0

    const-string v1, "filter"

    iget-object v2, p0, Lcom/google/android/gms/internal/fu;->uj:Lcom/google/android/gms/internal/fs;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ds$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/internal/ds$a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/ds$a;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "parcel"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    sget-object v0, Lcom/google/android/gms/internal/fu;->CREATOR:Lcom/google/android/gms/internal/fv;

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/fv;->a(Lcom/google/android/gms/internal/fu;Landroid/os/Parcel;I)V

    return-void
.end method
