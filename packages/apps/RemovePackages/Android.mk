LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := RemovePackages
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := /dev/null
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_OVERRIDES_PACKAGES := AndroidAutoStubPrebuilt CalculatorGooglePrebuilt CalendarGooglePrebuilt GoogleFeedback GooglePrintRecommendationService GoogleTTS Photos PrebuiltDeskClockGoogle PrebuiltGmail TagGoogle Velvet
LOCAL_UNINSTALLABLE_MODULE := true

include $(BUILD_PREBUILT)
