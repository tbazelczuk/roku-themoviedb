const { baseManifest } = require("@dazn/kopytko-packager");

module.exports = {
  ...baseManifest,
  title: "TMDB",
  mm_icon_focus_fhd: "pkg:/images/1080p/tmdb_icon.png",
  mm_icon_focus_hd: "pkg:/images/720p/tmdb_icon.png",
  mm_icon_focus_sd: "pkg:/images/720p/tmdb_icon.png",
  splash_screen_fhd: "pkg:/images/1080p/tmdb_splash.png",
  splash_screen_hd: "pkg:/images/720p/tmdb_splash.png",
  splash_screen_sd: "pkg:/images/720p/tmdb_splash.png",
  ui_resolutions: "fhd",
  bs_const: {
    RALE: false,
  },
  baseUrl: "https://api.themoviedb.org",
  apiKey: process.env.API_KEY,
  language: "en-US",
};
