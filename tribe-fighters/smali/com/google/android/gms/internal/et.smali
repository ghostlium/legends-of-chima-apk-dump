.class public Lcom/google/android/gms/internal/et;
.super Ljava/lang/Object;


# static fields
.field public static final MIME_TYPE:Lcom/google/android/gms/drive/metadata/MetadataField;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/drive/metadata/MetadataField",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final PARENTS:Lcom/google/android/gms/drive/metadata/CollectionMetadataField;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/drive/metadata/CollectionMetadataField",
            "<",
            "Lcom/google/android/gms/drive/DriveId;",
            ">;"
        }
    .end annotation
.end field

.field public static final STARRED:Lcom/google/android/gms/drive/metadata/MetadataField;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/drive/metadata/MetadataField",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final TITLE:Lcom/google/android/gms/drive/metadata/MetadataField;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/drive/metadata/MetadataField",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final TRASHED:Lcom/google/android/gms/drive/metadata/MetadataField;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/drive/metadata/MetadataField",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final oU:Lcom/google/android/gms/drive/metadata/MetadataField;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/drive/metadata/MetadataField",
            "<",
            "Lcom/google/android/gms/drive/DriveId;",
            ">;"
        }
    .end annotation
.end field

.field public static final oV:Lcom/google/android/gms/drive/metadata/MetadataField;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/drive/metadata/MetadataField",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final oW:Lcom/google/android/gms/drive/metadata/MetadataField;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/drive/metadata/MetadataField",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget-object v0, Lcom/google/android/gms/internal/ev;->pb:Lcom/google/android/gms/internal/ev;

    sput-object v0, Lcom/google/android/gms/internal/et;->oU:Lcom/google/android/gms/drive/metadata/MetadataField;

    new-instance v0, Lcom/google/android/gms/drive/metadata/StringMetadataField;

    const-string v1, "title"

    invoke-direct {v0, v1}, Lcom/google/android/gms/drive/metadata/StringMetadataField;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/internal/et;->TITLE:Lcom/google/android/gms/drive/metadata/MetadataField;

    new-instance v0, Lcom/google/android/gms/drive/metadata/StringMetadataField;

    const-string v1, "mimeType"

    invoke-direct {v0, v1}, Lcom/google/android/gms/drive/metadata/StringMetadataField;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/internal/et;->MIME_TYPE:Lcom/google/android/gms/drive/metadata/MetadataField;

    new-instance v0, Lcom/google/android/gms/drive/metadata/internal/a;

    const-string v1, "starred"

    invoke-direct {v0, v1}, Lcom/google/android/gms/drive/metadata/internal/a;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/internal/et;->STARRED:Lcom/google/android/gms/drive/metadata/MetadataField;

    new-instance v0, Lcom/google/android/gms/internal/et$1;

    const-string v1, "trashed"

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/et$1;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/internal/et;->TRASHED:Lcom/google/android/gms/drive/metadata/MetadataField;

    new-instance v0, Lcom/google/android/gms/drive/metadata/internal/a;

    const-string v1, "isEditable"

    invoke-direct {v0, v1}, Lcom/google/android/gms/drive/metadata/internal/a;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/internal/et;->oV:Lcom/google/android/gms/drive/metadata/MetadataField;

    new-instance v0, Lcom/google/android/gms/drive/metadata/internal/a;

    const-string v1, "isPinned"

    invoke-direct {v0, v1}, Lcom/google/android/gms/drive/metadata/internal/a;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/internal/et;->oW:Lcom/google/android/gms/drive/metadata/MetadataField;

    new-instance v0, Lcom/google/android/gms/drive/metadata/internal/e;

    const-string v1, "parents"

    invoke-direct {v0, v1}, Lcom/google/android/gms/drive/metadata/internal/e;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/internal/et;->PARENTS:Lcom/google/android/gms/drive/metadata/CollectionMetadataField;

    return-void
.end method
