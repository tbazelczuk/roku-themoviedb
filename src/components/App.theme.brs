function getAppTheme()
  resolution = m.top.getScene().currentDesignResolution
  deviceInfo = CreateObject("roDeviceInfo")
  resolution.isRealFHD = (deviceInfo.getUIResolution().name = "FHD")

  colors = {
    white: "0xF9FAFA",
    black: "0x000000",
  }

  textColor = {
    primary: colors.white,
    focused: colors.black,
  }

  logo = {
    height: 134,
    width: 186,
    uri: "pkg:/images/logo.png",
  }

  return {
    logo: logo,
    colors: colors,
    textColor: textColor,
    resolution: resolution,
  }
end function
