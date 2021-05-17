.class abstract Lcom/google/android/gms/drive/internal/l$c;
.super Lcom/google/android/gms/drive/internal/i;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/drive/internal/l;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/drive/internal/i",
        "<",
        "Lcom/google/android/gms/drive/DriveFolder$DriveFolderResult;",
        "Lcom/google/android/gms/drive/DriveFolder$OnCreateFolderCallback;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic oA:Lcom/google/android/gms/drive/internal/l;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/drive/internal/l;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/drive/internal/l$c;->oA:Lcom/google/android/gms/drive/internal/l;

    invoke-direct {p0}, Lcom/google/android/gms/drive/internal/i;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/drive/internal/l;Lcom/google/android/gms/drive/internal/l$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/drive/internal/l$c;-><init>(Lcom/google/android/gms/drive/internal/l;)V

    return-void
.end method


# virtual methods
.method protected a(Lcom/google/android/gms/drive/DriveFolder$OnCreateFolderCallback;Lcom/google/android/gms/drive/DriveFolder$DriveFolderResult;)V
    .locals 0

    invoke-interface {p1, p2}, Lcom/google/android/gms/drive/DriveFolder$OnCreateFolderCallback;->onCreateFolder(Lcom/google/android/gms/drive/DriveFolder$DriveFolderResult;)V

    return-void
.end method

.method protected bridge synthetic a(Ljava/lang/Object;Lcom/google/android/gms/common/api/Result;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/drive/DriveFolder$OnCreateFolderCallback;

    check-cast p2, Lcom/google/android/gms/drive/DriveFolder$DriveFolderResult;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/drive/internal/l$c;->a(Lcom/google/android/gms/drive/DriveFolder$OnCreateFolderCallback;Lcom/google/android/gms/drive/DriveFolder$DriveFolderResult;)V

    return-void
.end method

.method public synthetic b(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/drive/internal/l$c;->i(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/drive/DriveFolder$DriveFolderResult;

    move-result-object v0

    return-object v0
.end method

.method public i(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/drive/DriveFolder$DriveFolderResult;
    .locals 2

    new-instance v0, Lcom/google/android/gms/drive/internal/l$e;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/google/android/gms/drive/internal/l$e;-><init>(Lcom/google/android/gms/common/api/Status;Lcom/google/android/gms/drive/DriveFolder;)V

    return-object v0
.end method
