.class public final Lcom/google/android/gms/internal/gb;
.super Lcom/google/android/gms/internal/fq;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Lcom/google/android/gms/internal/gc;


# instance fields
.field final kZ:I

.field private final wJ:Ljava/lang/String;

.field private final wK:Landroid/os/Bundle;

.field private final wL:Lcom/google/android/gms/internal/gd;

.field private final wM:Lcom/google/android/gms/maps/model/LatLng;

.field private final wN:F

.field private final wO:Lcom/google/android/gms/maps/model/LatLngBounds;

.field private final wP:Ljava/lang/String;

.field private final wQ:Landroid/net/Uri;

.field private final wR:Z

.field private final wS:F

.field private final wT:I

.field private final wU:J

.field private final wV:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/fw;",
            ">;"
        }
    .end annotation
.end field

.field private final wW:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/internal/fw;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final wX:Ljava/util/TimeZone;

.field private wY:Ljava/util/Locale;

.field private wZ:Lcom/google/android/gms/internal/gf;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/gc;

    invoke-direct {v0}, Lcom/google/android/gms/internal/gc;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/gb;->CREATOR:Lcom/google/android/gms/internal/gc;

    return-void
.end method

.method constructor <init>(ILjava/lang/String;Ljava/util/List;Landroid/os/Bundle;Lcom/google/android/gms/internal/gd;Lcom/google/android/gms/maps/model/LatLng;FLcom/google/android/gms/maps/model/LatLngBounds;Ljava/lang/String;Landroid/net/Uri;ZFIJ)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/fw;",
            ">;",
            "Landroid/os/Bundle;",
            "Lcom/google/android/gms/internal/gd;",
            "Lcom/google/android/gms/maps/model/LatLng;",
            "F",
            "Lcom/google/android/gms/maps/model/LatLngBounds;",
            "Ljava/lang/String;",
            "Landroid/net/Uri;",
            "ZFIJ)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/fq;-><init>()V

    iput p1, p0, Lcom/google/android/gms/internal/gb;->kZ:I

    iput-object p2, p0, Lcom/google/android/gms/internal/gb;->wJ:Ljava/lang/String;

    invoke-static {p3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/gms/internal/gb;->wV:Ljava/util/List;

    iput-object p4, p0, Lcom/google/android/gms/internal/gb;->wK:Landroid/os/Bundle;

    iput-object p5, p0, Lcom/google/android/gms/internal/gb;->wL:Lcom/google/android/gms/internal/gd;

    iput-object p6, p0, Lcom/google/android/gms/internal/gb;->wM:Lcom/google/android/gms/maps/model/LatLng;

    iput p7, p0, Lcom/google/android/gms/internal/gb;->wN:F

    iput-object p8, p0, Lcom/google/android/gms/internal/gb;->wO:Lcom/google/android/gms/maps/model/LatLngBounds;

    iput-object p9, p0, Lcom/google/android/gms/internal/gb;->wP:Ljava/lang/String;

    move-object/from16 v0, p10

    iput-object v0, p0, Lcom/google/android/gms/internal/gb;->wQ:Landroid/net/Uri;

    move/from16 v0, p11

    iput-boolean v0, p0, Lcom/google/android/gms/internal/gb;->wR:Z

    move/from16 v0, p12

    iput v0, p0, Lcom/google/android/gms/internal/gb;->wS:F

    move/from16 v0, p13

    iput v0, p0, Lcom/google/android/gms/internal/gb;->wT:I

    move-wide/from16 v0, p14

    iput-wide v0, p0, Lcom/google/android/gms/internal/gb;->wU:J

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p4}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/google/android/gms/internal/fw;->ab(Ljava/lang/String;)Lcom/google/android/gms/internal/fw;

    move-result-object v5

    invoke-virtual {p4, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v5, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    invoke-static {v3}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/gms/internal/gb;->wW:Ljava/util/Map;

    iget-object v2, p0, Lcom/google/android/gms/internal/gb;->wP:Ljava/lang/String;

    invoke-static {v2}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/gms/internal/gb;->wX:Ljava/util/TimeZone;

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/google/android/gms/internal/gb;->wY:Ljava/util/Locale;

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/google/android/gms/internal/gb;->wZ:Lcom/google/android/gms/internal/gf;

    return-void
.end method

.method private ac(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/gb;->wZ:Lcom/google/android/gms/internal/gf;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/gb;->wZ:Lcom/google/android/gms/internal/gf;

    iget-object v1, p0, Lcom/google/android/gms/internal/gb;->wJ:Ljava/lang/String;

    const-string v2, "PlaceImpl"

    invoke-virtual {v0, v1, v2, p1}, Lcom/google/android/gms/internal/gf;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public dE()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/fw;",
            ">;"
        }
    .end annotation

    const-string v0, "getTypes"

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gb;->ac(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/gb;->wV:Ljava/util/List;

    return-object v0
.end method

.method public dF()Lcom/google/android/gms/maps/model/LatLng;
    .locals 1

    const-string v0, "getLatLng"

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gb;->ac(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/gb;->wM:Lcom/google/android/gms/maps/model/LatLng;

    return-object v0
.end method

.method public dG()F
    .locals 1

    const-string v0, "getLevelNumber"

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gb;->ac(Ljava/lang/String;)V

    iget v0, p0, Lcom/google/android/gms/internal/gb;->wN:F

    return v0
.end method

.method public dH()Lcom/google/android/gms/maps/model/LatLngBounds;
    .locals 1

    const-string v0, "getViewport"

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gb;->ac(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/gb;->wO:Lcom/google/android/gms/maps/model/LatLngBounds;

    return-object v0
.end method

.method public dI()Landroid/net/Uri;
    .locals 1

    const-string v0, "getWebsiteUri"

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gb;->ac(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/gb;->wQ:Landroid/net/Uri;

    return-object v0
.end method

.method public dJ()Z
    .locals 1

    const-string v0, "isPermanentlyClosed"

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gb;->ac(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/google/android/gms/internal/gb;->wR:Z

    return v0
.end method

.method public dK()I
    .locals 1

    const-string v0, "getPriceLevel"

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gb;->ac(Ljava/lang/String;)V

    iget v0, p0, Lcom/google/android/gms/internal/gb;->wT:I

    return v0
.end method

.method public dL()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/internal/gb;->wU:J

    return-wide v0
.end method

.method public dM()Landroid/os/Bundle;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gb;->wK:Landroid/os/Bundle;

    return-object v0
.end method

.method public dN()Lcom/google/android/gms/internal/gd;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gb;->wL:Lcom/google/android/gms/internal/gd;

    return-object v0
.end method

.method public dO()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gb;->wP:Ljava/lang/String;

    return-object v0
.end method

.method public describeContents()I
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/gb;->CREATOR:Lcom/google/android/gms/internal/gc;

    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6
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
    instance-of v2, p1, Lcom/google/android/gms/internal/gb;

    if-nez v2, :cond_2

    move v0, v1

    goto :goto_0

    :cond_2
    check-cast p1, Lcom/google/android/gms/internal/gb;

    .end local p1    # "object":Ljava/lang/Object;
    iget-object v2, p0, Lcom/google/android/gms/internal/gb;->wJ:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/internal/gb;->wJ:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/google/android/gms/internal/gb;->wY:Ljava/util/Locale;

    iget-object v3, p1, Lcom/google/android/gms/internal/gb;->wY:Ljava/util/Locale;

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/ds;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-wide v2, p0, Lcom/google/android/gms/internal/gb;->wU:J

    iget-wide v4, p1, Lcom/google/android/gms/internal/gb;->wU:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    const-string v0, "getId"

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gb;->ac(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/gb;->wJ:Ljava/lang/String;

    return-object v0
.end method

.method public getRating()F
    .locals 1

    const-string v0, "getRating"

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gb;->ac(Ljava/lang/String;)V

    iget v0, p0, Lcom/google/android/gms/internal/gb;->wS:F

    return v0
.end method

.method public hashCode()I
    .locals 4

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/google/android/gms/internal/gb;->wJ:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/google/android/gms/internal/gb;->wY:Ljava/util/Locale;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-wide v2, p0, Lcom/google/android/gms/internal/gb;->wU:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/google/android/gms/internal/ds;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    invoke-static {p0}, Lcom/google/android/gms/internal/ds;->e(Ljava/lang/Object;)Lcom/google/android/gms/internal/ds$a;

    move-result-object v0

    const-string v1, "id"

    iget-object v2, p0, Lcom/google/android/gms/internal/gb;->wJ:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ds$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/internal/ds$a;

    move-result-object v0

    const-string v1, "localization"

    iget-object v2, p0, Lcom/google/android/gms/internal/gb;->wL:Lcom/google/android/gms/internal/gd;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ds$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/internal/ds$a;

    move-result-object v0

    const-string v1, "locale"

    iget-object v2, p0, Lcom/google/android/gms/internal/gb;->wY:Ljava/util/Locale;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ds$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/internal/ds$a;

    move-result-object v0

    const-string v1, "latlng"

    iget-object v2, p0, Lcom/google/android/gms/internal/gb;->wM:Lcom/google/android/gms/maps/model/LatLng;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ds$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/internal/ds$a;

    move-result-object v0

    const-string v1, "levelNumber"

    iget v2, p0, Lcom/google/android/gms/internal/gb;->wN:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ds$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/internal/ds$a;

    move-result-object v0

    const-string v1, "viewport"

    iget-object v2, p0, Lcom/google/android/gms/internal/gb;->wO:Lcom/google/android/gms/maps/model/LatLngBounds;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ds$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/internal/ds$a;

    move-result-object v0

    const-string v1, "timeZone"

    iget-object v2, p0, Lcom/google/android/gms/internal/gb;->wP:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ds$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/internal/ds$a;

    move-result-object v0

    const-string v1, "websiteUri"

    iget-object v2, p0, Lcom/google/android/gms/internal/gb;->wQ:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ds$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/internal/ds$a;

    move-result-object v0

    const-string v1, "isPermanentlyClosed"

    iget-boolean v2, p0, Lcom/google/android/gms/internal/gb;->wR:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ds$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/internal/ds$a;

    move-result-object v0

    const-string v1, "priceLevel"

    iget v2, p0, Lcom/google/android/gms/internal/gb;->wT:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ds$a;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/internal/ds$a;

    move-result-object v0

    const-string v1, "timestampSecs"

    iget-wide v2, p0, Lcom/google/android/gms/internal/gb;->wU:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

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
    sget-object v0, Lcom/google/android/gms/internal/gb;->CREATOR:Lcom/google/android/gms/internal/gc;

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/gc;->a(Lcom/google/android/gms/internal/gb;Landroid/os/Parcel;I)V

    return-void
.end method
