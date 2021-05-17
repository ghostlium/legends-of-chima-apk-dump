.class public interface abstract Lcom/google/android/gms/drive/DriveApi;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/drive/DriveApi$OnSyncFinishCallback;,
        Lcom/google/android/gms/drive/DriveApi$IntentSenderResult;,
        Lcom/google/android/gms/drive/DriveApi$OnContentsDiscardedCallback;,
        Lcom/google/android/gms/drive/DriveApi$OnNewContentsCallback;,
        Lcom/google/android/gms/drive/DriveApi$ContentsResult;,
        Lcom/google/android/gms/drive/DriveApi$MetadataBufferResult;
    }
.end annotation


# virtual methods
.method public abstract discardContents(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/drive/Contents;)Lcom/google/android/gms/common/api/PendingResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            "Lcom/google/android/gms/drive/Contents;",
            ")",
            "Lcom/google/android/gms/common/api/PendingResult",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            "Lcom/google/android/gms/drive/DriveApi$OnContentsDiscardedCallback;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getFile(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/drive/DriveId;)Lcom/google/android/gms/drive/DriveFile;
.end method

.method public abstract getFolder(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/drive/DriveId;)Lcom/google/android/gms/drive/DriveFolder;
.end method

.method public abstract getRootFolder(Lcom/google/android/gms/common/api/GoogleApiClient;)Lcom/google/android/gms/drive/DriveFolder;
.end method

.method public abstract newContents(Lcom/google/android/gms/common/api/GoogleApiClient;)Lcom/google/android/gms/common/api/PendingResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            ")",
            "Lcom/google/android/gms/common/api/PendingResult",
            "<",
            "Lcom/google/android/gms/drive/DriveApi$ContentsResult;",
            "Lcom/google/android/gms/drive/DriveApi$OnNewContentsCallback;",
            ">;"
        }
    .end annotation
.end method

.method public abstract newCreateFileActivityBuilder()Lcom/google/android/gms/drive/CreateFileActivityBuilder;
.end method

.method public abstract newOpenFileActivityBuilder()Lcom/google/android/gms/drive/OpenFileActivityBuilder;
.end method

.method public abstract query(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/drive/query/Query;)Lcom/google/android/gms/common/api/PendingResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            "Lcom/google/android/gms/drive/query/Query;",
            ")",
            "Lcom/google/android/gms/common/api/PendingResult",
            "<",
            "Lcom/google/android/gms/drive/DriveApi$MetadataBufferResult;",
            "Lcom/google/android/gms/drive/DriveFolder$OnChildrenRetrievedCallback;",
            ">;"
        }
    .end annotation
.end method

.method public abstract requestSync(Lcom/google/android/gms/common/api/GoogleApiClient;)Lcom/google/android/gms/common/api/PendingResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            ")",
            "Lcom/google/android/gms/common/api/PendingResult",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            "Lcom/google/android/gms/drive/DriveApi$OnSyncFinishCallback;",
            ">;"
        }
    .end annotation
.end method
