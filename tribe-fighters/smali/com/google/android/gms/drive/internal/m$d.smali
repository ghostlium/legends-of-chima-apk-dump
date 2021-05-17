.class abstract Lcom/google/android/gms/drive/internal/m$d;
.super Lcom/google/android/gms/drive/internal/i;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/drive/internal/m;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/drive/internal/i",
        "<",
        "Lcom/google/android/gms/drive/DriveResource$MetadataResult;",
        "Lcom/google/android/gms/drive/DriveResource$OnMetadataUpdatedCallback;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic oD:Lcom/google/android/gms/drive/internal/m;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/drive/internal/m;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/drive/internal/m$d;->oD:Lcom/google/android/gms/drive/internal/m;

    invoke-direct {p0}, Lcom/google/android/gms/drive/internal/i;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/drive/internal/m;Lcom/google/android/gms/drive/internal/m$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/drive/internal/m$d;-><init>(Lcom/google/android/gms/drive/internal/m;)V

    return-void
.end method


# virtual methods
.method protected a(Lcom/google/android/gms/drive/DriveResource$OnMetadataUpdatedCallback;Lcom/google/android/gms/drive/DriveResource$MetadataResult;)V
    .locals 0

    invoke-interface {p1, p2}, Lcom/google/android/gms/drive/DriveResource$OnMetadataUpdatedCallback;->onMetadataUpdated(Lcom/google/android/gms/drive/DriveResource$MetadataResult;)V

    return-void
.end method

.method protected bridge synthetic a(Ljava/lang/Object;Lcom/google/android/gms/common/api/Result;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/drive/DriveResource$OnMetadataUpdatedCallback;

    check-cast p2, Lcom/google/android/gms/drive/DriveResource$MetadataResult;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/drive/internal/m$d;->a(Lcom/google/android/gms/drive/DriveResource$OnMetadataUpdatedCallback;Lcom/google/android/gms/drive/DriveResource$MetadataResult;)V

    return-void
.end method

.method public synthetic b(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/drive/internal/m$d;->j(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/drive/DriveResource$MetadataResult;

    move-result-object v0

    return-object v0
.end method

.method public j(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/drive/DriveResource$MetadataResult;
    .locals 2

    new-instance v0, Lcom/google/android/gms/drive/internal/m$c;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/google/android/gms/drive/internal/m$c;-><init>(Lcom/google/android/gms/common/api/Status;Lcom/google/android/gms/drive/Metadata;)V

    return-object v0
.end method
