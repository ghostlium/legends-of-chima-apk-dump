.class public final Lcom/amazon/ags/constants/WhisperSyncBindingKeys;
.super Ljava/lang/Object;
.source "WhisperSyncBindingKeys.java"


# static fields
.field public static final WS_ACTION_BUNDLE_KEY:Ljava/lang/String; = "ACTION"

.field public static final WS_CLOUD_DESCRIPTION:Ljava/lang/String; = "CLOUD_DESCRIPTION"

.field public static final WS_CLOUD_DEVICE:Ljava/lang/String; = "CLOUD_DEVICE"

.field public static final WS_CLOUD_GAME_HISTORY_KEY:Ljava/lang/String; = "CLOUD_GAME_HISTORY"

.field public static final WS_CLOUD_SAVE_TIME:Ljava/lang/String; = "CLOUD_SAVE_TIME"

.field public static final WS_CONFLICT_STRATEGY_BUNDLE_KEY:Ljava/lang/String; = "CONFLICT_STRATEGY"

.field public static final WS_DATA_BUNDLE_KEY:Ljava/lang/String; = "STC_DATA"

.field public static final WS_DATA_DOES_NOT_EXIST:Ljava/lang/String; = "WS_NO_DATA"

.field public static final WS_DESCRIPTION_BUNDLE_KEY:Ljava/lang/String; = "STC_DESCRIPTION"

.field public static final WS_DESCRIPTION_ID_HEADER_KEY:Ljava/lang/String; = "x-amz-meta-description"

.field public static final WS_DEVICE_ID_HEADER_KEY:Ljava/lang/String; = "x-amz-meta-device-id"

.field public static final WS_ENCRYPTION_HEADER_KEY:Ljava/lang/String; = "x-amz-server-side-encryption"

.field public static final WS_ENCRYPTION_HEADER_VALUE:Ljava/lang/String; = "AES256"

.field public static final WS_ERROR:Ljava/lang/String; = "ERROR"

.field public static final WS_GAME_NAME_BUNDLE_KEY:Ljava/lang/String; = "GAME_NAME"

.field public static final WS_HAS_PENDING_PROGRESS:Ljava/lang/String; = "HAS_PENDING_PROGRESS"

.field public static final WS_LATEST_CLOUD_GAME_SUMMARY_KEY:Ljava/lang/String; = "CLOUD_GAME_SUMMARY"

.field public static final WS_LATEST_LOCAL_GAME_SUMMARY_KEY:Ljava/lang/String; = "LOCAL_GAME_SUMMARY"

.field public static final WS_REVERT_REQUEST_BUNDLE_KEY:Ljava/lang/String; = "REVERT_REQUEST"

.field public static final WS_REVERT_RESULT_BUNDLE_KEY:Ljava/lang/String; = "REVERT_RESULT"

.field public static final WS_SAVE_TIME_BUNDLE_KEY:Ljava/lang/String; = "SAVE_TIME"

.field public static final WS_SYNCHRONIZE_REQUEST_BUNDLE_KEY:Ljava/lang/String; = "SYNCHRONIZE_REQUEST"

.field public static final WS_SYNCHRONIZE_RESULT_BUNDLE_KEY:Ljava/lang/String; = "SYNCHRONIZE_RESULT"

.field public static final WS_VERSION_BUNDLE_KEY:Ljava/lang/String; = "VERSION_ID"


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
