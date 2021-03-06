LOCAL_PATH:= $(call my-dir)

#
# libcameraservice
#

include $(CLEAR_VARS)

LOCAL_SRC_FILES:=               \
    CameraService.cpp \
    CameraDeviceFactory.cpp \
    common/Camera2ClientBase.cpp \
    common/CameraDeviceBase.cpp \
    common/FrameProcessorBase.cpp \
    api1/CameraClient.cpp \
    api1/Camera2Client.cpp \
    api1/client2/Parameters.cpp \
    api1/client2/FrameProcessor.cpp \
    api1/client2/StreamingProcessor.cpp \
    api1/client2/JpegProcessor.cpp \
    api1/client2/CallbackProcessor.cpp \
    api1/client2/ZslProcessor.cpp \
    api1/client2/BurstCapture.cpp \
    api1/client2/JpegCompressor.cpp \
    api1/client2/CaptureSequencer.cpp \
    api1/client2/ZslProcessor3.cpp \
    api2/CameraDeviceClient.cpp \
    api_pro/ProCamera2Client.cpp \
    device2/Camera2Device.cpp \
    device3/Camera3Device.cpp \
    device3/Camera3Stream.cpp \
    device3/Camera3IOStreamBase.cpp \
    device3/Camera3InputStream.cpp \
    device3/Camera3OutputStream.cpp \
    device3/Camera3ZslStream.cpp \
    device3/StatusTracker.cpp \
    gui/RingBufferConsumer.cpp \
    utils/CameraTraces.cpp \

LOCAL_SHARED_LIBRARIES:= \
    libui \
    liblog \
    libutils \
    libbinder \
    libcutils \
    libmedia \
    libcamera_client \
    libgui \
    libhardware \
    libsync \
    libcamera_metadata \
    libjpeg

LOCAL_C_INCLUDES += \
    system/media/camera/include \
    external/jpeg


LOCAL_CFLAGS += -Wall -Wextra

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
    LOCAL_CFLAGS += -DCAMERA_MSG_MGMT
endif

ifeq ($(BOARD_CAMERA_MSG_MGMT),true)
    LOCAL_CFLAGS += -DCAMERA_MSG_MGMT
endif

ifeq ($(BOARD_USE_MHB_ION), true)
LOCAL_CFLAGS += -DUSE_MHB_ION
endif

ifeq ($(BOARD_FIX_WRONG_RECBUF_FOR_CAMERA), true)
LOCAL_CFLAGS += -DFIX_WRONG_RECBUF_FOR_CAMERA
endif

LOCAL_MODULE:= libcameraservice

include $(BUILD_SHARED_LIBRARY)
