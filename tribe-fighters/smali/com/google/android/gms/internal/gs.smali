.class public Lcom/google/android/gms/internal/gs;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Lcom/google/android/gms/internal/gu;


# instance fields
.field private final jD:Ljava/lang/String;

.field private final kZ:I

.field private final zG:[Ljava/lang/String;

.field private final zH:[Ljava/lang/String;

.field private final zI:[Ljava/lang/String;

.field private final zJ:Ljava/lang/String;

.field private final zK:Ljava/lang/String;

.field private final zL:Ljava/lang/String;

.field private final zM:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/gu;

    invoke-direct {v0}, Lcom/google/android/gms/internal/gu;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/gs;->CREATOR:Lcom/google/android/gms/internal/gu;

    return-void
.end method

.method constructor <init>(ILjava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/internal/gs;->kZ:I

    iput-object p2, p0, Lcom/google/android/gms/internal/gs;->jD:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/internal/gs;->zG:[Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/internal/gs;->zH:[Ljava/lang/String;

    iput-object p5, p0, Lcom/google/android/gms/internal/gs;->zI:[Ljava/lang/String;

    iput-object p6, p0, Lcom/google/android/gms/internal/gs;->zJ:Ljava/lang/String;

    iput-object p7, p0, Lcom/google/android/gms/internal/gs;->zK:Ljava/lang/String;

    iput-object p8, p0, Lcom/google/android/gms/internal/gs;->zL:Ljava/lang/String;

    iput-object p9, p0, Lcom/google/android/gms/internal/gs;->zM:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/gs;->kZ:I

    iput-object p1, p0, Lcom/google/android/gms/internal/gs;->jD:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/gms/internal/gs;->zG:[Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/internal/gs;->zH:[Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/internal/gs;->zI:[Ljava/lang/String;

    iput-object p5, p0, Lcom/google/android/gms/internal/gs;->zJ:Ljava/lang/String;

    iput-object p6, p0, Lcom/google/android/gms/internal/gs;->zK:Ljava/lang/String;

    iput-object p7, p0, Lcom/google/android/gms/internal/gs;->zL:Ljava/lang/String;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/gs;->zM:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public eA()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gs;->zK:Ljava/lang/String;

    return-object v0
.end method

.method public eB()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gs;->zL:Ljava/lang/String;

    return-object v0
.end method

.method public eC()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gs;->zM:Ljava/lang/String;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    instance-of v1, p1, Lcom/google/android/gms/internal/gs;

    if-nez v1, :cond_1

    .end local p1    # "obj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return v0

    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/gs;

    .end local p1    # "obj":Ljava/lang/Object;
    iget v1, p0, Lcom/google/android/gms/internal/gs;->kZ:I

    iget v2, p1, Lcom/google/android/gms/internal/gs;->kZ:I

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/gs;->jD:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/internal/gs;->jD:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ds;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/gs;->zG:[Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/internal/gs;->zG:[Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ds;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/gs;->zH:[Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/internal/gs;->zH:[Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ds;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/gs;->zI:[Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/internal/gs;->zI:[Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ds;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/gs;->zJ:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/internal/gs;->zJ:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ds;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/gs;->zK:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/internal/gs;->zK:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ds;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/gs;->zL:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/internal/gs;->zL:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ds;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/gs;->zM:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/internal/gs;->zM:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ds;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public ew()[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gs;->zG:[Ljava/lang/String;

    return-object v0
.end method

.method public ex()[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gs;->zH:[Ljava/lang/String;

    return-object v0
.end method

.method public ey()[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gs;->zI:[Ljava/lang/String;

    return-object v0
.end method

.method public ez()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gs;->zJ:Ljava/lang/String;

    return-object v0
.end method

.method public getAccountName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gs;->jD:Ljava/lang/String;

    return-object v0
.end method

.method public getVersionCode()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/gs;->kZ:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    const/16 v0, 0x9

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    iget v2, p0, Lcom/google/android/gms/internal/gs;->kZ:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/google/android/gms/internal/gs;->jD:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/google/android/gms/internal/gs;->zG:[Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/google/android/gms/internal/gs;->zH:[Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    iget-object v2, p0, Lcom/google/android/gms/internal/gs;->zI:[Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    iget-object v2, p0, Lcom/google/android/gms/internal/gs;->zJ:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    iget-object v2, p0, Lcom/google/android/gms/internal/gs;->zK:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    iget-object v2, p0, Lcom/google/android/gms/internal/gs;->zL:Ljava/lang/String;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    iget-object v2, p0, Lcom/google/android/gms/internal/gs;->zM:Ljava/lang/String;

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/google/android/gms/internal/ds;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    invoke-static {p0}, Lcom/google/android/gms/internal/ds;->e(Ljava/lang/Object;)Lcom/google/android/gms/internal/ds$a;

    move-result-object v0

    const-string v1, "versionCode"

    iget v2, p0, Lcom/google/android/gms/internal/gs;->kZ:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ds$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/internal/ds$a;

    move-result-object v0

    const-string v1, "accountName"

    iget-object v2, p0, Lcom/google/android/gms/internal/gs;->jD:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ds$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/internal/ds$a;

    move-result-object v0

    const-string v1, "requestedScopes"

    iget-object v2, p0, Lcom/google/android/gms/internal/gs;->zG:[Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ds$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/internal/ds$a;

    move-result-object v0

    const-string v1, "visibleActivities"

    iget-object v2, p0, Lcom/google/android/gms/internal/gs;->zH:[Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ds$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/internal/ds$a;

    move-result-object v0

    const-string v1, "requiredFeatures"

    iget-object v2, p0, Lcom/google/android/gms/internal/gs;->zI:[Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ds$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/internal/ds$a;

    move-result-object v0

    const-string v1, "packageNameForAuth"

    iget-object v2, p0, Lcom/google/android/gms/internal/gs;->zJ:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ds$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/internal/ds$a;

    move-result-object v0

    const-string v1, "callingPackageName"

    iget-object v2, p0, Lcom/google/android/gms/internal/gs;->zK:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ds$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/internal/ds$a;

    move-result-object v0

    const-string v1, "applicationName"

    iget-object v2, p0, Lcom/google/android/gms/internal/gs;->zL:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ds$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/internal/ds$a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/ds$a;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/gu;->a(Lcom/google/android/gms/internal/gs;Landroid/os/Parcel;I)V

    return-void
.end method
